#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69518 "CRM Training Card"
{
    PageType = Card;
    SourceTable = "CRM Trainings";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field("Re-Assessment Date"; Rec."Re-Assessment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Need Source"; Rec."Need Source")
                {
                    ApplicationArea = Basic;
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Status"; Rec."Training Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control19; "CRM Trainees")
            {
                SubPageLink = "Training Code" = field(Code);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(ImportTrainees)
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                //cc// //RunObject = XMLport UnknownXMLport51516056;
            }
            action("Close Training")
            {
                ApplicationArea = Basic;
                Enabled = EnableActivateTraining;
                Image = Customer;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to close this training?', false) = true then begin
                        Rec."Training Status" := Rec."training status"::Closed;
                    end;
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Enabled = (not OpenApprovalEntriesExist) and EnabledApprovalWorkflowsExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Text001: label 'This request is already pending approval';
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    /*//cc//if ApprovalsMgmt.CheckCRMTrainingApprovalsWorkflowEnabled(Rec) THEN
                            //cc//ApprovalsMgmt.OnSendCRMTrainingForApproval(Rec);*/

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Enabled = CanCancelApprovalForRecord;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Approvalmgt: Codeunit "Approvals Mgmt.";
                begin
                    /*IF CONFIRM('Are you sure you want to cancel this approval request',FALSE)=TRUE THEN
                     //ApprovalsMgmt.OnCancelCRMTrainingApprovalRequest(Rec);
                      Status:=Status::Open;
                      MODIFY;
                      */

                end;
            }
            action(Approval)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"," ","Purchase Requisition",RFQ,"Store Requisition","Payment Voucher",MembershipApplication,LoanApplication,LoanDisbursement,ProductApplication,StandingOrder,MembershipWithdrawal,ATMCard,GuarantorRecovery,ChangeRequest,TreasuryTransactions,FundsTransfer,SaccoTransfers,ChequeDiscounting,ImprestRequisition,ImprestSurrender,LeaveApplication,BulkWithdrawal,PackageLodging,PackageRetrieval,HouseChange,CRMTraining;
                begin
                    /*DocumentType:=DocumentType::HouseChange;
                    ApprovalEntries.SetRecordfilters(DATABASE::"House Group Change Request",DocumentType,Code);
                    ApprovalEntries.RUN;*/

                end;
            }
            action("Training Cost/Suppliers")
            {
                ApplicationArea = Basic;
                Image = Form;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "CRM Training Suppliers";
                RunPageLink = "CRM Training No" = field(Code);
            }
        }
    }

    var
        EnableActivateTraining: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        EnabledApprovalWorkflowsExist: Boolean;
}
