#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70014 "Requisition Header"
{
    PageType = Card;
    SourceTable = "Requisition Header1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Use"; Rec."Date of Use")
                {
                    ApplicationArea = Basic;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = false;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = false;
                    Visible = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("No of Approvals"; Rec."No of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field("<Total>"; Rec.Total)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total';
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Purchase Type"; Rec."Purchase Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part(Control1000000016; "Requisition Line")
            {
                SubPageLink = "Requisition No" = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Requisition)
            {
                Caption = 'Requisition';
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin

                        if UserSetup.Get(UserId) then
                            if Rec."Employee Code" <> UserSetup."Employee No." then begin
                                Message('You can only send for approval the document that you prepared');
                                exit;
                            end;
                        ReqLines.Reset;
                        ReqLines.SetRange(ReqLines."Requisition No", Rec."No.");
                        if ReqLines.Find('-') then begin
                            ReqLines.TestField(ReqLines.No);
                        end else
                            Error('Requisition Lines must be provided');
                        //IF ApprovalMgt.SendPurchaseReqApprovalRequest(Rec) THEN;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelPurchaseApprovalRRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action(Archivet)
                {
                    ApplicationArea = Basic;
                    Caption = 'Archive';

                    trigger OnAction()
                    begin
                        Archive();
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
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
            group("&Attachments")
            {
                Caption = '&Attachments';
                Visible = false;
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."No.", Rec."Language Code (Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."No.", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."No.";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Reason;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Rec.Attachment := Rec.Attachment::Yes;
                        Rec.Modify;
                    end;
                }
                action("Copy &from")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."No.", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."No.";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Reason;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Rec.Attachment := Rec.Attachment::Yes;
                        Rec.Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."No.", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."No.";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Reason;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Rec.Attachment := Rec.Attachment::Yes;
                        Rec.Modify;
                    end;
                }
                action("E&xport")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."No.", Rec."Language Code (Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."No.", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Rec.Attachment := Rec.Attachment::No;
                            Rec.Modify;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("Print Requisition With Extended Description")
            {
                ApplicationArea = Basic;
                Caption = 'Print Requisition With Extended Description';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter(Rec."No.", Rec."No.");
                    Report.Run(51511008, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter(Rec."No.", Rec."No.");
                    Report.Run(51511003, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("Mandatory Requirements")
            {
                ApplicationArea = Basic;
                Caption = 'Mandatory Requirements';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Tender Mandatory Requirements";
                RunPageLink = "Tender No" = field("No.");
            }
            action("Technical Specifications")
            {
                ApplicationArea = Basic;
                Caption = 'Technical Specifications';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Tender Specifications";
                RunPageLink = "Requisition No" = field("No.");
            }
            action("Import Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Import Lines';

                trigger OnAction()
                begin
                    ReqLinex.GetRec(Rec);
                    ReqLinex.Run;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Requisition Type" := Rec."requisition type"::"Purchase Requisition";
    end;

    trigger OnOpenPage()
    begin
        /*
         SETRANGE("Raised by",USERID);

        IF UserSetup.GET(USERID) THEN
        BEGIN

        IF UserSetup."Approver ID"=USERID THEN
        SETRANGE("Raised by");
        ApprovalTemplate.RESET;
        ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Requisition Header1");
        ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
        IF ApprovalTemplate.FIND('-') THEN
        BEGIN
        AdditionalApprovers.RESET;
        AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
        AdditionalApprovers.SETRANGE(AdditionalApprovers."Approver ID",USERID);
        IF AdditionalApprovers.FIND('+') THEN
        SETRANGE("Raised by");
        END;
        IF ApprovalSetup.GET THEN
        IF ApprovalSetup."Approval Administrator"=USERID THEN
        SETRANGE("Raised by");


        ApprovalTemplate.RESET;
        ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Requisition Header1");
        ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
        IF ApprovalTemplate.FIND('-') THEN
        BEGIN
        AdditionalApprovers.RESET;
        AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
        IF AdditionalApprovers.FIND('-') THEN
        REPEAT

         UserSetupRec.RESET;
         UserSetupRec.SETRANGE(UserSetupRec.Substitute,AdditionalApprovers."Approver ID");
         IF UserSetupRec.FIND('-') THEN
         SETRANGE("Raised by");
        UNTIL AdditionalApprovers.NEXT=0;

        END;




        END;
      */

    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
        UserSetupRec: Record "User Setup";
        Trash: Record "Requisition Header1";
        ReqLines: Record "Requisition Lines1";
        ReqLinex: XmlPort "Import Req Lines";


    procedure Archive()
    begin

        if Rec.Status = Rec.Status::Open then begin
            Trash.Reset;
            Trash.SetRange(Trash."No.", Rec."No.");
            Rec.Status := Rec.Status::Archived;
            Rec."Document Type" := Rec."document type"::"Purchase Requisition";
            Rec.Modify;
            Message('The Purchase Requisition has been Archived');
        end;
    end;
}
