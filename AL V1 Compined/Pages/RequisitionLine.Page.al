#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70015 "Requisition Line"
{
    AutoSplitKey = false;
    PageType = ListPart;
    SourceTable = "Requisition Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget';
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Cost Centre Code"; Rec."Cost Centre Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount LCY';
                    Enabled = false;
                }
                field("Available amount"; Rec."Available amount")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Budget Amount"; Rec."Approved Budget Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Commitment Amount"; Rec."Commitment Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Expense"; Rec."Actual Expense")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnModifyRecord(): Boolean
    begin
        Header.SetRange(Header."No.", Rec."Requisition No");
        if Header.Status <> Header.Status::Open then
            Error('You cannot make changes at this stage');
    end;

    var
        Header: Record "Requisition Header1";
}
