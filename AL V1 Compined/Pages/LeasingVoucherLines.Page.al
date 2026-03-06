#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56151 "Leasing Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "ICT Issuance Voucher Lines";
    ApplicationArea = All;

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
                field("Duration of Use start date"; Rec."Duration of Use start date")
                {
                    ApplicationArea = Basic;
                }
                field("Duration of Use end date"; Rec."Duration of Use end date")
                {
                    ApplicationArea = Basic;
                }
                field("Duration of Use"; Rec."Duration of Use")
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
}
