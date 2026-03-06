#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56152 "Submitted Issuance  card"
{
    Editable = true;
    PageType = Card;
    SourceTable = "ICT Issuance Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised by';
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'No';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Leasing/Issuing"; Rec."Leasing/Issuing")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part(Control6; "Submitted Issuance  Lines")
            {
                SubPageLink = "No." = field("No."),
                              Type = const(Issuance);
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
            }
            systempart(Control18; Notes)
            {
            }
            systempart(Control19; MyNotes)
            {
            }
            systempart(Control20; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(56242, true, true, Rec);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Submit';
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Released;
                    Rec."Document Status" := Rec."document status"::Submitted;
                    Rec.Modify(true);
                    Message('Submitted Successfully');
                    ////cc//if ApprovalsMgmt.CheckIFSApprovalPossible(Rec) THEN
                    ////cc//ApprovalsMgmt.OnSendIFSForApproval(Rec);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Cancel the approval request.';
                Visible = false;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Released);
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                    Message('Approval Request Cancelled');
                    ////ApprovalsMgmt.OnCancelIFSApprovalRequest(Rec);
                    //WorkflowWebhookMgt.FindAndCancel(RECORDID);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Issue';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    UserSetup1: Record "User Setup";
                    ICTIssuanceLines: Record "ICT Issuance Voucher Lines";
                    ReceiverEmail: Text;
                    Email: Text;
                    Body: Text;
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Released);
                    Rec.TestField(Rec."Document Status", Rec."document status"::Submitted);
                    Rec.TestField(Rec.Posted, false);
                    ICTIssuanceVoucherLines.Reset;
                    ICTIssuanceVoucherLines.SetRange("No.", Rec."No.");
                    ICTIssuanceVoucherLines.SetRange(Type, Rec.Type);
                    ICTIssuanceVoucherLines.SetRange(Select, true);
                    if ICTIssuanceVoucherLines.FindSet then begin
                        repeat
                            //MESSAGE('%1',ICTIssuanceVoucherLines.Code);
                            ICTIssuanceEntries.Init;
                            ICTIssuanceEntries."Entry No" := ICTIssuanceEntries."Entry No" + 100;
                            ICTIssuanceEntries."No." := Rec."No.";
                            ICTIssuanceEntries."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                            ICTIssuanceEntries.Directorate := Rec.Directorate;
                            ICTIssuanceEntries.Department := Rec.Department;
                            ICTIssuanceEntries."Division/Unit" := Rec."Division/Unit";
                            ICTIssuanceEntries.Code := ICTIssuanceVoucherLines.Code;
                            ICTIssuanceEntries.Description := ICTIssuanceVoucherLines.Description;
                            ICTIssuanceEntries."Serial No." := ICTIssuanceVoucherLines."Serial No.";
                            ICTIssuanceEntries."FA No" := ICTIssuanceVoucherLines."FA No";
                            ICTIssuanceEntries.Type := ICTIssuanceVoucherLines.Type;
                            ICTIssuanceEntries."Reason For Movement" := ICTIssuanceVoucherLines."Reason For Movement";
                            ICTIssuanceEntries."Issued To User ID" := Rec."Issued To User ID";
                            ICTIssuanceEntries."Issued To No." := Rec."Issued To No.";
                            ICTIssuanceEntries."Issued By" := Rec."Issued By";
                            ICTIssuanceEntries."Issued Date" := Rec."Issued Date";
                            ICTIssuanceEntries.Name := Rec.Name;
                            ICTIssuanceEntries."Duration of Use" := ICTIssuanceVoucherLines."Duration of Use";
                            ICTIssuanceEntries."Duration of Use end date" := ICTIssuanceVoucherLines."Duration of Use end date";
                            ICTIssuanceEntries."Duration of Use start date" := ICTIssuanceVoucherLines."Duration of Use start date";
                            //ICTIssuanceEntries."Receiving Officer Name":=ICTIssuanceVoucherLines."Current Assigned Employee";
                            // ICTIssuanceEntries."Receiving Officer":=ICTIssuanceVoucherLines."Dpt Current Assigned";
                            ICTIssuanceEntries.Insert(true);
                            //MESSAGE('%1',Description);
                            ICTInventory.Reset;
                            ICTInventory.SetRange(Code, ICTIssuanceVoucherLines.Code);
                            if ICTInventory.FindSet then begin
                                ICTInventory."Current Assigned Employee" := Rec."Issued To No.";
                                ICTInventory."Current Assigned Division/Unit" := Rec.Department;
                                if ICTIssuanceVoucherLines."Leasing/Issuing" = ICTIssuanceVoucherLines."leasing/issuing"::Issuing then begin
                                    ICTInventory.Status := ICTInventory.Status::Issued;
                                end else
                                    ICTInventory.Status := ICTInventory.Status::Leased;
                                ICTInventory.Modify(true);
                            end;
                        until ICTIssuanceVoucherLines.Next = 0;
                        //    ICTInventory.RESET;
                        //    ICTInventory.SETRANGE(Code,ICTIssuanceVoucherLines.Code);
                        //    IF ICTInventory.FINDSET THEN BEGIN
                        //      ICTInventory."Current Assigned Employee":="Issued To No.";
                        //      ICTInventory."Current Assigned Division/Unit":=Department;
                        //      IF ICTIssuanceVoucherLines."Leasing/Issuing" = ICTIssuanceVoucherLines."Leasing/Issuing"::Issuing THEN BEGIN
                        //        ICTInventory.Status:=ICTInventory.Status::Issued;
                        //        END ELSE
                        //        ICTInventory.Status:=ICTInventory.Status::Leased;
                        //      ICTInventory.MODIFY(TRUE);
                        //     END;
                    end;
                    Rec.Posted := true;
                    Rec."Posting Date" := Today;
                    Rec."Document Status" := Rec."document status"::Issued;
                    Rec.Modify(true);
                    //Notify the requisitor
                    ICTSetup.Get();
                    UserSetup.Reset;
                    // IF UserSetup.GET(USERID)THEN
                    //  SenderName:=UserSetup."Employee Name";
                    if UserSetup1.Get(Rec."Issued To User ID") then begin
                        ICTIssuanceLines.Reset;
                        ICTIssuanceLines.SetRange("No.", Rec."No.");
                        if ICTIssuanceLines.FindSet then begin
                            ReceiverEmail := UserSetup1."E-Mail";

                            Email := ICTSetup."ICT Email";
                            Body := '<br>' + 'Greetings ' + Rec."Issued To User ID" + '<br>The item ' + ICTIssuanceLines.Description + ' Serial number ' + ICTIssuanceLines."Serial No." + ' requested under ticket number ' + Rec."No." + ' has been issued to ' + Rec."Issued To User ID" + '.' + '</br>';
                            Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                            Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                           //cc//     SMTP.CreateMessage(COMPANYNAME, ReceiverEmail, Email, 'ICT Inventory Issuance Notification', Body, true);
                            //MESSAGE(Email);
                            //cc//    SMTP.AddCC(Email);
                            //cc//    SMTP.Send();
                            Message('ICT Issue notification sent successfully.');
                        end;
                    end else
                        Error('email not sent');
                    Message('Issued Successfully To %1', Rec."Issued To User ID");
                end;
            }
            action(Return)
            {
                ApplicationArea = Basic;
                Image = Return;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Rec.Posted, true);
                    Rec.TestField(Rec."Document Status", Rec."document status"::Issued);
                    ICTIssuanceVoucherLines.Reset;
                    ICTIssuanceVoucherLines.SetRange("No.", Rec."No.");
                    ICTIssuanceVoucherLines.SetRange(Type, Rec.Type);
                    ICTIssuanceVoucherLines.SetRange(Select, true);
                    if ICTIssuanceVoucherLines.FindSet then begin
                        repeat
                            ICTInventory.Reset;
                            ICTInventory.SetRange(Code, ICTIssuanceVoucherLines.Code);
                            if ICTInventory.FindSet then begin
                                ICTInventory."Current Assigned Employee" := '';
                                ICTInventory."Current Assigned Division/Unit" := '';
                                ICTInventory.Status := ICTInventory.Status::Open;
                                ICTInventory.Modify(true);
                            end;
                        until ICTIssuanceVoucherLines.Next = 0;
                    end;
                    Rec."Document Status" := Rec."document status"::Returned;
                    Rec.Modify(true);
                    NotifyRequester(Rec);
                    Message('Items Returned Successfully');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // IF "Document Status"="Document Status"::Submitted THEN
        //  CurrPage.EDITABLE:=FALSE;
        // MODIFY(TRUE);
        corec := true;
        if Rec.Status = Rec.Status::Released then
            corec := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Issuance;
        Rec."Document Status" := Rec."document status"::Open;
        Rec."Leasing/Issuing" := Rec."leasing/issuing"::Issuing;
    end;

    trigger OnOpenPage()
    begin
        /*IF "Document Status"="Document Status"::Submitted THEN
          CurrPage.EDITABLE:=FALSE;
        MODIFY(TRUE);
        */
        corec := true;
        if Rec.Status = Rec.Status::Released then
            corec := false;

        corec1 := true;
        if Rec."Document Status" = Rec."document status"::Submitted then
            corec1 := false;
        corec2 := true;
        if Rec."Document Status" = Rec."document status"::Issued then
            corec2 := false;
        corec3 := true;
        if Rec."Document Status" = Rec."document status"::Open then
            corec3 := false;

        //"Leasing/Issuing" :="Leasing/Issuing"::Issuing;

    end;

    var
        ICTIssuanceEntries: Record "ICT Issuance Entries";
        ICTIssuanceVoucherLines: Record "ICT Issuance Voucher Lines";
        ICTInventory: Record "ICT Inventory";
        corec: Boolean;
        ICTInventory2: Record "ICT Inventory";
        corec1: Boolean;
        corec2: Boolean;
        corec3: Boolean;
        UserSetup: Record "User Setup";
       //cc//     SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "Hr E-Mail Parameters";
        ICTSetup: Record "ICT Helpdesk Global Parameters";
        ObjCompany: Record "Company Information";
        Email2: Text;
        Header: Text;


    procedure NotifyRequester(ICTIssuanceVoucher: Record "ICT Issuance Voucher")
    var
    //cc//        SMTPMailSetup: Record "SMTP Mail Setup";
        Header: Text;
        SenderName: Text;
        SenderEmail: Text;
        emp: Record Employee;
       //cc//     SMTPMail: Codeunit "SMTP Mail";
        UserSetup1: Record "User Setup";
        ReceiverEmail: Text;
        Email: Text;
        Body: Text;
        ICTIssuanceLines: Record "ICT Issuance Voucher Lines";
    begin
        ICTSetup.Get();
        UserSetup.Reset;
        if UserSetup.Get(UserId) then
            SenderName := UserSetup."Employee Name";
        if UserSetup1.Get(ICTIssuanceVoucher."Issued To User ID") then begin
            ICTIssuanceLines.Reset;
            ICTIssuanceLines.SetRange("No.", ICTIssuanceVoucher."No.");
            if ICTIssuanceLines.FindSet then begin
                ReceiverEmail := UserSetup1."E-Mail";

                Email := ICTSetup."ICT Email";
                Header := 'Greetings ' + ICTIssuanceVoucher."Issued To User ID";
                Body := '<br>' + Header + '<br>The item ' + ICTIssuanceLines.Description + ' Serial number ' + ICTIssuanceLines."Serial No." + ' requested under ticket number ' + ICTIssuanceVoucher."No." + ' has been returned by ' + SenderName + '.' + '</br>';
                Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
               //cc//     SMTP.CreateMessage(COMPANYNAME, ReceiverEmail, Email, 'ICT Heldesk Notification', Body, true);
                //MESSAGE(Email);
                //cc//    SMTP.AddCC(Email);
                //cc//    SMTP.Send();
                Message('ICT Issue notification sent successfully.');
            end;
        end else
            Error('email not sent');

    end;
}
