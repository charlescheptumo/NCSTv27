#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 70001 "Import Manual Bids"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Bid Tabulation Line"; "Bid Tabulation Line")
            {
                XmlName = 'FER';
                fieldelement(Code; "Bid Tabulation Line"."Tabulation ID")
                {
                }
                fieldelement(IFS; "Bid Tabulation Line"."Invitation For Supply No")
                {
                }
                fieldelement(VendorPIN; "Bid Tabulation Line"."Vendor PIN")
                {
                }
                fieldelement(VendorName; "Bid Tabulation Line"."Bidder Name")
                {
                }
                fieldelement(AttendedPreBid; "Bid Tabulation Line"."Attended Pre-bid Conference")
                {
                }
                fieldelement(PreBidDate; "Bid Tabulation Line"."Prebid Conference Date")
                {
                }
                fieldelement(BidOpeningDate; "Bid Tabulation Line"."Bid Opening Date")
                {
                }
                fieldelement(LateBid; "Bid Tabulation Line"."Late Bid (Opening Stage)")
                {
                }
                fieldelement(Withdrawal; "Bid Tabulation Line"."Withdrawn Bid (Opening Stage)")
                {
                }
                fieldelement(SuccessfulBid; "Bid Tabulation Line"."Succesful Bid (Opening Stage)")
                {
                }
                fieldelement(PreliminaryDate; "Bid Tabulation Line"."Preliminary Evaluation Date")
                {
                }
                fieldelement(Responsive; "Bid Tabulation Line"."Responsive Bid")
                {
                }
                fieldelement(TechnicalDate; "Bid Tabulation Line"."Technical Evaluation Date")
                {
                }
                fieldelement(WeightedScoreTech; "Bid Tabulation Line"."Weighted Tech Score %")
                {
                }
                fieldelement(PassedTech; "Bid Tabulation Line"."Passed Tech Evaluation")
                {
                }
                fieldelement(FinalEvaluatedPrice; "Bid Tabulation Line"."Final Evaluated Bid Price")
                {
                }
                fieldelement(FinancialDate; "Bid Tabulation Line"."Financial Evaluation Date")
                {
                }
                fieldelement(WeightedScoreFIN; "Bid Tabulation Line"."Weighted Financial Score %")
                {
                }
                fieldelement(EvaluationRemarks; "Bid Tabulation Line"."Financial Evaluation Comm Rem")
                {
                }
                fieldelement(EvaluationDecision; "Bid Tabulation Line"."Evaluation Committee Recomm")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    Vend.Reset;
                    Vend.SetRange("VAT Registration No.", "Bid Tabulation Line"."Vendor PIN");
                    if Vend.FindSet then begin
                        Bid.Reset;
                        Bid.SetRange("IFS Code", "Bid Tabulation Line"."Invitation For Supply No");
                        Bid.SetRange("Vendor No.", Vend."No.");
                        if not Bid.FindSet then begin
                            Bid.Init;
                            Bid.Validate("Buy-from Vendor No.", Vend."No.");

                            Bid.Insert(true);
                            if Bid.Insert(true) then begin
                                Bid.Validate("Invitation For Supply No", "Bid Tabulation Line"."Invitation For Supply No");
                                Bid.Modify(true);
                            end;

                            "Bid Tabulation Line"."Bidder No" := Vend."No.";
                            "Bid Tabulation Line"."No." := Bid."No.";
                        end else begin
                            "Bid Tabulation Line"."Bidder No" := Vend."No.";
                            "Bid Tabulation Line"."No." := Bid."No.";
                        end;

                    end else begin
                        Vend.Init;
                        Vend.Validate(Name, "Bid Tabulation Line"."Bidder Name");
                        Vend.Validate("VAT Registration No.", "Bid Tabulation Line"."Vendor PIN");
                        Vend."Gen. Bus. Posting Group" := 'DOMESTIC';
                        Vend."VAT Bus. Posting Group" := 'DOMESTIC';
                        Vend."Vendor Posting Group" := 'CONTRACTOR';
                        if Vend.Insert(true) then begin
                            Bid.Reset;
                            Bid.SetRange("IFS Code", "Bid Tabulation Line"."Invitation For Supply No");
                            Bid.SetRange("Vendor No.", Vend."No.");
                            if not Bid.FindSet then begin
                                Bid.Init;
                                Bid.Validate("Buy-from Vendor No.", Vend."No.");

                                if Bid.Insert(true) then begin
                                    Bid.Validate("Invitation For Supply No", "Bid Tabulation Line"."Invitation For Supply No");
                                    Bid.Modify(true);
                                end;
                                "Bid Tabulation Line"."Bidder No" := Vend."No.";
                                "Bid Tabulation Line"."No." := Bid."No.";
                            end else begin
                                "Bid Tabulation Line"."Bidder No" := Vend."No.";
                                "Bid Tabulation Line"."No." := Bid."No.";

                            end;
                        end;
                    end;
                    "Bid Tabulation Line"."Tabulation Type" := "Bid Tabulation Line"."tabulation type"::"Evaluation Report";
                    "Bid Tabulation Line"."Document Type" := "Bid Tabulation Line"."document type"::Quote;

                    "Bid Tabulation Line".Insert;
                    Bidtab.Reset;
                    Bidtab.SetRange("Tabulation ID", "Bid Tabulation Line"."Tabulation ID");
                    if Bidtab.FindSet then begin
                        repeat
                            if Bidtab."No." = '' then
                                Bidtab.Delete;
                        until Bidtab.Next = 0;
                    end;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        Message('Final Evaluation Report Imported Succesfully');
    end;

    var
        Vend: Record Vendor;
        Bid: Record "Purchase Header";
        Bidtab: Record "Bid Tabulation Line";
}
