#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55022 PurchaseLines
{

    elements
    {
        dataitem(Purchase_Line; "Purchase Line")
        {
            column(Document_Type; "Document Type")
            {
            }
            column(Buy_from_Vendor_No; "Buy-from Vendor No.")
            {
            }
            column(Document_No; "Document No.")
            {
            }
            column(Line_No; "Line No.")
            {
            }
            column(Type; Type)
            {
            }
            column(No; "No.")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Posting_Group; "Posting Group")
            {
            }
            column(Expected_Receipt_Date; "Expected Receipt Date")
            {
            }
            column(Description; Description)
            {
            }
            column(Description_2; "Description 2")
            {
            }
            column(Unit_of_Measure; "Unit of Measure")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(Outstanding_Quantity; "Outstanding Quantity")
            {
            }
            column(Qty_to_Invoice; "Qty. to Invoice")
            {
            }
            column(Qty_to_Receive; "Qty. to Receive")
            {
            }
            column(Direct_Unit_Cost; "Direct Unit Cost")
            {
            }
            column(Unit_Cost_LCY; "Unit Cost (LCY)")
            {
            }
            column(VAT; "VAT %")
            {
            }
            column(Line_Discount; "Line Discount %")
            {
            }
            column(Line_Discount_Amount; "Line Discount Amount")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Amount_Including_VAT; "Amount Including VAT")
            {
            }
            column(Unit_Price_LCY; "Unit Price (LCY)")
            {
            }
            column(Qty_Requested; "Qty. Requested")
            {
            }
            column(Item_Category; "Item Category")
            {
            }
            column(Item_Category_Code; "Item Category Code")
            {
            }
            column(Procurement_Plan; "Procurement Plan")
            {
            }
            column(Procurement_Plan_Item; "Procurement Plan Item")
            {
            }
            column(Line_Amount; "Line Amount")
            {
            }
            dataitem(Procurement_Header; "Procurement Header")
            {
                DataItemLink = No = Purchase_Line."Procurement Plan";
                column(BudgetDescription; Description)
                {
                }
                dataitem(ProcurementPlan; "Procurement Plan 1")
                {
                    DataItemLink = "Plan Item No" = Purchase_Line."Procurement Plan Item", "Plan Year" = Purchase_Line."Procurement Plan";
                    column(ProcurementPlanDescription; "Item Description")
                    {
                    }
                }
            }
        }
    }
}
