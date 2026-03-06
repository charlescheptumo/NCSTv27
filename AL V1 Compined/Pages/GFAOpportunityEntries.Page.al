#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65096 "GFA Opportunity Entries"
{
    ApplicationArea = RelationshipMgmt;
    Caption = 'Opportunity Entries';
    DataCaptionFields = "Contact No.", "Campaign No.", "Salesperson Code", "Sales Cycle Code", "Sales Cycle Stage", "Close Opportunity Code";
    Editable = false;
    PageType = List;
    SourceTable = "GFA Opportunity Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Opportunity No."; Rec."Opportunity No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the opportunity to which this entry applies.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the action that was taken when the entry was last updated. There are six options:';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies that the opportunity entry is active.';
                }
                field("Date of Change"; Rec."Date of Change")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the date this opportunity entry was last changed.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the date that the opportunity was closed.';
                }
                field("Days Open"; Rec."Days Open")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the number of days that the opportunity entry was open.';
                }
                field("Sales Cycle Code"; Rec."Sales Cycle Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the sales cycle to which the opportunity is linked.';
                    Visible = false;
                }
                field("Sales Cycle Stage Description"; Rec."Sales Cycle Stage Description")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies a description of the sales cycle that is related to the task. The description is copied from the sales cycle card.';
                }
                field("Previous Sales Cycle Stage"; Rec."Previous Sales Cycle Stage")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sales cycle stage of the opportunity before this entry.';
                    Visible = false;
                }
                field("Estimated Value (LCY)"; Rec."Estimated Value (LCY)")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the estimated value of the opportunity entry.';
                }
                field("Calcd. Current Value (LCY)"; Rec."Calcd. Current Value (LCY)")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the calculated current value of the opportunity entry.';
                }
                field("Completed %"; Rec."Completed %")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the percentage of the sales cycle that has been completed for this opportunity entry.';
                }
                field("Chances of Success %"; Rec."Chances of Success %")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the chances of success of the opportunity entry.';
                }
                field("Probability %"; Rec."Probability %")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the probability of the opportunity resulting in a sale.';
                }
                field("Close Opportunity Code"; Rec."Close Opportunity Code")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the code for closing the opportunity.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Show Opportunity Card")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Show Opportunity Card';
                Image = Opportunity;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Opportunity Card";
                RunPageLink = "No." = field("Opportunity No.");
                RunPageMode = View;
                Scope = Repeater;
                ToolTip = 'Open the card for the opportunity.';
            }
            action("Delete Closed")
            {
                ApplicationArea = All;
                Caption = 'Delete Closed Entries';
                Image = Delete;
                RunObject = Report "Delete Opportunities";
                ToolTip = 'Find and delete closed opportunity entries.';
            }
        }
    }
}
