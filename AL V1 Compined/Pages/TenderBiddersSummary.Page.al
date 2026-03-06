#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70029 "Tender Bidders Summary"
{
    PageType = List;
    SourceTable = Bidders;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
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
                action("Mandatory Requirements -Compliance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements -Compliance';
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
        ProcurementLines: Record "Procurement Request Lines";
}
