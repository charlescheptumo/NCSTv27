#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75141 "Bid Key Staff Qualification"
{
    PageType = List;
    SourceTable = "Bid Key Staff Qualification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Project Role ID"; Rec."Proposed Project Role ID")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Start Year"; Rec."Start Year")
                {
                    ApplicationArea = Basic;
                }
                field("End Year"; Rec."End Year")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Achievements"; Rec."Outstanding Achievements")
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
