#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69225 "Training Evaluation Page"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Training Evaluation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Emp No."; Rec."Emp No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Code"; Rec."Training Code")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Training Needs";
                }
                field("Training Description"; Rec."Training Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Training)
            {
                field("Training Objectives Achieved?"; Rec."Training Objectives Achieved?")
                {
                    ApplicationArea = Basic;
                }
                field(Objectives; Rec.Objectives)
                {
                    ApplicationArea = Basic;
                }
                field("Any Challenge Encountered?"; Rec."Any Challenge Encountered?")
                {
                    ApplicationArea = Basic;
                }
                field(Challenges; Rec.Challenges)
                {
                    ApplicationArea = Basic;
                }
                field("Training Gaps Adressed?"; Rec."Training Gaps Adressed?")
                {
                    ApplicationArea = Basic;
                }
                field("Training Gaps"; Rec."Training Gaps")
                {
                    ApplicationArea = Basic;
                }
                field("Course content"; Rec."Course content")
                {
                    ApplicationArea = Basic;
                }
                field("Presentation match"; Rec."Presentation match")
                {
                    ApplicationArea = Basic;
                }
                field("Topics delivered as stated"; Rec."Topics delivered as stated")
                {
                    ApplicationArea = Basic;
                }
                field("Material Relevance"; Rec."Material Relevance")
                {
                    ApplicationArea = Basic;
                }
                field("Adequate training aids"; Rec."Adequate training aids")
                {
                    ApplicationArea = Basic;
                }
                field("What did you Learn"; Rec."What did you Learn")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("What did you not undestand"; Rec."What did you not undestand")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Give suggestions"; Rec."Give suggestions")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
            group(Facilitators)
            {
                field("Knowledge and adherence"; Rec."Knowledge and adherence")
                {
                    ApplicationArea = Basic;
                }
                field("Preparation for each class"; Rec."Preparation for each class")
                {
                    ApplicationArea = Basic;
                }
                field("Communicated material"; Rec."Communicated material")
                {
                    ApplicationArea = Basic;
                }
                field("Responded well"; Rec."Responded well")
                {
                    ApplicationArea = Basic;
                }
                field("Positive rapport"; Rec."Positive rapport")
                {
                    ApplicationArea = Basic;
                }
                field("Comments About the Facilitator"; Rec."Comments About the Facilitator")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000010; "Training Evaluation Lines")
            {
                SubPageLink = "Document No." = field(No);
                Visible = false;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000008; Links)
            {
            }
            systempart(Control1000000009; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Load Evaluation Sections")
            {
                ApplicationArea = Basic;
                Caption = 'Load Evaluation Sections';
                Image = Journal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //DELETE LINES IF EXISTS;
                    EvaluationLines.Reset;
                    EvaluationLines.SetRange(EvaluationLines."Document No.", Rec.No);
                    if EvaluationLines.Find('-') then EvaluationLines.DeleteAll;

                    EvaluationAreas.Reset;
                    EvaluationAreas.SetRange(EvaluationAreas.Type, EvaluationAreas.Type::"Training Evaluation");
                    EvaluationAreas.SetCurrentkey(EvaluationAreas.Code);
                    EvaluationAreas.Find('-');

                    repeat
                        EvaluationLines."Document No." := Rec.No;
                        EvaluationLines."Evaluation Area" := EvaluationAreas.Description;
                        EvaluationLines.Insert;
                    until EvaluationAreas.Next = 0;
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to submit this evaluation?') = false then
                        exit else
                        Rec.Submitted := true;
                    Rec.Modify
                end;
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Submitted = true then
            Error('You cannot modify a submitted evaluation')
    end;

    var
        EvaluationAreas: Record "HR Models";
        EvaluationLines: Record "Training Evaluation Lines";
}
