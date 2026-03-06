#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75062 "Vendor Registration Card"
{
    Caption = 'Supplier Registration';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Approve,Request Approval,New Document,Navigate,Incoming Documents,Vendor';
    RefreshOnActivate = true;
    SourceTable = Vendor;
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
                    Editable = false;
                    Importance = Standard;
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
                    ApplicationArea = All;
                    Caption = 'Name';
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Tax  Registration (PIN) No.';
                    ToolTip = 'Specifies the vendor''s VAT registration number.';

                    trigger OnDrillDown()
                    var
                        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
                    begin
                        VATRegistrationLogMgt.AssistEditVendorVATReg(Rec);
                    end;
                }
                field("Country of Incorporation"; Rec."Country of Incorporation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tax Registration Country';
                }
                field("Registration/Incorporation No."; Rec."Registration/Incorporation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Reg/Incorporation Date"; Rec."Reg/Incorporation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Business Type"; Rec."Business Type")
                {
                    ApplicationArea = Basic;
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Type"; Rec."Supplier Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                }
                field("Industry Group"; Rec."Industry Group")
                {
                    ApplicationArea = Basic;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part("Special Group Registration"; "Vendor Special Group Entry")
            {
                SubPageLink = "Vendor No" = field("No.");
            }
            group("Communications & Contact Details")
            {
                Caption = 'Communications & Contact Details';
                group(AddressDetails)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the vendor''s address.';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies additional address information.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the vendor''s city.';
                    }
                    group(Control199)
                    {
                        Visible = IsCountyVisible;
                        field(County; Rec.County)
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the state, province or county as a part of the address.';
                        }
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ToolTip = 'Specifies the postal code.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the country/region of the address.';

                        trigger OnValidate()
                        begin
                            IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
                        end;
                    }
                    field("Fixed Line Tel No"; Rec."Fixed Line Tel No")
                    {
                        ApplicationArea = Basic;
                    }
                    field(ShowMap; ShowMapLbl)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        ShowCaption = false;
                        Style = StrongAccent;
                        StyleExpr = true;
                        ToolTip = 'Specifies you can view the vendor''s address on your preferred map website.';

                        trigger OnDrillDown()
                        begin
                            CurrPage.Update(true);
                            Rec.DisplayMap;
                        end;
                    }
                }
                group(Contact)
                {
                    Caption = 'Contact';
                    field("Primary Contact No."; Rec."Primary Contact No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Primary Contact Code';
                        ToolTip = 'Specifies the primary contact number for the vendor.';
                    }
                    field(Control16; Rec.Contact)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = ContactEditable;
                        Importance = Promoted;
                        ToolTip = 'Specifies the name of the person you regularly contact when you do business with this vendor.';

                        trigger OnValidate()
                        begin
                            ContactOnAfterValidate;
                        end;
                    }
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the vendor''s telephone number.';
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = Basic, Suite;
                        ExtendedDatatype = EMail;
                        Importance = Promoted;
                        ToolTip = 'Specifies the vendor''s email address.';
                    }
                    field("Fax No."; Rec."Fax No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the vendor''s fax number.';
                    }
                    field("Home Page"; Rec."Home Page")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the vendor''s web site.';
                    }
                    field("Our Account No."; Rec."Our Account No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies your account number with the vendor, if you have one.';
                    }
                }
                group("Location Details")
                {
                    Caption = 'Location Details';
                    field("Building/House No"; Rec."Building/House No")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Floor; Rec.Floor)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Plot No"; Rec."Plot No")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Street; Rec.Street)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group("Business Profile")
            {
                Caption = 'Business Profile';
                field("Company Size"; Rec."Company Size")
                {
                    ApplicationArea = Basic;
                }
                field("Nominal Capital LCY"; Rec."Nominal Capital LCY")
                {
                    ApplicationArea = Basic;
                }
                field("Dealer Type"; Rec."Dealer Type")
                {
                    ApplicationArea = Basic;
                }
                field("Max Value of Business"; Rec."Max Value of Business")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Business"; Rec."Nature of Business")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
            part(Control106; "Vendor Bank Account List")
            {
                Caption = 'Bank Details Page';
                SubPageLink = "Vendor No." = field("No.");
            }
            part(Control109; "Vendor Business Owner")
            {
                Caption = 'Business Ownership Details';
                SubPageLink = "Vendor No." = field("No.");
            }
            part(Control110; "Vendor Litigation History")
            {
                Caption = 'Litigation History';
                SubPageLink = "Vendor No." = field("No.");
            }
            part(Control111; "Vendor Past Experience")
            {
                Caption = 'Past Experience';
                SubPageLink = "Vendor No." = field("No.");
            }
            part(Control113; "Vendor Professional Staff")
            {
                Caption = 'Details of Key staff';
                SubPageLink = "Vendor No." = field("No.");
            }
            part(Control114; "Vendor Audited Balance Sheet")
            {
                Caption = 'Audited Balance Sheet';
                SubPageLink = "Vendor No." = field("No.");
            }
            part(Control115; "Vendor Audited Income Statemen")
            {
                Caption = 'Audited Income Statement';
                SubPageLink = "Vendor No." = field("No.");
            }
            part(Control117; "Vendor Filed Reg Document")
            {
                Caption = 'Document Attachments';
                SubPageLink = "Vendor No" = field("No.");
            }
            group("Posting Details")
            {
                Caption = 'Posting Details';
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the vendor''s market type to link business transactions made for the vendor with the appropriate account in the general ledger.';
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the currency code that is inserted by default when you create purchase documents or journal lines for the vendor.';
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                field("Prepayment %"; Rec."Prepayment %")
                {
                    ApplicationArea = Prepayments;
                    Importance = Additional;
                    ToolTip = 'Specifies a prepayment percentage that applies to all orders for this vendor, regardless of the items or services on the order lines.';
                }
                field("Application Method"; Rec."Application Method")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies how to apply payments to entries for this vendor.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the importance of the vendor when suggesting payments using the Suggest Vendor Payments function.';
                }
                field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the vendor allows payment tolerance.';

                    trigger OnValidate()
                    var
                        ConfirmManagement: Codeunit "Confirm Management";
                    begin
                        if Rec."Block Payment Tolerance" then begin
                            if ConfirmManagement.GetResponse(Text002, true) then
                                PaymentToleranceMgt.DelTolVendLedgEntry(Rec);
                        end else begin
                            if ConfirmManagement.GetResponse(Text001, true) then
                                PaymentToleranceMgt.CalcTolVendLedgEntry(Rec);
                        end;
                    end;
                }
                field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the vendor bank account that will be used by default on payment journal lines for export to a payment bank file.';
                }
                field("Partner Type"; Rec."Partner Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if the vendor is a person or a company.';
                }
                field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a payment term that will be used for calculating cash flow.';
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the vendor.';
                }
            }
            group(Receiving)
            {
                Caption = 'Receiving';
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                    ToolTip = 'Specifies the warehouse location where items from the vendor must be received by default.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
                }
                field("Base Calendar Code"; Rec."Base Calendar Code")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    ToolTip = 'Specifies a customizable calendar for delivery planning that holds the vendor''s working days and holidays.';
                }
                // field("Customized Calendar"; CalendarMgmt.CustomizedCalendarExistText(CustomizedCalendar."source type"::Vendor, Rec."No.", '', Rec."Base Calendar Code"))
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Customized Calendar';
                //     Editable = false;
                //     ToolTip = 'Specifies if you have set up a customized calendar for the vendor.';

                //     trigger OnDrillDown()
                //     begin
                //         CurrPage.SaveRecord;
                //         Rec.TestField(Rec."Base Calendar Code");
                //         CalendarMgmt.ShowCustomizedCalendar(CustomizedCalEntry."source type"::Vendor, Rec."No.", '', Rec."Base Calendar Code");
                //     end;
                // }
            }
        }
        area(factboxes)
        {
            part(Control82; "Vendor Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
                Visible = not IsOfficeAddin;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(23),
                              "No." = field("No.");
            }
            part(VendorStatisticsFactBox; "Vendor Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
            }
            part(AgedAccPayableChart; "Aged Acc. Payable Chart")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
                Visible = IsOfficeAddin;
            }
            // part(Control17; "Social Listening FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = const(Vendor),
            //                   "Source No." = field("No.");
            //     Visible = SocialListeningVisible;
            // }
            // part(Control19; "Social Listening Setup FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "Source Type" = const(Vendor),
            //                   "Source No." = field("No.");
            //     UpdatePropagation = Both;
            //     Visible = SocialListeningSetupVisible;
            // }
            part(VendorHistBuyFromFactBox; "Vendor Hist. Buy-from FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
            }
            part(VendorHistPayToFactBox; "Vendor Hist. Pay-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = All;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
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
            group("Ven&dor")
            {
                Caption = 'Ven&dor';
                Image = Vendor;
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(23),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Vendor Bank Account List";
                    RunPageLink = "Vendor No." = field("No.");
                    ToolTip = 'View or set up the vendor''s bank accounts. You can set up any number of bank accounts for each vendor.';
                }
                action(ContactBtn)
                {
                    AccessByPermission = TableData Contact = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'C&ontact';
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    ToolTip = 'View or edit detailed information about the contact person at the vendor.';

                    trigger OnAction()
                    begin
                        Rec.ShowContact;
                    end;
                }
                action(OrderAddresses)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Order &Addresses';
                    Image = Addresses;
                    RunObject = Page "Order Address List";
                    RunPageLink = "Vendor No." = field("No.");
                    ToolTip = 'View a list of alternate order addresses for the vendor.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Vendor),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action(ApprovalEntries)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Cross References")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cross References';
                    Image = Change;
                    Promoted = true;
                    PromotedCategory = Category9;
                    RunObject = Page "Item References";
                    RunPageLink = "Reference Type" = const(Vendor),
                                  "Reference Type No." = field("No.");
                    RunPageView = sorting("Reference Type", "Reference Type No.");
                    ToolTip = 'Set up a customer''s or vendor''s own identification of the selected item. Cross-references to the customer''s item number means that the item number is automatically shown on sales documents instead of the number that you use.';
                }
                action(VendorReportSelections)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Document Layouts';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Set up a layout for different types of documents such as invoices, quotes, and credit memos.';

                    trigger OnAction()
                    var
                        CustomReportSelection: Record "Custom Report Selection";
                    begin
                        CustomReportSelection.SetRange("Source Type", Database::Vendor);
                        CustomReportSelection.SetRange("Source No.", Rec."No.");
                        Page.RunModal(Page::"Vendor Report Selections", CustomReportSelection);
                    end;
                }
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category9;
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
                action("Business Owners")
                {
                    ApplicationArea = Basic;
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Vendor Business Owner";
                    RunPageLink = "Vendor No." = field("No.");
                }
                action("Vendor Classification")
                {
                    ApplicationArea = Basic;
                    Image = Category;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Vendor Classification";
                    RunPageLink = "Vendor No" = field("No.");
                }
                action("Litigation History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Vendor Past Experience";
                    RunPageLink = "Vendor No." = field("No.");
                }
                action("Client References")
                {
                    ApplicationArea = Basic;
                    Image = Relationship;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Vendor Past Experience";
                    RunPageLink = "Vendor No." = field("No.");
                }
                action("Proffesional Staff")
                {
                    ApplicationArea = Basic;
                    Image = SalesPerson;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Vendor Professional Staff";
                    RunPageLink = "Vendor No." = field("No.");
                }
                action("Works Awarded")
                {
                    ApplicationArea = Basic;
                    Image = AgreementQuote;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Vendor Works Awarded";
                    RunPageLink = "Vendor No" = field("No.");
                }
                action("Certificates Expiry")
                {
                    ApplicationArea = Basic;
                    Image = DueDate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Vendor Certificate Expiry";
                    RunPageLink = "Vendor No" = field("No.");
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        ////DMSManagement.UploadDocument(DMSDocuments."document type"::"Imprest Memo", Rec."No.", 'Imprest Memo', Rec.RecordId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval to change the record.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //cc//if ApprovalsMgmt.CheckVendorApprovalsWorkflowEnabled(Rec) then
                        //cc//ApprovalsMgmt.OnSendVendorForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.OnCancelVendorApprovalRequest(Rec);
                        WorkflowWebhookManagement.FindAndCancel(Rec.RecordId);
                    end;
                }
                group(Flow)
                {
                    Caption = 'Flow';
                    action(CreateFlow)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Create a Flow';
                        Image = Flow;
                        Promoted = true;
                        PromotedCategory = Category5;
                        ToolTip = 'Create a new Flow from a list of relevant Flow templates.';
                        Visible = IsSaaS;

                        trigger OnAction()
                        var
                            FlowServiceManagement: Codeunit "Flow Service Management";
                        //cc//FlowTemplateSelector: Page "Flow Template Selector";
                        begin
                            // Opens page 6400 where the user can use filtered templates to create new Flows.
                            //cc//FlowTemplateSelector.SetSearchText(FlowServiceManagement.GetVendorTemplateFilter);
                            //cc//FlowTemplateSelector.Run;
                        end;
                    }
                    action(SeeFlows)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'See my Flows';
                        Image = Flow;
                        Promoted = true;
                        PromotedCategory = Category5;
                        //cc//  RunObject = Page "Flow Selector";
                        ToolTip = 'View and configure Flows that you created.';
                    }
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(Templates)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Templates';
                    Image = Template;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Config Templates";
                    RunPageLink = "Table ID" = const(23);
                    ToolTip = 'View or edit vendor templates.';
                }
                action(ApplyTemplate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Apply Template';
                    Ellipsis = true;
                    Image = ApplyTemplate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Apply a template to update the entity with your standard settings for a certain type of entity.';

                    trigger OnAction()
                    var
                    //cc//        MiniVendorTemplate: Record "Mini Vendor Template";
                    begin
                        //cc//         MiniVendorTemplate.UpdateVendorFromTemplate(Rec);
                    end;
                }
                action(SaveAsTemplate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Save as Template';
                    Ellipsis = true;
                    Image = Save;
                    ToolTip = 'Save the vendor card as a template that can be reused to create new vendor cards. Vendor templates contain preset information to help you fill fields on vendor cards.';

                    trigger OnAction()
                    var
                    //cc//     TempMiniVendorTemplate: Record "Mini Vendor Template" temporary;
                    begin
                        //cc//              TempMiniVendorTemplate.SaveAsTemplate(Rec);
                    end;
                }
                action(MergeDuplicate)
                {
                    AccessByPermission = TableData "Merge Duplicates Buffer" = RIMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Merge With';
                    Ellipsis = true;
                    Image = ItemSubstitution;
                    ToolTip = 'Merge two vendor records into one. Before merging, review which field values you want to keep or override. The merge action cannot be undone.';

                    trigger OnAction()
                    var
                        TempMergeDuplicatesBuffer: Record "Merge Duplicates Buffer" temporary;
                    begin
                        TempMergeDuplicatesBuffer.Show(Database::Vendor, Rec."No.");
                    end;
                }
            }
            action("Create Payments")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Payments';
                Ellipsis = true;
                Image = PaymentJournal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Payment Journal";
                ToolTip = 'View or edit the payment journal where you can register payments to vendors.';
            }
            action("Purchase Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Journal';
                Image = Journals;
                RunObject = Page "Purchase Journal";
                ToolTip = 'Post any purchase transaction for the vendor. ';
            }
            action(PayVendor)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Pay Vendor';
                Image = SuggestVendorPayments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Vendor Ledger Entries";
                RunPageLink = "Vendor No." = field("No."),
                              "Remaining Amount" = filter(< 0),
                              "Applies-to ID" = filter(''),
                              "Document Type" = filter(Payment);
                ToolTip = 'Opens vendor ledger entries with invoices that have not been paid yet.';
            }
            group("Incoming Documents")
            {
                Caption = 'Incoming Documents';
                Image = SendApprovalRequest;
                action(SendToIncomingDocuments)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send to Incoming Documents';
                    Ellipsis = true;
                    Enabled = SendToIncomingDocEnabled;
                    Image = SendElectronicDocument;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ToolTip = 'Send to Incoming Documents';
                    Visible = SendToIncomingDocumentVisible;

                    trigger OnAction()
                    begin
                        OfficeMgt.InitiateSendToIncomingDocuments(Rec."No.");
                    end;
                }
                action(SendToOCR)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send To OCR';
                    Ellipsis = true;
                    Enabled = SendToOCREnabled;
                    Image = SendElectronicDocument;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ToolTip = 'Send To OCR';
                    Visible = SendToOCRVisible;

                    trigger OnAction()
                    begin
                        OfficeMgt.InitiateSendToOCR(Rec."No.");
                    end;
                }
                action(SendIncomingDocApprovalRequest)
                {
                    AccessByPermission = TableData "Approval Entry" = I;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedOnly = true;
                    ToolTip = 'Request approval to change the record.';
                    Visible = SendIncomingDocApprovalRequestVisible;

                    trigger OnAction()
                    begin
                        OfficeMgt.InitiateSendApprovalRequest(Rec."No.");
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Vendor - Summary Aging")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor - Summary Aging';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTip = 'View a summary of the payables owed to each vendor, divided into three time periods.';

                trigger OnAction()
                begin
                    RunReport(Report::"Vendor - Summary Aging");
                end;
            }
            action("Vendor - Labels")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor - Labels';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTip = 'View mailing labels with the vendors'' names and addresses.';

                trigger OnAction()
                begin
                    RunReport(Report::"Vendor - Labels");
                end;
            }
            action("Vendor - Balance to Date")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor - Balance to Date';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTip = 'View a detail balance for selected vendors.';

                trigger OnAction()
                begin
                    RunReport(Report::"Vendor - Balance to Date");
                end;
            }
            action("Vendor Statement")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Statement';
                Image = Document;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Vendor.SetRange("No.", Rec."No.");
                    Report.Run(69036, true, false, Vendor);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CreateVendorFromTemplate;
        ActivateFields;
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookManagement.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);

        if Rec."No." <> '' then
            CurrPage.AgedAccPayableChart.Page.UpdateChartForVendor(Rec."No.");
    end;

    trigger OnAfterGetRecord()
    begin
        ActivateFields;
    end;

    trigger OnInit()
    begin
        SetVendorNoVisibilityOnFactBoxes;

        ContactEditable := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        if GuiAllowed then
            if Rec."No." = '' then
                if DocumentNoVisibility.VendorNoSeriesIsDefault then
                    NewMode := true;
        Rec.Registered := Rec.Registered::No;
    end;

    trigger OnOpenPage()
    var
        PermissionManager: Codeunit "Permission Manager";
    begin
        ActivateFields;
        IsOfficeAddin := OfficeMgt.IsAvailable;
        SetNoFieldVisible;
        //cc//      IsSaaS := PermissionManager.SoftwareAsAService;
    end;

    var
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        OfficeMgt: Codeunit "Office Management";
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Text001: label 'Do you want to allow payment tolerance for entries that are currently open?';
        Text002: label 'Do you want to remove payment tolerance from entries that are currently open?';
        FormatAddress: Codeunit "Format Address";
        [InDataSet]
        ContactEditable: Boolean;
        [InDataSet]
        SocialListeningSetupVisible: Boolean;
        [InDataSet]
        SocialListeningVisible: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        ShowMapLbl: label 'Show on Map';
        IsOfficeAddin: Boolean;
        CanCancelApprovalForRecord: Boolean;
        SendToOCREnabled: Boolean;
        SendToOCRVisible: Boolean;
        SendToIncomingDocEnabled: Boolean;
        SendIncomingDocApprovalRequestVisible: Boolean;
        SendToIncomingDocumentVisible: Boolean;
        NoFieldVisible: Boolean;
        NewMode: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        IsSaaS: Boolean;
        IsCountyVisible: Boolean;
        Vendor: Record Vendor;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";

    local procedure ActivateFields()
    begin
        SetSocialListeningFactboxVisibility;
        ContactEditable := Rec."Primary Contact No." = '';
        IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
        if OfficeMgt.IsAvailable then
            ActivateIncomingDocumentsFields;
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields;
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    //cc//SocialListeningMgt: Codeunit "Social Listening Management";

    begin
        //cc//    SocialListeningMgt.GetVendFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    end;

    local procedure SetVendorNoVisibilityOnFactBoxes()
    begin
        //cc//    CurrPage.VendorHistBuyFromFactBox.Page.SetVendorNoVisibility(false);
        //cc//    CurrPage.VendorHistPayToFactBox.Page.SetVendorNoVisibility(false);
        //cc//   CurrPage.VendorStatisticsFactBox.Page.SetVendorNoVisibility(false);
    end;

    local procedure RunReport(ReportNumber: Integer)
    var
        Vendor: Record Vendor;
    begin
        Vendor.SetRange("No.", Rec."No.");
        Report.RunModal(ReportNumber, true, true, Vendor);
    end;

    local procedure ActivateIncomingDocumentsFields()
    var
        IncomingDocument: Record "Incoming Document";
    begin
        if OfficeMgt.OCRAvailable then begin
            SendToIncomingDocumentVisible := true;
            SendToIncomingDocEnabled := OfficeMgt.EmailHasAttachments;
            SendToOCREnabled := OfficeMgt.EmailHasAttachments;
            SendToOCRVisible := IncomingDocument.OCRIsEnabled and not IsIncomingDocApprovalsWorkflowEnabled;
            SendIncomingDocApprovalRequestVisible := IsIncomingDocApprovalsWorkflowEnabled;
        end;
    end;

    local procedure IsIncomingDocApprovalsWorkflowEnabled(): Boolean
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowDefinition: Query "Workflow Definition";
    begin
        WorkflowDefinition.SetRange(Table_ID, Database::"Incoming Document");
        WorkflowDefinition.SetRange(Entry_Point, true);
        WorkflowDefinition.SetRange(Enabled, true);
        WorkflowDefinition.SetRange(Type, WorkflowDefinition.Type::"Event");
        WorkflowDefinition.SetRange(Function_Name, WorkflowEventHandling.RunWorkflowOnSendIncomingDocForApprovalCode);
        WorkflowDefinition.Open;
        while WorkflowDefinition.Read do
            exit(true);

        exit(false);
    end;

    local procedure CreateVendorFromTemplate()
    var
        //cc//      MiniVendorTemplate: Record "Mini Vendor Template";
        Vendor: Record Vendor;
        VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
        ConfigTemplateHeader: Record "Config. Template Header";
        EUVATRegistrationNoCheck: Page "EU VAT Registration No Check";
        VendorRecRef: RecordRef;
    begin
        OnBeforeCreateVendorFromTemplate(NewMode);

        if NewMode then begin
            //cc//       if MiniVendorTemplate.NewVendorFromTemplate(Vendor) then begin
            if VATRegNoSrvConfig.VATRegNoSrvIsEnabled then
                if Vendor."Validate EU Vat Reg. No." then begin
                    EUVATRegistrationNoCheck.SetRecordRef(Vendor);
                    Commit;
                    EUVATRegistrationNoCheck.RunModal;
                    EUVATRegistrationNoCheck.GetRecordRef(VendorRecRef);
                    VendorRecRef.SetTable(Vendor);
                end;
            Rec.Copy(Vendor);
            CurrPage.Update;
        end else begin
            ConfigTemplateHeader.SetRange("Table ID", Database::Vendor);
            ConfigTemplateHeader.SetRange(Enabled, true);
            if not ConfigTemplateHeader.IsEmpty then
                CurrPage.Close;
        end;
        NewMode := false;
    end;
    //cc//    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.VendorNoIsVisible;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateVendorFromTemplate(var NewMode: Boolean)
    begin
    end;
}
