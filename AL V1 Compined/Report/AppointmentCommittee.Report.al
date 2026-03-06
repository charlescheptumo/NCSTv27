#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70031 "Appointment Committee"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Appointment Committee.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Tender Commitee Appointment1"; "Tender Commitee Appointment1")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(TenderQuotationNo_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."Tender/Quotation No")
            {
            }
            column(CommitteeID_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."Committee ID")
            {
            }
            column(CommitteeName_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."Committee Name")
            {
            }
            column(CreationDate_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."Creation Date")
            {
            }
            column(UserID_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."User ID")
            {
            }
            column(Title_TenderCommiteeAppointment1; "Tender Commitee Appointment1".Title)
            {
            }
            column(AppointmentNo_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."Appointment No")
            {
            }
            column(NoSeries_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."No. Series")
            {
            }
            column(Status_TenderCommiteeAppointment1; "Tender Commitee Appointment1".Status)
            {
            }
            column(NoofMembers_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."No of Members")
            {
            }
            column(DeadlineForReportSubmission_TenderCommiteeAppointment1; "Tender Commitee Appointment1"."Deadline For Report Submission")
            {
            }
            column(Location_TenderCommiteeAppointment1; "Tender Commitee Appointment1".Location)
            {
            }
            dataitem("Commitee Members"; "Commitee Members")
            {
                DataItemLink = "Appointment No" = field("Appointment No");
                column(ReportForNavId_13; 13)
                {
                }
                column(RefNo_CommiteeMembers; "Commitee Members"."Ref No")
                {
                }
                column(Commitee_CommiteeMembers; "Commitee Members".Commitee)
                {
                }
                column(EmployeeNo_CommiteeMembers; "Commitee Members"."Employee No")
                {
                }
                column(Name_CommiteeMembers; "Commitee Members".Name)
                {
                }
                column(AppointmentNo_CommiteeMembers; "Commitee Members"."Appointment No")
                {
                }
                column(Chair_CommiteeMembers; "Commitee Members".Chair)
                {
                }
                column(Secretary_CommiteeMembers; "Commitee Members".Secretary)
                {
                }
                column(Role_CommiteeMembers; "Commitee Members".Role)
                {
                }
            }
        }
        dataitem("Company Information"; "Company Information")
        {
            column(ReportForNavId_21; 21)
            {
            }
            column(Picture_CompanyInformation; "Company Information".Picture)
            {
            }
            column(PictureLastModDateTime_CompanyInformation; "Company Information"."Picture - Last Mod. Date Time")
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
}
