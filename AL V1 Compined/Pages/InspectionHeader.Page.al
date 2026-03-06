#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70056 "Inspection Header"
{
    PageType = Card;
    SourceTable = "Inspection Header1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Commitee Appointment No"; Rec."Commitee Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field("Tender/Quotation No."; Rec."Tender/Quotation No.")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000012; "Inspection Lines")
            {
                SubPageLink = "Inspection No" = field("Inspection No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Request for Approval';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.SendInspectionApproval(Rec) THEN;

                        //TESTFIELD();

                        ///Inspection....22.10.2019 Hunaina
                        //if ApprovalMgt.CheckInpectionApprovalPossible(Rec) then
                        //ApprovalMgt.OnSendInpectionDocForApproval(Rec);
                    end;
                }
                action("Cancel Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Request for Approval';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    begin
                        //cc//ApprovalMgt.OnCancelInpectionDocApprovalRequest(Rec);
                    end;
                }
                action("View Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Order';
                    RunObject = Page "Purchase Order";
                    RunPageLink = "No." = field("Order No");
                }
                action("View Inspection Certificate")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Inspection Certificate';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category10;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter(Rec."Inspection No", Rec."Inspection No");
                        Report.Run(70006, true, false, Rec);
                    end;
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
                        ////21.10.2019...Hunaina
                        Purch.Reset;
                        Purch.SetRange("Inspection No", Rec."Inspection No");
                        if Purch.FindSet then begin
                            RecRef.GetTable(Purch);
                            DocumentAttachmentDetails.OpenForRecRef(RecRef);
                            DocumentAttachmentDetails.Run;
                        end
                        else
                            RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.Run;

                        /*RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUNMODAL;*/

                    end;
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        Purch: Record "Inspection Header1";
}
