#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70125 "Self Service  Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1907662708; "Purchase Agent Activities")
                {
                }
            }
            group(Control1900724708)
            {
                systempart(Control43; MyNotes)
                {
                }
                part(Control25; "Purchase Performance")
                {
                }
                part(Control37; "Purchase Performance")
                {
                    Visible = false;
                }
                part(Control21; "Inventory Performance")
                {
                }
                part(Control44; "Inventory Performance")
                {
                    Visible = false;
                }
                part(Control35; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1902476008; "My Vendors")
                {
                }
                part(Control1905989608; "My Items")
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Vendor - T&op 10 List")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - T&op 10 List';
                Image = "Report";
                RunObject = Report "Vendor - Top 10 List";
            }
            action("Vendor/&Item Purchases")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor/&Item Purchases';
                Image = "Report";
                RunObject = Report "Vendor/Item Purchases";
            }
            separator(Action28)
            {
            }
            action("Inventory - &Availability Plan")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - &Availability Plan';
                Image = ItemAvailability;
                RunObject = Report "Inventory - Availability Plan";
            }
            action("Purchase Order Report")
            {
                ApplicationArea = Basic;
                //RunObject =Report UnknownReport51511169;
            }
            action("Inventory &Purchase Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory &Purchase Orders';
                Image = "Report";
                RunObject = Report "Inventory Purchase Orders";
            }
            action("Inventory - &Vendor Purchases")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - &Vendor Purchases';
                Image = "Report";
                RunObject = Report "Inventory - Vendor Purchases";
            }
            action("Inventory &Cost and Price List")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory &Cost and Price List';
                Image = "Report";
                RunObject = Report "Inventory Cost and Price List";
            }
            separator(Action53)
            {
            }
            action("Requisition by Item")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition by Item';
                Image = Aging;
                //RunObject =Report UnknownReport51511437;
            }
            action("Requisition by Date")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition by Date';
                Image = Alerts;
                //RunObject =Report UnknownReport51511441;
            }
            action("Purchase Order Analysis ")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Order Analysis ';
                //RunObject =Report UnknownReport51511473;
            }
        }
        area(embedding)
        {
            action("Purchase Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
            }
            action("Procurement Plan")
            {
                ApplicationArea = Basic;
                RunObject = Page "Procurement Plans List";
            }
            action("Open Orders ")
            {
                ApplicationArea = Basic;
                Caption = 'Open Orders ';
                RunObject = Page "Purchase Order List";
                RunPageView = where(Status = filter(Open));
            }
            action("Pending Approval ")
            {
                ApplicationArea = Basic;
                Caption = 'Pending Approval ';
                RunObject = Page "Purchase Order List";
                RunPageView = where(Status = filter("Pending Approval"));
            }
            action("Approved Purchase Orders ")
            {
                ApplicationArea = Basic;
                Caption = 'Approved Purchase Orders ';
                RunObject = Page "Purchase Order List";
                RunPageView = where(Status = filter(Released));
            }
            action("Purchase Quotes")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Quotes';
                RunObject = Page "Purchase Quotes";
            }
            action("Blanket Purchase Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Blanket Purchase Orders';
                RunObject = Page "Blanket Purchase Orders";
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Invoices';
                RunObject = Page "Purchase Invoices";
            }
            action("Purchase Return Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Return Orders';
                RunObject = Page "Purchase Return Order List";
            }
            action("Purchase Credit Memos")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Credit Memos';
                RunObject = Page "Purchase Credit Memos";
            }
            action("Assembly Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Assembly Orders';
                RunObject = Page "Assembly Orders";
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
            }
            action(Vendors)
            {
                ApplicationArea = Basic;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                RunPageMode = View;
                RunPageView = where("Vendor Type" = const(Trade));
            }
            action(Items)
            {
                ApplicationArea = Basic;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
            }
            action("Nonstock Items")
            {
                ApplicationArea = Basic;
                Caption = 'Nonstock Items';
                Image = NonStockItem;
                RunObject = Page "Catalog Item List";
            }
            action("Stockkeeping Units")
            {
                ApplicationArea = Basic;
                Caption = 'Stockkeeping Units';
                Image = SKU;
                RunObject = Page "Stockkeeping Unit List";
            }
            action("Purchase Analysis Reports")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Analysis Reports';
                RunObject = Page "Analysis Report Purchase";
                RunPageView = where("Analysis Area" = filter(Purchase));
            }
            action("Inventory Analysis Reports")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory Analysis Reports';
                RunObject = Page "Analysis Report Inventory";
                RunPageView = where("Analysis Area" = filter(Inventory));
            }
            action("Item Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal Batches";
                RunPageView = where("Template Type" = const(Item),
                                    Recurring = const(false));
            }
            action("Purchase Journals")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = where("Template Type" = const(Purchases),
                                    Recurring = const(false));
            }
            action("Requisition Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("Req."),
                                    Recurring = const(false));
            }
            action("Subcontracting Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Subcontracting Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("For. Labor"),
                                    Recurring = const(false));
            }
            action("Standard Cost Worksheets")
            {
                ApplicationArea = Basic;
                Caption = 'Standard Cost Worksheets';
                RunObject = Page "Standard Cost Worksheet Names";
            }
            action("Config. Packages")
            {
                ApplicationArea = Basic;
                Caption = 'Config. Packages';
                RunObject = Page "Config. Packages";
            }
        }
        area(sections)
        {
            group("Store Requisitions")
            {
                Caption = 'Store Requisitions';
                Image = LotInfo;
                action("Store Requisitions List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions List';
                    RunObject = Page "Store Requisitions";
                }
                action("Released Store Requisitions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Released Store Requisitions';
                    RunObject = Page "Approved Store Requisitions";
                }
                action("Store Requisitions Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisitions Posted';
                    RunObject = Page "Posted Store Requisitions";
                }
                action("Stock Return")
                {
                    ApplicationArea = Basic;
                    Caption = 'Stock Return';
                    RunObject = Page "Approved Stock Returns";
                }
            }
            group("Purchase Requisitions ")
            {
                Caption = 'Purchase Requisitions ';
                Image = LotInfo;
                action("Purchase Requisitions List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisitions List';
                    RunObject = Page "Purchase Requisitions List";
                }
                action("Released Purchase Requsitions ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Released Purchase Requsitions ';
                    RunObject = Page "Approved Purchase Requisition";
                }
            }
            group("Self Service")
            {
                Caption = 'Self Service';
                Image = Travel;
                action("Imprest Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Request';
                    RunObject = Page "Imprest Memos";
                }
                action(Action105)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Request';
                    RunObject = Page "Imprest Requisitions";
                }
                action("Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    RunObject = Page "Imprest Surrenders";
                }
                action("Claims Refund")
                {
                    ApplicationArea = Basic;
                    Caption = 'Claims Refund';
                    RunObject = Page "Staff Claims";
                }
                action("Purchase Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition ';
                    RunObject = Page "Purchase Requisitions List";
                }
                action("Store Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisition ';
                    Image = Vendor;
                    RunObject = Page "Store Requisitions";
                }
                action("Leave Application ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application ';
                    Image = Balance;
                    RunObject = Page "Leave Applications List";
                }
                action("Fleet Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Requisition';
                    Image = Documents;
                    RunObject = Page "Fleet Requisition List";
                }
                action("ICT Help Desk")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Help Desk';
                    RunObject = Page "ICT Helpdesk Request List";
                }
            }
            group("Approvals ")
            {
                Caption = 'Approvals ';
                Image = Purchasing;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    Image = Currency;
                    RunObject = Page "Approval Entries";
                }
                action("Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Request Entries';
                    Image = AccountingPeriods;
                    RunObject = Page "Approval Request Entries";
                }
            }
            group("Posted Documents & History ")
            {
                Caption = 'Posted Documents & History ';
                Image = FiledPosted;
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
                action("Posted Assembly Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Assembly Orders';
                    RunObject = Page "Posted Assembly Orders";
                }
                action("Purchase Order Archives")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Order Archives';
                    RunObject = Page "Purchase Order Archives";
                }
            }
        }
        area(creation)
        {
            action("Purchase &Quote")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Quote';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Quote";
                RunPageMode = Create;
            }
            action("Purchase &Invoice")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Invoice';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Invoice";
                RunPageMode = Create;
            }
            action("Purchase &Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Order';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
            }
            action("Purchase &Return Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Return Order';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Return Order";
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            separator(Action24)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Location List ")
            {
                ApplicationArea = Basic;
                Image = Job;
                RunObject = Page "Location List";
            }
            action("&Purchase Journal")
            {
                ApplicationArea = Basic;
                Caption = '&Purchase Journal';
                Image = Journals;
                RunObject = Page "Purchase Journal";
            }
            action("Item &Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Item &Journal';
                Image = Journals;
                RunObject = Page "Item Journal";
            }
            action("Physical Inventory Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Physical Inventory Journal';
                Image = Addresses;
                RunObject = Page "Phys. Inventory Journal";
            }
            action("Order Plan&ning")
            {
                ApplicationArea = Basic;
                Caption = 'Order Plan&ning';
                Image = Planning;
                RunObject = Page "Order Planning";
            }
            separator(Action38)
            {
            }
            action("Requisition &Worksheet")
            {
                ApplicationArea = Basic;
                Caption = 'Requisition &Worksheet';
                Image = Worksheet;
                RunObject = Page "Req. Wksh. Names";
                RunPageView = where("Template Type" = const("Req."),
                                    Recurring = const(false));
            }
            action("Pur&chase Prices")
            {
                ApplicationArea = Basic;
                Caption = 'Pur&chase Prices';
                Image = Price;
                RunObject = Page "Purchase Prices";
            }
            action("Purchase &Line Discounts")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase &Line Discounts';
                Image = LineDiscount;
                RunObject = Page "Purchase Line Discounts";
            }
            separator(Action36)
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
            action(GRN)
            {
                ApplicationArea = Basic;
                //RunObject =Report UnknownReport51511265;
            }
        }
    }
}
