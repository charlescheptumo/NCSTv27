#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59136 "File Folio Card"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "File Folio Registry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Folio No"; Rec."Folio No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Folio Name"; Rec."Folio Name")
                {
                    ApplicationArea = Basic;
                }
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("View File Allocation Entries")
            {
                ApplicationArea = Basic;
                Image = JobLines;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "File Allocation Entries Lst";
                RunPageLink = "Document No" = field("Document No");
            }
        }
    }
}
