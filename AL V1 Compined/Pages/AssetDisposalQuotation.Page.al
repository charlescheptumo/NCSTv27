#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70105 "Asset Disposal Quotation"
{
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const("Low Value"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000019; "Procurement Request Lines")
            {
                SubPageLink = "Requisition No" = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Asset Disposal")
            {
                Caption = 'Asset Disposal';
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements';
                    RunObject = Page "Tender Mandatory Requirements";
                    RunPageLink = "Tender No" = field(No);
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    RunObject = Page "Asset Disposal Bidders";
                    RunPageLink = "Ref No." = field(No);
                }
                action("Generate Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Orders';
                    Visible = false;

                    trigger OnAction()
                    var
                        QuotationLines: Record "Sales Line";
                    begin
                        /*
                        QuotationLines.SETRANGE(QuotationLines."Asset Disposal No","Asset Disposal No");
                        IF QuotationLines.FINDFIRST THEN
                         BEGIN
                           REPEAT
                            QuotationLines.CreateSalesOrder(QuotationLines);
                           UNTIL QuotationLines.NEXT=0;
                          MESSAGE('Orders Created successfully');
                         END;
                        */

                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Process Type" := Rec."process type"::"Low Value";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::"Low Value";
    end;
}
