#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57100 "Approved  Warrant Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Approved  Warrant Voucher";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = order(ascending)
                      where("Payment Type" = filter("Warrant Voucher"),
                            Status = filter(Released),
                            Posted = filter(FALSE));
    UsageCategory = Lists;

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
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
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
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                }
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
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
