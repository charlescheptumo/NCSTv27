#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57037 "Other Costs"
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
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                }
                field(Description; Rec.Description)
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
                    Visible = false;
                }
                field("Required For"; Rec."Required For")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Required"; Rec."Quantity Required")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
