#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55011 Casuals
{

    elements
    {
        dataitem(Casuals; Casuals)
        {
            column(Imprest_Memo_No; "Imprest Memo No.")
            {
            }
            column(Type; Type)
            {
            }
            column(No_Required; "No. Required")
            {
            }
            column(Work_Type; "Work Type")
            {
            }
            column(No_of_Days; "No. of Days")
            {
            }
            column(Rate; Rate)
            {
            }
            column(Amount; Amount)
            {
            }
            column(Activity; Activity)
            {
            }
            column(Resource_No; "Resource No.")
            {
            }
            column(Posted; Posted)
            {
            }
            column(Linked; Linked)
            {
            }
            column(Project; Project)
            {
            }
            column(Task_No; "Task No.")
            {
            }
            column(Actual_No_of_Days; "Actual No. of Days")
            {
            }
            column(Surrendered; Surrendered)
            {
            }
            column(Job_Task_Description; "Job Task Description")
            {
            }
            column(Actual_Rate; "Actual Rate")
            {
            }
            column(Actual_Amount; "Actual Amount")
            {
            }
            dataitem(Imprest_Memo; "Imprest Memo")
            {
                DataItemLink = "No." = Casuals."Imprest Memo No.";
                column(No; "No.")
                {
                }
                column(Requestor; Requestor)
                {
                }
                dataitem(Resource; Resource)
                {
                    DataItemLink = "No." = Casuals."Resource No.";
                    column(ResourceNo; "No.")
                    {
                    }
                    column(ResourceName; Name)
                    {
                    }
                }
            }
        }
    }
}
