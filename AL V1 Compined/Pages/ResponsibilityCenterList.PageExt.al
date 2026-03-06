#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50062 pageextension50062 extends "Responsibility Center List"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Responsibility Center List"(Page 5715)".

    layout
    {
        addafter("Location Code")
        {
            field("Operating Unit Type"; Rec."Operating Unit Type")
            {
                ApplicationArea = Basic;
            }
            field("Direct Reports To"; Rec."Direct Reports To")
            {
                ApplicationArea = Basic;
            }
            field("Indirect Reports To"; Rec."Indirect Reports To")
            {
                ApplicationArea = Basic;
            }
            field("Hierarchical  Level ID"; Rec."Hierarchical  Level ID")
            {
                ApplicationArea = Basic;
            }
            field("Headed By (Title)"; Rec."Headed By (Title)")
            {
                ApplicationArea = Basic;
            }
            field("Current Head"; Rec."Current Head")
            {
                ApplicationArea = Basic;
            }
        }
    }

    //Unsupported feature: Property Deletion (Editable).

}
