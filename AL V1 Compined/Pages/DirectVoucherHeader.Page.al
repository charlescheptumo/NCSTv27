#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57097 "Direct Voucher Header"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Receipts Header1";
    SourceTableView = where(Posted = const(false));

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
                    Editable = true;
                    Visible = true;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receiving bank';
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field("Expense Account"; Rec."Expense Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Income Account';
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
            }
            part(Control1000000017; "Direct Voucher Lines")
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
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = false;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /*
                    usersetup.GET(USERID);
                    IF usersetup."Post Receipts"=FALSE THEN
                    ERROR(Text0001);
                    usersetup.RESET;
                    IF usersetup."User ID"=Cashier THEN
                     ERROR('You cannot create and post the receipt, Alternative Cashier should post');
                     */
                    Rec.TestField("Expense Account");
                    PaymentPost.PostDIV(Rec);

                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56003, true, true, Rec);
                end;
            }
        }

    }
    var
    PaymentPost: codeunit "Payments-Post";
}