#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75133 "IFS Intention To Bid"
{
    Caption = 'Recurring Purchase Lines';
    DataCaptionFields = "Vendor No.";
    PageType = List;
    SourceTable = "Standard Vendor Purchase Code";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the vendor to which the standard purchase code is assigned.';
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a standard purchase code from the Standard Purchase Code table.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the standard purchase code.';
                }
                field("Insert Rec. Lines On Quotes"; Rec."Insert Rec. Lines On Quotes")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how you want to use standard purchase codes on purchase quotes.';
                }
                field("Insert Rec. Lines On Orders"; Rec."Insert Rec. Lines On Orders")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how you want to use standard purchase codes on purchase orders.';
                }
                field("Insert Rec. Lines On Invoices"; Rec."Insert Rec. Lines On Invoices")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how you want to use standard purchase codes on purchase invoices.';
                }
                field("Insert Rec. Lines On Cr. Memos"; Rec."Insert Rec. Lines On Cr. Memos")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies how you want to use standard purchase codes on purchase credit memos.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Purchase")
            {
                Caption = '&Purchase';
                Image = Purchasing;
                action(Card)
                {
                    ApplicationArea = Suite;
                    Caption = 'Card';
                    Image = EditLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Standard Purchase Code Card";
                    RunPageLink = Code = field(Code);
                    Scope = Repeater;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Specifies a standard purchase code from the Standard Purchase Code table.';
                }
            }
        }
    }

    procedure GetSelected(var StdVendPurchCode: Record "Standard Vendor Purchase Code")
    begin
        CurrPage.SetSelectionFilter(StdVendPurchCode);
    end;
}
