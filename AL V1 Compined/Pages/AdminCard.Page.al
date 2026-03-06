#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65081 "Admin Card"
{
    Caption = 'Admin Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Resource;
    SourceTableView = where(Admin = filter(true));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = NoFieldVisible;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies a description of the resource.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies whether the resource is a person or a machine.';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the base unit used to measure the resource, such as hour, piece, or kilometer.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field("Resource Group No."; Rec."Resource Group No.")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the resource group that this resource is assigned to.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the date of the most recent change of information in the Resource Card window.';
                }
                field("Use Time Sheet"; Rec."Use Time Sheet")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies if a resource uses a time sheet to record time allocated to various tasks.';
                }
                field("Time Sheet Owner User ID"; Rec."Time Sheet Owner User ID")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the name of the owner of the time sheet.';
                }
                field("Time Sheet Approver User ID"; Rec."Time Sheet Approver User ID")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the ID of the approver of the time sheet.';
                }
                field(Admin; Rec.Admin)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the percentage of the item''s last purchase cost that includes indirect costs, such as freight that is associated with the purchase of the item.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
                field("Price/Profit Calculation"; Rec."Price/Profit Calculation")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the relationship between the Unit Cost, Unit Price, and Profit Percentage fields associated with this resource.';
                }
                field("Profit %"; Rec."Profit %")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the profit margin that you want to sell the resource at. You can enter a profit percentage manually or have it entered according to the Price/Profit Calculation field';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Default Deferral Template Code"; Rec."Default Deferral Template Code")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Default Deferral Template';
                    ToolTip = 'Specifies the default template that governs how to defer revenues and expenses to the periods when they occurred.';
                }
                field("Automatic Ext. Texts"; Rec."Automatic Ext. Texts")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies that an Extended Text Header will be added on sales or purchase documents for this resource.';
                }
                field("IC Partner Purch. G/L Acc. No."; Rec."IC Partner Purch. G/L Acc. No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the intercompany g/l account number in your partner''s company that the amount for this resource is posted to.';
                }
            }
            group("Personal Data")
            {
                Caption = 'Personal Data';
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the person''s job title.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the address or location of the resource, if applicable.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies additional address information.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the city of the resource''s address.';
                }
                group(Control47)
                {
                    Visible = IsCountyVisible;
                    field(County; Rec.County)
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies a special region, to which the resource belongs.';
                    }
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Jobs;

                    trigger OnValidate()
                    begin
                        IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
                    end;
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the person''s social security number or the machine''s serial number.';
                }
                field(Education; Rec.Education)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the training, education, or certification level of the person.';
                }
                field("Contract Class"; Rec."Contract Class")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the contract class for the person.';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the date when the person began working for you or the date when the machine was placed in service.';
                }
            }
        }
        area(factboxes)
        {
            part(Control39; "Resource Picture")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("No.");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(156),
                              "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resource")
            {
                Caption = '&Resource';
                Image = Resource;
                action("Resource L&ocations")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resource L&ocations';
                    Image = Resource;
                    RunObject = Page "Resource Locations";
                    RunPageLink = "Resource No." = field("No.");
                    RunPageView = sorting("Resource No.");
                    ToolTip = 'View where resources are located or assign resources to locations.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Resource),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("Online Map")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Online Map';
                    Image = Map;
                    ToolTip = 'View the address on an online map.';

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                separator(Action69)
                {
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                action(Costs)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Costs';
                    Image = ResourceCosts;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Resource Costs";
                    RunPageLink = Type = const(Resource),
                                  Code = field("No.");
                    ToolTip = 'View or change detailed information about costs for the resource.';
                }
                action(Prices)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Prices';
                    Image = Price;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Resource Prices";
                    RunPageLink = Type = const(Resource),
                                  Code = field("No.");
                    ToolTip = 'View or edit prices for the resource.';
                }
                action("S&kills")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'S&kills';
                    Image = Skills;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Resource Skills";
                    RunPageLink = Type = const(Resource),
                                  "No." = field("No.");
                    ToolTip = 'View the assignment of skills to the resource. You can use skill codes to allocate skilled resources to service items or items that need special skills for servicing.';
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action("Resource &Capacity")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource &Capacity';
                    Image = Capacity;
                    RunObject = Page "Resource Capacity";
                    RunPageOnRec = true;
                    ToolTip = 'View this job''s resource capacity.';
                }
                action("Resource &Allocated per Job")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = Page "Resource Allocated per Job";
                    RunPageLink = "Resource Filter" = field("No.");
                    ToolTip = 'View this job''s resource allocation.';
                }
                action("Resource Allocated per Service &Order")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resource Allocated per Service &Order';
                    Image = ViewServiceOrder;
                    RunObject = Page "Res. Alloc. per Service Order";
                    RunPageLink = "Resource Filter" = field("No.");
                    ToolTip = 'View the service order allocations of the resource.';
                }
                action("Resource A&vailability")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource A&vailability';
                    Image = Calendar;
                    RunObject = Page "Resource Availability";
                    RunPageLink = "No." = field("No."),
                                  "Base Unit of Measure" = field("Base Unit of Measure"),
                                  "Chargeable Filter" = field("Chargeable Filter");
                    ToolTip = 'View a summary of resource capacities, the quantity of resource hours allocated to jobs on order, the quantity allocated to service orders, the capacity assigned to jobs on quote, and the resource availability.';
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceZone;
                action("Service &Zones")
                {
                    ApplicationArea = Service;
                    Caption = 'Service &Zones';
                    Image = ServiceZone;
                    RunObject = Page "Resource Service Zones";
                    RunPageLink = "Resource No." = field("No.");
                    ToolTip = 'View the different service zones that you can assign to customers and resources. When you allocate a resource to a service task that is to be performed at the customer site, you can select a resource that is located in the same service zone as the customer.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Ledger E&ntries';
                    Image = ResourceLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Resource Ledger Entries";
                    RunPageLink = "Resource No." = field("No.");
                    RunPageView = sorting("Resource No.")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
        }
        area(reporting)
        {
            action("Resource Statistics")
            {
                ApplicationArea = Jobs;
                Caption = 'Resource Statistics';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Resource Statistics";
                ToolTip = 'View detailed, historical information for the resource.';
            }
            action("Resource Usage")
            {
                ApplicationArea = Jobs;
                Caption = 'Resource Usage';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Resource Usage";
                ToolTip = 'View the resource utilization that has taken place. The report includes the resource capacity, quantity of usage, and the remaining balance.';
            }
            action("Resource - Cost Breakdown")
            {
                ApplicationArea = Jobs;
                Caption = 'Resource - Cost Breakdown';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Resource - Cost Breakdown";
                ToolTip = 'View the direct unit costs and the total direct costs for each resource. Only usage postings are considered in this report. Resource usage can be posted in the resource journal or the job journal.';
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CreateTimeSheets)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Create Time Sheets';
                    Ellipsis = true;
                    Image = NewTimesheet;
                    ToolTip = 'Create new time sheets for the resource.';

                    trigger OnAction()
                    begin
                        Rec.CreateTimeSheets;
                    end;
                }
                action("Grant Admin Tasks")
                {
                    ApplicationArea = Basic;
                    Image = Grid;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Grant Admin Tasks List";
                    RunPageLink = "Researcher No" = field("No.");
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        if CRMIntegrationEnabled then begin
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
            if Rec."No." <> xRec."No." then
                CRMIntegrationManagement.SendResultNotification(Rec);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Admin := true;
        Rec."Resource Type" := Rec."resource type"::Administrator;
    end;

    trigger OnOpenPage()
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        SetNoFieldVisible;
        IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        FormatAddress: Codeunit "Format Address";
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        NoFieldVisible: Boolean;
        IsCountyVisible: Boolean;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.ResourceNoIsVisible;
    end;
}
