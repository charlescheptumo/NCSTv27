#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70028 Bidders
{
    PageType = List;
    SourceTable = Bidders;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Tender Doc Receipt Date"; Rec."Tender Doc Receipt Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipt Date';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Amount"; Rec."Tender Amount")
                {
                    ApplicationArea = Basic;
                    Caption = ' Amount';
                }
                field("Bid Security Amount"; Rec."Bid Security Amount")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Copies Submitted"; Rec."No. of Copies Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Physical Address"; Rec."Physical Address")
                {
                    ApplicationArea = Basic;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No"; Rec."Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile No"; Rec."Mobile No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Pre Qualified"; Rec."Pre Qualified")
                {
                    ApplicationArea = Basic;
                }
                field("Proceed to Tech Evaluation"; Rec."Proceed to Tech Evaluation")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset No"; Rec."Fixed Asset No")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Bidders)
            {
                Caption = 'Bidders';
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements ';
                    RunObject = Page "Bidder Mandatory Requirements";
                    RunPageLink = "Tender No" = field("Ref No."),
                                  "Company Name" = field(Name);

                    trigger OnAction()
                    begin
                        MandatoryReq.Reset;
                        MandatoryReq.SetRange(MandatoryReq."Tender No", Rec."Ref No.");
                        if MandatoryReq.Find('-') then
                            repeat
                                BidderMandatory."Tender No" := Rec."Ref No.";
                                BidderMandatory."Company Name" := Rec.Name;
                                BidderMandatory.Type := MandatoryReq.Type;
                                BidderMandatory.No := MandatoryReq.No;
                                BidderMandatory.Description := MandatoryReq.Description;
                                BidderMandatory.Specification := MandatoryReq.Specification;
                                if not BidderMandatory.Get(BidderMandatory."Tender No", BidderMandatory."Company Name", BidderMandatory.Specification)
                                then
                                    BidderMandatory.Insert;

                            until MandatoryReq.Next = 0;
                    end;
                }
                action(Bids)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bids';
                    RunObject = Page "Tender Bids";
                    RunPageLink = "Requisition No" = field("Ref No."),
                                  "Bidder Name" = field(Name);

                    trigger OnAction()
                    begin
                        ProcurementLines.Reset;
                        ProcurementLines.SetRange(ProcurementLines."Requisition No", Rec."Ref No.");
                        if ProcurementLines.Find('-') then
                            repeat
                                TenderBids."Requisition No" := Rec."Ref No.";
                                TenderBids."Bidder Name" := Rec.Name;
                                TenderBids."Bidder Email" := Rec."E-mail";
                                TenderBids.Type := ProcurementLines.Type;
                                TenderBids.No := ProcurementLines.No;
                                TenderBids.Description := ProcurementLines.Description;
                                if not TenderBids.Get(TenderBids."Requisition No", TenderBids."Bidder Name", TenderBids."Bidder Email") then
                                    TenderBids.Insert;
                            until ProcurementLines.Next = 0;
                    end;
                }
            }
        }
    }

    var
        MandatoryReq: Record "Tender Mandatory Requirements";
        BidderMandatory: Record "Bidder Mandatory Requirements";
        TenderBids: Record "Tender Bids";
        ProcurementLines: Record 70014;
}
