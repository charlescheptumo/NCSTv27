#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 69005 "Release Payroll period"
{
    TableNo = "Payroll PeriodX";

    trigger OnRun()
    begin
        if Rec.Status = Rec.Status::Released then
            exit;

        OnBeforeReleasePayPeriod(Rec);
        //OnCheckImpMemoReleaseRestrictions;

        Rec.Status := Rec.Status::Released;



        Rec.Modify(true);

        OnAfterReleasePayPeriod(Rec);
    end;

    var
        Text001: label 'There is nothing to release for Payroll Period %1.';
        Text002: label 'This Period can only be released when the approval process is complete.';
        Text003: label 'The approval process must be canceled or completed to reopen this period.';
        Text004: label 'There are unposted prepayment amounts on the document of type %1 with the number %2.';
        Text005: label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';


    procedure Reopen(var PayPeriod: Record "Payroll PeriodX")
    begin
        //OnBeforeReopenPayments(Payments);

        begin
            if PayPeriod.Status = PayPeriod.Status::Open then
                exit;
            PayPeriod.Status := PayPeriod.Status::Open;

            PayPeriod.Modify(true);

        end;

        OnAfterReopenPayPeriod(PayPeriod);
    end;


    procedure PerformManualRelease(var PayPeriod: Record "Payroll PeriodX")
    var
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        begin


            //if ApprovalsMgmt.IsPayPeriodApprovalsWorkflowEnabled(PayPeriod) and (PayPeriod.Status = PayPeriod.Status::Open) then
            //   Error(Text002);

            Codeunit.Run(Codeunit::"Release Payroll period", PayPeriod);
        end;
    end;


    procedure PerformManualReopen(var PayPeriod: Record "Payroll PeriodX")
    begin
        if PayPeriod.Status = PayPeriod.Status::"Pending Approval" then
            Error(Text003);

        Reopen(PayPeriod);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReleasePayPeriod(var PayPeriod: Record "Payroll PeriodX")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReleasePayPeriod(var PayPeriod: Record "Payroll PeriodX")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopenPayPeriod(var PayPeriod: Record "Payroll PeriodX")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReopenPayPeriod(var PayPeriod: Record "Payroll PeriodX")
    begin
    end;
}
