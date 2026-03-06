#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59054 "Fund Opportunity Details"
{
    ApplicationArea = Basic;
    CardPageID = "Fund Opportunity Detail Card";
    Editable = false;
    PageType = List;
    SourceTable = "Funding Oportunity";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Donor Type"; Rec."Donor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Donor No"; Rec."Donor No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Date Awarded"; Rec."Date Awarded")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Applied"; Rec."Total Amount Applied")
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Donor Name"; Rec."Donor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Eligibility Criteria"; Rec."Eligibility Criteria")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Outlook)
            {
            }
            systempart(Control17; Notes)
            {
            }
            systempart(Control18; MyNotes)
            {
            }
            systempart(Control19; Links)
            {
            }
        }
    }

    actions
    {
    }
}
