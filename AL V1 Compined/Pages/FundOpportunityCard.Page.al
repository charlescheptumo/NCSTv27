#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59051 "Fund Opportunity Card"
{
    PageType = Card;
    SourceTable = "Funding Oportunity";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Donor Name"; Rec."Donor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Eligibility Criteria"; Rec."Eligibility Criteria")
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
                    Visible = false;
                }
                field("Total Amount Applied"; Rec."Total Amount Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
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
