#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50026 pageextension50026 extends "G/L Budget Entries"
{
    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Directorates';
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Division/Section';
            }
        }
    }
}
