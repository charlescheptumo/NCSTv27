#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75242 "PRN Personnel Experience"
{
    PageType = List;
    SourceTable = "PRN Personnel Experience";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Years of Experience"; Rec."Minimum Years of Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Experience Req"; Rec."Minimum Experience Req")
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
