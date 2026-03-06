#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55012 OtherCosts
{

    elements
    {
        dataitem(Other_Costs; "Other Costs")
        {
            column(Imprest_Memo_No; "Imprest Memo No.")
            {
            }
            column(Line_No; "Line No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Quantity_Required; "Quantity Required")
            {
            }
            column(Unit_Cost; "Unit Cost")
            {
            }
            column(Required_For; "Required For")
            {
            }
            column(Line_Amount; "Line Amount")
            {
            }
            column(Work_Type; "Work Type")
            {
            }
            column(No; "No.")
            {
            }
            column(Posted; Posted)
            {
            }
            column(Linked; Linked)
            {
            }
            column(Type; Type)
            {
            }
            column(Project; Project)
            {
            }
            column(Task_No; "Task No.")
            {
            }
            column(Actual_Unit_Cost; "Actual Unit Cost")
            {
            }
            column(Actual_Line_Amount; "Actual Line Amount")
            {
            }
            column(Surrendered; Surrendered)
            {
            }
            column(No_of_Days; "No. of Days")
            {
            }
            column(Vote_Item; "Vote Item")
            {
            }
            column(Vote_Amount; "Vote Amount")
            {
            }
            column(Actual_to_Date; "Actual to Date")
            {
            }
            column(Commitments; Commitments)
            {
            }
            column(Vote_Item_Desc; "Vote Item Desc.")
            {
            }
            column(Available_Funds; "Available Funds")
            {
            }
            column(Job_Task_Description; "Job Task Description")
            {
            }
            column(Quantity_Used; "Quantity Used")
            {
            }
            column(Actual_Unit_Costs; "Actual Unit Costs")
            {
            }
            column(Type_of_Expense; "Type of Expense")
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }
            dataitem(Imprest_Memo; "Imprest Memo")
            {
                DataItemLink = "No." = Other_Costs."Imprest Memo No.";
                column(memoNo; "No.")
                {
                }
                column(Requestor; Requestor)
                {
                }
            }
        }
    }
}
