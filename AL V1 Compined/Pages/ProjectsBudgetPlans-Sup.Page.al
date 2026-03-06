#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65117 "Projects Budget Plans-Sup"
{
    ApplicationArea = Jobs;
    Caption = 'Projects Budget Plans-Sup';
    CardPageID = "Budget Plan Card-Sup";
    Editable = false;
    PageType = List;
    SourceTable = "Project Budget Header";
    SourceTableView = where("Budget Type" = const(Suplementary));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Project Budget ID"; Rec."Project Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Type"; Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
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
