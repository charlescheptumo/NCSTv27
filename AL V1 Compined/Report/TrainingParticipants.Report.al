#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69125 "Training Participants"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Training Participants.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Training Participants"; "Training Participants")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(TrainingCourseCode; "HR Training Participants"."Training Code")
            {
            }
            column(EmployeeCode; "HR Training Participants"."Employee Code")
            {
            }
            column(EmployeeName; "HR Training Participants"."Employee Name")
            {
            }
            column(Objectives; "HR Training Participants".Objectives)
            {
            }
            column(Dim1; "HR Training Participants"."Global Dimension 1 Code")
            {
            }
            column(Dim2; "HR Training Participants"."Global Dimension 2 Code")
            {
            }
            column(Description; Desc)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TrainingNeeds.Get("HR Training Participants"."Training Code");
                Desc := TrainingNeeds.Description;
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

    var
        Desc: Text;
        TrainingNeeds: Record "Training Needs";
}
