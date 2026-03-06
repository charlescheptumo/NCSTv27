#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75296 "IFS Purchase Activity Schedule"
{
    PageType = List;
    SourceTable = "IFS Purchase Activity Schedule";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Entry"; Rec."PP Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Default Planned Duration(Days)"; Rec."Default Planned Duration(Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Duration (Days)"; Rec."Actual Duration (Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Dates"; Rec."Planned Dates")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Dates"; Rec."Actual Dates")
                {
                    ApplicationArea = Basic;
                }
                field("Line no"; Rec."Line no")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
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
