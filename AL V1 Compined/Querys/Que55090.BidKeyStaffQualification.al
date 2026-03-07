#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Query 55090 "BidKeyStaffQualification"
{

    elements
    {
        dataitem(Bid_Key_Staff_Qualification;"Bid Key Staff Qualification")
        {
            column(Document_Type;"Document Type")
            {
            }
            column(No;"No.")
            {
            }
            column(Staff_No;"Staff No.")
            {
            }
            column(Entry_No;"Entry No")
            {
            }
            column(Vendor_No;"Vendor No.")
            {
            }
            column(Proposed_Project_Role_ID;"Proposed Project Role ID")
            {
            }
            column(Qualification_Category;"Qualification Category")
            {
            }
            column(Qualification_Name;"Qualification Name")
            {
            }
            column(Institution;Institution)
            {
            }
            column(Start_Year;"Start Year")
            {
            }
            column(End_Year;"End Year")
            {
            }
            column(Outstanding_Achievements;"Outstanding Achievements")
            {
            }
            dataitem(Bid_Key_Staff_Experience;"Bid Key Staff Experience")
            {
                DataItemLink = "No."=Bid_Key_Staff_Qualification."No.";
                column(Experience_Category;"Experience Category")
                {
                }
                column(Years_of_Experience;"Years of Experience")
                {
                }
                column(Experience_Summary;"Experience Summary")
                {
                }
                column(Sample_Assignments_Projects;"Sample Assignments/Projects")
                {
                }
                column(Experience_From_Year;"Experience From Year")
                {
                }
                column(Experience_To_Year;"Experience To Year")
                {
                }
            }
        }
    }
}

