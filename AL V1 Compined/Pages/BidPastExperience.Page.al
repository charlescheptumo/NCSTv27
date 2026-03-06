#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75143 "Bid Past Experience"
{
    PageType = List;
    SourceTable = "Bid Past Experience";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Assignment/Project Name"; Rec."Assignment/Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Scope Summary"; Rec."Project Scope Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Start Date"; Rec."Assignment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment End Date"; Rec."Assignment End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Value LCY"; Rec."Assignment Value LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Status"; Rec."Assignment Status")
                {
                    ApplicationArea = Basic;
                }
                field("Project Completion % (Value)"; Rec."Project Completion % (Value)")
                {
                    ApplicationArea = Basic;
                }
                field("Delivery Location"; Rec."Delivery Location")
                {
                    ApplicationArea = Basic;
                }
                field("Project Completion % (Work)"; Rec."Project Completion % (Work)")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Person"; Rec."Primary Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Designation"; Rec."Primary Contact Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Tel"; Rec."Primary Contact Tel")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contact Email"; Rec."Primary Contact Email")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
