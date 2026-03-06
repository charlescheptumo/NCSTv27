#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55052 PurchaseReqLines
{

    elements
    {
        dataitem(Procurement_Request_Lines; "Procurement Request Lines")
        {
            column(Requisition_No; "Requisition No")
            {
            }
            column(Line_No; "Line No")
            {
            }
            column(Type; Type)
            {
            }
            column(No; No)
            {
            }
            column(Description; Description)
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(Unit_of_Measure; "Unit of Measure")
            {
            }
            column(Unit_Price; "Unit Price")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Procurement_Plan; "Procurement Plan")
            {
            }
            column(Procurement_Plan_Item; "Procurement Plan Item")
            {
            }
            column(Budget_Line; "Budget Line")
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Amount_LCY; "Amount LCY")
            {
            }
            column(Select; Select)
            {
            }
            column(Request_Generated; "Request Generated")
            {
            }
            column(Supplier_Category; "Supplier Category")
            {
            }
            column(Vendor_No; "Vendor No")
            {
            }
            column(Ordered; Ordered)
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column(Activity_Type; "Activity Type")
            {
            }
            column(Current_Budget; "Current Budget")
            {
            }
            column(Activity; Activity)
            {
            }
            column(Specifications; Specifications)
            {
            }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "No." = Procurement_Request_Lines."Vendor No";
                column(Name; Name)
                {
                }
            }
        }
    }
}
