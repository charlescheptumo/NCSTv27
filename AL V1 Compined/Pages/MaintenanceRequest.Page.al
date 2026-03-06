#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59036 "Maintenance Request"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel & Maintenance Requisition";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = VehicleRegNoEditable;
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = vendorEditable;
                    LookupPageID = "Vendor List";
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Taken for Maintenance"; Rec."Date Taken for Maintenance")
                {
                    ApplicationArea = Basic;
                    Editable = DateofMaintenanceEditable;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Service Code"; Rec."Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service Name"; Rec."Service Name")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Editable = closedbyEditable;
                    LookupPageID = "User Setup";
                    Visible = false;
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = DateclosedEditable;
                    Visible = false;
                }
                field("Vendor Invoice No"; Rec."Vendor Invoice No")
                {
                    ApplicationArea = Basic;
                    Editable = vendorInvoiceEditable;
                    LookupPageID = "Purchase Invoices";
                    Visible = false;
                }
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted LSO';
                    Editable = postedInvoiceEditable;
                    LookupPageID = "Posted Purchase Invoice";
                    Visible = true;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;

                trigger OnAction()
                begin
                    //ApprovalMgt.SendMaintApprovalRequest(Rec);
                    if Rec.Status <> Rec.Status::Open then
                        Error('Status must be open');

                    /*
                    //if ApprovalMgt.CheckFuelReqApprovalsWorkflowEnabled(Rec) THEN
                      //ApprovalMgt.OnSendFuelReqForApproval(Rec);
                    */

                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;
                    Message('Approved successfully');

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = approval;
                Promoted = true;

                trigger OnAction()
                begin
                    //ApprovalMgt.CancelMaintApprovalRequest(Rec,TRUE,TRUE);
                    /*
                    //cc//ApprovalMgt.OnCancel
FuelReqApprovalRequest(Rec)
                 */

                    Rec.Status := Rec.Status::Cancelled;
                    Rec.Modify;
                    Message('Cancelled successfully');

                end;
            }
            action("Close Maintenance Request.")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Posted Invoice No");
                    if Rec."PO Created" = true then begin
                        if Confirm('Are you sure you want to close this Maintenance Request?', true) = false then begin
                            exit
                        end else
                            Rec.Status := Rec.Status::Closed;
                        Rec."Closed By" := UserId;
                        Rec."Date Closed" := Today;
                        Rec.Modify;
                    end else
                        Error('You cannot close the request until the LSO is created');
                end;
            }
            action("Process LSO")
            {
                ApplicationArea = Basic;
                Image = Purchasing;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Approved then begin
                        if Confirm(Text004, false) then begin
                            RequsitionManager.MaintanceReview(Rec);
                            Rec."PO Created By" := UserId;
                            Rec."Date PO Created" := Today;
                            Rec."PO Created" := true;
                            Rec.Modify;
                            Message(Text005);
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Maintenance;
        Rec."Request Date" := Today;
        //IF FltUserSetup.GET(USERID) THEN BEGIN
        //FltUserSetup.TESTFIELD("User Department");
        Rec."Prepared By" := UserId;
        Rec.Status := Rec.Status::Open;
        // Department:=FltUserSetup."User Department";
        //END ELSE
        //ERROR(Text0001);
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        VehicleRegNoEditable: Boolean;
        vendorEditable: Boolean;
        RequestDateEditable: Boolean;
        DateofMaintenanceEditable: Boolean;
        typeofmaintenanceEditable: Boolean;
        chequenoEditable: Boolean;
        closedbyEditable: Boolean;
        DateclosedEditable: Boolean;
        vendorInvoiceEditable: Boolean;
        postedInvoiceEditable: Boolean;
        Text004: label 'Do you want to proceed and perform the selected action on the Maintanance request?';
        GLSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        LineNo2: Code[20];
        gCuNoSeriesMngmnt: Codeunit "No. Series";
        PurchaseHeader: Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        Text005: label 'Purchase Review process completed';


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            VehicleRegNoEditable := true;
            vendorEditable := true;
            RequestDateEditable := true;
            DateofMaintenanceEditable := true;
            typeofmaintenanceEditable := true;
            chequenoEditable := false;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := true;
            postedInvoiceEditable := true;
        end;
        if Rec.Status = Rec.Status::"Pending Approval" then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := false;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
        if Rec.Status = Rec.Status::Approved then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := true;
            postedInvoiceEditable := true;
        end;
        if Rec.Status = Rec.Status::Rejected then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
        if Rec.Status = Rec.Status::Closed then begin
            VehicleRegNoEditable := false;
            vendorEditable := false;
            RequestDateEditable := false;
            DateofMaintenanceEditable := false;
            typeofmaintenanceEditable := false;
            chequenoEditable := true;
            closedbyEditable := false;
            DateclosedEditable := false;
            vendorInvoiceEditable := false;
            postedInvoiceEditable := false;
        end;
    end;
}
