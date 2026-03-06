#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75181 "Posted Debarment Vouchers"
{
    ApplicationArea = Basic;
    Caption = 'Posted Debarment Vouchers (Active)';
    PageType = List;
    SourceTable = "Vendor Debarment Voucher Line";
    SourceTableView = where("Document Type" = filter(Debarment),
                            Posted = const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Firm Name"; Rec."Firm Name")
                {
                    ApplicationArea = Basic;
                }
                field("Debarment Reason Code"; Rec."Debarment Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Ineligibility Start Date"; Rec."Ineligibility Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Ineligibility End Date"; Rec."Ineligibility End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reinstatement Date"; Rec."Reinstatement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Registration (PIN) No."; Rec."Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                }
                field("Incorporation/Reg No."; Rec."Incorporation/Reg No.")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
