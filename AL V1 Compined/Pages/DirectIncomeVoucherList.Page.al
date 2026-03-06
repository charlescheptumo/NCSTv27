#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57095 "Direct Income Voucher List"
{
    ApplicationArea = Basic;
    CardPageID = "Direct Voucher Header";
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    SourceTable = "Receipts Header1";
    SourceTableView = where(Posted = const(false),
                            "Direct Income Voucher" = const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
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
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Time"; Rec."Posted Time")
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Post Batch")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Receipts Batch Posting ....Kisavi
                    if Confirm(Txt009, true) then begin
                        ReceiptsHeader3.Reset;
                        ReceiptsHeader3.SetRange(Select, true);
                        ReceiptsHeader3.SetRange(Posted, false);
                        if ReceiptsHeader3.FindSet then begin
                            repeat
                                Window.Open('Posting.....');
                                PaymentPost.PostBatchDiv(ReceiptsHeader3);
                                Sleep(1000);
                                Window.Close;
                            until ReceiptsHeader3.Next = 0;
                            Message('Posted Successfully');
                        end else begin
                            Error(Txt010);
                        end;
                    end;
                end;
            }
        }
    }

    var
        PaymentPost: Codeunit "Payments-Post";
        usersetup: Record "User Setup";
        ReceiptsHeader3: Record "Receipts Header1";
        Txt009: label 'Are you sure you want to post the selected receipts?';
        Txt010: label 'You have not selected any receipt, Kindly select atleast one.';
        Window: Dialog;
        Windowisopen: Boolean;
}
