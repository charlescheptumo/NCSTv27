#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59050 "Fund Opportunity List"
{
    ApplicationArea = Basic;
    CardPageID = "Fund Opportunity Card";
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
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
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
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
            }
            systempart(Control15; Notes)
            {
            }
            systempart(Control16; MyNotes)
            {
            }
            systempart(Control17; Links)
            {
            }
        }
    }

    actions
    {
    }
}
