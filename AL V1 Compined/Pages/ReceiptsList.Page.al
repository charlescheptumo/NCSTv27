#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57065 "Receipts List"
{
    ApplicationArea = Basic;
    CardPageID = Receipt;
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Receipts Header1";
    SourceTableView = where(Posted = const(false));
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
                    Visible = false;
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
        area(navigation)
        {
            action("Post Batch")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to Post the selected receipts?';
                    TXT0002: label 'You have not selected any receipt. Please select atleast one.';
                begin

                    if Confirm(TXT001, true) then begin
                        ReceiptsHeader.Reset;
                        ReceiptsHeader.SetRange(Select, true);
                        ReceiptsHeader.SetRange(Posted, false);
                        if ReceiptsHeader.FindSet then begin
                            repeat
                                Window.Open('Posting...');
                                //MESSAGE('%1', ReceiptsHeader."No.");
                                PaymentPost.PostBatchReceipt(ReceiptsHeader);
                                //MESSAGE('%1', ReceiptsHeader."No.");
                                Sleep(1000);
                                Window.Close;
                            //PaymentPost.PostBatchReceipt(Rec);
                            //    PaymentPost.PostReceipt(Rec);
                            until ReceiptsHeader.Next = 0;
                            //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post Batch",GenJnLine);
                            Message('Posted Successfully');
                        end else begin
                            Error(TXT0002);
                        end;
                    end;
                    //CurrPage.UPDATE();
                    //CurrPage.CLOSE();
                end;
            }
        }
    }

    var
        PaymentPost: Codeunit "Payments-Post";
        ReceiptsHeader: Record "Receipts Header1";
        Window: Dialog;
        Windowisopen: Boolean;
        GenJnLine: Record "Gen. Journal Line";
        ReceiptsHeader4: Record "Receipts Header1";
}
