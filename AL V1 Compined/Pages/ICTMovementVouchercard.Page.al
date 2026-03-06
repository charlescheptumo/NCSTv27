#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56140 "ICT Movement Voucher card"
{
    PageType = Card;
    SourceTable = "ICT Issuance Voucher";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = corec;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Movement';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Division/Unit"; Rec."Division/Unit")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Processed By';
                }
            }
            part(Control6; "Movement Voucher Lines")
            {
                Editable = corec;
                SubPageLink = "No." = field("No."),
                              Type = const(Movement);
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
            }
            systempart(Control18; Notes)
            {
            }
            systempart(Control19; MyNotes)
            {
            }
            systempart(Control20; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(56243, true, true, Rec);
                end;
            }
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
                    Rec.TestField(Rec.Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify(true);
                    Message('Approved Successfully');
                    ////cc//if ApprovalsMgmt.CheckIFSApprovalPossible(Rec) THEN
                    ////cc//ApprovalsMgmt.OnSendIFSForApproval(Rec);

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
                    Rec.TestField(Rec.Status, Rec.Status::Released);
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                    Message('Approval Request Cancelled');
                    ////ApprovalsMgmt.OnCancelIFSApprovalRequest(Rec);
                    //WorkflowWebhookMgt.FindAndCancel(RECORDID);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Move';
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Released);
                    Rec.TestField(Rec.Posted, false);
                    ICTIssuanceVoucherLines.Reset;
                    ICTIssuanceVoucherLines.SetRange("No.", Rec."No.");
                    ICTIssuanceVoucherLines.SetRange(Type, Rec.Type);
                    if ICTIssuanceVoucherLines.FindSet then begin
                        repeat
                            ICTIssuanceEntries.Init;
                            ICTIssuanceEntries."Entry No" := ICTIssuanceEntries."Entry No" + 100;
                            ICTIssuanceEntries."No." := Rec."No.";
                            ICTIssuanceEntries."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                            ICTIssuanceEntries.Directorate := Rec.Directorate;
                            ICTIssuanceEntries.Department := Rec.Department;
                            ICTIssuanceEntries."Division/Unit" := Rec."Division/Unit";
                            ICTIssuanceEntries.Code := ICTIssuanceVoucherLines.Code;
                            ICTIssuanceEntries.Description := ICTIssuanceVoucherLines.Description;
                            ICTIssuanceEntries."Serial No." := ICTIssuanceVoucherLines."Serial No.";
                            ICTIssuanceEntries."FA No" := ICTIssuanceVoucherLines."FA No";
                            ICTIssuanceEntries.Type := ICTIssuanceVoucherLines.Type;
                            ICTIssuanceEntries."Reason For Movement" := ICTIssuanceVoucherLines."Reason For Movement";
                            ICTIssuanceEntries."Issued To User ID" := Rec."Issued To User ID";
                            ICTIssuanceEntries."Issued To No." := Rec."Issued To No.";
                            ICTIssuanceEntries."Issued By" := Rec."Issued By";
                            ICTIssuanceEntries."Issued Date" := Rec."Issued Date";
                            ICTIssuanceEntries.Name := Rec.Name;
                            ICTIssuanceEntries."Duration of Use" := ICTIssuanceVoucherLines."Duration of Use";
                            ICTIssuanceEntries."Duration of Use end date" := ICTIssuanceVoucherLines."Duration of Use end date";
                            ICTIssuanceEntries."Duration of Use start date" := ICTIssuanceVoucherLines."Duration of Use start date";
                            ICTIssuanceEntries."Previously Assigned Dpt" := ICTIssuanceVoucherLines."Dpt Current Assigned";
                            ICTIssuanceEntries."Previously Assigned To" := ICTIssuanceVoucherLines."Current Assigned Employee";
                            ICTIssuanceEntries.Insert(true);
                        until ICTIssuanceVoucherLines.Next = 0;
                        ICTInventory.Reset;
                        ICTInventory.SetRange(Code, ICTIssuanceVoucherLines.Code);
                        if ICTInventory.FindSet then begin
                            ICTInventory."Current Assigned Employee" := Rec."Issued To No.";
                            ICTInventory."Current Assigned Division/Unit" := Rec.Department;
                            ICTInventory.Modify(true);
                        end;
                    end;
                    Rec.Posted := true;
                    Rec."Posting Date" := Today;
                    Rec.Modify(true);
                    Message('Moved Successfully');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // IF "Document Status"="Document Status"::Submitted THEN
        //  CurrPage.EDITABLE:=FALSE;
        // MODIFY(TRUE);
        corec := true;
        if Rec.Status = Rec.Status::Released then
            corec := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Movement;
    end;

    trigger OnOpenPage()
    begin
        /*IF "Document Status"="Document Status"::Submitted THEN
          CurrPage.EDITABLE:=FALSE;
        MODIFY(TRUE);
        */

        corec := true;
        if Rec.Status = Rec.Status::Released then
            corec := false;

    end;

    var
        ICTIssuanceEntries: Record "ICT Issuance Entries";
        ICTIssuanceVoucherLines: Record "ICT Issuance Voucher Lines";
        ICTInventory: Record "ICT Inventory";
        corec: Boolean;
}
