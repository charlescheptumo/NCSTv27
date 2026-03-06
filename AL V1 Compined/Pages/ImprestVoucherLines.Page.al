#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57050 "Imprest Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "Imprest Voucher Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    DrillDown = true;
                    Lookup = true;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = true;
                    Lookup = true;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Subsistence"; Rec."Imprest Subsistence")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Transport"; Rec."Imprest Transport")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Fuel"; Rec."Imprest Fuel")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Casuals"; Rec."Imprest Casuals")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Other Costs"; Rec."Imprest Other Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Amount"; Rec."Vote Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Actual to Date"; Rec."Actual to Date")
                {
                    ApplicationArea = Basic;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                }
                field("Vote Item Desc."; Rec."Vote Item Desc.")
                {
                    ApplicationArea = Basic;
                }
                field("Available Funds"; Rec."Available Funds")
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
