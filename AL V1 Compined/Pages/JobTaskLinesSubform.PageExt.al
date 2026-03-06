#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50047 pageextension50047 extends "Job Task Lines Subform"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Remaining (Total Cost)"(Control 5)".


        //Unsupported feature: Property Modification (Visible) on ""Remaining (Total Price)"(Control 71)".

        modify("EAC (Total Cost)")
        {
            Caption = 'Remaining Amount';
        }

        //Unsupported feature: Property Modification (Visible) on ""EAC (Total Price)"(Control 75)".


        //Unsupported feature: Property Deletion (Visible) on ""EAC (Total Cost)"(Control 73)".

        addafter("Amt. Rcd. Not Invoiced")
        {
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
            }
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
            }
            field(Division; Rec.Division)
            {
                ApplicationArea = Basic;
            }
            field(Commitments; Rec.Commitments)
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Usage (Total Price)"; "EAC (Total Cost)")
        moveafter("EAC (Total Cost)"; "Remaining (Total Cost)")
    }
    actions
    {
        addafter("F&unctions")
        {
            group(Milestones)
            {
                Image = Setup;
                action(MilestoneLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Milestone & Lines';
                    Image = JobLines;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';

                    trigger OnAction()
                    var
                        MilestoneLine: Record "Milestones Lines";
                        MilestoneLines: Page "Milestones Lines";
                    begin
                        Rec.TestField(Rec."Job No.");
                        MilestoneLine.FilterGroup(2);
                        MilestoneLine.SetRange("Project No", Rec."Job No.");
                        MilestoneLine.SetRange("Task No", Rec."Job Task No.");
                        MilestoneLine.FilterGroup(0);
                        MilestoneLines.SetTableview(MilestoneLine);
                        MilestoneLines.Editable := true;
                        MilestoneLines.Run;
                    end;
                }
            }
        }
    }
}
