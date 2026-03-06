#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70102 "Asset Disposals List"
{
    CardPageID = "Asset Disposal Card";
    PageType = List;
    SourceTable = "Asset Disposal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disposal No"; Rec."Disposal No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Asset Code"; Rec."Asset Code")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code (Default)"; Rec."Language Code (Default)")
                {
                    ApplicationArea = Basic;
                }
                field(Attachement; Rec.Attachement)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Code"; Rec."Committee Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Asset Name"; Rec."Asset Name")
                {
                    ApplicationArea = Basic;
                }
                field("Valuation Amount"; Rec."Valuation Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Recommendations"; Rec."Committee Recommendations")
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
