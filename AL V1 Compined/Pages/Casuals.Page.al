#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57036 Casuals
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
                    Visible = false;
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    Editable = true;
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

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
            }
        }
    }

    actions
    {
    }
}
