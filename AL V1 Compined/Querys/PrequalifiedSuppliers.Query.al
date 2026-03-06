#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 50044 PrequalifiedSuppliers
{

    elements
    {
        dataitem(Prequalified_Suppliers1; "Prequalified Suppliers1")
        {
            column(Ref_No; "Ref No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Physical_Address; "Physical Address")
            {
            }
            column(Postal_Address; "Postal Address")
            {
            }
            column(City; City)
            {
            }
            column(E_mail; "E-mail")
            {
            }
            column(Telephone_No; "Telephone No")
            {
            }
            column(Mobile_No; "Mobile No")
            {
            }
            column(Contact_Person; "Contact Person")
            {
            }
            column(KBA_Bank_Code; "KBA Bank Code")
            {
            }
            column(KBA_Branch_Code; "KBA Branch Code")
            {
            }
            column(Bank_account_No; "Bank account No")
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
            column(Fax_No; "Fax No")
            {
            }
            column(Category_Name; "Category Name")
            {
            }
            column(VAT_Registration_No; "VAT Registration No")
            {
            }
            column(Company_PIN_No; "Company PIN No")
            {
            }
            column(Vendor_No; "Vendor No")
            {
            }
            column(Vendor_Type; "Vendor Type")
            {
            }
            column(Blacklisted; Blacklisted)
            {
            }
            column(Default_Payment_Mode; "Default Payment Mode")
            {
            }
            column(Maximum_Order_Quantity; "Maximum Order Quantity")
            {
            }
            column(Minimum_Order_Quantity; "Minimum Order Quantity")
            {
            }
            column(Maximum_Order_Amount; "Maximum Order Amount")
            {
            }
            column(Minimum_Order_Amount; "Minimum Order Amount")
            {
            }
            column(Status; Status)
            {
            }
            column(Contact_No; "Contact No")
            {
            }
            column(Supplier_Type; "Supplier Type")
            {
            }
            column(Director_1_Name; "Director 1 Name")
            {
            }
            column(Director_2_Name; "Director 2 Name")
            {
            }
            column(Director_3_Name; "Director 3 Name")
            {
            }
            column(Line_No; "Line No")
            {
            }
            dataitem(Supplier_Category; "Supplier Category")
            {
                DataItemLink = "Category Code" = Prequalified_Suppliers1.Category;
                column(Description; Description)
                {
                }
                column(Category_Code; "Category Code")
                {
                }
            }
        }
    }
}
