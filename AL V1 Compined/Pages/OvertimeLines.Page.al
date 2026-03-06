#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69131 "Overtime Lines"
{
    PageType = ListPart;
    SourceTable = "Overtime lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                }
                field("Overtime Type"; Rec."Overtime Type")
                {
                    ApplicationArea = Basic;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Work Done"; Rec."Work Done")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        OvertimD: Record "Overtime lines";
        Overtim: Record "Overtime Header";
}
