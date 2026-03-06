#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57121 "Audit Role center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group("Managers Role Centers")
            {
                part(Control1901197008; "Audit activities")
                {
                }
                part(Control1907692008; "My Customers")
                {
                }
            }
            group(Control1900724708)
            {
                part(Control17; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1902476008; "My Vendors")
                {
                }
                part(Control18; "Report Inbox Part")
                {
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
            action("A&ccount Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'A&ccount Schedule';
                Image = "Report";
                RunObject = Report "Account Schedule";
            }
            group("&Trial Balance")
            {
                Caption = '&Trial Balance';
                Image = Balance;
                action("&G/L Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = '&G/L Trial Balance';
                    Image = "Report";
                    RunObject = Report "Trial Balance";
                }
                action("Bank &Detail Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank &Detail Trial Balance';
                    Image = "Report";
                    RunObject = Report "Bank Acc. - Detail Trial Bal.";
                }
                action("T&rial Balance/Budget")
                {
                    ApplicationArea = Basic;
                    Caption = 'T&rial Balance/Budget';
                    Image = "Report";
                    RunObject = Report "Trial Balance/Budget";
                }
                action("Trial Balance by &Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Trial Balance by &Period';
                    Image = "Report";
                    RunObject = Report "Trial Balance by Period";
                }
                action("Closing Tria&l Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closing Tria&l Balance';
                    Image = "Report";
                    RunObject = Report "Closing Trial Balance";
                }
            }
            action("&Fiscal Year Balance")
            {
                ApplicationArea = Basic;
                Caption = '&Fiscal Year Balance';
                Image = "Report";
                RunObject = Report "Fiscal Year Balance";
            }
            action("Balance C&omp. . Prev. Year")
            {
                ApplicationArea = Basic;
                Caption = 'Balance C&omp. . Prev. Year';
                Image = "Report";
                RunObject = Report "Balance Comp. - Prev. Year";
            }
            separator(Action49)
            {
            }
            action("&Aged Accounts Receivable")
            {
                ApplicationArea = Basic;
                Caption = '&Aged Accounts Receivable';
                Image = "Report";
                RunObject = Report "Aged Accounts Receivable";
            }
            action("Aged Accou&nts Payable")
            {
                ApplicationArea = Basic;
                Caption = 'Aged Accou&nts Payable';
                Image = "Report";
                RunObject = Report "Aged Accounts Payable";
            }
            action("Reconcile Cust. and &Vend. Accs")
            {
                ApplicationArea = Basic;
                Caption = 'Reconcile Cust. and &Vend. Accs';
                Image = "Report";
                RunObject = Report "Reconcile Cust. and Vend. Accs";
            }
            separator(Action53)
            {
            }
            action("VAT Reg&istration No. Check")
            {
                ApplicationArea = Basic;
                Caption = 'VAT Reg&istration No. Check';
                Image = "Report";
                RunObject = Report "VAT Registration No. Check";
            }
            action("VAT E&xceptions")
            {
                ApplicationArea = Basic;
                Caption = 'VAT E&xceptions';
                Image = "Report";
                RunObject = Report "VAT Exceptions";
            }
            action("VAT State&ment")
            {
                ApplicationArea = Basic;
                Caption = 'VAT State&ment';
                Image = "Report";
                RunObject = Report "VAT Statement";
            }
            action("VAT - VI&ES Declaration Tax Auth")
            {
                ApplicationArea = Basic;
                Caption = 'VAT - VI&ES Declaration Tax Auth';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Tax Auth";
            }
            action("VAT - VIES Declaration Dis&k")
            {
                ApplicationArea = Basic;
                Caption = 'VAT - VIES Declaration Dis&k';
                Image = "Report";
                RunObject = Report "VAT- VIES Declaration Disk";
            }
            action("EC &Sales List")
            {
                ApplicationArea = Basic;
                Caption = 'EC &Sales List';
                Image = "Report";
                RunObject = Report "EC Sales List";
            }
        }
        area(embedding)
        {
            ToolTip = 'Collect and make payments, prepare statements, and manage reminders.';
            action("Chart of Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Bank Accounts';
                Image = BankAccount;
                RunObject = Page "Bank Account List";
            }
            action(Customers)
            {
                ApplicationArea = Basic;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
            }
            action(Balance)
            {
                ApplicationArea = Basic;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Customer List";
                RunPageView = where("Balance (LCY)" = filter(<> 0));
            }
            action(Vendors)
            {
                ApplicationArea = Basic;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
            }
            action(Action5)
            {
                ApplicationArea = Basic;
                Caption = 'Balance';
                Image = Balance;
                RunObject = Page "Vendor List";
                RunPageView = where("Balance (LCY)" = filter(<> 0));
            }
            action("Payment on Hold")
            {
                ApplicationArea = Basic;
                Caption = 'Payment on Hold';
                RunObject = Page "Vendor List";
                RunPageView = where(Blocked = filter(Payment));
            }
            action("VAT Statements")
            {
                ApplicationArea = Basic;
                Caption = 'VAT Statements';
                RunObject = Page "VAT Statement Names";
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Invoices';
                RunObject = Page "Purchase Invoices";
            }
            action("Purchase Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
            }
            action("Sales Invoices")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Invoices';
                Image = Invoice;
                RunObject = Page "Sales Invoice List";
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                RunObject = Page "Requests to Approve";
            }
            action("Cash Receipt Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Cash Receipt Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const("Cash Receipts"),
                                    Recurring = const(false));
            }
            action("Payment Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Payment Journals';
                Image = Journals;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(Payments),
                                    Recurring = const(false));
            }
            action("General Journals")
            {
                ApplicationArea = Basic;
                Caption = 'General Journals';
                Image = Journal;
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(General),
                                    Recurring = const(false));
            }
            action("Recurring General Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Recurring General Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(General),
                                    Recurring = const(true));
            }
            action("Intrastat Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Intrastat Journals';
                //RunObject = Page "Intrastat Jnl. Batches";            }
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'View posted invoices and credit memos, and analyze G/L registers.';
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
            group(ActionGroup22)
            {
                Caption = 'Approvals';
                ToolTip = 'Request approval of your documents, cards, or journal lines or, as the approver, approve requests made by other users.';
                action("Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requests Sent for Approval';
                    Image = Approvals;
                    RunObject = Page "Approval Entries";
                    RunPageView = sorting("Record ID to Approve", "Workflow Step Instance ID", "Sequence No.")
                                  order(ascending)
                                  where(Status = filter(Open));
                }
                action(RequestsToApprove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requests to Approve';
                    Image = Approvals;
                    RunObject = Page "Requests to Approve";
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                Image = Administration;
                action(Currencies)
                {
                    ApplicationArea = Basic;
                    Caption = 'Currencies';
                    Image = Currency;
                    RunObject = Page Currencies;
                }
                action("Accounting Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accounting Periods';
                    Image = AccountingPeriods;
                    RunObject = Page "Accounting Periods";
                }
                action("Number Series")
                {
                    ApplicationArea = Basic;
                    Caption = 'Number Series';
                    RunObject = Page "No. Series";
                }
            }
        }
        area(creation)
        {
            action("C&ustomer")
            {
                ApplicationArea = Basic;
                Caption = 'C&ustomer';
                Image = Customer;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Customer Card";
                RunPageMode = Create;
            }
            action("Sales &Invoice")
            {
                ApplicationArea = Basic;
                Caption = 'Sales &Invoice';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
            }
            action("Cash Receipt")
            {
                ApplicationArea = Basic;
                Caption = 'Cash Receipt';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page Receipt;
                RunPageMode = Create;
            }
            action("Sales &Fin. Charge Memo")
            {
                ApplicationArea = Basic;
                Caption = 'Sales &Fin. Charge Memo';
                Image = FinChargeMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Finance Charge Memo";
                RunPageMode = Create;
            }
            action("Sales &Reminder")
            {
                ApplicationArea = Basic;
                Caption = 'Sales &Reminder';
                Image = Reminder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page Reminder;
                RunPageMode = Create;
            }
            separator(Action554)
            {
            }
            action("&Vendor")
            {
                ApplicationArea = Basic;
                Caption = '&Vendor';
                Image = Vendor;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Vendor Card";
                RunPageMode = Create;
            }
            action("&Purchase Invoice")
            {
                ApplicationArea = Basic;
                Caption = '&Purchase Invoice';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Invoice";
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            separator(Action67)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Cash Re&ceipt Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Cash Re&ceipt Journal';
                Image = CashReceiptJournal;
                RunObject = Page "Cash Receipt Journal";
            }
            action("Payment &Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Payment &Journal';
                Image = PaymentJournal;
                RunObject = Page "Payment Journal";
            }
            action("Payment Registration")
            {
                ApplicationArea = Basic;
                Caption = 'Payment Registration';
                Image = Payment;
                RunObject = Page "Payment Registration";
            }
            separator(Action77)
            {
            }
            action("B&ank Account Reconciliations")
            {
                ApplicationArea = Basic;
                Caption = 'B&ank Account Reconciliations';
                Image = BankAccountRec;
                RunObject = Page "Bank Acc. Reconciliation";
            }
            action("Adjust E&xchange Rates")
            {
                ApplicationArea = Basic;
                Caption = 'Adjust E&xchange Rates';
                Ellipsis = true;
                Image = AdjustExchangeRates;
                //cc   //RunObject = Report "Adjust Exchange Rates";; 
                           }
            action("Post Inventor&y Cost to G/L")
            {
                ApplicationArea = Basic;
                Caption = 'Post Inventor&y Cost to G/L';
                Ellipsis = true;
                Image = PostInventoryToGL;
                RunObject = Report "Post Inventory Cost to G/L";
            }
            action("Calc. and Pos&t VAT Settlement")
            {
                ApplicationArea = Basic;
                Caption = 'Calc. and Pos&t VAT Settlement';
                Ellipsis = true;
                Image = SettleOpenTransactions;
                RunObject = Report "Calc. and Post VAT Settlement";
            }
            separator(Action84)
            {
                Caption = 'Administration';
                IsHeader = true;
            }
            action("Sa&les && Receivables Setup")
            {
                ApplicationArea = Basic;
                Caption = 'Sa&les && Receivables Setup';
                Image = Setup;
                RunObject = Page "Sales & Receivables Setup";
            }
            separator(Action89)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic;
                Caption = 'Navi&gate';
                Image = Navigate;
                RunObject = Page Navigate;
            }
        }
    }
}
