#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75134 "IFS Prebid Register"
{
    ApplicationArea = Basic;
    CardPageID = "IFS Prebid Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "IFS Prebid Register";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Description"; Rec."Tender Description")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Visit Date"; Rec."Pre-bid Visit Date")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Visit Start Time"; Rec."Pre-bid Visit Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Visit End Date"; Rec."Pre-bid Visit End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Visit End Time"; Rec."Pre-bid Visit End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Bidders"; Rec."No. of Bidders")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Prebid Attendees"; Rec."No. of Prebid Attendees")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
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
