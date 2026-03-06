#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59026 "Fuel Requisition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = where(Type = filter(Fuel));
    ApplicationArea = All;

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
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                    Editable = VendorEditable;
                    LookupPageID = "Vendor List";
                    TableRelation = Vendor;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Price of Fuel"; Rec."Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount Requested';
                    Editable = TotalAmountEditable;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = RequestDateEditable;
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
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Invoice No';
                    Editable = chequeEditable;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    //TESTFIELD("Vehicle Reg No");
                    Rec.TestField(Rec."Vendor(Dealer)");
                    Rec.TestField(Rec."Total Price of Fuel");
                    //ApprovalMgt.SendFuelMaintApprovalRequest(Rec);


                    /*//cc//if ApprovalsMgmt.CheckFuelReqApprovalsWorkflowEnabled(Rec) THEN
                    //cc//ApprovalsMgmt.OnSendFuelReqForApproval(Rec);*/
                    Rec.TestField(Rec.Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;
                    Message('Document has been Approved Automatically');

                end;
            }
            action("Cancel Document")
            {
                ApplicationArea = Basic;
                Promoted = true;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //ApprovalMgt.CancelFuelMaintApprovalRequest(Rec,TRUE,TRUE);

                    /*
                    //ApprovalsMgmt.OnCancelFuelReqApprovalRequest(Rec)
                    */
                    Rec.TestField(Rec.Status, Rec.Status::"Pending Approval");
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                    Message('Approval Request has been cancelled');

                end;
            }
            action("Close Fuel Request")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //TESTFIELD("Posted Invoice No");

                    if Confirm('Are you sure you want to close this Fuel Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Closed;
                    Rec."Closed By" := UserId;
                    Rec."Date Closed" := Today;
                    Rec.Modify;
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

        Rec.Type := Rec.Type::Fuel;
        Rec."Request Date" := Today;
        Rec.Status := Rec.Status::Open;
        //IF FltUserSetup.GET(USERID) THEN BEGIN
        //FltUserSetup.TESTFIELD("User Department");
        Rec."Prepared By" := UserId;
        //Department:=FltUserSetup."User Department";
        //END ELSE
        //ERROR(Text0001);
    end;

    var
        VendorEditable: Boolean;
        TotalAmountEditable: Boolean;
        RequestDateEditable: Boolean;
        chequeEditable: Boolean;


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            VendorEditable := true;
            TotalAmountEditable := true;
            RequestDateEditable := true;
            chequeEditable := false;
        end else
            if Rec.Status = Rec.Status::"Pending Approval" then begin
                VendorEditable := false;
                TotalAmountEditable := false;
                RequestDateEditable := false;
                chequeEditable := false;

            end else
                if Rec.Status = Rec.Status::Approved then begin
                    VendorEditable := false;
                    TotalAmountEditable := false;
                    RequestDateEditable := false;
                    chequeEditable := true;
                end else

                    if Rec.Status = Rec.Status::Rejected then begin
                        VendorEditable := false;
                        TotalAmountEditable := false;
                        RequestDateEditable := false;
                        chequeEditable := false;

                    end
    end;
}
