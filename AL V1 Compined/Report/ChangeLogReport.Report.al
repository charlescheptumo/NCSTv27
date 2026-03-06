#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 99099 "ChangeLog Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ChangeLog Report.rdlc';
    Caption = 'ChangeLog Report';
    UsageCategory = Tasks;
    ApplicationArea = All;

    dataset
    {
        dataitem("Change Log Entry"; "Change Log Entry")
        {
            RequestFilterFields = "Date and Time", "Type of Change", "User ID";
            column(ReportForNavId_1; 1)
            {
            }
            column(EntryNo_ChangeLogEntry; "Change Log Entry"."Entry No.")
            {
            }
            column(DateandTime_ChangeLogEntry; "Change Log Entry"."Date and Time")
            {
            }
            column(UserID_ChangeLogEntry; "Change Log Entry"."User ID")
            {
            }
            column(TableNo_ChangeLogEntry; "Change Log Entry"."Table No.")
            {
            }
            column(TableCaption_ChangeLogEntry; "Change Log Entry"."Table Caption")
            {
            }
            column(FieldCaption_ChangeLogEntry; "Change Log Entry"."Field Caption")
            {
            }
            column(TypeofChange_ChangeLogEntry; "Change Log Entry"."Type of Change")
            {
            }
            column(OldValue_ChangeLogEntry; "Change Log Entry"."Old Value")
            {
            }
            column(NewValue_ChangeLogEntry; "Change Log Entry"."New Value")
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
