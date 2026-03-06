#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57002 "Approved Payment Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Payment Voucher";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Status = const(Released),
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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
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
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Banked Payment Voucher")
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
                    Payments.SetRange("Payment Type", Payments."payment type"::"Payment Voucher");
                    if Payments.Find('-') then begin
                        repeat
                            Payments.banked := true;
                            Payments.Modify;
                        until Payments.Next = 0;
                    end;
                    Message('Banked Successfully');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Accounts User" = false then
                Rec.SetRange("Created By", UserId);
            //ERROR('You do not have permision to view Payment Vouchers');
        end;
    end;

    trigger OnOpenPage()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Accounts User" = false then
                Rec.SetRange("Created By", UserId);
            //ERROR('You do not have permision to view Payment Vouchers');
        end;
    end;

    var
        UserSetup: Record "User Setup";
        Payments: Record Payments;
}
