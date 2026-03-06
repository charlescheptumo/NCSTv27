#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65080 "Contract Funding Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Funding Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Contract No."; Rec."Project Contract No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Start Date"; Rec."Budget Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Budget End Date"; Rec."Budget End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Customer"; Rec."Funding Customer")
                {
                    ApplicationArea = Basic;
                }
                field("Grant ID"; Rec."Grant ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Funding Currency"; Rec."Funding Currency")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Funding Limit"; Rec."Approved Funding Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Status"; Rec."Job Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}
