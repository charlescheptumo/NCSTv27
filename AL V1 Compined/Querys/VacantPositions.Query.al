#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 50074 VacantPositions
{

    elements
    {
        dataitem(Company_Jobs; "Company Jobs")
        {
            DataItemTableFilter = "Vacant Positions" = filter(> 0), Advertised = const(true);
            column(Job_ID; "Job ID")
            {
            }
            column(Job_Description; "Job Description")
            {
            }
            column(No_of_Posts; "No of Posts")
            {
            }
            column(Position_Reporting_to; "Position Reporting to")
            {
            }
            column(Occupied_Positions; "Occupied Positions")
            {
            }
            column(Vacant_Positions; "Vacant Positions")
            {
            }
            column(Score_code; "Score code")
            {
            }
            column(Dimension_1; "Dimension 1")
            {
            }
            column(Dimension_2; "Dimension 2")
            {
            }
            column(Dimension_3; "Dimension 3")
            {
            }
            column(Dimension_4; "Dimension 4")
            {
            }
            column(Dimension_5; "Dimension 5")
            {
            }
            column(Dimension_6; "Dimension 6")
            {
            }
            column(Dimension_7; "Dimension 7")
            {
            }
            column(Dimension_8; "Dimension 8")
            {
            }
            column(No_of_Position; "No of Position")
            {
            }
            column(Total_Score; "Total Score")
            {
            }
            column(Objective; Objective)
            {
            }
            column(Key_Position; "Key Position")
            {
            }
            column(Category; Category)
            {
            }
            column(Grade; Grade)
            {
            }
            column(Primary_Skills_Category; "Primary Skills Category")
            {
            }
            // column("2nd_Skills_Category"; "2nd Skills Category")
            // {
            // }
            // column("3nd_Skills_Category"; "3nd Skills Category")
            // {
            // }
            column(Management; Management)
            {
            }
            column(Employee_Requisitions; "Employee Requisitions")
            {
            }
            column(UserID; UserID)
            {
            }
            column(Status; Status)
            {
            }
            column(Responsibility_Center; "Responsibility Center")
            {
            }
            column(Date_Created; "Date Created")
            {
            }
            column(Supervisor_Manager; "Supervisor/Manager")
            {
            }
            column(Supervisor_Name; "Supervisor Name")
            {
            }
            column(Is_Supervisor; "Is Supervisor")
            {
            }
            column(G_L_Account; "G/L Account")
            {
            }
            column(Branch_Name; "Branch Name")
            {
            }
            column(Department; Department)
            {
            }
            column(Dept_Name; "Dept Name")
            {
            }
            column(Activity_Code; "Activity Code")
            {
            }
        }
    }
}
