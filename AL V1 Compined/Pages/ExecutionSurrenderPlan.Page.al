#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57086 "Execution Surrender Plan"
{
    PageType = ListPart;
    SourceTable = "Execution Plan";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Period; Rec.Period)
                {
                    ApplicationArea = Basic;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Output; Rec.Output)
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
