#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57075 "Posted Receipt"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Receipts Header1";
    SourceTableView = where(Posted = const(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
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
                    Editable = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Time"; Rec."Posted Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000017; "Receipt Lines")
            {
                SubPageLink = "Receipt No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000023; Outlook)
            {
            }
            systempart(Control1000000024; Notes)
            {
            }
            systempart(Control1000000025; MyNotes)
            {
            }
            systempart(Control1000000026; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    PaymentPost.PostReceipt(Rec);
                end;
            }
            action("Print report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(56003, true, true, Rec);
                end;
            }
            action("&Navigate")
            {
                ApplicationArea = Basic;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Scope = Repeater;

                trigger OnAction()
                var
                    Navigate: Page Navigate;
                    UserSetup: Record "User Setup";
                    GL: Record "G/L Entry";
                begin
                    Navigate.SetDoc(Rec.Date, Rec."No.");
                    Navigate.Run;
                end;
            }
            action("General Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerBook;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "General Ledger Entries";
                RunPageLink = "Document No." = field("No."),
                              "Posting Date" = field("Cheque Date");
            }
            action(ReverseTransaction)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reverse Transaction';
                Ellipsis = true;
                Image = ReverseRegister;
                Scope = Repeater;
                ToolTip = 'Reverse a posted general ledger entry.';

                trigger OnAction()
                var
                    ReversalEntry: Record "Reversal Entry";
                    GL: Record "G/L Entry";
                begin
                    //check if receipt is allocated


                    Clear(ReversalEntry);
                    Rec.CalcFields(Rec.Reversed);
                    GL.Reset;
                    GL.SetRange("Document No.", Rec."No.");
                    if GL.FindSet then begin
                        if Rec.Reversed then
                            ReversalEntry.AlreadyReversedEntry(Rec.TableCaption, GL."Entry No.");
                        /*IF GL."Journal Batch Name" = '' THEN
                          ReversalEntry.TestFieldError;*/
                        GL.TestField("Transaction No.");
                        ReversalEntry.ReverseTransaction(GL."Transaction No.")
                    end;

                end;
            }
        }
    }

    var
        PaymentPost: Codeunit "Payments-Post";
        "Document-Print": Codeunit "Document-Print";
}
