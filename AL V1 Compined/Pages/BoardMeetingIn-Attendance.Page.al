#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55024 "Board Meeting In-Attendance"
{
    PageType = List;
    SourceTable = "Board Meeting In Attendance1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Meeting Name"; Rec."Meeting Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Commitee No"; Rec."Commitee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                    Editable = true;
                }
                field("Committee  Name"; Rec."Committee  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation';
                }
                field("Meeting Date"; Rec."Meeting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Attendance; Rec.Attendance)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
