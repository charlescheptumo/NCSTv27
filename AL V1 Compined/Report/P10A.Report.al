#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69023 P10A
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/P10A.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "Pay Period Filter", "No.";
            column(ReportForNavId_7528; 7528)
            {
            }
            column(FORMAT_DateSpecified_0___year4___; Format(DateSpecified, 0, '<year4>'))
            {
            }
            column(CoName; CoName)
            {
            }
            column(Employee__First_Name_; Employee."First Name")
            {
            }
            column(Employee__Last_Name_; Employee."Last Name")
            {
            }
            column(Employee_PAYE; Employee.PAYE)
            {
            }
            column(Employee__P_I_N_; Employee."P.I.N")
            {
            }
            column(Employee__No__; Employee."No.")
            {
            }
            column(Employee_Employee__Taxable_Income_; Employee."Taxable Income")
            {
            }
            column(Employee_PAYE_Control5; Employee.PAYE)
            {
            }
            column(Employee_Employee__Taxable_Income__Control1000000001; Employee."Taxable Income")
            {
            }
            column(SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaption; SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaptionLbl)
            {
            }
            column(Payroll_NumberCaption; Payroll_NumberCaptionLbl)
            {
            }
            column(Employee_Caption; Employee_CaptionLbl)
            {
            }
            column(PIN_NumberCaption; PIN_NumberCaptionLbl)
            {
            }
            column(Total_Tax_KshsCaption; Total_Tax_KshsCaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(TAXABLE_PAYCaption; TAXABLE_PAYCaptionLbl)
            {
            }
            column(TotalsCaption; TotalsCaptionLbl)
            {
            }
            column(P10ACaption; P10ACaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Employee.CalcFields("Cumm. PAYE");
                Employee.PAYE := Abs(Employee."Cumm. PAYE");
                if Employee."Cumm. PAYE" = 0 then
                    CurrReport.Skip;
                TotalTax := TotalTax + Abs(Employee."Cumm. PAYE");
                TotalTax := PayrollRounding(TotalTax);
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Employee."Taxable Income", Employee.PAYE);
                CUser := UserId;
                GetGroup.GetUserGroup(CUser, GroupCode);
                Employee.SetRange(Employee."Posting Group", GroupCode);
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
        DateSpecified := Employee.GetRangeMin("Pay Period Filter");
        CompRec.Get();
        CoName := CompRec.Name;
    end;

    var
        PAYE: Decimal;
        TotalTax: Decimal;
        CompRec: Record "Company Information";
        CoName: Text[30];
        DateSpecified: Date;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        SUPPORTING_LIST_TO_THE_END_OF_YEAR_CERTIFICATECaptionLbl: label 'SUPPORTING LIST TO THE END OF YEAR CERTIFICATE';
        Payroll_NumberCaptionLbl: label 'Payroll Number';
        Employee_CaptionLbl: label 'Employee ';
        PIN_NumberCaptionLbl: label 'PIN Number';
        Total_Tax_KshsCaptionLbl: label 'Total Tax Kshs';
        PERIODCaptionLbl: label 'PERIOD';
        TAXABLE_PAYCaptionLbl: label 'TAXABLE PAY';
        TotalsCaptionLbl: label 'Totals';
        P10ACaptionLbl: label 'P10A';


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;
}
