#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56213 "Employee Self-Service RC"
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
                part(Control1904652008; "Employee service Activities")
                {
                }
            }
            group(Control1900724708)
            {
                part(Control29; "Report Inbox Part")
                {
                    ApplicationArea = Basic, Suite;
                }
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
            action("Imprest Memo")
            {
                ApplicationArea = Basic;
                Caption = 'Imprest Memo';
                Image = "Report";
                RunObject = Report "Imprest Memo";
            }
            action("Imprests Requisition")
            {
                ApplicationArea = Basic;
                Caption = 'Imprest Requisition';
                Image = "Report";
                RunObject = Report "Imprest Requisition";
            }
            action("Imprest Surrender")
            {
                ApplicationArea = Basic;
                Caption = 'Imprest Surrender';
                Image = "Report";
                RunObject = Report "Imprest Surrender";
            }
            separator(Action9)
            {
            }
            action(" Leave Application Print Out")
            {
                ApplicationArea = Basic;
                Caption = ' Leave Application Print Out';
                Image = "Report";
                RunObject = Report "Leave Application";
            }
            separator(Action14)
            {
            }
        }
        area(embedding)
        {
            action(" Imprest Memos")
            {
                ApplicationArea = Basic;
                RunObject = Page "Imprest Memos";
            }
            action("Imprest Requisitions")
            {
                ApplicationArea = Basic;
                Image = Quote;
                RunObject = Page "Imprest Requisitions";
            }
            action("Imprest Surrenders")
            {
                ApplicationArea = Basic;
                Image = Document;
                RunObject = Page "Imprest Surrenders";
            }
            action("Store Requisitions")
            {
                ApplicationArea = Basic;
                Image = Document;
                RunObject = Page "Store Requisitions";
            }
            action("Page Approved Store Requisition")
            {
                ApplicationArea = Basic;
                Caption = 'Approved Store Requisitions';
                RunObject = Page "Approved Store Requisitions";
            }
            action("Page Posted Store Requisitions>")
            {
                ApplicationArea = Basic;
                Caption = 'Store Requisitions Posted';
                RunObject = Page "Posted Store Requisitions";
            }
            action("Leave Applications List")
            {
                ApplicationArea = Basic;
                Image = ServiceCode;
                RunObject = Page "Leave Applications List";
            }
            action("ICT Helpdesk Request List")
            {
                ApplicationArea = Basic;
                Enabled = false;
                RunObject = Page "ICT Helpdesk Request List";
                Visible = false;
            }
            action("Purchase Requisitions")
            {
                ApplicationArea = Basic;
                Image = Loaners;
                RunObject = Page "Purchase Requisitions";
            }
            action("Purchase Requisitions List")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Requisitions List';
                RunObject = Page "Purchase Requisitions List";
            }
            action("Approved Purchase Requsitions")
            {
                ApplicationArea = Basic;
                Caption = 'Approved Purchase Requsitions';
                RunObject = Page "Approved Purchase Requisition";
            }
            action("Item List")
            {
                ApplicationArea = Basic;
                Image = Item;
                RunObject = Page "Item List";
            }
            action("p9 Self Services")
            {
                ApplicationArea = Basic;
                RunObject = Page "p9 Self Services";
            }
            action(PaySlip)
            {
                ApplicationArea = Basic;
                RunObject = Page "Pay Periods-Self Service";
            }
            action("Staff Claims")
            {
                ApplicationArea = Basic;
                RunObject = Page "Staff Claims";
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Memos';
                    Image = PostedVoucherGroup;
                    RunObject = Page "Posted Imprest Memos";
                }
                action("Posted Imprest Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Requisitions';
                    Image = PostedServiceOrder;
                    RunObject = Page "Posted Imprest Requisitions";
                }
                action("Posted Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Imprest Surrender';
                    RunObject = Page "Imprest Surrenders";
                }
            }
        }
        area(creation)
        {
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action(Action17)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    Image = New;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Memo";
                    RunPageMode = Create;
                }
                action("Imprest_Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Requisition';
                    Image = NewDocument;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Requisition";
                    RunPageMode = Create;
                }
                action("My p9 Self Services")
                {
                    ApplicationArea = Basic;
                    Image = New;
                    RunObject = Page "p9 Self Services";
                }
                action("My PaySlip")
                {
                    ApplicationArea = Basic;
                    Image = "New ";
                    RunObject = Page "Pay Periods-Self Service";
                }
                action(Action16)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    Image = NewDocument;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Surrender";
                    RunPageMode = Create;
                }
            }
            action("Leave Application")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Application';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Leave Application Card";
                RunPageMode = Create;
            }
            action("Purchase Requisition")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Requisition';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Requisition";
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            group("My Self-Service ")
            {
            }
            action("My P9 Form")
            {
                ApplicationArea = Basic;
                Image = Employee;
                RunObject = Page "p9 Self Services";
            }
            action("My PaySlips")
            {
                ApplicationArea = Basic;
                Image = Email;
                RunObject = Page "Pay Periods-Self Service";
            }
        }
    }
}
