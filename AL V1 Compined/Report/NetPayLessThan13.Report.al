#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69081 "Net Pay Less Than 1/3"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Net Pay Less Than 13.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

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
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____; UpperCase(Format(DateSpecified, 0, '<month text> <year4>')))
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
            column(V1_3_Net_Pay_; '1/3 Net Pay')
            {
            }
            column(Difference_; 'Difference')
            {
            }
            column(First_Name_________Middle_Name_______Last_Name_; Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
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
            column(Employee__Total_Deductions___Total_Allowances1_; Employee."Total Deductions" + Employee."Total Allowances1")
            {
            }
            column(V1_3__Employee__Total_Allowances1__Employee__Total_Statutory__; 1 / 3 * (Employee."Total Allowances1" + Employee."Total Statutory"))
            {
            }
            column(Employee__Total_Deductions___Total_Allowances1___1_3__Employee__Total_Allowances1__Employee__Total_Statutory__; (Employee."Total Deductions" + Employee."Total Allowances1") - 1 / 3 * (Employee."Total Allowances1" + Employee."Total Statutory"))
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
            column(Employee__Total_Deductions___Total_Allowances1__Control1000000039; Employee."Total Deductions" + Employee."Total Allowances1")
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
            column(Passed_for_Payment_By____________________________________________________; 'Passed for Payment By...................................................')
            {
            }
            column(V1_3__Employee__Total_Allowances1__Employee__Total_Statutory___Control1000000050; 1 / 3 * (Employee."Total Allowances1" + Employee."Total Statutory"))
            {
            }
            column(DataItem1000000051; (Employee."Total Deductions" + Employee."Total Allowances1") - 1 / 3 * (Employee."Total Allowances1" + Employee."Total Statutory"))
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
                Employee.CalcFields(Employee."Total Allowances1", Employee."Total Deductions", Employee."Total Statutory");
                //IF (Employee."Total Allowances"+Employee."Total Deductions")=0 THEN
                //CurrReport.SKIP;

                //MESSAGE('%1',Employee."Total Statutory");
                if Employee."Terminal Dues" = true then
                    CurrReport.Skip;

                //IF (Employee."Total Allowances1"+Employee."Total Deductions")>500 THEN
                HRSetup.Get;
                HRSetup.TestField(HRSetup."Net Pay Advance Code");

                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions", Employee."Total Allowances1",
                Employee."Total Statutory");
                //Employee.CALCFIELDS(Employee.Branch,Employee.Paypoint,Employee."Staffing Group",Employee.Department);
                //IF (Employee."Total Allowances"+Employee."Total Deductions")=0 THEN

                if Assignmat.Get(Employee."No.", Assignmat.Type::Deduction, HRSetup."Net Pay Advance Code", DateSpecified) then
                    NetPayAdvance := Assignmat.Amount
                else
                    NetPayAdvance := 0;


                if (((Employee."Total Allowances1" + Employee."Total Deductions") = 0) and (NetPayAdvance = 0)) then
                    CurrReport.Skip;



                if (Employee."Total Allowances1" + Employee."Total Deductions") > 1 / 3 * (Employee."Total Allowances1" + Employee."Total Statutory") then
                    CurrReport.Skip;

                counter := counter + 1;
                for i := 1 to 10 do begin
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
                OtherEarn := Employee."Total Allowances1" - Totallowances;

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
            end;

            trigger OnPreDataItem()
            begin
                // CurrReport.CreateTotals(Allowances, Deductions, OtherEarn, OtherDeduct, Employee."Total Statutory", Employee."Total Deductions", Employee."Total Allowances1");
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
        //DateSpecified:=Employee."Pay Period Filter";



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
    end;

    var
        Allowances: array[20] of Decimal;
        Deductions: array[20] of Decimal;
        EarnRec: Record EarningsX;
        DedRec: Record DeductionsX;
        Earncode: array[1000] of Code[20];
        deductcode: array[1000] of Code[20];
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
        NetPayAdvance: Decimal;
        MASTER_ROLLCaptionLbl: label 'MASTER ROLL';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Other_AllowancesCaptionLbl: label 'Other Allowances';
}
