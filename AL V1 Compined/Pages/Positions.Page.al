#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69117 Positions
{
    ApplicationArea = Basic;
    CardPageID = Position;
    Editable = false;
    PageType = List;
    SourceTable = "Company Jobs";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    ApplicationArea = Basic;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                }
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
            systempart(Control1000000010; Outlook)
            {
            }
            systempart(Control1000000011; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                action("Training Needs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Needs';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Training Needs";
                    RunPageLink = "No." = field("Job ID");
                }
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Job Requirement Lines";
                    RunPageLink = "Job Id" = field("Job ID");
                }
                action(Responsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Job Responsibilites";
                    RunPageLink = "Job ID" = field("Job ID");
                }
                action(Occupants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Occupants';
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Employee List-HR";
                    RunPageLink = "Job ID" = field("Job ID");
                }
                action("Work Relationship")
                {
                    ApplicationArea = Basic;
                    Caption = 'Work Relationship';
                    RunObject = Page "Job Working Relationship";
                    RunPageLink = "Job ID" = field("Job ID");
                }
                action(Attachments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Hr Jobs Documents";
                    RunPageLink = "Doc No." = field("Job ID");
                    Visible = false;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if Rec.Find('-') then begin
            repeat
                Rec.CalcFields(Rec."Occupied Positions");
                // MESSAGE('%1',"Occupied Position");
                Rec."Vacant Positions" := Rec."No of Posts" - Rec."Occupied Positions";
                if (Rec."Occupied Positions" > Rec."No of Posts") then
                    Rec."Vacant Positions" := 0;
                Rec.Modify;
            until Rec.Next = 0;
        end;
    end;
}
