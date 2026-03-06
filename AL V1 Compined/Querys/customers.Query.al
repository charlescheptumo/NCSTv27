#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 50001 customers
{

    elements
    {
        dataitem(Customer; Customer)
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
            column(P_I_N; "P.I.N")
            {
            }
            column(Post_Code; "Post Code")
            {
            }
            column(E_Mail; "E-Mail")
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
            column(ID_No; "ID. No.")
            {
            }
            dataitem(portalusers; portalusers)
            {
                DataItemLink = "customer No" = Customer."ID. No.";
                column(customer_No; "customer No")
                {
                }
                column(Password; Password)
                {
                }
                column(Last_Login; "Last Login")
                {
                }
                column(status; status)
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
                dataitem(emailvalidations; emailvalidations)
                {
                    DataItemLink = id = Customer."No.";
                    column(id; id)
                    {
                    }
                    column(user; user)
                    {
                    }
                    column("key"; "key")
                    {
                    }
                    column(generatedAt; generatedAt)
                    {
                    }
                }
            }
        }
    }
}
