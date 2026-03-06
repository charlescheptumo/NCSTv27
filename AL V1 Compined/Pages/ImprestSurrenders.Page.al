#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57025 "Imprest Surrenders"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Surrender";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Surrender),
                            Status = filter(Open | "Pending Approval"),
                            "Document Type" = const(Surrender),
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
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57002, true, true);
                    Rec.Reset;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."post surrender" = false then
                Rec.SetRange("Created By", UserId);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Payment Type" := Rec."payment type"::Surrender;
        Rec."Document Type" := Rec."document type"::Surrender;
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."post surrender" = false then
                Rec.SetRange("Created By", UserId);
        end;
    end;

    var
        UserSetup: Record "User Setup";
}
