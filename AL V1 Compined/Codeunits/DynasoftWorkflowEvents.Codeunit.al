#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50000 "Dynasoft Workflow Events"
{

    // trigger OnRun()
    // begin
    // end;

    // var
    //     WFHandler: Codeunit "Workflow Event Handling";
    //     WorkflowManagement: Codeunit "Workflow Management";
    //     "....daudi added....": ;
    //     ImpMemoSendForApprovalEventDescTxt: label 'Approval of an Imprest Memo is requested.';
    //     ImpMemoApprReqCancelledEventDescTxt: label 'An approval request for an Imprest Memo has been canceled.';
    //     ImpMemoReleasedEventDescTxt: label 'An Imprest Memo has been released.';
    //     PaymentsSendForApprovalEventDescTxt: label 'Approval of a payment is requested.';
    //     PaymentsApprReqCancelledEventDescTxt: label 'An approval request for a payment has been canceled.';
    //     PaymentsReleasedEventDescTxt: label 'A payment has been released.';
    //     PayPeriodSendForApprovalEventDescTxt: label 'Approval of a Payroll Period is requested.';
    //     PayPeriodApprReqCancelledEventDescTxt: label 'An approval request for a Payroll Period has been canceled.';
    //     PayPeriodReleasedEventDescTxt: label 'A Payroll Period has been released.';
    //     LeaveAppSendForApprovalEventDescTxt: label 'Approval of a Leave Application is requested.';
    //     LeaveAppApprReqCancelledEventDescTxt: label 'An approval request for a Leave Application has been canceled.';
    //     LeaveAppReleasedEventDescTxt: label 'A Leave Application has been released.';


    // procedure AddEventsToLib()
    // begin
    //     //---------------------------------------------1. Approval Events--------------------------------------------------------------
    //     //leave application
    //     WFHandler.AddEventToLibrary(RunWorkflowOnSendLeaveAppForApprovalCode,
    //                                 Database::"HR Leave Application", LeaveAppSendForApprovalEventDescTxt, 0, false);
    //     WFHandler.AddEventToLibrary(RunWorkflowOnCancelLeaveAppApprovalRequestCode,
    //                                 Database::"HR Leave Application", LeaveAppApprReqCancelledEventDescTxt, 0, false);
    //     WFHandler.AddEventToLibrary(RunWorkflowOnAfterReleaseLeaveAppCode, Database::"HR Leave Application",
    //     LeaveAppReleasedEventDescTxt, 0, false);

    //     //Payment Header
    //     /*WFHandler.AddEventToLibrary(RunWorkflowOnSendPaymentsForApprovalCode,
    //                                 DATABASE::Payments,PaymentsSendForApprovalEventDescTxt,0,FALSE);
    //     WFHandler.AddEventToLibrary(RunWorkflowOnCancelPaymentApprovalRequestCode,
    //                                 DATABASE::Payments,PaymentsApprReqCancelledEventDescTxt,0,FALSE);
    //     WFHandler.AddEventToLibrary(RunWorkflowOnAfterReleasePaymentsCode,DATABASE::Payments,
    //     PaymentsReleasedEventDescTxt,0,FALSE);*/

    //     /*
    //     //Receipt Header
    //     WFHandler.AddEventToLibrary(RunWorkflowOnSendReceiptDocForApprovalCode,
    //                                 DATABASE::"Receipt Header",'Approval of a Receipt Document is Requested.',0,FALSE);
    //     WFHandler.AddEventToLibrary(RunWorkflowOnCancelReceiptApprovalRequestCode,
    //                                 DATABASE::"Receipt Header",'An Approval request for a Receipt Document is Canceled.',0,FALSE);
    //     //Client Application
    //     WFHandler.AddEventToLibrary(RunWorkflowOnSendClientApplicationForApprovalCode,
    //                                 DATABASE::"Membership Applications",'Approval of a Member Application is Requested.',0,FALSE);
    //     WFHandler.AddEventToLibrary(RunWorkflowOnCancelClientApplicationApprovalRequestCode,
    //                                 DATABASE::"Membership Applications",'An Approval request for a Member Application is canceled.',0,FALSE);
    //     //Loan Booking
    //     WFHandler.AddEventToLibrary(RunWorkflowOnSendLoanBookingForApprovalCode,
    //                                 DATABASE::"Loans Register",'Approval of a Loan Application is Requested.',0,FALSE);
    //     WFHandler.AddEventToLibrary(RunWorkflowOnCancelLoanBookingApprovalRequestCode,
    //                                 DATABASE::"Loans Register",'An Approval request for a Loan Application is canceled.',0,FALSE);
    //     //Loan Disbursement
    //     WFHandler.AddEventToLibrary(RunWorkflowOnSendLoanDisbursementForApprovalCode,
    //                                 DATABASE::"Loan Disburesment-Batching",'Approval of a Loan Disbursement is Requested.',0,FALSE);
    //     WFHandler.AddEventToLibrary(RunWorkflowOnCancelLoanDisbursementApprovalRequestCode,
    //                                 DATABASE::"Loan Disburesment-Batching",'An Approval request for a Loan Disbursement is canceled.',0,FALSE);
    //                                 */
    //     //-------------------------------------------End Approval Events-------------------------------------------------------------

    // end;


    // procedure AddEventsPredecessor()
    // begin
    //     //--------------------------------------1.Approval,Rejection,Delegation Predecessors------------------------------------------------
    //     //WFHandler.AddEventPredecessor(WFHandler.runworkflowon,RunWorkflowOnCancelLeaveAppApprovalRequestCode);
    //     WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendLeaveAppForApprovalCode);
    //     WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnRejectApprovalRequestCode, RunWorkflowOnSendLeaveAppForApprovalCode);
    //     WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnDelegateApprovalRequestCode, RunWorkflowOnSendLeaveAppForApprovalCode);


    //     //Payment Header
    //     /*WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnCancelPaymentsApprovalRequestCode,RunWorkflowOnCancelPaymentsApprovalRequestCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);*/

    //     /*//Receipt Header
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendReceiptDocForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendReceiptDocForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendReceiptDocForApprovalCode);
    //     //Client Application
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendClientApplicationForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendClientApplicationForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendClientApplicationForApprovalCode);
    //     //Loan Booking
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendLoanBookingForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendLoanBookingForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendLoanBookingForApprovalCode);
    //     //Loan Disbursement
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendLoanDisbursementForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnSendLoanDisbursementForApprovalCode);
    //       WFHandler.AddEventPredecessor(WFHandler.RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendLoanDisbursementForApprovalCode);*/
    //     //---------------------------------------End Approval,Rejection,Delegation Predecessors---------------------------------------------

    // end;


    // procedure RunWorkflowOnSendPaymentDocForApprovalCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnSendPaymentDocForApproval'));
    // end;


    // procedure RunWorkflowOnCancelPaymentApprovalRequestCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnCancelPaymentApprovalRequest'));
    // end;

    // local procedure ".........Daudi added......"()
    // begin
    // end;


    // procedure RunWorkflowOnSendImpMemoForApprovalCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnSendImpMemoForApproval'));
    // end;


    // procedure RunWorkflowOnCancelImpMemoApprovalRequestCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnCancelImpMemoApprovalRequest'));
    // end;


    // procedure RunWorkflowOnAfterReleaseImpMemoCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnAfterReleaseImpMemo'));
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendImpMemoForApproval', '', false, false)]

    // procedure RunWorkflowOnSendImpMemoForApproval(var ImprestMemo: Record "Imprest Memo")
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnSendImpMemoForApprovalCode, ImprestMemo);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCancelImpMemoApprovalRequest', '', false, false)]

    // procedure RunWorkflowOnCancelImpMemoApprovalRequest(var ImprestMemo: Record "Imprest Memo")
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelImpMemoApprovalRequestCode, ImprestMemo);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Imprest Memo", 'OnAfterReleaseImpMemo', '', false, false)]

    // procedure RunWorkflowOnAfterReleaseImpMemoDoc(var ImprestMemo: Record "Imprest Memo")
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseImpMemoCode, ImprestMemo);
    // end;

    // local procedure "--------------additions for Payments-----------------------------------------"()
    // begin
    // end;


    // procedure RunWorkflowOnSendPaymentsForApprovalCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnSendPaymentsForApproval'));
    // end;


    // procedure RunWorkflowOnCancelPaymentsApprovalRequestCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnCancelPaymentsApprovalRequest'));
    // end;


    // procedure RunWorkflowOnAfterReleasePaymentsCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnAfterReleasePayments'));
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendPaymentsForApproval', '', false, false)]

    // procedure RunWorkflowOnSendPaymentsForApproval(var Payments: Record Payments)
    // begin

    //     WorkflowManagement.HandleEvent(RunWorkflowOnSendPaymentsForApprovalCode, Payments);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCancelPaymentsApprovalRequest', '', false, false)]

    // procedure RunWorkflowOnCancelPaymentsApprovalRequest(var Payments: Record Payments)
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelPaymentsApprovalRequestCode, Payments);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::Payments, 'OnAfterReleasePayments', '', false, false)]

    // procedure RunWorkflowOnAfterReleasePaymentsDoc(var Payments: Record Payments)
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePaymentsCode, Payments);
    // end;

    // local procedure "--------------additions for PayPeriods-----------------------------------------"()
    // begin
    // end;


    // procedure RunWorkflowOnSendPayPeriodForApprovalCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnSendPayPeriodForApproval'));
    // end;


    // procedure RunWorkflowOnCancelPayPeriodApprovalRequestCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnCancelPayPeriodApprovalRequest'));
    // end;


    // procedure RunWorkflowOnAfterReleasePayPeriodCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnAfterReleasePayPeriod'));
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendPayPeriodForApproval', '', false, false)]

    // procedure RunWorkflowOnSendPayPeriodForApproval(var PayPeriod: Record "Payroll PeriodX")
    // begin

    //     WorkflowManagement.HandleEvent(RunWorkflowOnSendPayPeriodForApprovalCode, PayPeriod);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCancelPayPeriodApprovalRequest', '', false, false)]

    // procedure RunWorkflowOnCancelPayPeriodApprovalRequest(var PayPeriod: Record "Payroll PeriodX")
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelPayPeriodApprovalRequestCode, PayPeriod);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Payroll period", 'OnAfterReleasePayPeriod', '', false, false)]

    // procedure RunWorkflowOnAfterReleasePayPeriodDoc(var PayPeriod: Record "Payroll PeriodX")
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePayPeriodCode, PayPeriod);
    // end;

    // local procedure "--------------additions for Leave Application-----------------------------------------"()
    // begin
    // end;


    // procedure RunWorkflowOnSendLeaveAppForApprovalCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnSendLeaveAppForApproval'));
    // end;


    // procedure RunWorkflowOnCancelLeaveAppApprovalRequestCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnCancelLeaveAppApprovalRequest'));
    // end;


    // procedure RunWorkflowOnAfterReleaseLeaveAppCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkflowOnAfterReleaseLeaveApp'));
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSendLeaveAppForApproval', '', false, false)]

    // procedure RunWorkflowOnSendLeaveAppForApproval(var LeaveApp: Record "HR Leave Application")
    // begin

    //     WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaveAppForApprovalCode, LeaveApp);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCancelLeaveAppApprovalRequest', '', false, false)]

    // procedure RunWorkflowOnCancelLeaveAppApprovalRequest(var LeaveApp: Record "HR Leave Application")
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelLeaveAppApprovalRequestCode, LeaveApp);
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::Payments, 'OnAfterReleaseLeaveApp', '', false, false)]

    // procedure RunWorkflowOnAfterReleaseLeaveAppDoc(var LeaveApp: Record "HR Leave Application")
    // begin
    //     WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseLeaveAppCode, LeaveApp);
    // end;
}

