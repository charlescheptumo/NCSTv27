#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57048 "Imprest Warrant Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Warrant Voucher";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = order(ascending)
                      where("Payment Type" = filter("Warrant Voucher"),
                            Status = filter(Open | "Pending Approval"),
                            "Archive Document" = const(False));
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
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
