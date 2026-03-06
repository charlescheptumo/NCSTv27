#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75289 "Contract Representative"
{
    PageType = List;
    SourceTable = "Contract Representative";
    ApplicationArea = All;

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
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Name"; Rec."Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Signing Role"; Rec."Contract Signing Role")
                {
                    ApplicationArea = Basic;
                }
                field("Executed on behalf of"; Rec."Executed on behalf of")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Execution Date"; Rec."Execution Date")
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
