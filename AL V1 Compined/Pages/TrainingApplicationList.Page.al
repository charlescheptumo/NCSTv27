#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69220 "Training Application List"
{
    ApplicationArea = Basic;
    CardPageID = "Training Application Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Training Requests";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    Caption = 'Estimated Cost';
                }
                field("Approved Cost"; Rec."Approved Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Provider; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = true;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755002; "Trainings Factbox")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Training Applications List")
            {
                ApplicationArea = Basic;
                Caption = 'Training Applications List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject =Report UnknownReport39005603;
            }
            action("Training Applications")
            {
                ApplicationArea = Basic;
                Caption = 'Training Applications';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject =Report UnknownReport39005580;
            }
        }
    }
}
