#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69086 "Zero Deductions Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Zero Deductions Report.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Pay Period Filter";
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
            column(STRSUBSTNO__PERIOD___1__UPPERCASE_FORMAT_Thismonth_0___month_text___year4_____; StrSubstNo('PERIOD: %1', UpperCase(Format(Thismonth, 0, '<month text> <year4>'))))
            {
            }
            column(Employee__No__; Employee."No.")
            {
            }
            column(First_Name_______Middle_Name________Last_Name_; Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
            {
            }
            column(Counter; Counter)
            {
            }
            column(NEW_EMPLOYEESCaption; NEW_EMPLOYEESCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Employee__No__Caption; Employee.FieldCaption(Employee."No."))
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                FoundThismonth:=FALSE;
                FoundLastmonth:=FALSE;
                
                AssignMat.RESET;
                AssignMat.SETRANGE(AssignMat."Employee No",Employee."No.");
                AssignMat.SETRANGE(AssignMat."Payroll Period",Thismonth);
                IF AssignMat.FIND('+') THEN
                FoundThismonth:=TRUE;
                
                
                AssignMat.RESET;
                AssignMat.SETRANGE(AssignMat."Employee No",Employee."No.");
                AssignMat.SETRANGE(AssignMat."Payroll Period",LastMonth);
                IF AssignMat.FIND('+') THEN
                FoundLastmonth:=TRUE;
                
                IF FoundThismonth AND FoundLastmonth THEN
                CurrReport.SKIP;
                
                IF NOT FoundThismonth AND NOT FoundLastmonth THEN
                CurrReport.SKIP;
                
                
                IF FoundLastmonth AND NOT FoundThismonth THEN
                CurrReport.SKIP;
                 */

                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions", Employee."Total Allowances1");

                if ((Employee."Total Allowances1" > 0) and (Employee."Total Deductions" = 0)) then
                    NetPayThisMonth := Employee."Total Allowances1" + Employee."Total Deductions"
                else
                    CurrReport.Skip;

                Counter := Counter + 1;

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
        Thismonth := Employee.GetRangeMin(Employee."Pay Period Filter");
        LastMonth := CalcDate('-1M', Thismonth);
    end;

    var
        AssignMat: Record "Assignment Matrix-X";
        LastMonth: Date;
        Thismonth: Date;
        FoundThismonth: Boolean;
        FoundLastmonth: Boolean;
        Counter: Integer;
        NetPayThisMonth: Decimal;
        NetPayLastMonth: Decimal;
        NEW_EMPLOYEESCaptionLbl: label 'NEW EMPLOYEES';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        NameCaptionLbl: label 'Name';
}
