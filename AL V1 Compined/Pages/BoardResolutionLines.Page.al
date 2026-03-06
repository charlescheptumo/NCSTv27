#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 55017 "Board Resolution Lines"
{
    PageType = ListPart;
    SourceTable = "Board Resolution Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control9)
            {
                field("Agenda No"; Rec."Agenda No")
                {
                    ApplicationArea = Basic;
                    TableRelation = Agenda."Agenda No";
                }
                field("Agenda Item"; Rec."Agenda Item")
                {
                    ApplicationArea = Basic;
                }
                field(Resolution; Rec.Resolution)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Action Owner"; Rec."Action Owner")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibility';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of the Meeting';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed"; Rec."Date Closed")
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
