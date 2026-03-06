#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56215 "Corporate Affairs  RC"
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
            action("Imprest Requisition")
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
            group("Self-Service")
            {
                Caption = 'Self-Service';
                Image = HumanResources;
                ToolTip = 'Manage your time sheets and assignments.';
            }
        }
        area(sections)
        {
            group(ActionGroup46)
            {
                Caption = 'Self-Service';
                Image = HumanResources;
                ToolTip = 'Manage your time sheets and assignments.';
                action("Page Purchase Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Page Purchase Requisitions';
                    Gesture = None;
                    RunObject = Page "Purchase Requisitions";
                }
                action("Store Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Store Requisitions';
                    Gesture = None;
                    RunObject = Page "Store Requisitions";
                    ToolTip = 'Enable Users to request for items from the store';
                }
                action("HR Leave Applications List")
                {
                    ApplicationArea = Suite;
                    Caption = 'HR Leave Applications List';
                    Gesture = None;
                    RunObject = Page "Leave Applications List";
                    ToolTip = 'HR Leave Applications List';
                }
                action("Leave Application Status")
                {
                    ApplicationArea = Suite;
                    Caption = 'Leave Application Status';
                    Gesture = None;
                    RunObject = Page "Posted Direct Voucher";
                    ToolTip = 'Approved Leave Applications';
                }
                action("ICT Helpdesk Request List")
                {
                    ApplicationArea = Suite;
                    Caption = 'ICT Helpdesk Request List';
                    Gesture = None;
                    RunObject = Page "ICT Helpdesk Request List";
                    ToolTip = 'ICT Helpdesk Request List';
                }
                action("ICT Helpdesk Assign List")
                {
                    ApplicationArea = Suite;
                    Caption = 'ICT Helpdesk Assign List';
                    Gesture = None;
                    RunObject = Page "ICT Helpdesk Assign List";
                    ToolTip = 'ICT Helpdesk Assign List';
                }
                action("Imprest Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Imprest Memos';
                    Gesture = None;
                    RunObject = Page "Imprest Memos";
                    ToolTip = 'Imprest Memos';
                }
                action("Approved Imprest Memos")
                {
                    ApplicationArea = Suite;
                    Caption = 'Approved Imprest Memos';
                    Gesture = None;
                    RunObject = Page "Approved Imprest Memos";
                    ToolTip = 'Approved Imprest Memos';
                }
                action("Imprest Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Imprest Requisitions';
                    Gesture = None;
                    RunObject = Page "Imprest Requisitions";
                    ToolTip = 'Imprest Requisitions';
                }
                action("Imprest Requisitions Status")
                {
                    ApplicationArea = Suite;
                    Caption = 'Imprest Requisitions Status';
                    Gesture = None;
                    RunObject = Page "Direct Voucher Header";
                }
                action("Imprest Surrenders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Imprest Surrenders';
                    Gesture = None;
                    RunObject = Page "Imprest Surrenders";
                    ToolTip = 'Imprest Surrenders';
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Approved Imprest Surrenders';
                    Gesture = None;
                    RunObject = Page "Approved Imprest Surrenders";
                    ToolTip = 'Approved Imprest Surrenders';
                }
                action("Salary Advance  Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Salary Advance  Requisitions';
                    Gesture = None;
                    RunObject = Page "Standing Imprest List";
                    ToolTip = 'Salary Advance  Requisitions';
                }
                action("Salary Advance Status")
                {
                    ApplicationArea = Suite;
                    Caption = 'Salary Advance Status';
                    Gesture = None;
                    RunObject = Page "Posted Direct Voucher List";
                }
                action("Staff Claims")
                {
                    ApplicationArea = Suite;
                    Caption = 'Staff Claims';
                    Gesture = None;
                    RunObject = Page "Staff Claims";
                    ToolTip = 'Staff Claims';
                }
                action("Staff Claims Status")
                {
                    ApplicationArea = Suite;
                    Caption = 'Staff Claims Status';
                    Gesture = None;
                    RunObject = Page "Direct Voucher Lines";
                }
                action("Petty Cash Requisition")
                {
                    ApplicationArea = Suite;
                    Caption = 'Petty Cash Requisition';
                    Gesture = None;
                    //cc// //RunObject = Page UnknownPage57144;
                }
                action("Petty Cash Surrenders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Petty Cash Surrenders';
                    Gesture = None;
                    RunObject = Page "Petty Cash Surrenders";
                    ToolTip = 'Petty Cash Surrenders';
                }
            }
            group("Property Contracts")
            {
                Caption = 'Property Contracts';
                Image = HumanResources;
                ToolTip = 'Manage your time sheets and assignments.';
                action("Property Contracts List")
                {
                    ApplicationArea = Suite;
                    Caption = 'Property Contracts List';
                    Gesture = None;
                    //cc//   //RunObject = Page UnknownPage55305;
                }
                action("Property Item List")
                {
                    ApplicationArea = Suite;
                    Caption = 'Property Item List';
                    Gesture = None;
                    //cc//  //RunObject = Page UnknownPage55303;
                }
                action("Property List")
                {
                    ApplicationArea = Suite;
                    Caption = 'Property List';
                    Gesture = None;
                    //cc//   //RunObject = Page UnknownPage55300;
                }
                action("Posted Service Invoices")
                {
                    ApplicationArea = Suite;
                    Caption = 'Posted Service Invoices';
                    Gesture = None;
                    RunObject = Page "Posted Service Invoices";
                }
            }
        }
        area(creation)
        {
        }
    }
}
