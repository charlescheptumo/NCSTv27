#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69069 "Employee Biodata"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Biodata.rdlc';
    UsageCategory = Tasks;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Pay Period Filter", "No.", "Posting Group";
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
                Classification1 := '';
                Rank1 := '';
                JobTitle := '';

                PayModE := '';
                BankCode := '';
                BankAccount := '';
                NSSF1 := '';
                PIN := '';
                Employee.SystemId := '';
                DateJoined := 0D;
                DateLeft := 0D;
                DateBorn := 0D;
                NHIF1 := '';


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
                    CurrReport.Skip;

                TotalDed := Abs(Employee."Total Deductions");
                counter := counter + 1;
                NetPay := Employee."Total Allowances" + Employee."Total Deductions";

              //cc//  NetPay := Payroll.PayrollRounding(NetPay);


                for i := 1 to 10 do begin
                    Clear(Allowances[i]);
                    Clear(Deductions[i]);
                    Clear(Allowances2[i]);
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



                /*
                
                EarnRec.RESET;
                EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
                EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",FALSE);
                IF DateSpecified<>0D THEN
                EarnRec.SETRANGE(EarnRec."Pay Period Filter",DateSpecified);
                IF PostingGrp<>'' THEN
                EarnRec.SETRANGE(EarnRec."Posting Group Filter",PostingGrp);
                EarnRec.CALCFIELDS(EarnRec."Total Amount");
                EarnRec.SETFILTER(EarnRec."Total Amount",'<>%1',0);
                
                
                k:=1;
                IF EarnRec.FIND('-') THEN BEGIN
                REPEAT
                
                IF Assignmat.GET(Employee."No.",Assignmat.Type::Payment,EarnRec.Code,DateSpecified) THEN
                Allowances[k]:=Assignmat.Amount
                ELSE
                Allowances[k]:=0;
                
                IF EarnRec."Show No.of Days"=TRUE THEN BEGIN
                 k:=k+1;
                Allowances[k]:=Assignmat."Days Worked/Lost";
                END;
                
                IF EarnRec."Show No.of Hours"=TRUE THEN BEGIN
                 k:=k+1;
                Allowances[k]:=Assignmat."No. Of Hours";
                END;
                
                 k:=k+1;
                
                UNTIL EarnRec.NEXT=0;
                
                END;
                
                
                //Non-Cash Benefit.
                EarnRec.RESET;
                EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
                EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",TRUE);
                IF DateSpecified<>0D THEN
                EarnRec.SETRANGE(EarnRec."Pay Period Filter",DateSpecified);
                IF PostingGrp<>'' THEN
                EarnRec.SETRANGE(EarnRec."Posting Group Filter",PostingGrp);
                EarnRec.CALCFIELDS(EarnRec."Total Amount");
                EarnRec.SETFILTER(EarnRec."Total Amount",'<>%1',0);
                
                
                m:=1;
                IF EarnRec.FIND('-') THEN BEGIN
                REPEAT
                
                IF Assignmat.GET(Employee."No.",Assignmat.Type::Payment,EarnRec.Code,DateSpecified) THEN
                Allowances2[m]:=Assignmat.Amount
                ELSE
                Allowances2[m]:=0;
                
                IF EarnRec."Show No.of Days"=TRUE THEN BEGIN
                m:=m+1;
                Allowances2[m]:=Assignmat."Days Worked/Lost";
                END;
                
                IF EarnRec."Show No.of Hours"=TRUE THEN BEGIN
                 m:=m+1;
                 Allowances2[m]:=0;
                Allowances2[m]:=Assignmat."No. Of Hours";
                END;
                
                 m:=m+1;
                
                UNTIL EarnRec.NEXT=0;
                
                END;
                ///end Non-Cash Benefit.
                
                */


                /*
                
                ///Calculate Tax Relief
                EarnRec.RESET;
                EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Tax Relief");
                //EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",FALSE);
                
                IF EarnRec.FIND('-') THEN BEGIN
                REPEAT
                
                //ExcelBuf.AddColumn(EarnRec.Description,FALSE,'',TRUE,FALSE,FALSE,'@');
                //FOR i:=1 TO 10 DO
                //BEGIN
                Assignmat.RESET;
                Assignmat.SETRANGE(Assignmat."Employee No",Employee."No.");
                Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Payment);
                Assignmat.SETRANGE(Assignmat.Code,EarnRec.Code);
                Assignmat.SETRANGE(Assignmat."Payroll Period",DateSpecified);
                IF Assignmat.FIND('-') THEN BEGIN
                
                //Allowances[k]:=Assignmat.Amount;
                //Totallowances:=Totallowances+Allowances[i];
                //END;
                //Dep:=Assignmat."Department Code";
                
                TaxRelief:=TaxRelief+Assignmat.Amount;
                END;
                // k:=k+1;
                UNTIL EarnRec.NEXT=0;
                END;
                
                //end Tax releif
                
                //Employer Pension
                DedRec.RESET;
                //DedRec.SETRANGE();
                IF DateSpecified<>0D THEN
                DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
                DedRec.SETRANGE(DedRec."Pension Scheme",TRUE);
                IF PostingGrp<>'' THEN
                DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
                DedRec.SETFILTER(DedRec.Description,'<>%1','NSSF');
                DedRec.CALCFIELDS(DedRec."Total Amount Employer");
                DedRec.SETFILTER(DedRec."Total Amount Employer",'<>%1',0);
                
                
                IF DedRec.FIND('-') THEN BEGIN
                //REPEAT
                REPEAT
                Assignmat.RESET;
                Assignmat.SETRANGE(Assignmat."Employee No",Employee."No.");
                Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Deduction);
                Assignmat.SETRANGE(Assignmat.Code,DedRec.Code);
                Assignmat.SETRANGE(Assignmat."Payroll Period",DateSpecified);
                IF Assignmat.FIND('-') THEN BEGIN
                
                REPEAT
                //Deductions[L]:=Assignmat.Amount;
                
                //Totallowances:=Totallowances+Allowances[i];
                //END;
                EmployerPension:=EmployerPension+Assignmat."Employer Amount";
                //GrossPay:=GrossPay+Assignmat.Amount;
                
                UNTIL Assignmat.NEXT=0;
                 END;
                
                UNTIL DedRec.NEXT=0
                 END;
                
                //END;
                //end Employer pension
                
                //Employer NSSF
                DedRec.RESET;
                //DedRec.SETRANGE();
                IF DateSpecified<>0D THEN
                DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
                DedRec.SETRANGE(DedRec."Pension Scheme",TRUE);
                IF PostingGrp<>'' THEN
                DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
                DedRec.SETFILTER(DedRec.Description,'=%1','NSSF');
                DedRec.CALCFIELDS(DedRec."Total Amount Employer");
                DedRec.SETFILTER(DedRec."Total Amount Employer",'<>%1',0);
                
                
                IF DedRec.FIND('-') THEN BEGIN
                REPEAT
                Assignmat.RESET;
                Assignmat.SETRANGE(Assignmat."Employee No",Employee."No.");
                Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Deduction);
                Assignmat.SETRANGE(Assignmat.Code,DedRec.Code);
                Assignmat.SETRANGE(Assignmat."Payroll Period",DateSpecified);
                IF Assignmat.FIND('-') THEN BEGIN
                
                REPEAT
                //Deductions[L]:=Assignmat.Amount;
                
                //Totallowances:=Totallowances+Allowances[i];
                //END;
                EmployerNSSF:=EmployerNSSF+Assignmat."Employer Amount";
                //GrossPay:=GrossPay+Assignmat.Amount;
                
                UNTIL Assignmat.NEXT=0;
                 END;
                
                
                
                
                
                UNTIL DedRec.NEXT=0;
                END;
                //end Employer NSSF
                
                
                ///Calculate Gross pay
                EarnRec.RESET;
                EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
                EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",FALSE);
                
                IF EarnRec.FIND('-') THEN BEGIN
                REPEAT
                
                //ExcelBuf.AddColumn(EarnRec.Description,FALSE,'',TRUE,FALSE,FALSE,'@');
                //FOR i:=1 TO 10 DO
                //BEGIN
                Assignmat.RESET;
                Assignmat.SETRANGE(Assignmat."Employee No",Employee."No.");
                Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Payment);
                Assignmat.SETRANGE(Assignmat.Code,EarnRec.Code);
                Assignmat.SETRANGE(Assignmat."Payroll Period",DateSpecified);
                IF Assignmat.FIND('-') THEN BEGIN
                
                //Allowances[k]:=Assignmat.Amount;
                //Totallowances:=Totallowances+Allowances[i];
                //END;
                //Dep:=Assignmat."Department Code";
                
                GrossPay:=GrossPay+Assignmat.Amount;
                END;
                // k:=k+1;
                UNTIL EarnRec.NEXT=0;
                END;
                
                
                DedRec.RESET;
                //DedRec.SETRANGE();
                IF DateSpecified<>0D THEN
                DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
                IF PostingGrp<>'' THEN
                DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
                DedRec.CALCFIELDS(DedRec."Total Amount");
                DedRec.SETFILTER(DedRec."Total Amount",'<>%1',0);
                
                L:=1;
                IF DedRec.FIND('-') THEN BEGIN
                REPEAT
                Assignmat.RESET;
                Assignmat.SETRANGE(Assignmat."Employee No",Employee."No.");
                Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Deduction);
                Assignmat.SETRANGE(Assignmat.Code,DedRec.Code);
                Assignmat.SETRANGE(Assignmat."Payroll Period",DateSpecified);
                IF Assignmat.FIND('-') THEN BEGIN
                Deductions[L]:=Assignmat.Amount;
                
                //Totallowances:=Totallowances+Allowances[i];
                //END;
                
                //GrossPay:=GrossPay+Assignmat.Amount;
                 END;
                 L:=L+1;
                
                
                UNTIL DedRec.NEXT=0;
                END;
                */




                Dep := Employee.Department;
                ProfitCtr := Employee."Global Dimension 2 Code";
                Branch1 := Employee.Branch;
                PayPoint1 := Employee.Paypoint;
                Classification1 := Employee.Classification;
                PayrollGroup := Employee."Posting Group";
                JobTitle := Employee."Job Title";
                Rank1 := Format(Employee.Rank);

                PayModE := Format(Employee."Pay Mode");
                BankCode := Employee."Employee's Bank" + Employee."Bank Branch";
                BankAccount := Employee."Bank Account Number";
                NSSF1 := Employee."Social Security No.";
                NHIF1 := Employee."N.H.I.F No";
                PIN := Employee."P.I.N";
                Employee."ID Number" := Employee."ID Number";
                if Employee."Employment Date" <> 0D then
                    DateJoined := Employee."Employment Date"
                else
                    DateJoined := Employee."Date Of Join";
                DateLeft := Employee."Termination Date";
                DateBorn := Employee."Birth Date";


                MakeExcelDataBody;

            end;

            trigger OnPostDataItem()
            begin
                MakeExcelFooter;
                CreateExcelbook;
            end;

            trigger OnPreDataItem()
            begin
                // CurrReport.CreateTotals(Allowances, Deductions, OtherEarn, OtherDeduct, NetPay);
                HRSetup.Get;

                MakeExcelHeader;
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

        //IF UserRole.GET(USERID,'PAYROLLVIEW',' ')=FALSE THEN
        //ERROR('You do not have permissions to view this form');
    end;

    var
        Allowances: array[200] of Decimal;
        Deductions: array[200] of Decimal;
        EarnRec: Record EarningsX;
        DedRec: Record DeductionsX;
        Earncode: array[20] of Code[10];
        deductcode: array[20] of Code[10];
        EarnDesc: array[20] of Text[30];
        DedDesc: array[20] of Text[30];
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
        PayModE: Text[100];
        BankCode: Code[10];
        BankAccount: Code[100];
        NSSF1: Text[50];
        PIN: Text[50];
        ID: Text[50];
        DateJoined: Date;
        DateLeft: Date;
        DateBorn: Date;
        NHIF1: Text[100];
        Classification1: Code[20];
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
        //ExcelBuf.CreateBookAndOpenExcel('C:\Payroll\Employee Biodata.xlsx', Text002, Text001, COMPANYNAME, UserId);
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
        ExcelBuf.AddColumn(JobTitle, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Rank1, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ProfitCtr, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Branch1, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Dep, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(PayPoint1, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Classification1, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(PayrollGroup, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn(PayModE, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(BankCode, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(BankAccount, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(NSSF1, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(NHIF1, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(PIN, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(ID, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(DateJoined, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(DateLeft, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(DateBorn, false, '', false, false, false, '@', ExcelBuf."cell type"::Text);


        /*
        EarnRec.RESET;
        EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
        EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",FALSE);
        IF DateSpecified<>0D THEN
        EarnRec.SETRANGE(EarnRec."Pay Period Filter",DateSpecified);
        IF PostingGrp<>'' THEN
        EarnRec.SETRANGE(EarnRec."Posting Group Filter",PostingGrp);
        EarnRec.CALCFIELDS(EarnRec."Total Amount");
        EarnRec.SETFILTER(EarnRec."Total Amount",'<>%1',0);
        k:=1;
        IF EarnRec.FIND('-') THEN BEGIN
        REPEAT
        
        //EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
        //FOR k:=1 TO EarnRec.COUNT DO
        //BEGIN
        ExcelBuf.AddColumn(Allowances[k],FALSE,'',FALSE,FALSE,FALSE,'');
        //END;
        
        IF EarnRec."Show No.of Days"=TRUE THEN BEGIN
         k:=k+1;
        ExcelBuf.AddColumn(Allowances[k],FALSE,'',FALSE,FALSE,FALSE,'');
        END;
        
        IF EarnRec."Show No.of Hours"=TRUE THEN BEGIN
         k:=k+1;
        ExcelBuf.AddColumn(Allowances[k],FALSE,'',FALSE,FALSE,FALSE,'');
        END;
        
        
        k:=k+1;
        UNTIL EarnRec.NEXT=0;
        END;
        ///Non-Cash Benefit
        
        
        EarnRec.RESET;
        EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
        EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",TRUE);
        IF DateSpecified<>0D THEN
        EarnRec.SETRANGE(EarnRec."Pay Period Filter",DateSpecified);
        IF PostingGrp<>'' THEN
        EarnRec.SETRANGE(EarnRec."Posting Group Filter",PostingGrp);
        EarnRec.CALCFIELDS(EarnRec."Total Amount");
        EarnRec.SETFILTER(EarnRec."Total Amount",'<>%1',0);
        m:=1;
        IF EarnRec.FIND('-') THEN BEGIN
        REPEAT
        
        //EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
        //FOR k:=1 TO EarnRec.COUNT DO
        //BEGIN
        ExcelBuf.AddColumn(Allowances2[m],FALSE,'',FALSE,FALSE,FALSE,'');
        //END;
        
        IF EarnRec."Show No.of Days"=TRUE THEN BEGIN
         m:=m+1;
        ExcelBuf.AddColumn(Allowances2[m],FALSE,'',FALSE,FALSE,FALSE,'');
        END;
        
        IF EarnRec."Show No.of Hours"=TRUE THEN BEGIN
         m:=m+1;
        ExcelBuf.AddColumn(Allowances2[m],FALSE,'',FALSE,FALSE,FALSE,'');
        END;
        
        
        m:=m+1;
        UNTIL EarnRec.NEXT=0;
        END;
        
        ///End non-cash benefit
        ExcelBuf.AddColumn(TaxRelief,FALSE,'',FALSE,FALSE,FALSE,'');
        
        //Employer Pension
        DedRec.RESET;
        //DedRec.SETRANGE();
        IF DateSpecified<>0D THEN
        DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
        DedRec.SETRANGE(DedRec."Pension Scheme",TRUE);
        IF PostingGrp<>'' THEN
        DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
        DedRec.SETFILTER(DedRec.Description,'<>%1','NSSF');
        DedRec.CALCFIELDS(DedRec."Total Amount Employer");
        DedRec.SETFILTER(DedRec."Total Amount Employer",'<>%1',0);
        
        
        //IF DedRec.FIND('-') THEN BEGIN
        //REPEAT
        IF DedRec.FINDFIRST THEN BEGIN
        ExcelBuf.AddColumn(EmployerPension,FALSE,'',FALSE,FALSE,FALSE,'');
        
        //UNTIL DedRec.NEXT=0;
        END;
        //end Employer pension
        
        //Employer NSSF
        DedRec.RESET;
        //DedRec.SETRANGE();
        IF DateSpecified<>0D THEN
        DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
        DedRec.SETRANGE(DedRec."Pension Scheme",TRUE);
        IF PostingGrp<>'' THEN
        DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
        DedRec.SETFILTER(DedRec.Description,'=%1','NSSF');
        DedRec.CALCFIELDS(DedRec."Total Amount Employer");
        DedRec.SETFILTER(DedRec."Total Amount Employer",'<>%1',0);
        
        
        IF DedRec.FINDFIRST THEN BEGIN
        //REPEAT
        ExcelBuf.AddColumn(EmployerNSSF,FALSE,'',FALSE,FALSE,FALSE,'');
        //UNTIL DedRec.NEXT=0;
        END;
        //end Employer NSSF
        
        
        
        ExcelBuf.AddColumn(GrossPay,FALSE,'',TRUE,FALSE,FALSE,'');
        
        DedRec.RESET;
        //DedRec.COUNT;
        IF DateSpecified<>0D THEN
        DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
        IF PostingGrp<>'' THEN
        DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
        DedRec.CALCFIELDS(DedRec."Total Amount");
        DedRec.SETFILTER(DedRec."Total Amount",'<>%1',0);
        
        
        FOR L:=1 TO DedRec.COUNT DO
        BEGIN
        ExcelBuf.AddColumn(Deductions[L],FALSE,'',FALSE,FALSE,FALSE,'');
        
        END;
        
        ExcelBuf.AddColumn(TotalDed,FALSE,'',TRUE,FALSE,FALSE,'');
        
        ExcelBuf.AddColumn(NetPay,FALSE,'',TRUE,FALSE,FALSE,'');
        */

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
        /*
        ExcelBuf.NewRow;
        
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(UPPERCASE(COMPANYNAME),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('PERIOD: '+UPPERCASE(FORMAT(DateSpecified,0,'<month text> <year4>')),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('POSTING GROUP: '+Employee.GETFILTER(Employee."Posting Group"),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('GENERATED ON: '+FORMAT(CURRENTDATETIME),FALSE,'',TRUE,FALSE,FALSE,'@');
        
        ExcelBuf.NewRow;
        */

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('S/NO.', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('EMP NO.', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NAME', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('TITLE', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('RANK', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('PROFIT CENTRE', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('BRANCH', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('DEPARTMENT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('PAYPOINT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('CLASSIFICATION', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('PAYROLL GROUP', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('PAY MODE', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);

        ExcelBuf.AddColumn('BANK', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('ACCOUNT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NSSF#', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('NHIF#', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('PIN#', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('ID#', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('DATE JOINED', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('DATE LEFT', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('DATE BORN', false, '', true, false, false, '@', ExcelBuf."cell type"::Text);


        /*
        ExcelBuf.AddColumn(PayModE,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(BankCode,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(BankAccount,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(NSSF1,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(PIN,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(ID,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(DateJoined,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(DateLeft,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(DateBorn,FALSE,'',FALSE,FALSE,FALSE,'@');
        */
        /*
        EarnRec.RESET;
        EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
        EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",FALSE);
        IF DateSpecified<>0D THEN
        EarnRec.SETRANGE(EarnRec."Pay Period Filter",DateSpecified);
        IF PostingGrp<>'' THEN
        EarnRec.SETRANGE(EarnRec."Posting Group Filter",PostingGrp);
        EarnRec.CALCFIELDS(EarnRec."Total Amount");
        EarnRec.SETFILTER(EarnRec."Total Amount",'<>%1',0);
        
        IF EarnRec.FIND('-') THEN BEGIN
        REPEAT
        ExcelBuf.AddColumn(EarnRec.Description,FALSE,'',TRUE,FALSE,FALSE,'@');
        
        IF EarnRec."Show No.of Days"=TRUE THEN
        ExcelBuf.AddColumn(EarnRec.Description+'-DAYS',FALSE,'',TRUE,FALSE,FALSE,'@');
        IF EarnRec."Show No.of Hours"=TRUE THEN
        ExcelBuf.AddColumn(EarnRec.Description+'-HRS',FALSE,'',TRUE,FALSE,FALSE,'@');
        
        
        //end;
        
        UNTIL EarnRec.NEXT=0;
        END;
        
        
        //Non-Cash Benefits
        EarnRec.RESET;
        EarnRec.SETRANGE(EarnRec."Earning Type",EarnRec."Earning Type"::"Normal Earning");
        EarnRec.SETRANGE(EarnRec."Non-Cash Benefit",TRUE);
        IF DateSpecified<>0D THEN
        EarnRec.SETRANGE(EarnRec."Pay Period Filter",DateSpecified);
        IF PostingGrp<>'' THEN
        EarnRec.SETRANGE(EarnRec."Posting Group Filter",PostingGrp);
        EarnRec.CALCFIELDS(EarnRec."Total Amount");
        EarnRec.SETFILTER(EarnRec."Total Amount",'<>%1',0);
        
        IF EarnRec.FIND('-') THEN BEGIN
        REPEAT
        ExcelBuf.AddColumn(EarnRec.Description,FALSE,'',TRUE,FALSE,FALSE,'@');
        
        IF EarnRec."Show No.of Days"=TRUE THEN
        ExcelBuf.AddColumn(EarnRec.Description+'-DAYS',FALSE,'',TRUE,FALSE,FALSE,'@');
        IF EarnRec."Show No.of Hours"=TRUE THEN
        ExcelBuf.AddColumn(EarnRec.Description+'-HRS',FALSE,'',TRUE,FALSE,FALSE,'@');
        
        
        //end;
        
        UNTIL EarnRec.NEXT=0;
        END;
        //end non-cash benefits
        ExcelBuf.AddColumn('Tax Relief',FALSE,'',TRUE,FALSE,FALSE,'');
        
        
        //Employer Pension
        DedRec.RESET;
        //DedRec.SETRANGE();
        IF DateSpecified<>0D THEN
        DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
        DedRec.SETRANGE(DedRec."Pension Scheme",TRUE);
        IF PostingGrp<>'' THEN
        DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
        DedRec.SETFILTER(DedRec.Description,'<>%1','NSSF');
        DedRec.CALCFIELDS(DedRec."Total Amount Employer");
        DedRec.SETFILTER(DedRec."Total Amount Employer",'<>%1',0);
        
        
        IF DedRec.FINDFIRST THEN BEGIN
        //REPEAT
        ExcelBuf.AddColumn('EMPLOYER PENSION',FALSE,'',TRUE,FALSE,FALSE,'');
        
        //UNTIL DedRec.NEXT=0;
        END;
        //end Employer pension
        
        //Employer NSSF
        DedRec.RESET;
        //DedRec.SETRANGE();
        IF DateSpecified<>0D THEN
        DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
        DedRec.SETRANGE(DedRec."Pension Scheme",TRUE);
        IF PostingGrp<>'' THEN
        DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
        DedRec.SETFILTER(DedRec.Description,'=%1','NSSF');
        DedRec.CALCFIELDS(DedRec."Total Amount Employer");
        DedRec.SETFILTER(DedRec."Total Amount Employer",'<>%1',0);
        
        IF DedRec.FINDFIRST THEN BEGIN
        //REPEAT
        ExcelBuf.AddColumn('EMPLOYER NSSF',FALSE,'',TRUE,FALSE,FALSE,'');
        
        //UNTIL DedRec.NEXT=0;
        END;
        
        //end Employer NSSF
        
        
        
        ExcelBuf.AddColumn('GROSS PAY',FALSE,'',TRUE,FALSE,FALSE,'');
        
        DedRec.RESET;
        
        IF DateSpecified<>0D THEN
        DedRec.SETRANGE(DedRec."Pay Period Filter",DateSpecified);
        IF PostingGrp<>'' THEN
        DedRec.SETRANGE(DedRec."Posting Group Filter",PostingGrp);
        DedRec.CALCFIELDS(DedRec."Total Amount");
        DedRec.SETFILTER(DedRec."Total Amount",'<>%1',0);
        
        
        IF DedRec.FIND('-') THEN BEGIN
        REPEAT
        ExcelBuf.AddColumn(DedRec.Description,FALSE,'',TRUE,FALSE,FALSE,'@');
        
        UNTIL DedRec.NEXT=0;
        END;
        ExcelBuf.AddColumn('TOTAL DEDUCTIONS',FALSE,'',TRUE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('NET PAY',FALSE,'',TRUE,FALSE,FALSE,'');
        */

    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin
        /*
        
        BlankFiller := PADSTR(' ',MAXSTRLEN(BlankFiller),' ');
        
        {
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalNet,FALSE,'',FALSE,FALSE,FALSE,'');
        
        }
        
        
        */

    end;
}
