#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57080 "Advance Types"
{
    ApplicationArea = Basic;
    Caption = 'Advance Types';
    CardPageID = AdvanceType;
    Editable = false;
    PageType = List;
    SourceTable = "Receipts and Payment Types1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("Appear on Imprest?"; Rec."Appear on Imprest?")
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
