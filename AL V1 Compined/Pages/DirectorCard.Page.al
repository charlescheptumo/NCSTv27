#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69089 "Director Card"
{
    Caption = 'Board Members Card';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Approve,Request Approval';
    RefreshOnActivate = true;
    SourceTable = Vendor;
    SourceTableView = where("Vendor Type" = const(Director));
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
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    Editable = ContactEditable;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        ContactOnAfterValidate;
                    end;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Status 1"; Rec."Status 1")
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("Bank Account Number"; Rec.Tel)
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Branch")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Code"; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Branch Name"; Rec."Vendor's Bank")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allowances"; Rec."Total Allowances")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                }
                field("PIN Number"; Rec."PIN Number")
                {
                    ApplicationArea = Basic;
                }
                field("Cumm. PAYE"; Rec."Cumm. PAYE")
                {
                    ApplicationArea = Basic;
                }
                field("Taxable Income"; Rec."Taxable Income")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Pay Mode"; Rec."Payroll Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode Filter"; Rec."Pay Mode Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Pays tax"; Rec."Pays tax")
                {
                    ApplicationArea = Basic;
                }
                field("Non Cash Benefit"; Rec."Non Cash Benefit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;

                    trigger OnDrillDown()
                    var
                        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
                    begin
                        VATRegistrationLogMgt.AssistEditVendorVATReg(Rec);
                    end;
                }
                field(GLN; Rec.GLN)
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Prepayment %"; Rec."Prepayment %")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                field("Application Method"; Rec."Application Method")
                {
                    ApplicationArea = Basic;
                }
                field("Partner Type"; Rec."Partner Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                }
                field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
                {
                    ApplicationArea = Basic;
                }
                field("Our Account No."; Rec."Our Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Rec."Block Payment Tolerance" then begin
                            if Confirm(Text002, false) then
                                PaymentToleranceMgt.DelTolVendLedgEntry(Rec);
                        end else begin
                            if Confirm(Text001, false) then
                                PaymentToleranceMgt.CalcTolVendLedgEntry(Rec);
                        end;
                    end;
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Receiving)
            {
                Caption = 'Receiving';
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Base Calendar Code"; Rec."Base Calendar Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                }
                // field("Customized Calendar"; CalendarMgmt. ( CustomizedCalendar."source type"::Vendor, Rec."No.", '', Rec."Base Calendar Code"))
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Customized Calendar';
                //     Editable = false;

                //     trigger OnDrillDown()
                //     begin
                //         CurrPage.SaveRecord;
                //         Rec.TestField(Rec."Base Calendar Code");
                //        //cc//  CalendarMgmt.ShowCustomizedCalendar(CustomizedCalEntry."source type"::Vendor, Rec."No.", '', Rec."Base Calendar Code");
                //     end;
                // }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("Mi&sc. Article Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Confidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("Q&ualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                }
                separator(Action1000000012)
                {
                }
                action("Absences by Ca&tegories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Absences by Ca&tegories';
                    Image = AbsenceCategory;
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No." = field("No."),
                                  "Employee No. Filter" = field("No.");
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                }
                separator(Action1000000008)
                {
                }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                Image = Purchasing;
            }
            action("Assign Default Earn/Ded")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Default Earn/Ded';
                Ellipsis = true;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                end;
            }
            action("Assign Earnings")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Earnings';
                Ellipsis = true;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Director Ledger Entries";
                RunPageLink = "Director No" = field("No."),
                              Type = const(Payment),
                              Closed = const(false);

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                end;
            }
            action("Assign Deductions")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Deductions';
                Ellipsis = true;
                Image = Cost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Director Ledger Entries";
                RunPageLink = "Director No" = field("No."),
                              Type = const(Deduction),
                              Closed = const(false);

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);
                end;
            }
            action("&Generate Payslip")
            {
                ApplicationArea = Basic;
                Caption = '&Generate Payslip';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    // //IM.GenerateAcquisitionJournal(Rec);
                    //
                    Payperiod.Reset;
                    Payperiod.SetRange(Payperiod.Closed, false);
                    if Payperiod.Find('-') then
                        CurrentMonth := Payperiod."Starting Date";
                    DirectorRec.SetRange(DirectorRec."No.", Rec."No.");
                    DirectorRec.SetRange(DirectorRec."Pay Period Filter", CurrentMonth);

                    Report.Run(89033, true, false, DirectorRec);
                end;
            }
            separator(Action1000000024)
            {
            }
            action("&Run Director Payroll")
            {
                ApplicationArea = Basic;
                Caption = '&Run Director Payroll';
                Ellipsis = true;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    // //IM.GenerateRedemptionJournal(Rec);
                    //
                    Payperiod.Reset;
                    Payperiod.SetRange(Payperiod.Closed, false);
                    if Payperiod.Find('-') then
                        CurrentMonth := Payperiod."Starting Date";
                    DirectorRec.SetRange("No.", Rec."No.");
                    DirectorRec.SetRange("Pay Period Filter", CurrentMonth);
                    Report.Run(89032, true, false, DirectorRec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ActivateFields;
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        ActivateFields;
    end;

    trigger OnInit()
    begin
        ContactEditable := true;
        MapPointVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Vendor Type" := Rec."vendor type"::Director;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        ActivateFields;
        if not MapMgt.TestSetup then
            MapPointVisible := false;
    end;

    var
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        Text001: label 'Do you want to allow payment tolerance for entries that are currently open?';
        Text002: label 'Do you want to remove payment tolerance from entries that are currently open?';
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        ContactEditable: Boolean;
        [InDataSet]
        SocialListeningSetupVisible: Boolean;
        [InDataSet]
        SocialListeningVisible: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        Text003: label 'Text';
        Payperiod: Record "Directorsl PeriodX";
        DirectorRec: Record Vendor;
        CurrentMonth: Date;

    local procedure ActivateFields()
    begin
        SetSocialListeningFactboxVisibility;
        ContactEditable := Rec."Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields;
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    //cc//      //cc//SocialListeningMgt: Codeunit "Social Listening Management";

    begin
        //cc//       SocialListeningMgt.GetVendFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    end;
}
