#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69139 "HR Leave analysis"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave analysis.rdlc';

    dataset
    {
        dataitem("HR Employees"; Employee)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No; "HR Employees"."No.")
            {
            }
            column(FullName; "HR Employees"."Last Name" + '  ' + "HR Employees"."Middle Name")
            {
            }
            column(DepartmentName; "HR Employees"."Department Name")
            {
            }
            column(LeaveDaysBF; "HR Employees"."Reimbursed Leave Days")
            {
            }
            column(LeaveDaysEarned; "HR Employees"."Allocated Leave Days")
            {
            }
            column(LeaveDaysApplied; "HR Employees"."Total Leave Taken")
            {
            }
            column(TotalLeaveDays_HREmployees; "HR Employees"."Total Leave Days")
            {
            }
            column(LeaveBalance; "HR Employees"."Leave Outstanding Bal")
            {
            }
            column(Picture; CI.Picture)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(UserID; UserId)
            {
            }
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
        CI.Get();
        CI.CalcFields(CI.Picture);


    end;

    var
        CI: Record "Company Information";
}
