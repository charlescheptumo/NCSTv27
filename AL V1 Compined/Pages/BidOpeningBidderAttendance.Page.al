#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75157 "Bid Opening Bidder Attendance"
{
    PageType = List;
    SourceTable = "Bid Opening Bidder Attendance";

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
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Representative Name"; Rec."Bidder Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Email"; Rec."Representative Email")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Tel No"; Rec."Representative Tel No")
                {
                    ApplicationArea = Basic;
                }
                field("Date/Time Notified"; Rec."Date/Time Notified")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
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
