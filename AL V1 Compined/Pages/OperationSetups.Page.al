#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59003 "Operation Setups"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fleet Management Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Req No"; Rec."Transport Req No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field("Fuel Register"; Rec."Fuel Register")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field("Maintenance Request"; Rec."Maintenance Request")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field("Contract  No"; Rec."Contract  No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field("Fuel Card No"; Rec."Fuel Card No")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "No. Series";
                }
                field(No; Rec.No)
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
