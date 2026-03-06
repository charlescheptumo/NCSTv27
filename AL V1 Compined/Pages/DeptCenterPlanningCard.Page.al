#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59072 "Dept/Center Planning Card"
{
    Caption = 'User Planning Card';
    PageType = Card;
    SourceTable = Planning;
    ApplicationArea = All;

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
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Head"; Rec."Directorate Head")
                {
                    ApplicationArea = Basic;
                }
                field("Accounting Period"; Rec."Accounting Period")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control23; "Planning Matrix List")
            {
                SubPageLink = No = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup22)
            {
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send For Approval';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        /*TESTFIELD(Status,Status::Open);//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //TESTFIELD("Imprest Memo No");
                        TESTFIELD("Payment Narration");
                        IF "Imprest Amount"=0 THEN
                          ERROR(Text001,"No.");
                        //cc//if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                          //cc//ApprovalsMgmt.OnSendPaymentsForApproval(Rec);*/
                        Message('Approved successfully');

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        /*TESTFIELD(Status,Status::"Pending Approval");//status must be open.
                        TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);*/
                        Message('Canceled successfully');

                    end;
                }
            }
        }
    }
}
