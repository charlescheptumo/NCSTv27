#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75167 "Request for Registration"
{
    ApplicationArea = Basic, Suite, Service;
    Caption = 'Request for Registration';
    CardPageID = "Vendor Registration Request";
    DataCaptionFields = "Company No.";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Contact';
    SourceTable = Contact;
    SourceTableView = sorting("Company Name", "Company No.", Type, Name)
                      where("Portal Request" = const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the name of the contact. If the contact is a person, you can click the field to see the Name Details window.';
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the company. If the contact is a person, Specifies the name of the company for which this contact works. This field is not editable.';
                    Visible = false;
                }
                field("Date of Last Interaction"; Rec."Date of Last Interaction")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date Created';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the postal code.';
                    Visible = false;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country/region of the address.';
                    Visible = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the contact''s phone number.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the contact''s mobile telephone number.';
                    Visible = false;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic, Suite;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the contact''s email.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the contact''s fax number.';
                    Visible = false;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Suite;
                    Caption = 'Principle Investigator';
                    ToolTip = 'Specifies the code of the salesperson who normally handles this contact.';
                }
                field("Territory Code"; Rec."Territory Code")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the territory code for the contact.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the currency code for the contact.';
                    Visible = false;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the language that is used when translating specified text on documents to foreign business partner, such as an item description on an order confirmation.';
                    Visible = false;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                    Visible = false;
                }
                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                    Visible = false;
                }
                field(Minor; Rec.Minor)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that the person''s age is below the definition of adulthood as recognized by law. Data for minors is blocked until a parent or guardian of the minor provides parental consent. You unblock the data by selecting the Parental Consent Received check box.';
                    Visible = false;
                }
                field("Parental Consent Received"; Rec."Parental Consent Received")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that a parent or guardian of the minor has provided their consent to allow the minor to use this service. When this check box is selected, data for the minor can be processed.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(Control128; "Contact Statistics FactBox")
            {
                ApplicationArea = RelationshipMgmt;
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("C&ontact")
            {
                Caption = 'C&ontact';
                Image = ContactPerson;
                group("Comp&any")
                {
                    Caption = 'Comp&any';
                    Enabled = CompanyGroupEnabled;
                    Image = Company;
                    action("Business Relations")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Business Relations';
                        Image = BusinessRelation;
                        RunObject = Page "Contact Business Relations";
                        RunPageLink = "Contact No." = field("Company No.");
                        ToolTip = 'View or edit the contact''s business relations, such as customers, vendors, banks, lawyers, consultants, competitors, and so on.';
                    }
                    action("Industry Groups")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Industry Groups';
                        Image = IndustryGroups;
                        RunObject = Page "Contact Industry Groups";
                        RunPageLink = "Contact No." = field("Company No.");
                        ToolTip = 'View or edit the industry groups, such as Retail or Automobile, that the contact belongs to.';
                    }
                    action("Web Sources")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Web Sources';
                        Image = Web;
                        RunObject = Page "Contact Web Sources";
                        RunPageLink = "Contact No." = field("Company No.");
                        ToolTip = 'View a list of the web sites with information about the contacts.';
                    }
                }
                group("P&erson")
                {
                    Caption = 'P&erson';
                    Enabled = PersonGroupEnabled;
                    Image = User;
                    action("Job Responsibilities")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Job Responsibilities';
                        Image = Job;
                        ToolTip = 'View or edit the contact''s job responsibilities.';

                        trigger OnAction()
                        var
                            ContJobResp: Record "Contact Job Responsibility";
                        begin
                            Rec.TestField(Rec.Type, Rec.Type::Person);
                            ContJobResp.SetRange("Contact No.", Rec."No.");
                            Page.RunModal(Page::"Contact Job Responsibilities", ContJobResp);
                        end;
                    }
                }
                action("Pro&files")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Pro&files';
                    Image = Answers;
                    ToolTip = 'Open the Profile Questionnaires window.';

                    trigger OnAction()
                    var
                        ProfileManagement: Codeunit ProfileManagement;
                    begin
                        ProfileManagement.ShowContactQuestionnaireCard(Rec, '', 0);
                    end;
                }
                action("&Picture")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Contact Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'View or add a picture of the contact person or, for example, the company''s logo.';
                    Visible = ActionVisible;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Rlshp. Mgt. Comment Sheet";
                    RunPageLink = "Table Name" = const(Contact),
                                  "No." = field("No."),
                                  "Sub No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
                group("Alternati&ve Address")
                {
                    Caption = 'Alternati&ve Address';
                    Image = Addresses;
                    action(Card)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Card';
                        Image = EditLines;
                        RunObject = Page "Contact Alt. Address List";
                        RunPageLink = "Contact No." = field("No.");
                        ToolTip = 'View or change detailed information about the contact.';
                    }
                    action("Date Ranges")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Date Ranges';
                        Image = DateRange;
                        RunObject = Page "Contact Alt. Addr. Date Ranges";
                        RunPageLink = "Contact No." = field("No.");
                        ToolTip = 'Specify date ranges that apply to the contact''s alternate address.';
                    }
                }
            }
            group(ActionGroupCRM)
            {
                Caption = 'Dynamics 365 for Sales';
                Visible = CRMIntegrationEnabled;
                action(CRMGotoContact)
                {
                    ApplicationArea = Suite;
                    Caption = 'Contact';
                    Enabled = (Rec.Type <> Rec.Type::Company) and (Rec."Company No." <> '');
                    Image = CoupledContactPerson;
                    ToolTip = 'Open the coupled Dynamics 365 for Sales contact.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record" = IM;
                    ApplicationArea = Suite;
                    Caption = 'Synchronize';
                    Enabled = (Rec.Type <> Rec.Type::Company) and (Rec."Company No." <> '');
                    Image = Refresh;
                    ToolTip = 'Send or get updated data to or from Dynamics 365 for Sales.';

                    trigger OnAction()
                    var
                        Contact: Record Contact;
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        ContactRecordRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(Contact);
                        Contact.Next;

                        if Contact.Count = 1 then
                            CRMIntegrationManagement.UpdateOneNow(Contact.RecordId)
                        else begin
                            ContactRecordRef.GetTable(Contact);
                            CRMIntegrationManagement.UpdateMultipleNow(ContactRecordRef);
                        end
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment = 'Coupling is a noun';
                    Enabled = (Rec.Type <> Rec.Type::Company) and (Rec."Company No." <> '');
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Dynamics 365 for Sales record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Set Up Coupling';
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Dynamics 365 for Sales contact.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Delete Coupling';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Dynamics 365 for Sales contact.';

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
                        end;
                    }
                }
                group(Create)
                {
                    Caption = 'Create';
                    Image = NewCustomer;
                    action(CreateInCRM)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Contact in Dynamics 365 for Sales';
                        Enabled = (Rec.Type <> Rec.Type::Company) and (Rec."Company No." <> '');
                        Image = NewCustomer;
                        ToolTip = 'Create a contact in Dynamics 365 for Sales that is linked to a contact in your company.';

                        trigger OnAction()
                        var
                            Contact: Record Contact;
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CurrPage.SetSelectionFilter(Contact);
                            CRMIntegrationManagement.CreateNewRecordsInCRM(Contact);
                        end;
                    }
                    action(CreateFromCRM)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Contact in Business Central';
                        Image = NewCustomer;
                        ToolTip = 'Create a contact here in your company that is linked to the Dynamics 365 for Sales contact.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.CreateNewContactFromCRM;
                        end;
                    }
                }
                action(ShowLog)
                {
                    ApplicationArea = Suite;
                    Caption = 'Synchronization Log';
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the contact table.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(Rec.RecordId);
                    end;
                }
            }
            group("Related Information")
            {
                Caption = 'Related Information';
                Image = Users;
                action("Relate&d Contacts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Relate&d Contacts';
                    Image = Users;
                    RunObject = Page "Contact List";
                    RunPageLink = "Company No." = field("Company No.");
                    ToolTip = 'View a list of all contacts.';
                }
                action("Segmen&ts")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Segmen&ts';
                    Image = Segment;
                    RunObject = Page "Contact Segment List";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No."));
                    RunPageView = sorting("Contact No.", "Segment No.");
                    ToolTip = 'View the segments that are related to the contact.';
                }
                action("Mailing &Groups")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Mailing &Groups';
                    Image = DistributionGroup;
                    RunObject = Page "Contact Mailing Groups";
                    RunPageLink = "Contact No." = field("No.");
                    ToolTip = 'View or edit the mailing groups that the contact is assigned to, for example, for sending price lists or Christmas cards.';
                }
                action("C&ustomer/Vendor/Bank Acc.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'C&ustomer/Vendor/Bank Acc.';
                    Image = ContactReference;
                    ToolTip = 'View the related customer, vendor, or bank account that is associated with the current record.';

                    trigger OnAction()
                    begin
                      //c//  Rec.ShowCustVendBank;
                    end;
                }
            }
            group(Tasks)
            {
                Caption = 'Tasks';
                Image = Task;
                action("T&asks")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'T&asks';
                    Image = TaskList;
                    RunObject = Page "Task List";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = field(filter("Lookup Contact No.")),
                                  "System To-do Type" = filter("Contact Attendee");
                    RunPageView = sorting("Contact Company No.", "Contact No.");
                    ToolTip = 'View all marketing tasks that involve the contact person.';
                }
                action("Open Oppo&rtunities")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Open Oppo&rtunities';
                    Image = OpportunityList;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Opportunity List";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No.")),
                                  Status = filter("Not Started" | "In Progress");
                    RunPageView = sorting("Contact Company No.", "Contact No.");
                    Scope = Repeater;
                    ToolTip = 'View the open sales opportunities that are handled by salespeople for the contact. Opportunities must involve a contact and can be linked to campaigns.';
                }
                action("Postponed &Interactions")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Postponed &Interactions';
                    Image = PostponedInteractions;
                    RunObject = Page "Postponed Interactions";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No."));
                    RunPageView = sorting("Contact Company No.", "Contact No.");
                    ToolTip = 'View postponed interactions for the contact.';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(ShowSalesQuotes)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales &Quotes';
                    Image = Quote;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Contact No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Contact No.");
                    ToolTip = 'View sales quotes that exist for the contact.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Closed Oppo&rtunities")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Closed Oppo&rtunities';
                    Image = OpportunityList;
                    RunObject = Page "Opportunity List";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No.")),
                                  Status = filter(Won | Lost);
                    RunPageView = sorting("Contact Company No.", "Contact No.");
                    ToolTip = 'View the closed sales opportunities that are handled by salespeople for the contact. Opportunities must involve a contact and can be linked to campaigns.';
                }
                action("Interaction Log E&ntries")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Interaction Log E&ntries';
                    Image = InteractionLog;
                    RunObject = Page "Interaction Log Entries";
                    RunPageLink = "Contact Company No." = field("Company No."),
                                  "Contact No." = filter(<> ''),
                                  "Contact No." = field(filter("Lookup Contact No."));
                    RunPageView = sorting("Contact Company No.", "Contact No.");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View a list of the interactions that you have logged, for example, when you create an interaction, print a cover sheet, a sales order, and so on.';
                }
                action(Statistics)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Contact Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(MakePhoneCall)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Make &Phone Call';
                    Image = Calls;
                    Promoted = true;
                    PromotedCategory = Process;
                    Scope = Repeater;
                    ToolTip = 'Call the selected contact.';

                    trigger OnAction()
                    var
                        TAPIManagement: Codeunit TAPIManagement;
                    begin
                        TAPIManagement.DialContCustVendBank(Database::Contact, Rec."No.", Rec.GetDefaultPhoneNo, '');
                    end;
                }
                action("Launch &Web Source")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Launch &Web Source';
                    Image = LaunchWeb;
                    ToolTip = 'Search for information about the contact online.';
                    Visible = ActionVisible;

                    trigger OnAction()
                    var
                        ContactWebSource: Record "Contact Web Source";
                    begin
                        ContactWebSource.SetRange("Contact No.", Rec."Company No.");
                        if Page.RunModal(Page::"Web Source Launch", ContactWebSource) = Action::LookupOK then
                            ContactWebSource.Launch;
                    end;
                }
                group("Create as")
                {
                    Caption = 'Create as';
                    Image = CustomerContact;
                    Visible = ActionVisible;
                    action(Customer)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer';
                        Image = Customer;
                        ToolTip = 'Create the contact as a customer.';

                        trigger OnAction()
                        begin
                            Rec.CreateCustomer();
                        end;
                    }
                    action(Vendor)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Vendor';
                        Image = Vendor;
                        ToolTip = 'Create the contact as a vendor.';

                        trigger OnAction()
                        begin
                            Rec.CreateVendor;
                        end;
                    }
                    action(Bank)
                    {
                        AccessByPermission = TableData "Bank Account" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bank';
                        Image = Bank;
                        ToolTip = 'Create the contact as a bank.';

                        trigger OnAction()
                        begin
                            Rec.CreateBankAccount;
                        end;
                    }
                }
                group("Link with existing")
                {
                    Caption = 'Link with existing';
                    Image = Links;
                    action(Action63)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer';
                        Image = Customer;
                        ToolTip = 'Link the contact to an existing customer.';

                        trigger OnAction()
                        begin
                            Rec.CreateCustomerLink;
                        end;
                    }
                    action(Action64)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Vendor';
                        Image = Vendor;
                        ToolTip = 'Link the contact to an existing vendor.';

                        trigger OnAction()
                        begin
                            Rec.CreateVendorLink;
                        end;
                    }
                    action(Action65)
                    {
                        AccessByPermission = TableData "Bank Account" = R;
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bank';
                        Image = Bank;
                        ToolTip = 'Link the contact to an existing bank.';

                        trigger OnAction()
                        begin
                            Rec.CreateBankAccountLink;
                        end;
                    }
                }
            }
            action("Export Contact")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Export Contact';
                Image = Export;
                RunObject = XMLport "Export Contact";
                ToolTip = 'Export Contact';
            }
            action("Create &Interaction")
            {
                AccessByPermission = TableData Attachment = R;
                ApplicationArea = RelationshipMgmt;
                Caption = 'Create &Interaction';
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Create an interaction with a specified contact.';

                trigger OnAction()
                begin
                    Rec.CreateInteraction;
                end;
            }
            action("Create Opportunity")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Create Opportunity';
                Image = NewOpportunity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Opportunity Card";
                RunPageLink = "Contact No." = field("No."),
                              "Contact Company No." = field("Company No.");
                RunPageMode = Create;
                ToolTip = 'Register a sales opportunity for the contact.';
            }
            action(SyncWithExchange)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sync with Office 365';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Synchronize with Office 365 based on last sync date and last modified date. All changes in Office 365 since the last sync date will be synchronized back.';

                trigger OnAction()
                begin
                    SyncExchangeContacts(false);
                end;
            }
            action(FullSyncWithExchange)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Full Sync with Office 365';
                Image = RefreshLines;
                ToolTip = 'Synchronize, but ignore the last synchronized and last modified dates. All changes will be pushed to Office 365 and take all contacts from your Exchange folder and sync back.';

                trigger OnAction()
                begin
                    SyncExchangeContacts(true);
                end;
            }
        }
        area(creation)
        {
            action(NewSalesQuote)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'New Sales Quote';
                Image = NewSalesQuote;
                Promoted = true;
                PromotedCategory = New;
                ToolTip = 'Offer items or services to a customer.';

                trigger OnAction()
                begin
                    Rec.CreateSalesQuoteFromContact;
                end;
            }
        }
        area(reporting)
        {
            action("Contact Labels")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Contact Labels';
                Image = "Report";
                RunObject = Report "Contact - Labels";
                ToolTip = 'View mailing labels with names and addresses of your contacts. For example, you can use the report to review contact information before you send sales and marketing campaign letters.';
            }
            action("Questionnaire Handout")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Questionnaire Handout';
                Image = "Report";
                RunObject = Report "Questionnaire - Handouts";
                ToolTip = 'View your profile questionnaire for the contact. You can print this report to have a printed copy of the questions that are within the profile questionnaire.';
            }
            action("Sales Cycle Analysis")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Cycle Analysis';
                Image = "Report";
                RunObject = Report "Sales Cycle - Analysis";
                ToolTip = 'View information about your sales cycles. The report includes details about the sales cycle, such as the number of opportunities currently at that stage, the estimated and calculated current values of opportunities created using the sales cycle, and so on.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        EnableFields;
        if CRMIntegrationEnabled then
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        StyleIsStrong := Rec.Type = Rec.Type::Company;
    end;

    trigger OnInit()
    begin
        ActionVisible := ClientTypeManagement.GetCurrentClientType = Clienttype::Windows;
    end;

    trigger OnOpenPage()
    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        ClientTypeManagement: Codeunit "Client Type Management";
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        [InDataSet]
        StyleIsStrong: Boolean;
        CompanyGroupEnabled: Boolean;
        PersonGroupEnabled: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        ActionVisible: Boolean;

    local procedure EnableFields()
    begin
        CompanyGroupEnabled := Rec.Type = Rec.Type::Company;
        PersonGroupEnabled := Rec.Type = Rec.Type::Person;
    end;


    procedure SyncExchangeContacts(FullSync: Boolean)
    var
        ExchangeSync: Record "Exchange Sync";
        O365SyncManagement: Codeunit "O365 Sync. Management";
        ExchangeContactSync: Codeunit "Exchange Contact Sync.";
    begin
        // if O365SyncManagement.IsO365Setup(true) then
        //     if ExchangeSync.Get(UserId) then begin
        //         ExchangeContactSync.GetRequestParameters(ExchangeSync);
        //         O365SyncManagement.SyncExchangeContacts(ExchangeSync, FullSync);
        //     end;
    end;

    procedure GetSelectionFilter(): Text
    var
        Contact: Record Contact;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Contact);
        exit(SelectionFilterManagement.GetSelectionFilterForContact(Contact));
    end;

    procedure SetSelection(var Contact: Record Contact)
    begin
        CurrPage.SetSelectionFilter(Contact);
    end;
}
