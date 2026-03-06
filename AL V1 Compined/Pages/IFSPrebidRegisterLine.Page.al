#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75136 "IFS Prebid Register Line"
{
    PageType = ListPart;
    SourceTable = "IFS Prebid Register Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prebid Register ID"; Rec."Prebid Register ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder No"; Rec."Bidder No")
                {
                    ApplicationArea = Basic;
                }
                field("Name of Participating Bidder"; Rec."Name of Participating Bidder")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Representatives"; Rec."No. of Representatives")
                {
                    ApplicationArea = Basic;
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                action(Representative)
                {
                    ApplicationArea = Basic;
                    RunObject = Page "IFS Prebid Bidder Attendance";
                    RunPageLink = "Prebid Register ID" = field("Prebid Register ID"),
                                  "IFS Code" = field("IFS Code"),
                                  "Bidder No" = field("Bidder No");
                }
            }
        }
    }
}
