#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69007 "Import payroll details"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Pay Period Filter", "Posting Group", "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(Employee_Name; Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
            {
            }
            column(DateSpecified; DateSpecified)
            {
            }
            column(Dept; Employee.Department)
            {
            }
            column(counter; counter)
            {
            }
            column(PayPeriodtext1; PayPeriodtext1)
            {
            }
            column(NetPay2; NetPay2)
            {
            }
            column(GrossPay; GrossPay2)
            {
            }
            column(Totalded; Totalded)
            {
            }
            column(USERID; UserId)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(Allowances_Number_; Allowances[Integer.Number])
                {
                }
                column(EarnDesc_Number_; EarnDesc[Integer.Number])
                {
                }
                column(CompanyInfoName; CompanyInfo.Name)
                {
                }
                column(CompanyInfoPicture; CompanyInfo.Picture)
                {
                }

                trigger OnPreDataItem()
                begin
                    Integer.SetRange(Number, 1, i);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);
                //exclude deceased pensioner
                if Employee.Status = Employee.Status::Inactive then
                    CurrReport.Skip;
                //MESSAGE('%1',PG);
                Employee.SetRange("Posting Group", PG);
                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions");
                //IF (Employee."Total Allowances"+Employee."Total Deductions")=0 THEN
                if Employee."Total Allowances" = 0 then
                    CurrReport.Skip;
                counter := counter + 1;
                NetPay := Employee."Total Allowances" + Employee."Total Deductions";

                Clear(Allowances);
                Clear(Deductions);
                Clear(OtherEarn);
                Clear(OtherDeduct);
                Clear(BasicPay);

                Totallowances := 0;
                TotalDeductions := 0;
                //BasicPay := 0;

                for i := 1 to NoOfEarnings do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SetRange(Assignmat.Code, Earncode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then begin
                        Assignmat.CalcSums(Amount);
                        Allowances[i] := Assignmat.Amount;
                        Totallowances := Totallowances + Allowances[i];
                    end else begin
                        if Earncode[i] = 'OTHER EARNINGS' then begin
                            Allowances[i] := Employee."Total Allowances" - Totallowances;
                        end
                        else if Earncode[i] = 'GROSS PAY' then
                            Allowances[i] := Employee."Total Allowances";
                    end;
                    Employee.CalcFields(Employee."Basic Salary");
                    BasicPay := Employee."Basic Salary";
                end;


                for i := NoOfEarnings + 1 to NoOfEarnings + NoOfDeductions do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, Earncode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then begin
                        Assignmat.CalcSums(Amount);
                        Allowances[i] := Assignmat.Amount;
                        TotalDeductions := TotalDeductions + Allowances[i];
                    end else begin
                        if Earncode[i] = 'OTHER DEDUCTIONS' then
                            Allowances[i] := Abs(Employee."Total Deductions" - TotalDeductions)
                        else if Earncode[i] = 'NET PAY' then
                            Allowances[i] := Employee."Total Allowances" + Employee."Total Deductions";
                    end;
                end;



                PayrollHeader.Reset;
                PayrollHeader.SetRange("No.", SalaryvoucherNo);
                PayrollHeader.SetRange(PayrollHeader."Payroll Period", DateSpecified);
                if PayrollHeader.Find('-') then begin
                    LineNo := LineNo + 1000;
                    PayrollLines."Line No" := LineNo;
                    PayrollLines."Payroll Header" := PayrollHeader."No.";
                    PayrollLines."Payroll Group" := Assignmat."Posting Group Filter";
                    PayrollLines."Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    //PayrollLines."Basic Arrears":=Assignmat."Basic Pay Arrears";
                    PayrollLines."Basic Salary" := BasicPay;
                    PayrollLines."Gross Pay" := Totallowances;
                    PayrollLines.Netpay := NetPay;
                    PayrollLines."Total Deduction" := Employee."Total Deductions";
                    PayrollLines."Personal No." := Assignmat."Employee No";
                    PayrollLines."Payroll Period" := PayrollHeader."Payroll Period";
                    PayrollLines.Insert;
                end;
            end;

            trigger OnPreDataItem()
            begin
                //PayPeriod:="Dimension Value".GETRANGEMIN("Pay Period Filter");
                PayPeriod := DateSpecified;
                //"Dimension Value".SETRANGE("Dimension Value"."Dimension Code",'DEPARTMENT');
                //MESSAGE('%1',PayPeriod);

                if PayPeriodX.Get(PayPeriod) then
                    PayPeriodtext1 := PayPeriodX.Name;
                Year := Date2dmy(PayPeriod, 3);
                PayPeriodtext1 := 'PAYROLL SUMMARY ' + UpperCase(PayPeriodtext1) + '-' + Format(Year);
                //MESSAGE('%1',PayPeriodtext1);
                //Net Pay
                ///Calculate Gross pay
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                EarnRec.SetRange(EarnRec."Pay Period Filter", PayPeriod);
                //EarnRec.SETRANGE(EarnRec."Payroll Grouping Filter",EarnRec."Payroll Grouping Filter"::Management);

                if EarnRec.Find('-') then begin
                    repeat
                        EarnRec.CalcFields(EarnRec."Total Amount");
                        GrossPay2 := GrossPay2 + EarnRec."Total Amount";
                    until EarnRec.Next = 0;
                end;

                Ded.Reset;
                Ded.SetRange(Ded."Pay Period Filter", PayPeriod);
                //Ded.SETRANGE(Ded."Payroll Grouping Filter",Ded."Payroll Grouping Filter"::Management);
                if Ded.Find('-') then begin
                    repeat
                        Ded.CalcFields(Ded."Total Amount");
                        Totalded := Totalded + Ded."Total Amount";
                    until Ded.Next = 0;
                end;

                NetPay2 := Abs(GrossPay2 + Totalded);

                PayrollHeader.Reset;
                PayrollHeader.SetRange("No.", SalaryvoucherNo);
                PayrollHeader.SetRange(PayrollHeader."Payroll Period", DateSpecified);
                if PayrollHeader.Find('-') then begin
                    PayrollLines.Reset;
                    PayrollLines.SetRange("Payroll Header", SalaryvoucherNo);
                    PayrollLines.SetRange(PayrollLines."Payroll Period", PayrollHeader."Payroll Period");
                    if PayrollLines.Find('-') then
                        PayrollLines.DeleteAll
                end;
            end;
        }
        dataitem("Payroll Header"; "Payroll Header")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_2; 2)
            {
            }
        }
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = sorting("Dimension Code", Code) order(ascending) where("Dimension Code" = const('PAYROLLGROUP'));
            column(ReportForNavId_1000000025; 1000000025)
            {
            }
            column(Code_DimensionValue; "Dimension Value".Code)
            {
            }
            column(Name_DimensionValue; "Dimension Value".Name)
            {
            }
            column(DepName; DepName)
            {
            }
            column(DepTotals; DepTotals)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DepTotals := 0;
                DepName := "Dimension Value".Code + ' GROSS PAY';

                /*
                AssMatrix.RESET
                AssMatrix.SETRANGE(AssMatrix."Payroll Period",PayPeriod);
                AssMatrix.SETRANGE(AssMatrix."Department Code","Dimension Value".Code);
                AssMatrix.
                
                */


                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                EarnRec.SetRange(EarnRec."Pay Period Filter", PayPeriod);
                EarnRec.SetRange(EarnRec."Department Filter", "Dimension Value".Code);

                if EarnRec.Find('-') then begin
                    repeat
                        EarnRec.CalcFields(EarnRec."Total Amount");
                        DepTotals := DepTotals + EarnRec."Total Amount";
                        TotalGross := TotalGross + EarnRec."Total Amount";
                    until EarnRec.Next = 0;
                end;

                if DepTotals = 0 then
                    CurrReport.Skip;

            end;

            trigger OnPreDataItem()
            begin
                //PayPeriod:="Dimension Value".GETRANGEMIN("Pay Period Filter");
                PayPeriod := DateSpecified;
                "Dimension Value".SetRange("Dimension Value"."Dimension Code", 'PAYROLLGROUP');
                //MESSAGE('%1',PayPeriod);

                if PayPeriodX.Get(PayPeriod) then
                    PayPeriodtext1 := PayPeriodX.Name;
                Year := Date2dmy(PayPeriod, 3);
                PayPeriodtext1 := 'PAYROLL SUMMARY ' + UpperCase(PayPeriodtext1) + '-' + Format(Year);
                //MESSAGE('%1',PayPeriodtext1);
                //Net Pay
                ///Calculate Gross pay
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                EarnRec.SetRange(EarnRec."Pay Period Filter", PayPeriod);
                //EarnRec.SETRANGE(EarnRec."Payroll Grouping Filter",EarnRec."Payroll Grouping Filter"::Management);

                if EarnRec.Find('-') then begin
                    repeat
                        EarnRec.CalcFields(EarnRec."Total Amount");
                        GrossPay2 := GrossPay2 + EarnRec."Total Amount";
                    until EarnRec.Next = 0;
                end;

                Ded.Reset;
                Ded.SetRange(Ded."Pay Period Filter", PayPeriod);
                //Ded.SETRANGE(Ded."Payroll Grouping Filter",Ded."Payroll Grouping Filter"::Management);
                if Ded.Find('-') then begin
                    repeat
                        Ded.CalcFields(Ded."Total Amount");
                        Totalded := Totalded + Ded."Total Amount";
                    until Ded.Next = 0;
                end;

                NetPay2 := Abs(GrossPay2 + Totalded);

                //MESSAGE('%1',GrossPay);
                ///MESSAGE('%1',Totalded);


                //MESSAGE('%1',NetPay2);
            end;
        }
        dataitem(DeductionsX; DeductionsX)
        {
            column(ReportForNavId_1000000013; 1000000013)
            {
            }
            column(Code_DeductionsX; DeductionsX.Code)
            {
            }
            column(Description_DeductionsX; DeductionsX.Description)
            {
            }
            column(DeductionTotals; DeductionTotals)
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(ReportForNavId_1000000014; 1000000014)
                {
                }
                column(Picture_CompanyInformation; "Company Information".Picture)
                {
                }
                column(Name_CompanyInformation; "Company Information".Name)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                DeductionsX.CalcFields(DeductionsX."Total Amount");
                DeductionTotals := Abs(DeductionsX."Total Amount");
                //Totalded:=Totalded+DeductionsX."Total Amount";
            end;

            trigger OnPreDataItem()
            begin
                DeductionsX.SetRange(DeductionsX."Pay Period Filter", PayPeriod);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        MasterRoll = 'MASTER ROLL';
    }

    trigger OnPreReport()
    begin
        SalaryvoucherNo := "Payroll Header".GetFilter("No.");
        DateSpecified := Employee.GetRangeMin(Employee."Pay Period Filter");
        PG := Employee.GetFilter("Posting Group");
        EarnRec.Reset;
        //EarnRec.SETRANGE("Show on Master Roll",TRUE);
        EarnRec.SetRange("Non-Cash Benefit", false);
        EarnRec.SetRange("Pay Period Filter", DateSpecified);
        if EarnRec.Find('-') then
            repeat
                EarnRec.CalcFields("Total Amount");
                if EarnRec."Total Amount" <> 0 then begin
                    i := i + 1;
                    Earncode[i] := EarnRec.Code;
                    EarnDesc[i] := EarnRec.Description;
                    NoOfEarnings := NoOfEarnings + 1;
                end;
            until EarnRec.Next = 0;

        //Add other earnings
        NoOfEarnings := NoOfEarnings + 1;
        i := i + 1;
        Earncode[i] := 'Basic Arrears';
        EarnDesc[i] := 'Basic Arrears';
        NoOfEarnings := NoOfEarnings + 1;
        i := i + 1;
        Earncode[i] := 'Gross Pay';
        EarnDesc[i] := 'Gross Pay';

        //

        DedRec.Reset;
        DedRec.SetRange(DedRec."Show on Master Roll", true);
        DedRec.SetRange("Pay Period Filter", DateSpecified);
        if DedRec.Find('-') then
            repeat

                DedRec.CalcFields("Total Amount");
                if DedRec."Total Amount" <> 0 then begin
                    i := i + 1;
                    Earncode[i] := DedRec.Code;
                    EarnDesc[i] := DedRec.Description;
                    NoOfDeductions := NoOfDeductions + 1;
                end;
            until DedRec.Next = 0;


        //Add other deductions and Net Pay
        NoOfDeductions := NoOfDeductions + 1;
        i := i + 1;
        Earncode[i] := 'OTHER DEDUCTIONS';
        EarnDesc[i] := 'OTHER DEDUCTIONS';

        NoOfDeductions := NoOfDeductions + 1;
        i := i + 1;
        Earncode[i] := 'NET PAY';
        EarnDesc[i] := 'NET PAY';
        //
    end;

    var
        Allowances: array[1000] of Decimal;
        Deductions: array[1000] of Decimal;
        EarnRec: Record EarningsX;
        DedRec: Record DeductionsX;
        Earncode: array[1000] of Code[20];
        deductcode: array[1000] of Code[20];
        EarnDesc: array[1000] of Text[150];
        DedDesc: array[1000] of Text[150];
        i: Integer;
        j: Integer;
        Assignmat: Record "Assignment Matrix-X";
        DateSpecified: Date;
        Totallowances: Decimal;
        TotalDeductions: Decimal;
        OtherEarn: array[1000] of Decimal;
        OtherDeduct: array[1000] of Decimal;
        counter: Integer;
        HRSetup: Record "Human Resources Setup";
        NetPay: Decimal;
        Payroll: Codeunit Payroll3;
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        NoOfEarnings: Integer;
        NoOfDeductions: Integer;
        PG: Code[20];
        Dpt: Code[20];
        Emp: Code[20];
        GrossPay: array[1000] of Decimal;
        DepName: Text[100];
        PayPeriod: Date;
        AssMatrix: Record "Assignment Matrix-X";
        DepTotals: Decimal;
        TotalGross: Decimal;
        DeductionTotals: Decimal;
        Totalded: Decimal;
        Ded: Record DeductionsX;
        PayPeriodX: Record "Payroll PeriodX";
        Year: Integer;
        PayPeriodtext1: Text[100];
        GrossPay2: Decimal;
        NetPay2: Decimal;
        CompanyInfo: Record "Company Information";
        PayrollLines: Record "Payroll Lines";
        PayrollHeader: Record "Payroll Header";
        LineNo: Integer;
        BasicPay: Decimal;
        SalaryvoucherNo: Code[50];
}
