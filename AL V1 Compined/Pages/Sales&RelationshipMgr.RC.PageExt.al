#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50068 pageextension50068 extends "Sales & Relationship Mgr. RC"
{
    Caption = 'Customer Information Desk Officers', Comment = 'Use same translation as ''Profile Description'' (if applicable)';
    layout
    {
        modify(Control6)
        {
            Caption = 'Grants Pipeline Chart';
        }
    }
}
