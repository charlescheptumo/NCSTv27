#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57070 "Posted Warrant Voucher"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = Payments;

    layout
    {
        area(content)
        {
            group(General)
            {
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
                    Caption = 'Transaction No.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Source of Funds';
                }
                field("Imprest Voucher Amount"; Rec."Imprest Voucher Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control17; "Posted Imprest Voucher Lines")
            {
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control19; Notes)
            {
            }
            systempart(Control18; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
                    Image = Dimensions;
                    Promoted = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        // IF Status<>Status::Released THEN
                        // ERROR(Txt0001);
                        // IF Status=Status::Released THEN BEGIN
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57012, true, true, Rec)
                    end;
                }
                action("Print Bank Schedule")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Bank Schedule';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        Rec.Reset;
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57013, true, false, Rec)
                    end;
                }
                action("Recreate Surrender Lines")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to recreate Surrender lines?', true) then begin
                            PaymentsRec.Reset;
                            PaymentsRec.SetRange("Imprest Memo No", Rec."Imprest Memo No");
                            PaymentsRec.SetRange("Payment Type", PaymentsRec."payment type"::Surrender);
                            if PaymentsRec.FindSet then
                                Error('Kindly confirm surrender Number %1 the surrenders exists', PaymentsRec."No.");
                            PaymentPost.CreateSurrender(Rec."Imprest Memo No", Rec."Cheque No");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Warrant Voucher";
    end;

    var
        UserSetup: Record "User Setup";
        Text001: label 'Kindly consult the System administrator to give you the relevant permissions';
        PaymentPost: Codeunit "Payments-Post";
        PaymentsPosting: Codeunit "Payments-Post";
        PaymentsRec: Record Payments;
}
