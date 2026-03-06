#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 50060 "Copyright Files"
{

    elements
    {
        dataitem(Copyright_Files; "Copyright Files")
        {
            column(fileId; fileId)
            {
            }
            column(CopyrightNo; CopyrightNo)
            {
            }
            column(fileName; fileName)
            {
            }
            column(dateUploaded; dateUploaded)
            {
            }
            dataitem(Copyright_Registration_Table; "Copyright Registration Table")
            {
                DataItemLink = "No." = Copyright_Files.CopyrightNo;
                column(Applicant_Account; "Applicant Account")
                {
                }
                column(No; "No.")
                {
                }
            }
        }
    }
}
