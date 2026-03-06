#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69086 "Manager Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control21; "Finance Performance")
                {
                }
                part(Control1000000008; "Manager Activities")
                {
                }
                systempart(Control1901420308; Outlook)
                {
                }
              
            }
            group(Control1900724708)
            {
                part(Control24; "Cash Flow Forecast Chart")
                {
                }
                part(Control25; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1907692008; "My Customers")
                {
                }
                part(Control1902476008; "My Vendors")
                {
                    Visible = false;
                }
                part(Control1905989608; "My Items")
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
            action("Account Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Account Schedule';
                Image = ReceivablesPayables;
                RunObject = Report "Account Schedule";
            }
            action("Recei&vables-Payables")
            {
                ApplicationArea = Basic;
                Caption = 'Recei&vables-Payables';
                Image = ReceivablesPayables;
                RunObject = Report "Receivables-Payables";
            }
            action("&Trial Balance/Budget")
            {
                ApplicationArea = Basic;
                Caption = '&Trial Balance/Budget';
                Image = "Report";
                RunObject = Report "Trial Balance/Budget";
            }
            action("&Closing Trial Balance")
            {
                ApplicationArea = Basic;
                Caption = '&Closing Trial Balance';
                Image = "Report";
                RunObject = Report "Closing Trial Balance";
            }
            action("&Fiscal Year Balance")
            {
                ApplicationArea = Basic;
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report "Fiscal Year Balance";
            }
            separator(Action6)
            {
            }
            action(Statement)
            {
                ApplicationArea = Basic;
                Caption = 'Statement';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report Statement;
            }
            action("Aged Accounts Receivable")
            {
                ApplicationArea = Basic;
                Caption = 'Aged Accounts Receivable';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Aged Accounts Receivable";
            }
            action("Customer - &Balance")
            {
                ApplicationArea = Basic;
                Caption = 'Customer - &Balance';
                Image = "Report";
                RunObject = Report "Customer - Balance to Date";
            }
            action("Customer - T&op 10 List")
            {
                ApplicationArea = Basic;
                Caption = 'Customer - T&op 10 List';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                RunObject = Report "Customer - Top 10 List";
            }
            action("Customer - S&ales List")
            {
                ApplicationArea = Basic;
                Caption = 'Customer - S&ales List';
                Image = "Report";
                RunObject = Report "Customer - Sales List";
            }
            action("Sales &Statistics")
            {
                ApplicationArea = Basic;
                Caption = 'Sales &Statistics';
                Image = "Report";
                RunObject = Report "Sales Statistics";
            }
            separator(Action11)
            {
            }
            action("Employee Time Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Time Sheet';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                RunObject = Report "validate leave ledger entries";
            }
            action("Detailed Employee Time Sheet")
            {
                ApplicationArea = Basic;
                Caption = 'Detailed Employee Time Sheet';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //RunObject =Report UnknownReport50091;
            }
            action("Employee Time Sheet-EMB")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Time Sheet-EMB';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //RunObject =Report UnknownReport69067;
            }
            action("Detailed Employee Time Sheet-EMB")
            {
                ApplicationArea = Basic;
                Caption = 'Detailed Employee Time Sheet-EMB';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //RunObject =Report UnknownReport69066;
            }
            action("Detailed Employee Time Sheet-CHC")
            {
                ApplicationArea = Basic;
                Caption = 'Detailed Employee Time Sheet-CHC';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //RunObject =Report UnknownReport69113;
            }
            separator(Action1000000027)
            {
            }
            action("Daily Job Book Summary")
            {
                ApplicationArea = Basic;
                Caption = 'Daily Job Book Summary';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = false;
                //RunObject =Report UnknownReport50008;
            }
            separator(Action1000000025)
            {
            }
        }
        area(embedding)
        {
            action("Account Schedules")
            {
                ApplicationArea = Basic;
                Caption = 'Account Schedules';
                RunObject = Page "Account Schedule Names";
            }
            action("Analysis by Dimensions")
            {
                ApplicationArea = Basic;
                Caption = 'Analysis by Dimensions';
                Image = AnalysisViewDimension;
                RunObject = Page "Analysis View List";
            }
            action(Budgets)
            {
                ApplicationArea = Basic;
                Caption = 'Budgets';
                RunObject = Page "G/L Budget Names";
            }
            action("Leave Balances")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Balances';
                Image = Employee;
                RunObject = Page "Leave Balances";
            }
            action(Customers)
            {
                ApplicationArea = Basic;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
            }
            action("Service Contracts")
            {
                ApplicationArea = Basic;
                Caption = 'Service Contracts';
                Image = ServiceAgreement;
                RunObject = Page "Service Contracts";
            }
            action(Contacts)
            {
                ApplicationArea = Basic;
                Caption = 'Contacts';
                Image = CustomerContact;
                RunObject = Page "Contact List";
            }
        }
        area(sections)
        {
            group("Employee Self Service")
            {
                Caption = 'Employee Self Service';
                Image = HumanResources;
                action("Internal Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Internal Requisitions';
                    Image = ServiceAgreement;
                    RunObject = Page "Internal Requisitions";
                    RunPageView = sorting("Document Type", "No.")
                                  order(ascending);
                }
                action("Approved Internal Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Internal Requisitions';
                    Image = ServiceAgreement;
                    RunObject = Page "Approved IR-Released";
                    RunPageView = sorting("Document Type", "No.")
                                  order(ascending);
                }
                action("Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Applications';
                    Image = ServiceAgreement;
                    RunObject = Page "Leave Applications";
                    RunPageView = sorting("Document Type", "No.")
                                  order(ascending);
                }
                action("Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Leave Applications';
                    Image = ServiceAgreement;
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
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Sales Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Sales Shipments";
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Invoices";
                }
                action("Posted Return Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Return Receipts';
                    Image = PostedReturnReceipt;
                    RunObject = Page "Posted Return Receipts";
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = Page "Posted Sales Credit Memos";
                }
                action("Posted Service Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Service Shipments';
                    Image = PostedShipment;
                    RunObject = Page "Posted Service Shipments";
                }
                action("Posted Service Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Service Invoices';
                    Image = PostedServiceOrder;
                    RunObject = Page "Posted Service Invoices";
                }
                action("Posted Service Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Service Credit Memos';
                    RunObject = Page "Posted Service Credit Memos";
                }
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                }
                action("Posted Return Shipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                }
                action("Issued Reminders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Issued Reminders';
                    Image = OrderReminder;
                    RunObject = Page "Issued Reminder List";
                }
                action("Issued Fi. Charge Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Issued Fi. Charge Memos';
                    RunObject = Page "Issued Fin. Charge Memo List";
                }
                action("G/L Registers")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Registers';
                    Image = GLRegisters;
                    RunObject = Page "G/L Registers";
                }
            }
        }
    }
}

