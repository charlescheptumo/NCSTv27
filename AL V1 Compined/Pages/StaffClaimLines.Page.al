#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57108 "Staff Claim Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';

                    trigger OnValidate()
                    begin

                        /*IF VoteItem.GET()THEN
                          Description:=VoteItem.Description;*/

                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        VoteItem: Record "Receipts and Payment Types1";
}
