#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 50041 ProcurementRequest
{

    elements
    {
        dataitem(Procurement_Request; "Procurement Request")
        {
            DataItemTableFilter = Status = const(Released);
            column(No; No)
            {
            }
            column(Title; Title)
            {
            }
            column(Requisition_No; "Requisition No")
            {
            }
            column(Procurement_Plan_No; "Procurement Plan No")
            {
            }
            column(Creation_Date; "Creation Date")
            {
            }
            column(Process_Type; "Process Type")
            {
            }
            column(Tender_Opening_Date; "Tender Opening Date")
            {
            }
            column(Tender_Status; "Tender Status")
            {
            }
            column(Tender_Closing_Date; "Tender Closing Date")
            {
            }
            column(Status; Status)
            {
            }
            column(Return_Date; "Return Date")
            {
            }
            column(Return_Time; "Return Time")
            {
            }
            column(Tender_Type; "Tender Type")
            {
            }
            column(Tender_Amount; "Tender Amount")
            {
            }
            column(Validity_Period; "Validity Period")
            {
            }
            column(Issued_Date; "Issued Date")
            {
            }
            column(Closed; Closed)
            {
            }
            column(RFQ_Sent; "RFQ Sent")
            {
            }
            column(Procurement_Amount; "Procurement Amount")
            {
            }
            column(Approval_Status; "Approval Status")
            {
            }
            column(Awarded; "Awarded?")
            {
            }
            column(Successful_Bidder; "Successful Bidder")
            {
            }
            column(Select_Bidder_Vendor_No; "Select Bidder Vendor No")
            {
            }
            column(Selected_Bidder_Name; "Selected Bidder Name")
            {
            }
            column(Quotation_Finished; "Quotation Finished?")
            {
            }
            dataitem(Prequalified_Suppliers1; "Prequalified Suppliers1")
            {
                DataItemLink = "Ref No." = Procurement_Request.No;
                column(E_mail; "E-mail")
                {
                }
                column(Vendor_No; "Vendor No")
                {
                }
                column(Contact_No; "Contact No")
                {
                }
                column(Category; Category)
                {
                }
                column(Selected; Selected)
                {
                    ColumnFilter = Selected = filter(true);
                }
                column(Pre_Qualified; "Pre Qualified")
                {
                    ColumnFilter = Pre_Qualified = filter(TRUE);
                }
                column(Ref_No; "Ref No.")
                {
                }
                dataitem(Supplier_Category; "Supplier Category")
                {
                    DataItemLink = "Category Code" = Prequalified_Suppliers1.Category;
                    column(Category_Code; "Category Code")
                    {
                    }
                }
            }
        }
    }
}
