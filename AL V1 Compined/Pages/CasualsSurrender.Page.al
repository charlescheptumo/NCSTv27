#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57087 "Casuals Surrender"
{
    PageType = ListPart;
    SourceTable = Casuals;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                }
                field("Actual Rate"; Rec."Actual Rate")
                {
                    ApplicationArea = Basic;
                }
                field("No. Required"; Rec."No. Required")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Actual Amount"; Rec."Actual Amount")
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
