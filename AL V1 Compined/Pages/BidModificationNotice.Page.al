#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75154 "Bid Modification Notice"
{
    PageType = List;
    SourceTable = "Bid Modification Notice";

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
                field("Bid Action Type"; Rec."Bid Action Type")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Date"; Rec."Notice Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                }
                field("IFS No."; Rec."IFS No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for Action"; Rec."Reason for Action")
                {
                    ApplicationArea = Basic;
                }
                field("External Reference No"; Rec."External Reference No")
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
