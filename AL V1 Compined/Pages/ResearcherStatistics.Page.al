#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65076 "Researcher Statistics"
{
    Editable = false;
    PageType = Card;
    SourceTable = Resource;
    SourceTableView = where("Researcher?" = const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Awarded GFO"; Rec."No. of Awarded GFO")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Awarded Grant';
                    Editable = false;
                }
                field("No. of Lost Grant GFO"; Rec."No. of Lost Grant GFO")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Lost Grant Grants';
                    Editable = false;
                }
                field("No. of Ongoing RProjects"; Rec."No. of Ongoing RProjects")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Ongoing Projects';
                    Editable = false;
                }
                field("No. of Completed RProjects"; Rec."No. of Completed RProjects")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Completed Projects';
                    Editable = false;
                }
                field("No. of Research Outputs"; Rec."No. of Research Outputs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount Awarded(LCY)"; Rec."Total Amount Awarded(LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control11; "Grant Funding Sub List")
            {
                SubPageLink = "Principal Investigator" = field("No.");
            }
            part(Control12; "Project Funding Con. Sub List")
            {
                SubPageLink = "Person Responsible" = field("No.");
            }
        }
    }

    actions
    {
    }
}
