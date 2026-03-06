#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56043 "Case file Movement register"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Case File Movement Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Movement Reason Code"; Rec."Movement Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Movement Reason"; Rec."Movement Reason")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Source No"; Rec."Source No")
                {
                    ApplicationArea = Basic;
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ApplicationArea = Basic;
                }
                field("Destination No"; Rec."Destination No")
                {
                    ApplicationArea = Basic;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
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
