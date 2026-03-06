#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70128 "Awarded Bidders"
{
    PageType = List;
    SourceTable = "Tender Bids";
    SourceTableView = sorting("Requisition No", "Bidder Name", "Bidder Email", No, "Line No");
    ApplicationArea = All;

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
                Enabled = false;
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
                    //  emailrec: Record "SMTP Mail Setup";
                    //  emailcu: Codeunit "SMTP Mail";
                    emailhdr: Text;
                    emailbody: Text;
                begin
                    /*///Notifying the Suppliers via email...21.10.2019
                    
                    CompInfo.GET();
                    supplierrec.RESET;
                    supplierrec.SETFILTER(supplierrec."Ref No.",No);
                    supplierrec.SETFILTER(supplierrec.Category,rec5."Supplier Category");
                    supplierrec.SETFILTER(supplierrec.Selected,'=%1',TRUE);
                    IF supplierrec.FINDSET THEN  BEGIN
                    REPEAT
                       //Message('%1',supplierrec.Name);
                        supplierrec.TESTFIELD(supplierrec."E-mail");
                        Supplierrec2.RESET;
                        Supplierrec2.SETRANGE(Supplierrec2."Reference No.",No);
                        Supplierrec2.SETRANGE(Supplierrec2."Supplier Name",supplierrec.Name);
                        IF Supplierrec2.FINDSET THEN BEGIN
                    
                          //setuprec.RESET;
                          //setuprec.GET;
                    
                    {///.....18.10.2019 Hunaina
                    FileDirectory:=setuprec."RFQ Documents Path";
                    FileName:='QUOTE_'+DELCHR('Quotation'+ ProcurementRequest.No+'_'+supplierrec.Name, '=', '/')+'.pdf';}
                    
                    
                    Window.OPEN('Notifying the Suppliers....');
                    WindowisOpen:=TRUE;
                    
                    {//Saving the Quotation Document
                    IF FileName <>'' THEN BEGIN
                     //Report.SaveAsPdf(70002,FileDirectory+FileName,Supplierrec2);
                      END;
                    //End Saving...18.10.2019 Hunaina}
                    
                    
                          emailhdr:='QUOTATION AWARD: '+' '+supplierrec.Name;
                          emailbody:='Dear '+supplierrec.Name+'<br><br>';
                          emailbody:=emailbody+'This is to notify you that you have been awarded this Quatation<br><br>';
                          emailbody:=emailbody+'Please print, fill and return to National Commission for Science Technology and Innovation Head Office<br><br>';
                          emailbody:=emailbody+'Kind Regards<br><br>';
                          emailrec.RESET;
                          emailrec.GET;
                          emailcu.CreateMessage('NACOSTI',CompInfo."E-Mail",supplierrec."E-mail",emailhdr,emailbody,TRUE);
                    
                    {//Add the Quotation document as an attachment when emailing ....18.10.2019 Hunaina
                        emailcu.AddAttachment(FileDirectory+FileName, FileName);}
                          emailcu.Send;
                        END;
                    
                    UNTIL supplierrec.NEXT=0;
                    //"Quotation Pending Opening":=TRUE;
                    MESSAGE('Suppliers Notified Successfully!!');
                    CurrPage.CLOSE;
                    //"Issued Date":=TODAY;
                    END;
                    
                    ////End Notifying Suppliers..21.10.2019*/

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

                        /* MESSAGE('Please Proceed in a separate Window');
                         CurrPage.CLOSE;*/

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
        //SMTPMail: Codeunit "SMTP Mail";
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
