#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70038 "Direct RFQ"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(Direct));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Requisition Header1" where("Process Type" = filter(Direct));
                }
                field("Procurement Plan No"; Rec."Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Confirm('Are u sure u want to buy from this supplier', true) then begin
                            PurchReq.Reset;
                            PurchReq.SetRange("No.", Rec."Requisition No");
                            if PurchReq.FindSet then begin
                                //PurchReq.GET("Requisition No") THEN
                                if UserId = PurchReq."Assigned User ID" then begin
                                    PurchReq."Supplier Code" := Rec."Vendor No";
                                    PurchReq.Modify;
                                end else
                                    Error('User %1 has not been assigned permission to generate Purchase Order for this requisition', UserId);
                            end;
                        end;// ELSE ERROR('No Supplier has won this tender');
                    end;
                }
                field("Generate Multiple LPO"; Rec."Generate Multiple LPO")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000016; "Procurement Request Lines")
            {
                SubPageLink = "Requisition No" = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Request for EOI")
            {
                Caption = 'Request for EOI';
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Tender Mandatory Requirements";
                    RunPageLink = "Tender No" = field(No);
                }
                action("Technical Specifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Technical Specifications';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Tender Specifications";
                    RunPageLink = "Requisition No" = field(No);
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page Bidders;
                    RunPageLink = "Ref No." = field(No);
                }
                action("Opening Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Opening Summary';
                    RunObject = Page "Tender Bidders Summary";
                    RunPageLink = "Ref No." = field(No);
                }
                action("<Page Supplier Selection>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders Supplier Selection';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Tender Supplier";
                    RunPageLink = "Reference No." = field(No);
                    RunPageView = sorting("Reference No.", "Supplier No");
                }
                action("Attach Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Justification Memo';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        filename: Text;
                        filecu: Codeunit "File Management";
                        setuprec: Record "Purchases & Payables Setup";
                    begin
                        setuprec.Reset;
                        setuprec.Get;
                        //cc//      filename := filecu.OpenFileDialog('Attach Justification Memo', 'Select Memo Name', '');
                        if filename <> '' then begin
                            //cc//       filecu.CopyClientFile(filename, setuprec."Direct Documents Path" + filecu.GetFileName(filename), true);
                            Rec."Justification Memo" := setuprec."Direct Documents Path" + filecu.GetFileName(filename);
                            Message('Memo Attached Successfully!');
                        end;
                    end;
                }
                action("View Memo")
                {
                    ApplicationArea = Basic;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Rec."Justification Memo" <> '' then begin
                            Hyperlink(Rec."Justification Memo");
                        end;
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //if ApprovalMgt.CheckProcApprovalPossible(Rec) then
                        //ApprovalMgt.OnSendProcDocForApproval(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //cc//ApprovalMgt.OnCancelProcDocApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        Doctype := Doctype::Procurement;
                        //cc// WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, Database::"Procurement Request", Doctype, Rec.No);
                    end;
                }
                action("Generate Purchase Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Purchase Order';
                    Enabled = GenerateLPO;
                    Image = CreateBinContent;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Purchline: Record "Purchase Line";
                        Budgetrec: Record "Procurement Request Lines";
                        setuprec99: Record "General Ledger Setup";
                        Purchline23: Record "Procurement Request Lines";
                    begin
                        ValidateLines;
                        if Rec."Direct?" = true then begin
                            if Rec."Justification Memo" = '' then begin
                                Error('You must Attach a Justification Memo in Direct Procurement Method!');
                            end;
                        end;
                        //==========================================================================
                        Purchline23.Reset;
                        Purchline23.SetFilter(Purchline23."Requisition No", Rec.No);
                        if Purchline23.FindSet then
                            repeat
                                //ERROR('%1',Purchline23."Unit Price");
                                //Purchline23.TESTFIELD(Purchline23.Activity);
                                if Purchline23.Type = Purchline23.Type::Item then begin
                                    setuprec99.Reset; //ERROR('*%1',Purchline23."Unit Price");
                                    setuprec99.Get;
                                    Budgetrec.Reset;
                                    Budgetrec.SetFilter(Budgetrec."Procurement Plan", '%1', Purchline23."Procurement Plan");
                                    Budgetrec.SetFilter(Budgetrec."Procurement Plan Item", '%1', Purchline23."Procurement Plan Item");
                                    if Budgetrec.FindSet then begin
                                        // ERROR('**%1  %2',Purchline23."Unit Price",Budgetrec."Unit Price");
                                        if Budgetrec."Unit Price" < Purchline23."Unit Price" then begin
                                            Message('You have Quoted a Higher Cost Per Item As Compared to the Budget.\Current Budget Figure %1\Your Figure: %2', Budgetrec."Unit Price", Purchline23."Unit Price");
                                            exit;
                                        end;
                                    end;
                                end;
                            until Purchline23.Next = 0;
                        //=========================================================================

                        Rec.TestField(Rec.Title);
                        Rec.TestField(Rec."Vendor No");
                        Rec.TestField(Rec."Requisition No");
                        Rec.TestField(Rec."Supplier Category");

                        if not Rec."Generate Multiple LPO" then
                            PurchReq.Reset;
                        PurchReq.SetRange("No.", Rec."Requisition No");
                        if PurchReq.FindSet then
                            //IF PurchReq.GET("Requisition No")  THEN
                            //IF PurchReq.Status = PurchReq.Status::Released THEN BEGIN
                            Rec.CalcFields(Rec."Procurement Amount");
                        PurchReq.CalcFields(Amount);

                        if Rec."Procurement Amount" > PurchReq.Amount then
                            Error('The Procurement Amount %1 cannot be more than the Purchase Request Approved Amount %2', Rec."Procurement Amount", PurchReq.Amount);

                        if Confirm('Are you sure you want to generate Purchase Order for the selected Vendor No ' + Rec."Vendor No" + '?', true) then begin
                            if UserId = PurchReq."Assigned User ID" then
                                PurchReq.CreatePurchaseOrderProcMethod(Rec)
                            else
                                Error('User %1 has not been assigned permission to generate Purchase Order for this requisition', UserId);
                        end else
                            exit;

                        //END

                        //ELSE ERROR(Text000);

                        CurrPage.Close;
                    end;
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                action("Request for Quotations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Quotations';

                    trigger OnAction()
                    begin
                        //SupplierSelect.RESET;
                        //SupplierSelect.SETRANGE(SupplierSelect."Reference No.",No);
                        //IF SupplierSelect.FIND('-') THEN BEGIN
                        //REPEAT
                        //REPORT.RUN(51511272,TRUE,TRUE,Rec);
                        //UNTIL SupplierSelect.NEXT=0;
                        //END;

                        SupplierSelect.Reset;
                        SupplierSelect.SetFilter("Reference No.", Rec.No);
                        Report.Run(51511025, true, true, SupplierSelect);
                        SupplierSelect.Reset;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    //cc//     //RunObject =Report UnknownReport51511025;
                    Visible = false;

                    trigger OnAction()
                    begin

                        //SupplierSelect.RESET;
                        //SupplierSelect.SETRANGE(SupplierSelect."Reference No.",No);
                        //IF SupplierSelect.FIND('-') THEN BEGIN
                        //REPEAT
                        Report.Run(51511272, true, true, Rec);
                        //UNTIL SupplierSelect.NEXT=0;
                        //END;
                        //SupplierSelect.RESET;
                    end;
                }
                action("Cost Comparison Sheet")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison Sheet';

                    trigger OnAction()
                    begin
                        TenderBids.Reset;
                        TenderBids.SetFilter(TenderBids."Requisition No", Rec.No);
                        Report.Run(51511393, true, true, TenderBids);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Generate Multiple LPO" then
            GenerateLPO := false
        else
            GenerateLPO := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Process Type" := Rec."process type"::Direct;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Generate Multiple LPO" then
            GenerateLPO := false
        else
            GenerateLPO := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::Direct;
        Rec."Direct?" := true;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Generate Multiple LPO" then
            GenerateLPO := false
        else
            GenerateLPO := true;
    end;

    var
        FileDirectory: Text[100];
        FileName: Text[100];
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
        CompInfo: Record "Company Information";
        TenderBids: Record "Tender Bids";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        PurchReq: Record "Purchase Header";
        Text000: label 'The Status has to be Released';
        Text001: label 'A Purchase Order has already been created for this Requisition';
        GenerateLPO: Boolean;
        Doctype: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Imprest Memo","staff Claims","Payment Voucher","Petty Cash",Imprest,Surrender,Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition",Sclaims,"Salary Voucher","Grant Funding Application",Procurement;


    procedure PrintToBullZip()
    begin
        SupplierSelect.SetRange(SupplierSelect."Reference No.", Rec.No);

        ReportID := 51511025;
        FileDirectory := 'C:\Users\Jake\Desktop';

        //Report.SaveAsPdf(ReportID, FileDirectory, Rec);
        ////Report.SaveAsPdf(FileDirectory);

        /*
            CREATE(BullZipPDF);
        
        
        //ReportID := REPORT::"Customer - List";
        ReportID :=50050;
        FileDirectory := 'C:\ERC\';
        
        Window.OPEN('processing Supplier ######################1##');
        
        //Object.Get(Object.Type::Report,'',ReportID);
        
        IF SupplierSelect.FINDSET THEN REPEAT
          Window.UPDATE(1,SupplierSelect."Supplier Name");
          FileName := SupplierSelect."Supplier Name" + '.pdf';
          BullZipPDF.Init;
          BullZipPDF.LoadSettings;
          RunOnceFile := BullZipPDF.GetSettingsFileName(TRUE);
          BullZipPDF.SetValue('Output',FileDirectory+FileName);
          BullZipPDF.SetValue('Showsettings', 'never');
          BullZipPDF.SetValue('ShowPDF', 'no');
          BullZipPDF.SetValue('ShowProgress', 'no');
          BullZipPDF.SetValue('ShowProgressFinished', 'no');
          BullZipPDF.SetValue('SuppressErrors', 'yes');
          BullZipPDF.SetValue('ConfirmOverwrite', 'no');
          BullZipPDF.WriteSettings(TRUE);
          SupplierSelect2 := SupplierSelect;
          SupplierSelect2.SETRECFILTER;
          REPORT.RUNMODAL(ReportID,FALSE,FALSE,SupplierSelect2);
        
          TimeOut := 0;
          WHILE EXISTS(RunOnceFile) AND (TimeOut < 10) DO BEGIN
              SLEEP(1000);
              TimeOut := TimeOut + 1;
          END;
        
        
        
        Subject:='REQUEST FOR QUOTATION '+SupplierSelect."Reference No.";
        Body:='Please find attached Quotation';
        CCName:='chelimo@erc.go.ke';
        //E-mail the files
        PrequalifiedSupRec.RESET;
        PrequalifiedSupRec.SETRANGE(PrequalifiedSupRec.Name,SupplierSelect."Supplier Name");
        IF  PrequalifiedSupRec.FIND('-') THEN
        
        MailSent := Mail.NewMessage(PrequalifiedSupRec."E-mail",CCName,Subject,Body,FileDirectory+FileName,TRUE);
        {IF MailSent THEN
        MESSAGE('Message sent')
        ELSE
        MailSent := Mail.Send();}
        
        UNTIL SupplierSelect.NEXT = 0;
        
        Window.CLOSE;
         */

    end;


    procedure ValidateLines()
    var
        Purchline: Record "Purchase Line";
        Workplanrec: Record "Procurement Plan 1";
        procrec: Record "Procurement Plan 1";
        peadminrec: Record "Procurement Plan 1";
        K: Integer;
    begin
        //=======To Validate G/L Accounts or Items Or Fixed Assets on Lines before sending for Approvals============
        K := 0;
        Purchline.Reset;
        Purchline.SetFilter(Purchline."Requisition No", Rec.No);
        if Purchline.FindSet then
            repeat
                K += 1;
                /*IF Purchline."Activity Type"=Purchline."Activity Type"::WorkPlan THEN BEGIN
                   Workplanrec.RESET;
                   Workplanrec.SETFILTER(Workplanrec.Code,Purchline.Activity);
                   Workplanrec.SETFILTER(Workplanrec."Work Plan Code",Purchline."Current Budget");
                  // type:=type::"G/L Account";
                   Workplanrec.FINDSET;
                   IF Purchline.No<>Workplanrec."G/L Account" THEN BEGIN
                      //error('1. %1\2 %2',Purchline."No.",Workplanrec."G/L Account");
                      ERROR('Purchase Line No: '+FORMAT(K) +'\There is a Mismatch in your G/L Accounts Code as Compared to Budget Setup.\Please Click Update Activity Code or Consult Finance!!!');
                   END;
               END;
               IF Purchline."Activity Type"=Purchline."Activity Type"::"Admin & PE" THEN BEGIN
                   peadminrec.RESET;
                   peadminrec.SETFILTER(peadminrec.Code,Purchline."Current Budget");
                   peadminrec.SETFILTER(peadminrec."PE Activity Code",Purchline.Activity);
                   IF peadminrec.FINDSET THEN BEGIN
                       //type:=type::"G/L Account";
                       IF Purchline.No<>peadminrec."G/L Account" THEN BEGIN
                            ERROR('Purchase Line No: '+FORMAT(K) +'\There is a Mismatch in your G/L Accounts Code as Compared to Budget Setup.\Please Click Update Activity Code or Consult Finance!!!');

                       END;
                   END;
               END;*/

                if Purchline."Activity Type" = Purchline."activity type"::"Proc Plan" then begin
                    procrec.Reset;
                    procrec.SetFilter(procrec."Plan Year", Purchline."Current Budget"); //error(Purchline."Current Budget");
                    procrec.SetFilter(procrec."Plan Item No", Purchline.Activity);
                    if procrec.FindSet then begin
                        if procrec.Type = procrec.Type::"G/L Account" then begin
                            if Purchline.Type <> Purchline.Type::"G/L Account" then begin
                                Error('Purchase Line No: ' + Format(K) + '\There is a Mismatch in your Type Field as Compared to Budget Setup.\Please Click Update Activity Code or Consult Finance!!!');

                            end;
                            if Purchline."No." <> procrec."No." then begin
                                Error('Purchase Line No: ' + Format(K) + '\There is a Mismatch in your No. Field Code as Compared to Budget Setup.\Please Click Update Activity Code or Consult Finance!!!');

                            end;
                        end;
                        if procrec.Type = procrec.Type::Item then begin
                            if Purchline.Type <> Purchline.Type::Item then begin
                                Error('Purchase Line No: ' + Format(K) + '\There is a Mismatch in your Type Field as Compared to Budget Setup.\Please Click Update Activity Code or Consult Finance!!!');

                            end;
                            if Purchline."No." <> procrec."No." then begin
                                Error('Purchase Line No: ' + Format(K) + '\There is a Mismatch in your No. Field Code as Compared to Budget Setup.\Please Click Update Activity Code or Consult Finance!!!');

                            end;

                        end;
                        if procrec.Type = procrec.Type::"Fixed Asset" then begin
                            if Purchline.Type <> Purchline.Type::"Fixed Asset" then begin
                                Error('Purchase Line No: ' + Format(K) + '\There is a Mismatch in your Type Field as Compared to Budget Setup.\Please Click Update Activity Code or Consult Finance!!!');

                            end;
                            if Purchline."No." <> procrec."No." then begin
                                Error('Purchase Line No: ' + Format(K) + '\There is a Mismatch in your No. Field Code as Compared to Budget Setup.\Please Click Update Activity Code or Consult Finance!!!');

                            end;

                        end;


                    end;
                end;
            until Purchline.Next = 0;
        //==========================================================================================================

    end;
}
