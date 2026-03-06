#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 50071 HRPortalUsers
{

    elements
    {
        dataitem(HRPortalUsers; HRPortalUsers)
        {
            column("code"; "code")
            {
            }
            column(employeeNo; employeeNo)
            {
            }
            column(IdNo; IdNo)
            {
            }
            column(password; password)
            {
            }
            column(changedPassword; changedPassword)
            {
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = "No." = HRPortalUsers.employeeNo;
                column(First_Name; "First Name")
                {
                }
                column(Middle_Name; "Middle Name")
                {
                }
                column(Last_Name; "Last Name")
                {
                }
                column(ID_Number; "ID Number")
                {
                }
                dataitem(Hr_Jobs_Applicants; "Hr Jobs Applicants")
                {
                    DataItemLink = "ID Number" = HRPortalUsers.IdNo;
                    column(fName; "First Name")
                    {
                    }
                    column(mName; "Middle Name")
                    {
                    }
                    column(lName; "Last Name")
                    {
                    }
                    column(id; "ID Number")
                    {
                    }
                }
            }
        }
    }
}
