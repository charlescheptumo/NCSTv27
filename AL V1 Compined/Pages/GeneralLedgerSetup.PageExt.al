#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50024 pageextension50024 extends "General Ledger Setup"
{
    layout
    {
        addafter(Application)
        {
            group("Customized Number Series")
            {
                field("File Creation Nos"; Rec."File Creation Nos")
                {
                    ApplicationArea = Basic;
                }
                field("File Movement Nos"; Rec."File Movement Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
