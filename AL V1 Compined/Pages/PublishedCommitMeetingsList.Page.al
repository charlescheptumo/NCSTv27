#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55014 "Published Commit Meetings List"
{
    ApplicationArea = Basic;
    Caption = 'Published Committee  Meetings List';
    CardPageID = "Board Meeting Card";
    PageType = List;
    SourceTable = "Board Meetings";
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
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref. No:';
                    Visible = false;
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                }
                field("End time"; Rec."End time")
                {
                    ApplicationArea = Basic;
                }
                field("Meeting group"; Rec."Meeting group")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Meeting Status"; Rec."Meeting Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
    }
}
