#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57010 "Receipts and Payment Types"
{
    ApplicationArea = Basic;
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
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("VAT Chargeable"; Rec."VAT Chargeable")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Chargeable"; Rec."Withholding Tax Chargeable")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field("Default Grouping"; Rec."Default Grouping")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Voucher"; Rec."Pending Voucher")
                {
                    ApplicationArea = Basic;
                }
                field("Transation Remarks"; Rec."Transation Remarks")
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
