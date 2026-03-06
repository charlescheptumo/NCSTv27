#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57003 Payments
{
    TableNo = Payments;

    trigger OnRun()
    var
        SalesLine: Record "Sales Line";
        TempVATAmountLine0: Record "VAT Amount Line" temporary;
        TempVATAmountLine1: Record "VAT Amount Line" temporary;
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
        NotOnlyDropShipment: Boolean;
        PostingDate: Date;
        PrintPostedDocuments: Boolean;
    begin
        if Rec.Status = Rec.Status::Released then
            exit;

        OnBeforeReleasePayments(Rec);
        //OnCheckImpMemoReleaseRestrictions;

        Rec.Status := Rec.Status::Released;



        Rec.Modify(true);

        Rec.Validate(Status);//Added by Morris to Push Committments
        OnAfterReleasePayments(Rec);
    end;

    var
        Text001: label 'There is nothing to release for Payment %1.';
        SalesSetup: Record "Sales & Receivables Setup";
        InvtSetup: Record "Inventory Setup";
        WhseSalesRelease: Codeunit "Whse.-Sales Release";
        Text002: label 'This document can only be released when the approval process is complete.';
        Text003: label 'The approval process must be canceled or completed to reopen this document.';
        Text004: label 'There are unposted prepayment amounts on the document of type %1 with the number %2.';
        Text005: label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';


    procedure Reopen(var Payments: Record Payments)
    begin
        OnBeforeReopenPayments(Payments);

        begin
            if Payments.Status = Payments.Status::Open then
                exit;
            Payments.Status := Payments.Status::Open;

            Payments.Modify(true);

        end;

        OnAfterReopenPayments(Payments);
    end;


    procedure PerformManualRelease(var Payments: Record Payments)
    var
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        begin


            //cc//      if ApprovalsMgmt.IsPaymentsApprovalsWorkflowEnabled(Payments) and (Payments.Status = Payments.Status::Open) then
            //cc//          Error(Text002);

            Codeunit.Run(Codeunit::Payments, Payments);
        end;
    end;


    procedure PerformManualReopen(var Payments: Record Payments)
    begin
        if Payments.Status = Payments.Status::"Pending Approval" then
            Error(Text003);

        Reopen(Payments);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReleasePayments(var Payments: Record Payments)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReleasePayments(var Payments: Record Payments)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopenPayments(var Payments: Record Payments)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReopenPayments(var Payments: Record Payments)
    begin
    end;


    procedure PerformSalaryRelease(var Salary: Record "Payroll Header")
    var
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        begin


            if Salary.Status = Salary.Status::Released then
                exit;

            //OnBeforeReleasePayments(Rec);
            //OnCheckImpMemoReleaseRestrictions;

            Salary.Status := Salary.Status::Released;



            Salary.Modify(true);
        end;
    end;


    procedure PerformSalaryReopen(var Salary: Record "Payroll Header")
    begin
        begin
            if Salary.Status = Salary.Status::Open then
                exit;
            Salary.Status := Salary.Status::Open;

            Salary.Modify(true);

        end;
    end;
}
