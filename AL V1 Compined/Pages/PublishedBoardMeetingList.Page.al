#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55004 "Published Board Meeting List"
{
    ApplicationArea = Basic;
    CardPageID = "Board Meeting Card Pub";
    PageType = List;
    SourceTable = "Board Meetings1";
    SourceTableView = where(Published = filter(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref. No:';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref. No:';
                    Visible = false;
                }
                field("Type of Meeting"; Rec."Type of Meeting")
                {
                    ApplicationArea = Basic;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                }
                field("End time"; Rec."End time")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Venue/Location"; Rec."Venue/Location")
                {
                    ApplicationArea = Basic;
                }
                field("Convened by"; Rec."Convened by")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Meeting Status"; Rec."Meeting Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control4; Outlook)
            {
            }
            systempart(Control3; Notes)
            {
            }
            systempart(Control2; MyNotes)
            {
            }
            systempart(Control1; Links)
            {
            }
        }
    }

    actions
    {
    }
}
