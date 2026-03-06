#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75264 "Tender Opening Summary Note"
{
    PageType = List;
    SourceTable = "Tender Opening Summary Note";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Register ID"; Rec."Register ID")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Item Discussed"; Rec."Item Discussed")
                {
                    ApplicationArea = Basic;
                }
                field("Summary Notes"; Rec."Summary Notes")
                {
                    ApplicationArea = Basic;
                }
                field("Referenced Section of Tender"; Rec."Referenced Section of Tender")
                {
                    ApplicationArea = Basic;
                }
                field("Referenced Clause of Tender"; Rec."Referenced Clause of Tender")
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
