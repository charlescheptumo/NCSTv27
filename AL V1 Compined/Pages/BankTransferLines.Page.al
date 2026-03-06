#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57060 "Bank Transfer Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer To';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Amount1; Rec.Amount1)
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
