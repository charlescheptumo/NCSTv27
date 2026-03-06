#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69053 "Master Roll Excel Export"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Master Roll Excel Export.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Pay Period Filter", "No.", "Posting Group", Status;
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
            column(Scale; Employee."Salary Scale")
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
            column(DedDesc_3_; DedDesc[3])
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
            column(Deductions_3_; Deductions[3])
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
            column(Deductions_3__Control1000000036; Deductions[3])
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
            column(Prepared_By______________________________________________________; 'Prepared By.....................................................')
            {
            }
            column(Approved_By_____________________________________________________; 'Approved By....................................................')
            {
            }
            column(Approved_By_____________________________________________; 'Approved By............................................')
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

            trigger OnAfterGetRecord()
            begin
                GrossPay := 0;
                TaxRelief := 0;
                EmployerPension := 0;
                EmployerNSSF := 0;
                TotalDed := 0;
                Employee.Department := '';
                Dep := '';
                ProfitCtr := '';
                Branch1 := '';
                PayPoint1 := '';
                Rank1 := '';
                JobTitle := '';
                HRSetup.Get;
                HRSetup.TestField(HRSetup."Net Pay Advance Code");

                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions", Employee."Total Allowances1");
                Employee.CalcFields(Employee.Branch, Employee.Paypoint, Employee."Staffing Group", Employee.Department);
                //IF (Employee."Total Allowances"+Employee."Total Deductions")=0 THEN

                if Assignmat.Get(Employee."No.", Assignmat.Type::Deduction, HRSetup."Net Pay Advance Code", DateSpecified) then
                    NetPayAdvance := Assignmat.Amount
                else
                    NetPayAdvance := 0;


                if (((Employee."Total Allowances1" + Employee."Total Deductions") = 0) and (NetPayAdvance = 0)) then
                    //CurrReport.SKIP;

                    TotalDed := Abs(Employee."Total Deductions");
                counter := counter + 1;
                NetPay := Employee."Total Allowances" + Employee."Total Deductions";

                //cc// NetPay := Payroll.PayrollRounding(NetPay);

                //CLEAR(Deductions[L]);
                for i := 1 to 10 do begin
                    Clear(Allowances[i]);
                    Clear(Deductions[i]);
                    Clear(Allowances2[i]);
                    //CLEAR(Deductions[L]);
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

                for i := 1 to 10 do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, deductcode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then
                        Deductions[i] := Abs(Assignmat.Amount);
                    TotalDeductions := TotalDeductions + Deductions[i];
                end;
                OtherDeduct := Abs(Employee."Total Deductions" + TotalDeductions);



                /*
                
                //BEGIN
                Assignmat.RESET;
                Assignmat.SETRANGE(Assignmat."Employee No",Employee."No.");
                Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Payment);
                Assignmat.SETRANGE(Assignmat."Payroll Period",DateSpecified);
                IF Assignmat.FIND('-') THEN BEGIN
                Department:=Assignmat."Department Code";
                
                END;
                //END;
                */



                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                if DateSpecified <> 0D then
                    EarnRec.SetRange(EarnRec."Pay Period Filter", DateSpecified);
                if PostingGrp <> '' then
                    EarnRec.SetRange(EarnRec."Posting Group Filter", PostingGrp);
                EarnRec.CalcFields(EarnRec."Total Amount");
                EarnRec.SetFilter(EarnRec."Total Amount", '<>%1', 0);


                k := 1;
                if EarnRec.Find('-') then begin
                    repeat

                        if Assignmat.Get(Employee."No.", Assignmat.Type::Payment, EarnRec.Code, DateSpecified) then
                            Allowances[k] := Assignmat.Amount
                        else
                            Allowances[k] := 0;

                        if EarnRec."Show No.of Days" = true then begin
                            k := k + 1;
                            Allowances[k] := Assignmat."Days Worked/Lost";
                        end;

                        if EarnRec."Show No.of Hours" = true then begin
                            k := k + 1;
                            Allowances[k] := Assignmat."No. Of Hours";
                        end;

                        k := k + 1;

                    until EarnRec.Next = 0;

                end;


                //Non-Cash Benefit.
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", true);
                if DateSpecified <> 0D then
                    EarnRec.SetRange(EarnRec."Pay Period Filter", DateSpecified);
                if PostingGrp <> '' then
                    EarnRec.SetRange(EarnRec."Posting Group Filter", PostingGrp);
                EarnRec.CalcFields(EarnRec."Total Amount");
                EarnRec.SetFilter(EarnRec."Total Amount", '<>%1', 0);


                m := 1;
                if EarnRec.Find('-') then begin
                    repeat

                        if Assignmat.Get(Employee."No.", Assignmat.Type::Payment, EarnRec.Code, DateSpecified) then
                            Allowances2[m] := Assignmat.Amount
                        else
                            Allowances2[m] := 0;

                        if EarnRec."Show No.of Days" = true then begin
                            m := m + 1;
                            Allowances2[m] := Assignmat."Days Worked/Lost";
                        end;

                        if EarnRec."Show No.of Hours" = true then begin
                            m := m + 1;
                            Allowances2[m] := 0;
                            Allowances2[m] := Assignmat."No. Of Hours";
                        end;

                        m := m + 1;

                    until EarnRec.Next = 0;

                end;
                ///end Non-Cash Benefit.

                Dep := Employee.Department;
                ProfitCtr := Employee."Global Dimension 2 Code";
                Branch1 := Employee.Branch;
                PayPoint1 := Employee.Paypoint;
                PayrollGroup := Employee."Posting Group";
                JobTitle := Employee."Job Title";
                Rank1 := Format(Employee.Rank);


                ///Calculate Tax Relief
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Tax Relief");
                //EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",FALSE);

                if EarnRec.Find('-') then begin
                    repeat

                        //ExcelBuf.AddColumn(EarnRec.Description,FALSE,'',TRUE,FALSE,FALSE,'@');
                        //FOR i:=1 TO 10 DO
                        //BEGIN
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                        Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Assignmat.Code, EarnRec.Code);
                        Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                        if Assignmat.Find('-') then begin

                            //Allowances[k]:=Assignmat.Amount;
                            //Totallowances:=Totallowances+Allowances[i];
                            //END;
                            //Dep:=Assignmat."Department Code";

                            TaxRelief := TaxRelief + Assignmat.Amount;
                        end;
                    // k:=k+1;
                    until EarnRec.Next = 0;
                end;

                //end Tax releif

                //Employer Pension
                DedRec.Reset;
                //DedRec.SETRANGE();
                if DateSpecified <> 0D then
                    DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
                DedRec.SetRange(DedRec."Pension Scheme", true);
                if PostingGrp <> '' then
                    DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
                DedRec.SetFilter(DedRec.Description, '<>%1', 'NSSF');
                DedRec.CalcFields(DedRec."Total Amount Employer");
                DedRec.SetFilter(DedRec."Total Amount Employer", '<>%1', 0);


                if DedRec.Find('-') then begin
                    //REPEAT
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                        Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                        Assignmat.SetRange(Assignmat.Code, DedRec.Code);
                        Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                        if Assignmat.Find('-') then begin

                            repeat
                                //Deductions[L]:=Assignmat.Amount;

                                //Totallowances:=Totallowances+Allowances[i];
                                //END;
                                EmployerPension := EmployerPension + Assignmat."Employer Amount";
                            //GrossPay:=GrossPay+Assignmat.Amount;

                            until Assignmat.Next = 0;
                        end;

                    until DedRec.Next = 0
                end;

                //END;
                //end Employer pension

                //Employer NSSF
                DedRec.Reset;
                //DedRec.SETRANGE();
                if DateSpecified <> 0D then
                    DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
                DedRec.SetRange(DedRec."Pension Scheme", true);
                if PostingGrp <> '' then
                    DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
                DedRec.SetFilter(DedRec.Description, '=%1', 'NSSF');
                DedRec.CalcFields(DedRec."Total Amount Employer");
                DedRec.SetFilter(DedRec."Total Amount Employer", '<>%1', 0);


                if DedRec.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                        Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                        Assignmat.SetRange(Assignmat.Code, DedRec.Code);
                        Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                        if Assignmat.Find('-') then begin

                            repeat
                                //Deductions[L]:=Assignmat.Amount;

                                //Totallowances:=Totallowances+Allowances[i];
                                //END;
                                EmployerNSSF := EmployerNSSF + Assignmat."Employer Amount";
                            //GrossPay:=GrossPay+Assignmat.Amount;

                            until Assignmat.Next = 0;
                        end;





                    until DedRec.Next = 0;
                end;
                //end Employer NSSF


                ///Calculate Gross pay
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);

                if EarnRec.Find('-') then begin
                    repeat

                        //ExcelBuf.AddColumn(EarnRec.Description,FALSE,'',TRUE,FALSE,FALSE,'@');
                        //FOR i:=1 TO 10 DO
                        //BEGIN
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                        Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Assignmat.Code, EarnRec.Code);
                        Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                        if Assignmat.Find('-') then begin

                            //Allowances[k]:=Assignmat.Amount;
                            //Totallowances:=Totallowances+Allowances[i];
                            //END;
                            //Dep:=Assignmat."Department Code";

                            GrossPay := GrossPay + Assignmat.Amount;
                        end;
                    // k:=k+1;
                    until EarnRec.Next = 0;
                end;


                DedRec.Reset;
                //DedRec.SETRANGE();
                if DateSpecified <> 0D then
                    DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
                if PostingGrp <> '' then
                    DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
                DedRec.CalcFields(DedRec."Total Amount");
                DedRec.SetFilter(DedRec."Total Amount", '<>%1', 0);

                L := 1;
                if DedRec.Find('-') then begin
                    repeat
                        Deductions[L] := 0;
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                        Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                        Assignmat.SetRange(Assignmat.Code, DedRec.Code);
                        Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                        if Assignmat.Find('-') then begin
                            Deductions[L] := Assignmat.Amount;

                            //Totallowances:=Totallowances+Allowances[i];
                            //END;

                            //GrossPay:=GrossPay+Assignmat.Amount;
                        end;
                        L := L + 1;


                    until DedRec.Next = 0;
                end;


                MakeExcelDataBody;

            end;

            trigger OnPostDataItem()
            begin
                MakeExcelFooter;
                CreateExcelbook;
            end;

            trigger OnPreDataItem()
            begin
                //   CurrReport.CreateTotals(Allowances, Deductions, OtherEarn, OtherDeduct, NetPay);
                HRSetup.Get;

                MakeExcelHeader;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("Posting Group"; PostingGrp)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posting Group';

                        trigger OnLookup(var Text: Text): Boolean
                        begin


                            PosGrp.Reset;

                            if Page.RunModal(69042, PosGrp) = Action::LookupOK then
                                PostingGrp := PosGrp.Code;
                        end;
                    }
                }
            }
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
        if EarnRec.Find('-') then
            repeat
                i := i + 1;
                Earncode[i] := EarnRec.Code;
                EarnDesc[i] := EarnRec.Description;
            until EarnRec.Next = 0;


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

        //IF PostingGrp='' THEN
        //ERROR('YOU MUST SPECIFY POSTING GROUP UNDER OPTIONS!!PLEASE CHECK!');
    end;

    var
        Allowances: array[200] of Decimal;
        Deductions: array[200] of Decimal;
        EarnRec: Record EarningsX;
        DedRec: Record DeductionsX;
        Earncode: array[1000] of Code[10];
        deductcode: array[1000] of Code[10];
        EarnDesc: array[1000] of Text;
        DedDesc: array[1000] of Text;
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
        ExcelBuf: Record "Excel Buffer" temporary;
        Text002: label 'MASTER ROLL';
        Text001: label 'KS';
        Dep: Code[20];
        EarningsCount: Integer;
        DeductionsCount: Integer;
        k: Integer;
        GrossPay: Decimal;
        L: Integer;
        "S/NO": Integer;
        ProfitCtr: Code[20];
        Branch1: Code[20];
        PayPoint1: Code[20];
        EarnCount: Integer;
        EarnAmount: Decimal;
        PostingGrp: Code[20];
        PosGrp: Record "Employee Posting GroupX";
        PayrollGroup: Code[20];
        NetPayAdvance: Decimal;
        m: Integer;
        Allowances2: array[200] of Decimal;
        TaxRelief: Decimal;
        EmployerPension: Decimal;
        EmployerNSSF: Decimal;
        TotalDed: Decimal;
        JobTitle: Text[100];
        Rank1: Text[100];
        MASTER_ROLLCaptionLbl: label 'MASTER ROLL';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Other_AllowancesCaptionLbl: label 'Other Allowances';


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        
        */

        //ExcelBuf.CreateBookAndOpenExcel(Text002,Text001,COMPANYNAME,USERID);
        //cc  ExcelBuf.CreateBookAndOpenExcel('D:\Payroll\MASTER ROLL.xlsx', Text002, Text001, COMPANYNAME, UserId);
        //ERROR('');
        Error('');

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(counter, false, '', false, false, false, '@', ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn(Employee."No.", false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn(Employee."Last Name",FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Employee."First Name" + ' ' + Employee."Middle Name"
        + ' ' + Employee."Last Name", false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn(JobTitle,FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(Rank1,FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(ProfitCtr,FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(Branch1,FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(Dep,FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(PayPoint1,FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(PayrollGroup,FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);

        EarnRec.Reset;
        EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
        EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
        if DateSpecified <> 0D then
            EarnRec.SetRange(EarnRec."Pay Period Filter", DateSpecified);
        if PostingGrp <> '' then
            EarnRec.SetRange(EarnRec."Posting Group Filter", PostingGrp);
        EarnRec.CalcFields(EarnRec."Total Amount");
        EarnRec.SetFilter(EarnRec."Total Amount", '<>%1', 0);
        k := 1;
        if EarnRec.Find('-') then begin
            repeat

                //EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
                //FOR k:=1 TO EarnRec.COUNT DO
                //BEGIN
                ExcelBuf.AddColumn(Allowances[k], false, '', false, false, false, '', ExcelBuf."cell type"::Number);
                //END;

                if EarnRec."Show No.of Days" = true then begin
                    k := k + 1;
                    ExcelBuf.AddColumn(Allowances[k], false, '', false, false, false, '', ExcelBuf."cell type"::Number);
                end;

                if EarnRec."Show No.of Hours" = true then begin
                    k := k + 1;
                    ExcelBuf.AddColumn(Allowances[k], false, '', false, false, false, '', ExcelBuf."cell type"::Number);
                end;


                k := k + 1;
            until EarnRec.Next = 0;
        end;
        ///Non-Cash Benefit


        EarnRec.Reset;
        EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
        EarnRec.SetRange(EarnRec."Non-Cash Benefit", true);
        if DateSpecified <> 0D then
            EarnRec.SetRange(EarnRec."Pay Period Filter", DateSpecified);
        if PostingGrp <> '' then
            EarnRec.SetRange(EarnRec."Posting Group Filter", PostingGrp);
        EarnRec.CalcFields(EarnRec."Total Amount");
        EarnRec.SetFilter(EarnRec."Total Amount", '<>%1', 0);
        m := 1;
        if EarnRec.Find('-') then begin
            repeat

                //EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
                //FOR k:=1 TO EarnRec.COUNT DO
                //BEGIN
                ExcelBuf.AddColumn(Allowances2[m], false, '', false, false, false, '', ExcelBuf."cell type"::Number);
                //END;

                if EarnRec."Show No.of Days" = true then begin
                    m := m + 1;
                    ExcelBuf.AddColumn(Allowances2[m], false, '', false, false, false, '', ExcelBuf."cell type"::Number);
                end;

                if EarnRec."Show No.of Hours" = true then begin
                    m := m + 1;
                    ExcelBuf.AddColumn(Allowances2[m], false, '', false, false, false, '', ExcelBuf."cell type"::Number);
                end;


                m := m + 1;
            until EarnRec.Next = 0;
        end;

        ///End non-cash benefit
        ExcelBuf.AddColumn(TaxRelief, false, '', false, false, false, '', ExcelBuf."cell type"::Number);

        //Employer Pension
        DedRec.Reset;
        //DedRec.SETRANGE();
        if DateSpecified <> 0D then
            DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
        DedRec.SetRange(DedRec."Pension Scheme", true);
        if PostingGrp <> '' then
            DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
        DedRec.SetFilter(DedRec.Description, '<>%1', 'NSSF');
        DedRec.CalcFields(DedRec."Total Amount Employer");
        DedRec.SetFilter(DedRec."Total Amount Employer", '<>%1', 0);


        //IF DedRec.FIND('-') THEN BEGIN
        //REPEAT
        if DedRec.FindFirst then begin
            ExcelBuf.AddColumn(EmployerPension, false, '', false, false, false, '', ExcelBuf."cell type"::Number);

            //UNTIL DedRec.NEXT=0;
        end;
        //end Employer pension

        //Employer NSSF
        DedRec.Reset;
        //DedRec.SETRANGE();
        if DateSpecified <> 0D then
            DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
        DedRec.SetRange(DedRec."Pension Scheme", true);
        if PostingGrp <> '' then
            DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
        DedRec.SetFilter(DedRec.Description, '=%1', 'NSSF');
        DedRec.CalcFields(DedRec."Total Amount Employer");
        DedRec.SetFilter(DedRec."Total Amount Employer", '<>%1', 0);


        if DedRec.FindFirst then begin
            //REPEAT
            ExcelBuf.AddColumn(EmployerNSSF, false, '', false, false, false, '', ExcelBuf."cell type"::Number);
            //UNTIL DedRec.NEXT=0;
        end;
        //end Employer NSSF



        ExcelBuf.AddColumn(GrossPay, false, '', true, false, false, '', ExcelBuf."cell type"::Number);

        DedRec.Reset;
        //DedRec.COUNT;
        if DateSpecified <> 0D then
            DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
        if PostingGrp <> '' then
            DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
        DedRec.CalcFields(DedRec."Total Amount");
        DedRec.SetFilter(DedRec."Total Amount", '<>%1', 0);


        for L := 1 to DedRec.Count do begin
            ExcelBuf.AddColumn(Deductions[L], false, '', false, false, false, '', ExcelBuf."cell type"::Number);

        end;

        ExcelBuf.AddColumn(TotalDed, false, '', true, false, false, '', ExcelBuf."cell type"::Number);

        ExcelBuf.AddColumn(NetPay, false, '', true, false, false, '', ExcelBuf."cell type"::Number);




        /*
        
        ExcelBuf.AddColumn(BranchName,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(BankCode,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(BranchCode,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(BankAcc,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Amount,FALSE,'',FALSE,FALSE,FALSE,'');
        
        */

    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        ExcelBuf.NewRow;

        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(UpperCase(COMPANYNAME), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('PERIOD: ' + UpperCase(Format(DateSpecified, 0, '<month text> <year4>')), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('POSTING GROUP: ' + Employee.GetFilter(Employee."Posting Group"), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);


        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('GENERATED ON: ' + Format(CurrentDatetime), false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('S/NO.', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('EMP NO.', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NAME', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        //ExcelBuf.AddColumn('TITLE',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('RANK',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('PROFIT CENTRE',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('BRANCH',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('DEPARTMENT',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('PAYPOINT',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('PAYROLL GROUP',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);


        /*
        
        ExcelBuf.AddColumn('BANK NAME',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('BANK BRANCH',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('BANK CODE',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('BRANCH CODE',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('A/C NUMBER',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('AMOUNT KSHS',FALSE,'',FALSE,FALSE,FALSE,'');
        
        
        */

        EarnRec.Reset;
        EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
        EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
        if DateSpecified <> 0D then
            EarnRec.SetRange(EarnRec."Pay Period Filter", DateSpecified);
        if PostingGrp <> '' then
            EarnRec.SetRange(EarnRec."Posting Group Filter", PostingGrp);
        EarnRec.CalcFields(EarnRec."Total Amount");
        EarnRec.SetFilter(EarnRec."Total Amount", '<>%1', 0);

        if EarnRec.Find('-') then begin
            repeat
                ExcelBuf.AddColumn(EarnRec.Description, false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

                if EarnRec."Show No.of Days" = true then
                    ExcelBuf.AddColumn(EarnRec.Description + '-DAYS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
                if EarnRec."Show No.of Hours" = true then
                    ExcelBuf.AddColumn(EarnRec.Description + '-HRS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);


            //end;

            until EarnRec.Next = 0;
        end;


        //Non-Cash Benefits
        EarnRec.Reset;
        EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
        EarnRec.SetRange(EarnRec."Non-Cash Benefit", true);
        if DateSpecified <> 0D then
            EarnRec.SetRange(EarnRec."Pay Period Filter", DateSpecified);
        if PostingGrp <> '' then
            EarnRec.SetRange(EarnRec."Posting Group Filter", PostingGrp);
        EarnRec.CalcFields(EarnRec."Total Amount");
        EarnRec.SetFilter(EarnRec."Total Amount", '<>%1', 0);

        if EarnRec.Find('-') then begin
            repeat
                ExcelBuf.AddColumn(EarnRec.Description, false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

                if EarnRec."Show No.of Days" = true then
                    ExcelBuf.AddColumn(EarnRec.Description + '-DAYS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
                if EarnRec."Show No.of Hours" = true then
                    ExcelBuf.AddColumn(EarnRec.Description + '-HRS', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);


            //end;

            until EarnRec.Next = 0;
        end;
        //end non-cash benefits
        ExcelBuf.AddColumn('Tax Relief', false, '', true, false, false, '', ExcelBuf."cell type"::Text);


        //Employer Pension
        DedRec.Reset;
        //DedRec.SETRANGE();
        if DateSpecified <> 0D then
            DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
        DedRec.SetRange(DedRec."Pension Scheme", true);
        if PostingGrp <> '' then
            DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
        DedRec.SetFilter(DedRec.Description, '<>%1', 'NSSF');
        DedRec.CalcFields(DedRec."Total Amount Employer");
        DedRec.SetFilter(DedRec."Total Amount Employer", '<>%1', 0);


        if DedRec.FindFirst then begin
            //REPEAT
            ExcelBuf.AddColumn('EMPLOYER PENSION', false, '', true, false, false, '', ExcelBuf."cell type"::Text);

            //UNTIL DedRec.NEXT=0;
        end;
        //end Employer pension

        //Employer NSSF
        DedRec.Reset;
        //DedRec.SETRANGE();
        if DateSpecified <> 0D then
            DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
        DedRec.SetRange(DedRec."Pension Scheme", true);
        if PostingGrp <> '' then
            DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
        DedRec.SetFilter(DedRec.Description, '=%1', 'NSSF');
        DedRec.CalcFields(DedRec."Total Amount Employer");
        DedRec.SetFilter(DedRec."Total Amount Employer", '<>%1', 0);

        if DedRec.FindFirst then begin
            //REPEAT
            ExcelBuf.AddColumn('EMPLOYER NSSF', false, '', true, false, false, '', ExcelBuf."cell type"::Text);

            //UNTIL DedRec.NEXT=0;
        end;

        //end Employer NSSF



        ExcelBuf.AddColumn('GROSS PAY', false, '', true, false, false, '', ExcelBuf."cell type"::Text);

        DedRec.Reset;

        if DateSpecified <> 0D then
            DedRec.SetRange(DedRec."Pay Period Filter", DateSpecified);
        if PostingGrp <> '' then
            DedRec.SetRange(DedRec."Posting Group Filter", PostingGrp);
        DedRec.CalcFields(DedRec."Total Amount");
        DedRec.SetFilter(DedRec."Total Amount", '<>%1', 0);


        if DedRec.Find('-') then begin
            repeat
                ExcelBuf.AddColumn(DedRec.Description, false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

            until DedRec.Next = 0;
        end;
        ExcelBuf.AddColumn('TOTAL DEDUCTIONS', false, '', true, false, false, '', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NET PAY', false, '', true, false, false, '', ExcelBuf."cell type"::Text);

    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        /*
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalNet,FALSE,'',FALSE,FALSE,FALSE,'');
        
        */

    end;
}
