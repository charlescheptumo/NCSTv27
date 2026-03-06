#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56115 "ICT Helpdesk Office Mapping"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "ICT Officers Category Mapping";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(UserName; Rec.UserName)
                {
                    ApplicationArea = Basic;
                }
                field("Help Desk Category"; Rec."Help Desk Category")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("User Feedbback Duration"; Rec."User Feedbback Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Assined Issue Duration"; Rec."Assined Issue Duration")
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
