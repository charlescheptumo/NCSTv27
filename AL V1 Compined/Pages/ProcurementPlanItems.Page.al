#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70006 "Procurement Plan Items"
{
    DeleteAllowed = false;
    PageType = ListPart;
    SourceTable = "Procurement Plan 1";
    SourceTableView = sorting("Plan Item No")
                      order(ascending);
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Plan Item No"; Rec."Plan Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("General Item Category"; Rec."General Item Category")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                }
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
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
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Target Groups"; Rec."Target Groups")
                {
                    ApplicationArea = Basic;
                }
                field(Youth; Rec.Youth)
                {
                    ApplicationArea = Basic;
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan Task No."; Rec."Workplan Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(Women; Rec.Women)
                {
                    ApplicationArea = Basic;
                }
                field(PWD; Rec.PWD)
                {
                    ApplicationArea = Basic;
                }
                field("Citizen Contractors"; Rec."Citizen Contractors")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = Basic;
                }
                field("Source of Funds"; Rec."Source of Funds")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Account';
                }
                field("Margin of preference for Local"; Rec."Margin of preference for Local")
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Items"; Rec."Requisition Items")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Budget"; Rec."Approved Budget")
                {
                    ApplicationArea = Basic;
                }
                field(Actual; Rec.Actual)
                {
                    ApplicationArea = Basic;
                }
                field(Commitment; Rec.Commitment)
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 1 Amount"; Rec."Quarter 1 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 2 Amount"; Rec."Quarter 2 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 3 Amount"; Rec."Quarter 3 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 4 Amount"; Rec."Quarter 4 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 1 Qty"; Rec."Quarter 1 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 2 Qty"; Rec."Quarter 2 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 3 Qty"; Rec."Quarter 3 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 4 Qty"; Rec."Quarter 4 Qty")
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
