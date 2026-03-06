#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57110 "Approved Staff Claims"
{
    ApplicationArea = Basic;
    CardPageID = "Aprroved Staff Claim";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
                            Status = filter(Released),
                            Posted = const(False),
                            banked = const(False),
                            "Archive Document" = const(False));
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
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payee';
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            systempart(Control1000000020; Links)
            {
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
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
            action("Banked Staff Claim")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Payments.Reset;
                    Payments.SetRange(Select, true);
                    Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                    Payments.SetRange(banked, false);
                    if Payments.Find('-') then begin
                        repeat
                            Payments.banked := true;
                            Payments.Modify(true);
                        until Payments.Next = 0;
                    end;
                    Message('Banked Successfully');
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        /*IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Accounts User"=FALSE THEN
        SETRANGE("Created By",USERID);
        END*/

    end;

    var
        Payments: Record Payments;
        UserSetup: Record "User Setup";
}
