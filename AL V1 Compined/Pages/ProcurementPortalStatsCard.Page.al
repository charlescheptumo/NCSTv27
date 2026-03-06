#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70154 "Procurement Portal Stats Card"
{
    PageType = Card;
    SourceTable = "Eprocurement Statistics";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Process"; Rec."Procurement Process")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Step; Rec.Step)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Sumitted Date"; Rec."Sumitted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}
