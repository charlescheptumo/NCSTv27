#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65135 "Grants  Role Center"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'Manager''s  Role Center', Comment = '{Dependency=Match,"ProfileDescription_SMALLBUSINESS"}';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            part(Control139; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control16; "Grant Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control96; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("User Task List")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Tasks';
                RunObject = Page "User Task List";
            }
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action("Imprest Memo")
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
                action("Imprest Surrender")
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
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                Image = New;
                action("Funding Agencies")
                {
                    AccessByPermission = TableData Customer = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Funding Agencies';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageMode = Create;
                    RunPageView = where("Funding Class" = const(Grant));
                    ToolTip = 'Register a new =Funding Agent';
                }
                action("Collaborator & Partners")
                {
                    ApplicationArea = Basic;
                    Caption = 'Collaborator & Partners';
                    RunObject = Page "Contact Card";
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Grants Reports")
                {
                    Caption = 'Grants Reports';
                    Image = ReferenceData;
                    action("Research Centers")
                    {
                        ApplicationArea = Basic;
                        RunObject = Report "Research Center List";
                    }
                    action("Funding Announcements")
                    {
                        ApplicationArea = Basic;
                        RunObject = Report "FOA List";
                    }
                    action("Research Center Grants")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Grants Per Research Center';
                        RunObject = Report "Research Center Grants";
                    }
                    action("Research Center Projects")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Projects Per Research Center';
                        RunObject = Report "Research Center Projects";
                    }
                }
                group("Self Service Reports")
                {
                    Caption = 'Self Service Reports';
                    Image = ReferenceData;
                    action(Action37)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Memo';
                        Image = "Report";
                        RunObject = Report "Imprest Memo";
                    }
                    action("Imprest Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Requisition';
                        Image = "Report";
                        RunObject = Report "Imprest Requisition";
                    }
                    action(Action35)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Surrender';
                        Image = "Report";
                        RunObject = Report "Imprest Surrender";
                    }
                    separator(Action33)
                    {
                    }
                    action(" Leave Application Print Out")
                    {
                        ApplicationArea = Basic;
                        Caption = ' Leave Application Print Out';
                        Image = "Report";
                        RunObject = Report "Leave Application";
                    }
                    separator(Action31)
                    {
                    }
                }
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action("Research Center List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Research Centers';
                RunObject = Page "Research Center List";
                ToolTip = 'View or organize the general ledger accounts that store your financial data. All values from business transactions or internal adjustments end up in designated G/L accounts. Business Central includes a standard chart of accounts that is ready to support businesses in your country, but you can change the default accounts and add new ones.';
            }
            action("Research Program List")
            {
                ApplicationArea = Basic;
                Caption = 'Research Programs';
                RunObject = Page "Research Program List";
            }
            action(Researchers)
            {
                ApplicationArea = Basic;
                Caption = 'Researchers';
                RunObject = Page "Researcher List";
            }
            action("Admin List ")
            {
                ApplicationArea = Basic;
                Caption = 'Grant Administrators';
                RunObject = Page "Admin List";
            }
            action("Contact List")
            {
                ApplicationArea = Basic;
                Caption = 'Collaborators & Partners';
                RunObject = Page "Contact List";
            }
            action("Funding Agency List")
            {
                ApplicationArea = Basic;
                Caption = 'Funding Agencies';
                RunObject = Page "Funding Agency List";
            }
        }
        area(sections)
        {
            group("Pre-Award")
            {
                Caption = 'Pre-Award';
                Image = Sales;
                ToolTip = 'Make quotes, orders, and credit memos to customers. Manage customers and view transaction history.';
            }
            group("My Request")
            {
                Caption = 'My Request';
                action("Imprest Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memos';
                    RunObject = Page "Imprest Memos";
                }
                action("<Page Project Imprest Requisition>")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Requisitions';
                    Image = Quote;
                    RunObject = Page "Imprest Requisitions";
                }
                action("My Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Store Requisitions';
                    Image = Document;
                    RunObject = Page "Store Requisitions";
                }
                action("My Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Imprest Surrenders';
                    Image = Document;
                    RunObject = Page "Imprest Surrenders";
                }
                action("My Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Leave Applications';
                    Image = ServiceCode;
                    RunObject = Page "Leave Applications List";
                }
                action("ICT Helpdesk Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Helpdesk Request';
                    Enabled = false;
                    Image = SendTo;
                    RunObject = Page "ICT Helpdesk Request List";
                    Visible = false;
                }
                action("My Purchase Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'My Purchase Requisitions';
                    Image = Loaners;
                    RunObject = Page "Purchase Requisitions";
                }
                action("Fleet Requisition List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Fleet Requisition List";
                }
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Item List";
                }
            }
            group("My Approved Requests")
            {
                action("My Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Approved Leave Applications";
                }
                action("Approved Imprest Memos")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Imprest Memos";
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Imprest Surrenders";
                }
                action("Approved Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Purchase Requisition";
                }
            }
        }
    }
}
