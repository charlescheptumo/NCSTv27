#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75119 "Purch Requsition Template Card"
{
    PageType = Card;
    SourceTable = "Purchase Requisition Template";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Template Type"; Rec."Template Type")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
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
            part(Control22; "BoQ Template Line1")
            {
                Caption = 'Bill of Quantity (BoQ) Lines';
                SubPageLink = "BoQ Template ID" = field(Code);
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
            }
            systempart(Control18; Notes)
            {
            }
            systempart(Control19; MyNotes)
            {
            }
            systempart(Control20; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup10)
            {
                action("Purchase requisitions")
                {
                    ApplicationArea = Basic;
                    Image = ReviewWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "IFS Purchase Requisitions";
                    RunPageLink = "Document Type" = const("Purchase Requisition"),
                                  "Requisition Template ID" = field(Code);
                }
                action("Project Works Categories")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "BoQ Template Work Category";
                    RunPageLink = "BoQ Template Code" = field(Code);
                }
            }
        }
    }
}
