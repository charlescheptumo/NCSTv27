#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69002 "Master Roll Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Master Roll Report.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Pay Period Filter", "No.", "Posting Group", Department, Status;
            column(ReportForNavId_7528; 7528)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____; UpperCase(Format(DateSpecified, 0, '<month text> <year4>')))
            {
            }
            column(TIME; Time)
            {
            }
            column(CoRec_Picture; CoRec.Picture)
            {
            }
            column(EarnDesc_1_; EarnDesc[1])
            {
            }
            column(EarnDesc_2_; EarnDesc[2])
            {
            }
            column(EarnDesc_3_; EarnDesc[3])
            {
            }
            column(DedDesc_1_; DedDesc[1])
            {
            }
            column(DedDesc_2_; DedDesc[2])
            {
            }
            column(DedDesc_3_; DedDesc[12])
            {
            }
            column(DedDesc_4_; DedDesc[4])
            {
            }
            column(Other_Deductions_; 'Other Deductions')
            {
            }
            column(Net_Pay_; 'Net Pay')
            {
            }
            column(PF_No__; 'PF No.')
            {
            }
            column(Name_; 'Name')
            {
            }
            column(Employee__No__; Employee."No.")
            {
            }
            column(Allowances_1_; Allowances[1])
            {
            }
            column(Allowances_2_; Allowances[2])
            {
            }
            column(Allowances_3_; Allowances[3])
            {
            }
            column(OtherEarn; OtherEarn)
            {
            }
            column(Deductions_1_; Deductions[1])
            {
            }
            column(Deductions_2_; Deductions[2])
            {
            }
            column(Deductions_3_; Deductions[12])
            {
            }
            column(Deductions_4_; Deductions[4])
            {
            }
            column(OtherDeduct; OtherDeduct)
            {
            }
            column(NetPay; NetPay)
            {
            }
            column(First_Name_________Middle_Name_______Last_Name_; Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
            {
            }
            column(Allowances_1__Control1000000009; Allowances[1])
            {
            }
            column(Allowances_2__Control1000000018; Allowances[2])
            {
            }
            column(Allowances_3__Control1000000032; Allowances[3])
            {
            }
            column(OtherEarn_Control1000000033; OtherEarn)
            {
            }
            column(Deductions_1__Control1000000034; Deductions[1])
            {
            }
            column(Deductions_2__Control1000000035; Deductions[2])
            {
            }
            column(Deductions_3__Control1000000036; Deductions[12])
            {
            }
            column(Deductions_4__Control1000000037; Deductions[4])
            {
            }
            column(OtherDeduct_Control1000000038; OtherDeduct)
            {
            }
            column(NetPay_Control1000000039; NetPay)
            {
            }
            column(STRSUBSTNO__Employees__1__counter_; StrSubstNo('Employees=%1', counter))
            {
            }
            column(Prepared_By________________________________________________; 'Prepared By.....................................................')
            {
            }
            column(Approved_By_____________________________________________; 'Approved By....................................................')
            {
            }
            column(Approved_By_______________________________________; 'Approved By............................................')
            {
            }
            column(MASTER_ROLLCaption; MASTER_ROLLCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Other_AllowancesCaption; Other_AllowancesCaptionLbl)
            {
            }
            column(PostingGroup_Employee; Employee."Posting Group")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions");
                if (Employee."Total Allowances" + Employee."Total Deductions") = 0 then
                    CurrReport.Skip;
                counter := counter + 1;
                NetPay := Employee."Total Allowances" + Employee."Total Deductions";

                //cc//  NetPay := Payroll.PayrollRounding(NetPay);


                for i := 1 to 13 do begin
                    Clear(Allowances[i]);
                    Clear(Deductions[i]);
                end;
                OtherEarn := 0;
                OtherDeduct := 0;
                Totallowances := 0;
                OtherDeduct := 0;
                TotalDeductions := 0;

                for i := 1 to 10 do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SetRange(Assignmat.Code, Earncode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then
                        Allowances[i] := Assignmat.Amount;
                    Totallowances := Totallowances + Allowances[i];
                end;
                OtherEarn := Employee."Total Allowances" - Totallowances;

                for i := 1 to 13 do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, deductcode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then
                        Deductions[i] := Abs(Assignmat.Amount);
                    TotalDeductions := TotalDeductions + Deductions[i];
                end;
                OtherDeduct := Abs(Employee."Total Deductions" + TotalDeductions - Employee."Cumm. PAYE");
            end;

            trigger OnPreDataItem()
            begin
                //cc     CurrReport.CreateTotals(Allowances, Deductions, OtherEarn, OtherDeduct, NetPay);
                HRSetup.Get;
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
    }

    trigger OnPreReport()
    begin

        DateSpecified := Employee.GetRangeMin(Employee."Pay Period Filter");

        EarnRec.Reset;
        EarnRec.SetRange(EarnRec."Show on Master Roll", true);
        if EarnRec.FindSet then begin
            repeat
                i := i + 1;
                Earncode[i] := EarnRec.Code;
                EarnDesc[i] := EarnRec.Description;
            until EarnRec.Next = 0;
        end;

        DedRec.Reset;
        DedRec.SetRange(DedRec."Show on Master Roll", true);
        if DedRec.Find('-') then
            repeat
                j := j + 1;
                deductcode[j] := DedRec.Code;
                DedDesc[j] := DedRec.Description;
            until DedRec.Next = 0;
        CoRec.Get;
        CoRec.CalcFields(Picture);
    end;

    var
        Allowances: array[20] of Decimal;
        Deductions: array[20] of Decimal;
        EarnRec: Record EarningsX;
        DedRec: Record DeductionsX;
        Earncode: array[40] of Code[40];
        deductcode: array[50] of Code[40];
        EarnDesc: array[40] of Text[40];
        DedDesc: array[50] of Text[40];
        i: Integer;
        j: Integer;
        Assignmat: Record "Assignment Matrix-X";
        DateSpecified: Date;
        Totallowances: Decimal;
        TotalDeductions: Decimal;
        OtherEarn: Decimal;
        OtherDeduct: Decimal;
        counter: Integer;
        HRSetup: Record "Human Resources Setup";
        NetPay: Decimal;
        Payroll: Codeunit Payroll3;
        CoRec: Record "Company Information";
        MASTER_ROLLCaptionLbl: label 'MASTER ROLL';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Other_AllowancesCaptionLbl: label 'Other Allowances';
}
