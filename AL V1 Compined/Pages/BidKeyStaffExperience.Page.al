#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75142 "Bid Key Staff Experience"
{
    PageType = List;
    SourceTable = "Bid Key Staff Experience";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Project Role ID"; Rec."Proposed Project Role ID")
                {
                    ApplicationArea = Basic;
                }
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                }
                field("Years of Experience"; Rec."Years of Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Experience Summary"; Rec."Experience Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Sample Assignments/Projects"; Rec."Sample Assignments/Projects")
                {
                    ApplicationArea = Basic;
                }
                field("Experience From Year"; Rec."Experience From Year")
                {
                    ApplicationArea = Basic;
                }
                field("Experience To Year"; Rec."Experience To Year")
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
