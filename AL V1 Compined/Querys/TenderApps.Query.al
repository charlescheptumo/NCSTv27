#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55047 TenderApps
{

    elements
    {
        dataitem(Bidders; Bidders)
        {
            column(Ref_No; "Ref No.")
            {
            }
            column(Category; Category)
            {
            }
            column(Fiscal_Year; "Fiscal Year")
            {
            }
            column(Selected; Selected)
            {
            }
            column(Pre_Qualified; "Pre Qualified")
            {
            }
            column(Tender_Amount; "Tender Amount")
            {
            }
            column(Bid_Security_Amount; "Bid Security Amount")
            {
            }
            column(No_of_Copies_Submitted; "No. of Copies Submitted")
            {
            }
            column(Bid_Expiry_Date; "Bid Expiry Date")
            {
            }
            column(Proceed_to_Tech_Evaluation; "Proceed to Tech Evaluation")
            {
            }
            column(Fixed_Asset_No; "Fixed Asset No")
            {
            }
            column(Cheque_No; "Cheque No")
            {
            }
            column(Response; Response)
            {
            }
            column(Technical_Marks_Awarded; "Technical Marks Awarded")
            {
            }
            column(Financial_Marks_Awarded; "Financial Marks Awarded")
            {
            }
            column(Successful; Successful)
            {
            }
            column(Supplier; Supplier)
            {
            }
            column(Vendor_No; "Vendor No")
            {
            }
            column(Name; Name)
            {
            }
            column(E_mail; "E-mail")
            {
            }
            dataitem(Procurement_Request; "Procurement Request")
            {
                DataItemLink = No = Bidders."Ref No.";
                column(Title; Title)
                {
                }
            }
        }
    }
}
