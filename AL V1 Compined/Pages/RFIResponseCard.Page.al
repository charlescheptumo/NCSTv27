#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75172 "RFI Response Card"
{
    PageType = Card;
    SourceTable = "RFI Response";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Representative Name"; Rec."Vendor Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Repr Designation"; Rec."Vendor Repr Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address 2"; Rec."Vendor Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Vendor"; Rec."Special Group Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("Special Group Category"; Rec."Special Group Category")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Score"; Rec."Final Evaluation Score")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Date Submitted"; Rec."Date Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control31; "RFI Response Line")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
            }
            systempart(Control28; Notes)
            {
            }
            systempart(Control29; MyNotes)
            {
            }
            systempart(Control30; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
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
                action("Filed Documents")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "RFI Response Filed Document";
                    RunPageLink = "Document No" = field("Document No.");
                }
            }
        }
    }
}
