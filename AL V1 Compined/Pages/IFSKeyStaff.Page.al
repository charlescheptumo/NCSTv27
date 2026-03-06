#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75131 "IFS Key Staff"
{
    PageType = List;
    SourceTable = "IFS Key Staff";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation Description"; Rec."Title/Designation Description")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Min No. of Recomm Staff"; Rec."Min No. of Recomm Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
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
