#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56153 "Submitted Issuance  Lines"
{
    Editable = true;
    PageType = ListPart;
    SourceTable = "ICT Issuance Voucher Lines";
    ApplicationArea = All;

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
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Duration of Use start date"; Rec."Duration of Use start date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Duration of Use end date"; Rec."Duration of Use end date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Duration of Use"; Rec."Duration of Use")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
        }
    }

    actions
    {
    }
}
