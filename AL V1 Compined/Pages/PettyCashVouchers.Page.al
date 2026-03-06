#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57016 "Petty Cash Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Petty Cash Voucher";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Petty Cash"),
                            Status = filter(Open | "Pending Approval"),
                            Posted = const(False),
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
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Petty Cash Voucher")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57003, true, true, Rec);
                    Rec.SetRange("No.");
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if UserSetup."Accounts User" = false then begin
            //FILTERGROUP(1);
            Rec.SetRange("Created By", UserId);
            //FILTERGROUP(0);
        end;
    end;

    var
        UserSetup: Record "User Setup";
}
