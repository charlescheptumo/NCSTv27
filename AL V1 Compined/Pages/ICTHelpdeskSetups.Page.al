#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56119 "ICT Helpdesk Setups"
{
    ApplicationArea = Basic;
    CardPageID = "ICT Helpdesk Setup Card";
    PageType = Card;
    SourceTable = "ICT Helpdesk Global Parameters";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("User Feedback Duration"; Rec."User Feedback Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Issue Duration"; Rec."Assigned Issue Duration")
                {
                    ApplicationArea = Basic;
                }
                field("ICT Email"; Rec."ICT Email")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("ICT Issuance Voucher Nos."; Rec."ICT Issuance Voucher Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("ICT Inventory Nos"; Rec."ICT Inventory Nos")
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
