#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 50020 Vendors
{

    elements
    {
        dataitem(Vendor; Vendor)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Search_Name; "Search Name")
            {
            }
            column(Name_2; "Name 2")
            {
            }
            column(Address; Address)
            {
            }
            column(Address_2; "Address 2")
            {
            }
            column(City; City)
            {
            }
            column(Contact; Contact)
            {
            }
            column(Phone_No; "Phone No.")
            {
            }
            column(Telex_No; "Telex No.")
            {
            }
            column(Our_Account_No; "Our Account No.")
            {
            }
            column(Territory_Code; "Territory Code")
            {
            }
            column(Country_Region_Code; "Country/Region Code")
            {
            }
            column(Comment; Comment)
            {
            }
            column(Blocked; Blocked)
            {
            }
            column(Pay_to_Vendor_No; "Pay-to Vendor No.")
            {
            }
            column(Primary_Contact_No; "Primary Contact No.")
            {
            }
            column(E_Mail; "E-Mail")
            {
            }
            column(Email; Email)
            {
            }
            dataitem(portalusers; portalusers)
            {
                DataItemLink = "customer No" = Vendor."No.";
                column(customer_No; "customer No")
                {
                }
                column(Password; Password)
                {
                }
                column(Last_Login; "Last Login")
                {
                }
                column(userstatus; status)
                {
                }
                column(changedPassword; changedPassword)
                {
                }
                column(usertype; usertype)
                {
                }
                column(validated; validated)
                {
                }
            }
        }
    }
}
