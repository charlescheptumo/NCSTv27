#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70153 "Tender Bids A"
{
    PageType = List;
    SourceTable = "Tender Bids";
    SourceTableView = sorting("Requisition No", "Bidder Name", "Bidder Email", No, "Line No")
                      where("Evaluation Decision" = const(Responsive),
                            "Financial Evaluation Decision" = const(Pass));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Linked vendor"; Rec."Linked vendor")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Decision"; Rec."Evaluation Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Technical Score"; Rec."Technical Score")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Evaluation Decision"; Rec."Financial Evaluation Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Score"; Rec."Financial Score")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field(Discount; Rec.Discount)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Start Technical Evaluation")
            {
                ApplicationArea = Basic;
                Caption = 'Submit Technical Evaluation';
                Image = WorkCenterLoad;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    rec5: Record "Procurement Request";
                    rec7: Record Bidders;
                    supplierrec: Record "Prequalified Suppliers1";
                    rfqreport: Report "Request for Quotation";
                    Supplierrec2: Record "Supplier Selection1";
                    setuprec: Record "Purchases & Payables Setup";
                    //cc   emailrec: Record "SMTP Mail Setup";
                    //cc  emailcu: Codeunit "SMTP Mail";
                    emailhdr: Text;
                    emailbody: Text;
                begin
                    /* rec5.RESET;
                      rec5.GET("Requisition No");
                     IF rec5."In Award?"=TRUE THEN BEGIN
                       ERROR('The Quotation is already in award stage!');
                     END;/*/
                    rec5.Reset;
                    rec5.Get(Rec."Requisition No");
                    //Rec.RESET;
                    //rec.SETRANGE("Requisition No",No);
                    Rec.SetRange(Selected, true);
                    //Rec.SETFILTER(Amount,'<>%1',0);
                    if Rec.FindSet then begin
                        //MESSAGE('Financial Evaluation can begin in a separate Menu..');
                        rec5.Reset;
                        rec5.Get(Rec."Requisition No");
                        rec5."In Technical?" := true;
                        // rec5."In Financial?":=TRUE;
                        // rec5."In Award?":=TRUE;
                        //rec5."Pending LPO?":=TRUE;
                        rec5.Modify;
                        NotifyTheSelectedVendor(Rec."Linked vendor", Rec.Description, Rec."Requisition No");
                        Message('Please Proceed To Financial Evaluation in a separate Window');
                        CurrPage.Close;
                    end;

                    //IF NOT Rec.FINDSET THEN BEGIN
                    // ERROR('Please Fill in the Financial Amount(s).!!!');
                    //END;

                end;
            }
            action("Technical Attachments")
            {
                ApplicationArea = Basic;
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Bid Filed Document";
                RunPageLink = "No." = field("Requisition No"),
                              "Vendor No" = field("Linked vendor"),
                              "Evaluation Type" = const(Technical);
            }
            action("Start Financial Evaluation")
            {
                ApplicationArea = Basic;
                Caption = 'Submit Financial Evaluation';
                Image = WorkCenterLoad;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    rec5: Record "Procurement Request";
                    rec7: Record Bidders;
                    supplierrec: Record "Prequalified Suppliers1";
                    rfqreport: Report "Request for Quotation";
                    Supplierrec2: Record "Supplier Selection1";
                    setuprec: Record "Purchases & Payables Setup";
                    //cc   emailrec: Record "SMTP Mail Setup";
                    //cc emailcu: Codeunit "SMTP Mail";
                    emailhdr: Text;
                    emailbody: Text;
                begin
                    /* rec5.RESET;
                      rec5.GET("Requisition No");
                     IF rec5."In Award?"=TRUE THEN BEGIN
                       ERROR('The Quotation is already in award stage!');
                     END;/*/
                    rec5.Reset;
                    rec5.Get(Rec."Requisition No");
                    //Rec.RESET;
                    //rec.SETRANGE("Requisition No",No);
                    Rec.SetRange(Selected, true);
                    Rec.SetFilter(Amount, '<>%1', 0);
                    if Rec.FindSet then begin
                        //MESSAGE('Financial Evaluation can begin in a separate Menu..');
                        rec5.Reset;
                        rec5.Get(Rec."Requisition No");
                        // rec5."In Technical?":=TRUE;
                        rec5."In Financial?" := true;
                        //rec5."In Award?":=TRUE;
                        // rec5."Pending LPO?":=TRUE;
                        rec5.Modify;
                        NotifyTheSelectedVendor(Rec."Linked vendor", Rec.Description, Rec."Requisition No");
                        Message('Please Proceed Award Stage in a separate Window');
                        CurrPage.Close;
                    end;

                    if not Rec.FindSet then begin
                        Error('Please Fill in the Financial Amount(s).!!!');
                    end;

                end;
            }
            action("Financial Attachments")
            {
                ApplicationArea = Basic;
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Bid Filed Document";
                RunPageLink = "No." = field("Requisition No"),
                              "Vendor No" = field("Linked vendor"),
                              "Evaluation Type" = const(Financial);
            }
            action("Proceed to Award?")
            {
                ApplicationArea = Basic;
                Image = WorkCenterLoad;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rec5: Record "Procurement Request";
                    rec7: Record Bidders;
                    supplierrec: Record "Prequalified Suppliers1";
                    rfqreport: Report "Request for Quotation";
                    Supplierrec2: Record "Supplier Selection1";
                    setuprec: Record "Purchases & Payables Setup";
                    //cc   emailrec: Record "SMTP Mail Setup";
                    //cc  emailcu: Codeunit "SMTP Mail";
                    emailhdr: Text;
                    emailbody: Text;
                begin
                    /* rec5.RESET;
                      rec5.GET("Requisition No");
                     IF rec5."In Award?"=TRUE THEN BEGIN
                       ERROR('The Quotation is already in award stage!');
                     END;/*/
                    rec5.Reset;
                    rec5.Get(Rec."Requisition No");
                    //Rec.RESET;
                    //rec.SETRANGE("Requisition No",No);
                    Rec.SetRange(Selected, true);
                    Rec.SetFilter(Amount, '<>%1', 0);
                    if Rec.FindSet then begin
                        //MESSAGE('Financial Evaluation can begin in a separate Menu..');
                        rec5.Reset;
                        rec5.Get(Rec."Requisition No");
                        rec5."In Technical?" := true;
                        rec5."In Financial?" := true;
                        rec5."In Award?" := true;
                        rec5."Pending LPO?" := true;
                        rec5.Modify;
                        NotifyTheSelectedVendor(Rec."Linked vendor", Rec.Description, Rec."Requisition No");
                        Message('Please Proceed in a separate Window');
                        CurrPage.Close;
                    end;

                    if not Rec.FindSet then begin
                        Error('Please Fill in the Financial Amount(s).!!!');
                    end;

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        /*
        IF "In Technical?"=TRUE THEN BEGIN
            IF "Quotation Evaluation"=TRUE THEN BEGIN
               openingbl3:=TRUE;
            END;
        END;
        
        IF "In Financial?"=TRUE THEN BEGIN
            IF "Quotation Evaluation"=TRUE THEN BEGIN
                openingbl4:=TRUE;
            END;
        END;
        IF "In Award?"=TRUE THEN BEGIN
           IF "Quotation Evaluation"=TRUE THEN BEGIN
               openingbl5:=TRUE;
           END;
        END;
        */

    end;

    var
        FileDirectory: Text[50];
        FileName: Text[500];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer: Record Customer;
        Customer2: Record Customer;
        SupplierSelect: Record "Supplier Selection1";
        SupplierSelect2: Record "Supplier Selection1";
        Mail: Codeunit Mail;
        MailSent: Boolean;
        PrequalifiedSupRec: Record "Prequalified Suppliers1";
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        GLsetup: Record "General Ledger Setup";
        //ccc  SMTPMail: Codeunit "SMTP Mail";
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        SenderName: Text[250];
        SenderAddress: Text[250];
        Recipients: Text[250];
        ProcurementRequest: Record "Procurement Request";
        SearchString: Text[250];
        RecLink: Record "Record Link";
        ProcurementReqRef: RecordRef;
        Trash: Record "Procurement Request";
        PurchSetup: Record "Purchases & Payables Setup";
        TenderBids: Record "Tender Bids";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        CompInfo: Record "Company Information";
        Seeapproved: Boolean;
        Seeapproved2: Boolean;
        Seeapproved3: Boolean;
        quotationopening: Boolean;
        openingbl: Boolean;
        openingbl2: Boolean;
        openingbl3: Boolean;
        openingbl4: Boolean;
        openingbl5: Boolean;
        openingbl6: Boolean;
        "ineval?": Boolean;
        seepersons: Boolean;
        seelpo: Boolean;
        Doctype: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Imprest Memo","staff Claims","Payment Voucher","Petty Cash",Imprest,Surrender,Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition",Sclaims,"Salary Voucher","Grant Funding Application",Procurement;
        ProcurementRequestLines: Record "Procurement Request Lines";
        WindowisOpen: Boolean;
        QuotationReport: Report "Request for Quotation";
        Suppliers: Record "Supplier Selection1";
        DocAttached: Record "Document Attachment";
        Purch: Record "Purchase Header";

    local procedure NotifyTheSelectedVendor("VendorNo.": Code[50]; BidDescription: Text; RequisitionNo: Code[50])
    var
        Vendor: Record Vendor;
        ///cc   SMTPSetup: Record "SMTP Mail Setup";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        ProcurementSetup: Record "Procurement Setup";
    begin
        /*ObjCompany.GET();
           Vendor.RESET;
           Vendor.SETRANGE("No.","VendorNo.");
           IF Vendor.FIND('-') THEN BEGIN
             Header:='Approval Notification Overview  ';
             IF ProcurementSetup.GET() THEN BEGIN
               SenderEmail:=ProcurementSetup."Default Proc Email Contact";
             END;
             IF Vendor."No." <> '' THEN BEGIN
               SMTPMail.CreateMessage(SenderEmail,SenderEmail,Vendor."E-Mail",Header,'',TRUE);
               SMTPMail.AppendBody('<br>');
               SMTPMail.AppendBody('Hello, ');
               SMTPMail.AppendBody('<br>');
               SMTPMail.AppendBody('You are registered to receive notifications related to '+ObjCompany.Name + '. This is a message to notify you that:');
               SMTPMail.AppendBody('<HR>');
               SMTPMail.AppendBody('You have been Awarded : ' +'<b>'+BidDescription + ':Reference Number: '+ RequisitionNo);
               SMTPMail.AppendBody('<br><br>');
               SMTPMail.AppendBody('<br>');
               SMTPMail.AppendBody('This is a system generated mail.');
               SMTPMail.AppendBody('<br>');
               SMTPMail.Send;
              MESSAGE('Vendor Notified Successfuly.');
             END;
           END;*/

    end;
}
