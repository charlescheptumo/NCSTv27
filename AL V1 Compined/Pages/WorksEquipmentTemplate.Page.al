#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75230 "Works Equipment Template"
{
    ApplicationArea = Basic;
    CardPageID = "Works Equipment Template Card";
    PageType = List;
    SourceTable = "Works Equipment Template";
    UsageCategory = Administration;

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
                field("Main Works Category"; Rec."Main Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Purchase Requisitions"; Rec."No. of Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
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
