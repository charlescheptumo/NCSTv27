#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69043 "Payroll Admin Role Center"
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
                part(Control1000000004; "Payroll Activities")
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
                systempart(Control1901377608; MyNotes)
                {
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
                    RunObject = Report "1 Page Payslip";
                }
                action("2 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '2 Page Payslip';
                    Image = "Report";
                    RunObject = Report "New Payslip";
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
                action("Detailed E/D Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Detailed E/D Report';
                    Image = "Report";
                    RunObject = Report "Master reporterx";
                }
                action("Loans Detailed Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loans Detailed Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Loans Detailed Report1";
                }
                action("Sacco Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sacco Master Roll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Sacco Master report";
                }
                action("Loan Balances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loan Balances';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Loan Balances";
                }
                action("Employee Payroll Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Payroll Analysis';
                    Image = "Report";
                    RunObject = Report "Payroll Cost Analysis";
                }
                action("Employee Pay Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Pay Details';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Employee Pay Details";
                }
                action("Net Pay less than Rule")
                {
                    ApplicationArea = Basic;
                    Caption = 'Net Pay less than Rule';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Net Pay less than the rule";
                }
            }
            group(Statutory)
            {
                Caption = 'Statutory';
                action(NHIF)
                {
                    ApplicationArea = Basic;
                    Caption = 'NHIF';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report NHIF;
                }
                action(NSSF)
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "NSSF Reporting";
                }
                action("Monthly PAYE Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Monthly PAYE Export';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Monthly PAYE Export";
                }
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
            group("Payroll Reconcilliation")
            {
                Caption = 'Payroll Reconcilliation';
                action("Zero Earnings Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Earnings Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Earnings Report";
                }
                action("Zero Deductions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Deductions Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Deductions Report";
                }
                action("New Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Employees';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "New Employees";
                }
                action("Employees Removed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Removed';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employees Removed";
                }
                action("Negative Pay")
                {
                    ApplicationArea = Basic;
                    Caption = 'Negative Pay';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Negative Pay";
                }
                action("Net Pay Less Than 1/3")
                {
                    ApplicationArea = Basic;
                    Caption = 'Net Pay Less Than 1/3';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Net Pay Less Than 1/3";
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee Master Roll";
                }
                action("Master Roll Per Department")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Per Department';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee Master Roll Grouped";
                }
                action("Payroll Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Summary';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Summary";
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Summary';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Summary";
                }
                action("Payroll Reconciliation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Details';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Details";
                }
            }
        }
        area(embedding)
        {
            action("Employee List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List';
                Image = Employee;
                RunObject = Page "Employee List-P";
            }
            action("Pay Periods")
            {
                ApplicationArea = Basic;
                Caption = 'Pay Periods';
                Image = Employee;
                RunObject = Page "Pay Periods";
            }
            action(Earnings)
            {
                ApplicationArea = Basic;
                Caption = 'Earnings';
                Image = Employee;
                RunObject = Page Earnings;
            }
            action(Deductions)
            {
                ApplicationArea = Basic;
                Caption = 'Deductions';
                Image = Employee;
                RunObject = Page Deductions;
            }
            action("Salary Processing")
            {
                ApplicationArea = Basic;
                Caption = 'Salary Processing';
                Image = Loaners;
                RunObject = Page "Payroll Processing List";
            }
            action("Approved Salary Voucher")
            {
                ApplicationArea = Basic;
                Caption = 'Approved Salary Voucher';
                RunObject = Page "Approved Salary Vouchers";
            }
            action("Brackets Table")
            {
                ApplicationArea = Basic;
                Caption = 'Brackets Table';
                Image = Employee;
                RunObject = Page "Brackets Table";
            }
            action(Loans)
            {
                ApplicationArea = Basic;
                Caption = 'Loans';
                Image = Loaners;
                RunObject = Page Loans;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Employee;
                RunObject = Page Dimensions;
            }
            action("Employee Posting Group")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Posting Group';
                Image = Employee;
                RunObject = Page "Employee Posting Group";
            }
            action("Employee PGroups")
            {
                ApplicationArea = Basic;
                Caption = 'Employee PGroups';
                RunObject = Page "Employee PGroups";
            }
            action("Employee Bank List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Bank List';
                Image = Employee;
                RunObject = Page "Employee Bank List";
            }
            action("Loans Products")
            {
                ApplicationArea = Basic;
                Caption = 'Loans Products';
                Image = Loaners;
                RunObject = Page "Loan Products";
            }
            action("Documents E-mailed Log")
            {
                ApplicationArea = Basic;
                Caption = 'Documents E-mailed Log';
                Image = Loaners;
                RunObject = Page "Documents E-mailed Log1";
            }
        }
        area(sections)
        {
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
        }
        area(processing)
        {
            group("Data Import")
            {
                Caption = 'Data Import';
                Image = Calculator;
                action("Earnings Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Earnings Import';
                    Image = Import;
                    RunObject = XMLport "Earnings Import";
                }
                action("Deductions Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions Import';
                    Image = Import;
                    RunObject = XMLport "Ded Import";
                }
                action("Import Overtime @1.5")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Overtime @1.5';
                    Image = Import;
                    //RunObject = XMLport UnknownXMLport69056;
                }
                action("Import Overtime @2.0")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Overtime @2.0';
                    Image = Import;
                    //RunObject = XMLport UnknownXMLport69057;
                }
            }
            group("Payroll Processing")
            {
                Caption = 'Payroll Processing';
                Image = Calculator;
                action("Current Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Earnings/Deductions';
                    Image = CashReceiptJournal;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Current Earnings/Deductions";
                }
                action("Run Payroll Run")
                {
                    ApplicationArea = Basic;
                    Caption = 'Run Payroll Run';
                    Image = Calculate;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Payroll Run";
                }
                action("Process Loan Interest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Loan Interest';
                    Image = Suggest;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Process Loan Interest";
                }
                action("Process Update Payroll Dimensions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Update Payroll Dimensions';
                    Image = "Report";
                    RunObject = Report "Update Payroll Dimensions";
                }
                action("Assign Default Earnings/Ded")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Create Director PeriodX";
                }
                action("Process Update KRA classification")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Update KRA classification';
                    Image = "Report";
                    RunObject = Report "Update KRA classification";
                }
                action("Closed Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Earnings/Deductions';
                    Image = CashReceiptJournal;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Closed Earnings/Deductions";
                }
                action("Transfer to Journal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer to Journal';
                    RunObject = Report "Transfer to Journal";
                }
            }
            group("Data Export")
            {
                Caption = 'Data Export';
                Image = Calculator;
                action(Action1000000037)
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Excel Export';
                    Image = Export;
                    RunObject = Report "Master Roll Excel Export";
                }
                action("Employee Biodata")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Biodata';
                    Image = Export;
                    RunObject = Report "Employee Biodata";
                }
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'EFT';
                    Image = Export;
                    RunObject = Report "EFT/SFI-Admin";
                }
                action("Send PDF Payslips")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send PDF Payslips';
                    Image = Export;
                    RunObject = Report "Send PDF Payslips";
                }
                action("Journal Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Journal Export';
                    Image = Export;
                    RunObject = Report "Journal Export";
                }
            }
        }
    }
}
