#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57088 "Other Costs Surrender"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Other Costs";

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
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Required"; Rec."Quantity Required")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Required For"; Rec."Required For")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Used"; Rec."Quantity Used")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Unit Cost"; Rec."Actual Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Line Amount"; Rec."Actual Line Amount")
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
