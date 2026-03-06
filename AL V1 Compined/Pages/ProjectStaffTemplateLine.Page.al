#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75105 "Project Staff Template Line"
{
    PageType = ListPart;
    SourceTable = "Project Staff Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Title Designation Description';
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
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Project Staff Template Exp")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Qualification';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    RunObject = Page "Project Staff Template Exp";
                    RunPageLink = "Key Staff Template ID" = field("Key Staff Template ID"),
                                  "Project Role Code" = field("Project Role Code");
                }
                action("Project Staff Template Qualif")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experience';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "Project Staff Template Qualif";
                }
            }
        }
    }
}
