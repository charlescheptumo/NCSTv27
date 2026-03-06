#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69076 "HR Manager Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1904652008; "HR Manager Activities")
                {
                }
                systempart(Control1000000050; MyNotes)
                {
                }
                systempart(Control1901420308; Outlook)
                {
                }
            }
            group(Control1900724708)
            {
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            separator(Action1000000008)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group(Payslip)
            {
                Caption = 'Payslip';
                action("1 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '1 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "New Payslipx";
                }
                action("2 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '2 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "New 2 page Payslip";
                }
                action("3 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '3 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "New 3 page Payslipx";
                }
                action("HR Leave Applications List")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "HR Leave Applications List";
                }
                action("HR Leave Statement")
                {
                    ApplicationArea = Basic;
                }
            }
            separator(Action1000000041)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group("Management Reports")
            {
                Caption = 'Management Reports';
                action("Master Roll Excel Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Excel Export';
                    Image = "Report";
                    RunObject = Report "Master Roll Excel Export";
                }
            }
            group(Statutory)
            {
                Caption = 'Statutory';
                action(P9A)
                {
                    ApplicationArea = Basic;
                    Caption = 'P9A';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "P9A Report";
                }
            }
        }
        area(embedding)
        {
            group(Positions)
            {
                Caption = 'Positions';
            }
            action("Employee List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List';
                Image = Employee;
                RunObject = Page "Employee List-HR";
            }
            group(Leave)
            {
                Caption = 'Leave';
                action("Leave Balances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Balances';
                    Image = Employee;
                    RunObject = Page "Leave Balances";
                }
                action("Posted Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Leave Days';
                    Image = Employee;
                    RunObject = Page "Posted Leave Days";
                }
            }
        }
        area(sections)
        {
            group("Employee Self Service")
            {
                Caption = 'Employee Self Service';
                Image = HumanResources;
                action("Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Applications';
                    Image = ServiceAgreement;
                    RunObject = Page "Leave Applications List";
                    RunPageView = sorting("Application Code")
                                  order(descending);
                }
                action("Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Leave Applications';
                    Image = ServiceAgreement;
                    RunObject = Page "Approved Leave Applications";
                }
            }
            group("Management Approvals")
            {
                Caption = 'Management Approvals';
                Image = Confirm;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    Image = ServiceAgreement;
                    RunObject = Page "Approval Entries";
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Image = Administration;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Employee;
                    RunObject = Page Dimensions;
                }
                action("Human Resources Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Resources Setup';
                    Image = AccountingPeriods;
                    RunObject = Page "HR Setup List";
                }
                action("Employee Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Posting Group';
                    Image = AccountingPeriods;
                    RunObject = Page "Employee Posting Group";
                }
                action("Leave Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Types';
                    Image = AccountingPeriods;
                    RunObject = Page "Leave Types";
                }
                action("Human Res. Units of Measure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Res. Units of Measure';
                    Image = AccountingPeriods;
                    RunObject = Page "Human Res. Units of Measure";
                }
                action("Registration Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration Codes';
                    RunObject = Page "Causes of Absence";
                }
                action("Causes of Inactivity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Causes of Inactivity';
                    Image = Currency;
                    RunObject = Page "Causes of Inactivity";
                }
                action("Grounds for Termination")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grounds for Termination';
                    Image = AccountingPeriods;
                    RunObject = Page "Grounds for Termination";
                }
                action(Unions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Unions';
                    RunObject = Page Unions;
                }
                action("Employment Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Contracts';
                    Image = Currency;
                    RunObject = Page "Employment Contracts";
                }
                action(Relatives)
                {
                    ApplicationArea = Basic;
                    Caption = 'Relatives';
                    Image = Employee;
                    RunObject = Page Relatives;
                }
                action("Misc. Articles")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles';
                    RunObject = Page "Misc. Articles";
                }
                action(Confidential)
                {
                    ApplicationArea = Basic;
                    Caption = 'Confidential';
                    RunObject = Page Confidential;
                }
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = Currency;
                    RunObject = Page Qualifications;
                }
                action("Pay Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pay Periods';
                    Image = Currency;
                    RunObject = Page "Pay Periods";
                }
                action("Employee Statistics Groups")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Statistics Groups';
                    Image = Employee;
                    RunObject = Page "Employee Statistics Groups";
                }
            }
        }
        area(processing)
        {
            group("Company Information")
            {
                Caption = 'Company Information';
                action(Action1000000020)
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Information';
                    Image = "company information";
                    Promoted = false;
                    RunObject = Page "Company Information";
                }
                action(Comittees)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comittees';
                    Image = Customer;
                    Promoted = false;
                    RunObject = Page Comittees;
                }
                action("Committee Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committee Members';
                    Image = Relatives;
                    Promoted = false;
                    RunObject = Page "Committee Members";
                }
                action("Rules and Regulations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rules and Regulations';
                    Image = Permission;
                    Promoted = false;
                    RunObject = Page "Rules and Regulations";
                }
                action("Company Activities")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Activities';
                    Image = "Action";
                    Promoted = false;
                    RunObject = Page "Company Activities";
                }
                action("Company Calendar")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Calendar';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    RunObject = Page "Base Calendar Card";
                }
            }
            group("Man Power Planning")
            {
                Caption = 'Man Power Planning';
                Image = Calculator;
                action(Action1000000029)
                {
                    ApplicationArea = Basic;
                    Caption = 'Positions';
                    Image = Category;
                    Promoted = false;
                    RunObject = Page Positions;
                }
                action("Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacant Positions';
                    Image = Category;
                    RunObject = Page "Vacant Positions";
                }
                action("Over Staffed Positions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Over Staffed Positions';
                    Image = Category;
                    RunObject = Page "Overstaffed Positions";
                }
                action("Jobs Supervised")
                {
                    ApplicationArea = Basic;
                    Caption = 'Jobs Supervised';
                    Image = Hierarchy;
                    Promoted = false;
                    RunObject = Page "Jobs Supervised";
                }
                action("Job Specification")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Specification';
                    Image = Skills;
                    Promoted = false;
                    RunObject = Page "Job Specification";
                }
                action("Job Responsibility")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Responsibility';
                    Image = ResourceSkills;
                    Promoted = false;
                    RunObject = Page "Job Responsilibilty";
                }
                action("Job Working Relationship")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Working Relationship';
                    Image = Allocations;
                    Promoted = false;
                    RunObject = Page "J. Working Relationship";
                }
            }
            group("Leave Management")
            {
                Caption = 'Leave Management';
                Image = Calculator;
                action(Action1000000061)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Balances';
                    Image = Balance;
                    RunObject = Page "Leave Balances";
                }
                action("Accrue Annual Leave")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accrue Annual Leave';
                    Image = Calculate;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Accrue Leave";
                }
                action("Leave Posting Journal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Posting Journal';
                    Image = GLJournal;
                    RunObject = Page "Leave Posting Journal";
                    Visible = false;
                }
                action("HR Leave Adjustment")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "HR Leave Adjustment";
                }
            }
            group("Disciplinary Management")
            {
                Caption = 'Disciplinary Management';
                Image = Calculator;
            }
            group(Absence)
            {
                Caption = 'Absence';
                action("Absence Registration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Absence Registration';
                    Image = Absence;
                    RunObject = Page "Absence Registration";
                }
            }
            group(Training)
            {
                Caption = 'Training';
                action("Training Needs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Needs';
                    Image = Forecast;
                    RunObject = Page "Training Needs";
                }
            }
        }
    }
}
