#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75258 "Tender Cancellation List"
{
    ApplicationArea = Basic;
    CardPageID = "Tender Cancellation Voucher";
    PageType = List;
    SourceTable = "Tender Cancellation Voucher";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice No"; Rec."Invitation Notice No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender No."; Rec."Tender No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Cancel Reason Code"; Rec."Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
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
