#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69158 "Training Needs Card s"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Training Needs";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Cadre Code"; Rec."Cadre Code")
                {
                    ApplicationArea = Basic;
                }
                field("Cadre Description"; Rec."Cadre Description")
                {
                    ApplicationArea = Basic;
                }
                field("No to be Trained"; Rec."No to be Trained")
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
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Training"; Rec."Type of Training")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field(Qualification; Rec.Qualification)
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                }
                field("Re-Assessment Date"; Rec."Re-Assessment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Source; Rec.Source)
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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
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
                }
            }
            group("Committee Resolution")
            {
                field(Committee; Rec.Committee)
                {
                    ApplicationArea = Basic;
                }
                field("Committee Name"; Rec."Committee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prioritized Training"; Rec."Prioritized Training")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Verdict"; Rec."Committee Verdict")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; MyNotes)
            {
            }
            systempart(Control1000000021; Links)
            {
            }
            systempart(Control1000000022; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("&Update")
                {
                    ApplicationArea = Basic;
                    Caption = '&Update';
                    Image = StepInto;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to update the Training Need No. ' + Rec."No." + ' ?') = true then begin
                            Rec."Updated By" := UserId;
                            Rec."Date Updated" := Today;
                            Rec."Time Updated" := Time;
                            Rec.Status := Rec.Status::Approved;
                            Message('Training need :: %1 :: has been Updated', Rec.Description);
                            Rec.Modify;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            group(ActionGroup22)
            {
                Caption = '&Functions';
                action("Training Costs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Costs';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Training Cost";
                    RunPageLink = "Training ID" = field("No.");
                    Visible = false;
                }
                action("Page HR Training Participants List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Participants';
                    RunObject = Page "Training Participants List";
                    RunPageLink = "Training Code" = field("No.");
                }
                action("Training Bonding Conditions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Bonding Conditions';
                    Image = BOM;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Training Bonding List";
                    RunPageLink = "Training Bonding Code" = field("No.");
                    Visible = false;
                }
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit;
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := Documenttype::HRNeed;
                        ApprovalEntries.SetRecordfilters(Database::"Training Needs", DocumentType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Confirm('Send Approval Request?', true) = false then exit;
                        //AppMgmt.;
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then exit;
                        //AppMgmt.CancelNeedRequest(Rec,TRUE,TRUE);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        EnableField: Boolean;
        HRTrainingBondingCond: Record "Training Participants";
        AppMgmt: Codeunit "Approvals Mgmt.";
        FieldEditable: Boolean;


    procedure UpdateControls()
    begin
        if Rec."Budget Controlled" then begin
            EnableField := true;
        end else begin
            EnableField := false;
            Rec."G/L Account" := '';
            Rec."Expense Code" := '';
        end;
    end;
}
