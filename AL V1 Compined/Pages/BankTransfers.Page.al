#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57059 "Bank Transfers"
{
    ApplicationArea = Basic;
    CardPageID = "Bank Transfer";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Bank Transfer"),
                            Posted = const(False),
                            Status = filter(Open | "Pending Approval"));
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
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
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
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
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
                    //DocPrint.PrintPurchHeader(Rec);


                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57006, true, true, Rec)
                end;
            }
        }
    }
}
