#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70020 "Released Purchase Requisition"
{
    PageType = Card;
    SourceTable = "Requisition Header1";
    SourceTableView = where("Requisition Type" = const("Purchase Requisition"),
                            Status = const(Released));
    ApplicationArea = All;

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
                    Editable = false;
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
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 4 Code"; Rec."Global Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No of Approvals"; Rec."No of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Purchase Type"; Rec."Purchase Type")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Code"; Rec."Supplier Code")
                {
                    ApplicationArea = Basic;
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
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
                action(Archived)
                {
                    ApplicationArea = Basic;
                    Caption = 'Archive';

                    trigger OnAction()
                    begin
                        Archive();
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
                    Report.Run(70000, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("Generate Purchase Order")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Purchase Order';
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Released then begin
                        if Confirm('Are u sure u want to generate Orders for the selected Vendor(s)', true) then
                            Rec.CreatePurchaseOrder(Rec);
                    end else
                        Error(Text000);
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
                    Report.Run(70001, true, true, Rec);
                    Rec.Reset;
                end;
            }
            group("&Attachments")
            {
                Caption = '&Attachments';
                Visible = true;
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
        Text000: label 'The Status has to be Released';


    procedure Archive()
    begin
        /*
        IF Rec.Status=Rec.Status::Open THEN
        BEGIN
        Trash.RESET;
        Trash.SETRANGE(Trash. "No.",Rec."No.");
        Rec.Status:=Rec.Status::Archived;
        Rec."Document Type":=Rec."Document Type"::"Purchase Requisition";
        MODIFY;
        MESSAGE('The Purchase Requisition has been Archived');
        END;*/

    end;
}
