#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69120 "Leave Balance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Leave Balance.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(LeaveOutstandingBal_Employee; Employee."Leave Outstanding Bal")
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(FirstName_Employee; Employee."First Name")
            {
            }
            column(MiddleName_Employee; Employee."Middle Name")
            {
            }
            column(LastName_Employee; Employee."Last Name")
            {
            }
            dataitem("HR Leave Ledger Entries"; "HR Leave Ledger Entries")
            {
                DataItemLink = "Staff No." = field("No.");
                DataItemTableView = where("Leave Type" = const('ANNUAL'));
                RequestFilterFields = "Posting Date";
                column(ReportForNavId_6; 6)
                {
                }
                column(Noofdays_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."No. of days")
                {
                }
                column(PostingDate_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Posting Date")
                {
                }
                column(LeaveStartDate_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Start Date")
                {
                }
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
}
