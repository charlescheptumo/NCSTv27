#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75240 "PRN Personnel Specification"
{
    PageType = List;
    SourceTable = "PRN Personnel Specification";
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
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Line)
            {
                Caption = 'Line';
                action("PRN Personnel Qualification")
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualification Requirements';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    RunObject = Page "PRN Personnel Qualification";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Staff Role Code" = field("Staff Role Code");
                }
                action("PRN Personnel Experience")
                {
                    ApplicationArea = Basic;
                    Caption = 'Experience Requirements';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "PRN Personnel Experience";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Staff Role Code" = field("Staff Role Code");
                }
            }
        }
    }
}
