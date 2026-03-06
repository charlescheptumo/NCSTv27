#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56137 "Issuance Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "ICT Issuance Voucher Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("FA No"; Rec."FA No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        Rec."Leasing/Issuing" := Rec."leasing/issuing"::Issuing;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Leasing/Issuing" := Rec."leasing/issuing"::Issuing;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Leasing/Issuing" := Rec."leasing/issuing"::Issuing;
    end;

    trigger OnOpenPage()
    begin
        Rec."Leasing/Issuing" := Rec."leasing/issuing"::Issuing;
    end;
}
