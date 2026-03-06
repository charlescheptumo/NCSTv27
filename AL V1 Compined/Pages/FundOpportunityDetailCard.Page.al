#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59056 "Fund Opportunity Detail Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Funding Oportunity";
    ApplicationArea = All;

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
            part(Control15; "Grant Applicants subform")
            {
                SubPageLink = "Fund Opportunity" = field(No);
            }
        }
    }

    actions
    {
    }
}
