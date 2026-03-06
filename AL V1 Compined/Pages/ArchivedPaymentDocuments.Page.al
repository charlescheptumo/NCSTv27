#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57169 "Archived Payment Documents"
{
    ApplicationArea = Basic;
    CardPageID = "Payment Voucher";
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Archive Document" = const(True));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Type"; Rec."Payment Type")
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
