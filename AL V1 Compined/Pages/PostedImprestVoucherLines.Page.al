#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57071 "Posted Imprest Voucher Lines"
{
    Editable = false;
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
                    DrillDownPageID = "Employee List";
                }
                field("Account Name"; Rec."Account Name")
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
            }
        }
    }

    actions
    {
    }
}
