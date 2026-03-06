#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50046 pageextension50046 extends "Approval User Setup"
{

    //Unsupported feature: Property Insertion (SourceTableView) on ""Approval User Setup"(Page 663)".

    layout
    {
        addafter("Approver ID")
        {
            field("Second Supervisor"; Rec."Second Supervisor")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Approval Administrator")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = Basic;
            }
            field(Block; Rec.Block)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("&Approval User Setup Test")
        {
            action("User Signature")
            {
                ApplicationArea = Basic;
                Caption = 'User Signature';
                Image = Picture;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "User Signature";
                RunPageLink = "User ID" = field("User ID");
            }
        }
    }
}
