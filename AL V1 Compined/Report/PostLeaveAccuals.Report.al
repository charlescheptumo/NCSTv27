#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69102 "Post Leave Accuals"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Post Leave Accuals.rdlc';

    dataset
    {
        dataitem("Employee Leaves"; "Employee Leaves")
        {
            DataItemTableView = sorting("Employee No", "Leave Code", "Posting  Date") order(ascending) where(Posted = const(false));
            RequestFilterFields = "Posting  Date", "Employee No";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(EmployeeNo_EmployeeLeaves; "Employee Leaves"."Employee No")
            {
            }
            column(FirstName_EmployeeLeaves; "Employee Leaves"."First Name")
            {
            }
            column(LastName_EmployeeLeaves; "Employee Leaves"."Last Name")
            {
            }
            column(LeaveCode_EmployeeLeaves; "Employee Leaves"."Leave Code")
            {
            }
            column(PostingDate_EmployeeLeaves; "Employee Leaves"."Posting  Date")
            {
            }
            column(NoOfDays_EmployeeLeaves; "Employee Leaves"."No. Of Days")
            {
            }
            column(Description_EmployeeLeaves; "Employee Leaves".Description)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Employee Leaves".TestField("Employee Leaves"."Employee No");
                "Employee Leaves".TestField("Employee Leaves"."Leave Code");
                "Employee Leaves".TestField("Employee Leaves"."Posting  Date");
                "Employee Leaves".TestField("Employee Leaves"."No. Of Days");
                "Employee Leaves".TestField("Employee Leaves"."Adjustment Type");
                "Employee Leaves".TestField("Employee Leaves".Description);
                // "Employee Leaves".TESTFIELD("Employee Leaves"."Employee No");

                "Employee Leaves".Posted := true;
                "Employee Leaves".Modify;
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
}
