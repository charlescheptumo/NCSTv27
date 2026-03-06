#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69105 Position
{
    PageType = Card;
    SourceTable = "Company Jobs";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension 1"; Rec."Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension 2"; Rec."Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                }
                field("Position Reporting to"; Rec."Position Reporting to")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor/Manager"; Rec."Supervisor/Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009; Links)
            {
            }
            systempart(Control1000000010; Notes)
            {
            }
            systempart(Control1000000011; MyNotes)
            {
            }
            systempart(Control1000000012; Outlook)
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
                action("Raise Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raise Requisition';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Employee Requisitions List";
                    RunPageLink = "Job ID" = field("Job ID");
                }
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
                action("Advertise Position")
                {
                    ApplicationArea = Basic;
                    Image = AddToHome;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.Advertised := true;
                        Message('Job Position Has been advertised successfuly')
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*//cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);*/
                        Rec.Status := Rec.Status::Approved;
                        Rec.Modify;
                        Message('Document No %1, has been approved successfuly', Rec."Job ID");

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        /*//ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(RECORDID);*/
                        Rec.Status := Rec.Status::New;
                        Rec.Modify;
                        Message('Document No %1, has been reopened successfuly', Rec."Job ID");

                    end;
                }
            }
        }
    }
}
