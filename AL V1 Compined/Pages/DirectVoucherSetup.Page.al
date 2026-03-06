#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57073 "Direct Voucher Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Direct Voucher Setup";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Income Account"; Rec."Income Account")
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
