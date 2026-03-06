#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70157 "Bid Opening Register Line3"
{
    PageType = ListPart;
    SourceTable = "Bid Opening Register Lines2";

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
                    //cc//   emailrec: Record "SMTP Mail Setup";
                    //cc//   emailcu: Codeunit "SMTP Mail";
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
        //cc//  SMTPMail: Codeunit "SMTP Mail";
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
}
