#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57107 "Staff Claims"
{
    ApplicationArea = Basic;
    CardPageID = "Staff Claim";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
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
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
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
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Staff Claims";
    end;

    trigger OnOpenPage()
    begin
        UserSetup1.Get(UserId);
        if UserSetup1."Accounts User" = false then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Created By", UserId);
            Rec.FilterGroup(0);
        end;
    end;

    var
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
}
