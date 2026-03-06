#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56148 "Returned Issuance Vouchers"
{
    ApplicationArea = Basic;
    CardPageID = "ICT Issuance Voucher card";
    Editable = false;
    PageType = List;
    SourceTable = "ICT Issuance Voucher";
    SourceTableView = where(Type = const(Issuance),
                            Posted = const(true),
                            Status = const(Released),
                            "Document Status" = const(Returned));
    UsageCategory = History;

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
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
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
                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(56242, true, true, Rec);
                end;
            }
        }
    }
}
