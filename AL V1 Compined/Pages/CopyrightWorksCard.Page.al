#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56050 "Copyright Works Card"
{
    Caption = 'Copyright Works Card';
    PageType = Card;
    SourceTable = "Service Item";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the number of the item.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains a description of this item.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Company Reg No"; Rec."Company Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("ID. No."; Rec."ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Captured by"; Rec."Captured by")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Customer)
            {
                Caption = 'Customer';
                Editable = false;
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the number of the customer who owns this item.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Rec.Name, Rec."Name 2", Rec.Address, Rec."Address 2", Rec."Post Code",
                          Rec.City, Rec.Contact, Rec."Phone No.", Rec.County, Rec."Country/Region Code");
                        CustomerNoOnAfterValidate;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of the customer who owns this item.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the address of the customer who owns this item.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Address 2(County)';
                    DrillDown = false;
                    ToolTip = 'Specifies an additional line of the address.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the postal code of the address.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the city of the customer address.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of the person you regularly contact when you do business with the customer who owns this item.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the customer phone number.';
                }
                field("Location of Service Item"; Rec."Location of Service Item")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the code of the location of this item.';
                }
            }
            group("Agent Details")
            {
                Caption = 'Agent Details';
                Editable = false;
                field("Agent First Name"; Rec."Agent First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Surname"; Rec."Agent Surname")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Middle Name"; Rec."Agent Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Address"; Rec."Agent Address")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Address 2"; Rec."Agent Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Agent City"; Rec."Agent City")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Contact"; Rec."Agent Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Agent Phone No."; Rec."Agent Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agent ID. No."; Rec."Agent ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Agent P.I.N"; Rec."Agent P.I.N")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Authorship Details")
            {
                Caption = 'Authorship Details';
                Editable = false;
                field("Author First Name"; Rec."Author First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Author Agent Surname"; Rec."Author Agent Surname")
                {
                    ApplicationArea = Basic;
                }
                field("Author Middle Name"; Rec."Author Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Author Address"; Rec."Author Address")
                {
                    ApplicationArea = Basic;
                }
                field("Author Address 2"; Rec."Author Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Author City"; Rec."Author City")
                {
                    ApplicationArea = Basic;
                }
                field("Author Contact"; Rec."Author Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Author Phone No."; Rec."Author Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Author ID. No."; Rec."Author ID. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Author P.I.N"; Rec."Author P.I.N")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Copyright Work Details")
            {
                Caption = 'Copyright Work Details';
                Editable = false;
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Work Category"; Rec."Copyright Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Work SubCategory"; Rec."Copyright Work SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Category Description"; Rec."Copyright Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright SubCategory Desc"; Rec."Copyright SubCategory Desc")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Fixation/Reduction"; Rec."Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                }
                field(Language; Rec.Language)
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Work Abstract"; Rec."Copyright Work Abstract")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Production Details")
            {
                Caption = 'Production Details';
                Editable = false;
                field("Prod/Pub Name"; Rec."Prod/Pub Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub ID No/Company Reg No"; Rec."Prod/Pub ID No/Company Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub P.I.N"; Rec."Prod/Pub P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment/License Date"; Rec."Assignment/License Date")
                {
                    ApplicationArea = Basic;
                }
                field("1st Country of Production"; Rec."1st Country of Production")
                {
                    ApplicationArea = Basic;
                }
                field(ISBN; Rec.ISBN)
                {
                    ApplicationArea = Basic;
                }
                field("Production Category"; Rec."Production Category")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Phone No."; Rec."Prod/Pub Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Prod/Pub Email"; Rec."Prod/Pub Email")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                Editable = false;
                field("Payement Reference No"; Rec."Payemnt Reference No")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No"; Rec."Receipt No")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt Amount"; Rec."Receipt Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Contains the ship-to code for the customer who owns this item.';

                    trigger OnValidate()
                    begin
                        UpdateShipToCode;
                    end;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the name at the address.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the address where this service item is located.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains an additional line of the address.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the postal code of the address.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the city of the address.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Contains the name of a contact person for the address.';
                }
                field("Ship-to Phone No."; Rec."Ship-to Phone No.")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the telephone number for the address.';
                }
            }
            group(Contract)
            {
                Caption = 'Contract';
                field("Default Contract Cost"; Rec."Default Contract Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the default contract cost of a service item that later will be included in a service contract or contract quote.';
                }
                field("Default Contract Value"; Rec."Default Contract Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the default contract value of an item that later will be included in a service contract or contract quote.';
                }
                field("Default Contract Discount %"; Rec."Default Contract Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a default contract discount percentage for an item, if this item will be part of a service contract.';
                }
                field("Service Contracts"; Rec."Service Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that this service item is associated with one or more service contracts/quotes.';
                }
            }
            group(Vendor)
            {
                Caption = 'Vendor';
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number of the vendor for this item.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Rec."Vendor Name");
                    end;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Contains the vendor name for this item.';
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the number assigned to this service item by its vendor.';
                }
                field("Vendor Item Name"; Rec."Vendor Item Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the name assigned to this item by the vendor.';
                }
            }
            group(Detail)
            {
                Caption = 'Detail';
                field("Sales Unit Cost"; Rec."Sales Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the unit cost of this item when it was sold.';
                }
                field("Sales Unit Price"; Rec."Sales Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the unit price of this item when it was sold.';
                }
                field("Sales Date"; Rec."Sales Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the date when this item was sold.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the code of the unit of measure used when this item was sold.';
                }
                field("Installation Date"; Rec."Installation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Contains the date when this item was installed at the customer''s site.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = field("Customer No."),
                              "Date Filter" = field("Date Filter");
                Visible = true;
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
            group("&Service Item")
            {
                Caption = '&Service Item';
                Image = ServiceItem;
                separator(Action123)
                {
                }
                action("&Components")
                {
                    ApplicationArea = Basic;
                    Caption = '&Components';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Service Item Component List";
                    RunPageLink = Active = const(true),
                                  "Parent Service Item No." = field("No.");
                    RunPageView = sorting(Active, "Parent Service Item No.", "Line No.");
                }
                action("&Dimensions")
                {
                    ApplicationArea = Basic;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5940),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                group(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action39)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Statistics';
                        Image = Statistics;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Service Item Statistics";
                        RunPageLink = "No." = field("No.");
                        ShortCutKey = 'F7';
                    }
                    action("Tr&endscape")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Tr&endscape';
                        Image = Trendscape;
                        RunObject = Page "Service Item Trendscape";
                        RunPageLink = "No." = field("No.");
                    }
                }
                group(Troubleshooting)
                {
                    Caption = 'Troubleshooting';
                    Image = Troubleshoot;
                    action("Troubleshooting Setup")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Troubleshooting Setup';
                        Image = Troubleshoot;
                        RunObject = Page "Troubleshooting Setup";
                        RunPageLink = Type = const("Service Item"),
                                      "No." = field("No.");
                    }
                    action("<Page Troubleshooting>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Troubleshooting';
                        Image = Troubleshoot;

                        trigger OnAction()
                        var
                            TroubleshootingHeader: Record "Troubleshooting Header";
                        begin
                            TroubleshootingHeader.ShowForServItem(Rec);
                        end;
                    }
                    separator(Action128)
                    {
                        Caption = '';
                    }
                }
                action("Resource Skills")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Skills';
                    Image = ResourceSkills;
                    RunObject = Page "Resource Skills";
                    RunPageLink = Type = const("Service Item"),
                                  "No." = field("No.");
                }
                action("S&killed Resources")
                {
                    ApplicationArea = Basic;
                    Caption = 'S&killed Resources';
                    Image = ResourceSkills;

                    trigger OnAction()
                    begin
                        Clear(SkilledResourceList);
                        SkilledResourceList.Initialize(ResourceSkill.Type::"Service Item", Rec."No.", Rec.Description);
                        SkilledResourceList.RunModal;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = const("Service Item"),
                                  "Table Subtype" = const(0),
                                  "No." = field("No.");
                }
                separator(Action131)
                {
                    Caption = '';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                group("S&ervice Orders")
                {
                    Caption = 'S&ervice Orders';
                    Image = "Order";
                    action("&Item Lines")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Service Item Lines";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                    }
                    action("&Service Lines")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Service Lines';
                        Image = ServiceLines;
                        RunObject = Page "Service Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                    }
                }
                group("Service Shi&pments")
                {
                    Caption = 'Service Shi&pments';
                    Image = Shipment;
                    action(Action117)
                    {
                        ApplicationArea = Basic;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Posted Shpt. Item Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                    }
                    action(Action113)
                    {
                        ApplicationArea = Basic;
                        Caption = '&Service Lines';
                        Image = ServiceLines;
                        RunObject = Page "Posted Serv. Shpt. Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                    }
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ser&vice Contracts';
                    Image = ServiceAgreement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Serv. Contr. List (Serv. Item)";
                    RunPageLink = "Service Item No." = field("No.");
                    RunPageView = sorting("Service Item No.", "Contract Status");
                }
                separator(Action126)
                {
                    Caption = '';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Service Item Lo&g")
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Item Lo&g';
                    Image = Log;
                    RunObject = Page "Service Item Log";
                    RunPageLink = "Service Item No." = field("No.");
                }
                action("Service Ledger E&ntries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Ledger E&ntries';
                    Image = ServiceLedger;
                    RunObject = Page "Service Ledger Entries";
                    RunPageLink = "Service Item No. (Serviced)" = field("No."),
                                  "Service Order No." = field("Service Order Filter"),
                                  "Service Contract No." = field("Contract Filter"),
                                  "Posting Date" = field("Date Filter");
                    RunPageView = sorting("Service Item No. (Serviced)", "Entry Type", "Moved from Prepaid Acc.", Type, "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                }
                action("&Warranty Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = '&Warranty Ledger Entries';
                    Image = WarrantyLedger;
                    RunObject = Page "Warranty Ledger Entries";
                    RunPageLink = "Service Item No. (Serviced)" = field("No.");
                    RunPageView = sorting("Service Item No. (Serviced)", "Posting Date", "Document No.");
                }
                separator(Action127)
                {
                    Caption = '';
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                Image = NewItem;
                action("New Item")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Item';
                    Image = NewItem;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Item Card";
                    RunPageMode = Create;
                }
            }
        }
        area(reporting)
        {
            action("Service Line Item Label")
            {
                ApplicationArea = Basic;
                Caption = 'Service Line Item Label';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Service Item Line Labels";
            }
            action("Copyright Certificate")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."No.", Rec."No.");
                    if Rec.FindSet then
                        Report.Run(56231, true, true, Rec);
                end;
            }
            action("Email Certificate")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    emailmessage: codeunit "Email Message";
                    emailsend: codeunit "email";
                    body: text[1000];
                begin
                    //cc//
                    //code to send email
                    // SMTPMailSet.Get;
                    // objCustomer.Reset;
                    // objCustomer.Get(Rec."Customer No.");
                    // Notification1.CreateMessage('Kenya Copyright Board ', SMTPMailSet."Email Sender Address", objCustomer."E-Mail", 'Copyright Works',
                    //                 'Dear ' + objCustomer.Name + ',<BR><BR>' +
                    //                 ' Your copyright work ' + UpperCase(Rec."Copyright Title") + ' has been successfully processed.<BR>' +
                    // Text0023 + '<BR>' + '<BR>', true);

                    // Notification1.AppendBody(
                    // '<BR><BR>Kind Regards,' +
                    // '<BR><BR>For any Information, Please Contact' + '<BR>Copyright Registration and Enforcement Department<BR>' +
                    // CompInfo.Name + '<BR>' +
                    // CompInfo.Address + '<BR>' +
                    // CompInfo."Address 2" + '<BR>' +
                    // CompInfo."Phone No." + '<BR>' +
                    // CompInfo.City);
                    // FileDirectory := 'K:/DOCS/';
                    // FileName := 'Certificate_' + Rec."Copyright Title" + '.pdf';
                    // //Report.SaveAsPdf(56231, FileDirectory + FileName, Rec);
                    // Notification1.AddAttachment(FileDirectory + FileName, FileName);
                    // Notification1.Send;

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateShipToCode;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec."Item No." = '' then
            if Rec.GetFilter(Rec."Item No.") <> '' then
                if Rec.GetRangeMin(Rec."Item No.") = Rec.GetRangemax(Rec."Item No.") then
                    Rec."Item No." := Rec.GetRangeMin(Rec."Item No.");

        if Rec."Customer No." = '' then
            if Rec.GetFilter(Rec."Customer No.") <> '' then
                if Rec.GetRangeMin(Rec."Customer No.") = Rec.GetRangemax(Rec."Customer No.") then
                    Rec."Customer No." := Rec.GetRangeMin(Rec."Customer No.");
    end;

    var
        ResourceSkill: Record "Resource Skill";
        SkilledResourceList: Page "Skilled Resource List";
        FileDirectory: Text;
        FileName: Text;
        //SMTPMailSet: Record "SMTP Mail Setup";
        ServiceItem: Record "Service Item";
        Service: Text;
        //Notification1: Codeunit "SMTP Mail";
        objCustomer: Record Customer;
        CompInfo: Record "Company Information";
        Text0023: label 'Please find attached, your copyright work certificate.';

    local procedure UpdateShipToCode()
    begin
        if Rec."Ship-to Code" = '' then begin
            Rec."Ship-to Name" := Rec.Name;
            Rec."Ship-to Address" := Rec.Address;
            Rec."Ship-to Address 2" := Rec."Address 2";
            Rec."Ship-to Post Code" := Rec."Post Code";
            Rec."Ship-to City" := Rec.City;
            Rec."Ship-to Phone No." := Rec."Phone No.";
            Rec."Ship-to Contact" := Rec.Contact;
        end else
            Rec.CalcFields(
              Rec."Ship-to Name", Rec."Ship-to Name 2", Rec."Ship-to Address", Rec."Ship-to Address 2", Rec."Ship-to Post Code", Rec."Ship-to City",
              Rec."Ship-to County", Rec."Ship-to Country/Region Code", Rec."Ship-to Contact", Rec."Ship-to Phone No.");
    end;

    local procedure CustomerNoOnAfterValidate()
    begin
        if Rec."Customer No." <> xRec."Customer No." then
            UpdateShipToCode;
    end;
}
