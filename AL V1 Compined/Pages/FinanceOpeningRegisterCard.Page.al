#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75273 "Finance Opening Register Card"
{
    PageType = Card;
    SourceTable = "Bid Opening Register";
    ApplicationArea = All;

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
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Com"; Rec."Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Opening Committee Code';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Start Time"; Rec."Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening End Date"; Rec."Bid Opening End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening End Time"; Rec."Bid Opening End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Venue"; Rec."Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 1"; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 2"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 3"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 4"; Rec."Opening Person 4")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Intention To Bid Vendor"; Rec."No. of Intention To Bid Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submitted Bids"; Rec."No. of Submitted Bids")
                {
                    ApplicationArea = Basic;
                }
                field("Required Bid Security Amount"; Rec."Required Bid Security Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
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
            part(Control28; "Bid Opening Register Line")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup30)
            {
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = Code = field(upperlimit(Code)),
                                  "IFS Code" = field("IFS Code");
                }
                action("Bid Opening Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Opening Tender Committee";
                    RunPageLink = "Document No." = field(Code);
                }
                action("Tender Opening Summary")
                {
                    ApplicationArea = Basic;
                    Image = WIPEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Tender Opening Summary Note";
                    RunPageLink = "Register ID" = field(Code);
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Rec.Code, Rec.Code);
                        Report.Run(70040, true, true, Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Procurement.PostBidOpeningRegister(Rec)
                    end;
                }
                action("Unseal Bid")
                {
                    ApplicationArea = Basic;
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Procurement.UnsealFinancialBid(Rec);
                    end;
                }
                action("Send Bid Opening Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Bid Opening Codes';
                    Image = OpenJournal;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Procurement.FnSendSecretCodeOnIFSBidOpening(Rec)
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Finance
    end;

    var
        Procurement: Codeunit "Procurement Processing";
}
