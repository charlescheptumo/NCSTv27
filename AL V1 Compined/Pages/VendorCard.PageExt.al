#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50008 pageextension50008 extends "Vendor Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Vendor Card"(Page 26)".

    layout
    {
        addafter("Balance Due (LCY)")
        {
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Responsibility Center")
        {
            field("onboarded Year"; Rec."onboarded Year")
            {
                ApplicationArea = Basic;
            }
            field("Supplier Category"; Rec."Supplier Category")
            {
                ApplicationArea = Basic;
            }
            field("Special Category"; Rec."Special Category")
            {
                ApplicationArea = Basic;
            }
            field("Certificate of Registration"; Rec."Certificate of Registration")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Disable Search by Name")
        {
            field("Status 1"; Rec."Status 1")
            {
                ApplicationArea = Basic;
            }
            field("Vendor Type"; Rec."Vendor Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on "PayVendor(Action 98)".

        addafter(Attachments)
        {
            action("Prequalified Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Prequalified Categories';
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Pre Qualified Categories";
                RunPageLink = "Vendor No" = field("No.");
            }
        }
    }
}
