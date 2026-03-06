#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75126 "IFS Securities"
{
    PageType = List;
    SourceTable = "IFS Securities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Form of Security"; Rec."Form of Security")
                {
                    ApplicationArea = Basic;
                }
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                }
                field("Required at Bid Submission"; Rec."Required at Bid Submission")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Security Amount (LCY)"; Rec."Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Security Validity Expiry"; Rec."Bid Security Validity Expiry")
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
