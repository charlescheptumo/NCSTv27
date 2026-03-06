#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50001 "Dynasoft Workflow Responses"
{

    trigger OnRun()
    begin
    end;

    var
        WFEventHandler: Codeunit "Workflow Event Handling";
        SurestepWFEvents: Codeunit "Dynasoft Workflow Events";
        WFResponseHandler: Codeunit "Workflow Response Handling";


    procedure AddResponsesToLib()
    begin
    end;


    procedure AddResponsePredecessors()
    begin
        //
        /* //Payment Header
         WFResponseHandler.AddResponsePredecessor(WFResponseHandler.SetStatusToPendingApprovalCode,
                                                  SurestepWFEvents.RunWorkflowOnSendPaymentDocForApprovalCode);
         WFResponseHandler.AddResponsePredecessor(WFResponseHandler.CreateApprovalRequestsCode,
                                                  SurestepWFEvents.RunWorkflowOnSendPaymentDocForApprovalCode);
         WFResponseHandler.AddResponsePredecessor(WFResponseHandler.SendApprovalRequestForApprovalCode,
                                                  SurestepWFEvents.RunWorkflowOnSendPaymentDocForApprovalCode);
         WFResponseHandler.AddResponsePredecessor(WFResponseHandler.OpenDocumentCode,
                                                  SurestepWFEvents.RunWorkflowOnCancelPaymentApprovalRequestCode);
         WFResponseHandler.AddResponsePredecessor(WFResponseHandler.CancelAllApprovalRequestsCode,
                                                  SurestepWFEvents.RunWorkflowOnCancelPaymentApprovalRequestCode);*/

        // //Leave Application
        // WFResponseHandler.AddResponsePredecessor(WFResponseHandler.SetStatusToPendingApprovalCode,
        //                                          SurestepWFEvents.RunWorkflowOnSendLeaveAppForApprovalCode);
        // WFResponseHandler.AddResponsePredecessor(WFResponseHandler.CreateApprovalRequestsCode,
        //                                          SurestepWFEvents.RunWorkflowOnSendLeaveAppForApprovalCode);
        // WFResponseHandler.AddResponsePredecessor(WFResponseHandler.SendApprovalRequestForApprovalCode,
        //                                          SurestepWFEvents.RunWorkflowOnSendLeaveAppForApprovalCode);
        // WFResponseHandler.AddResponsePredecessor(WFResponseHandler.OpenDocumentCode,
        //                                          SurestepWFEvents.RunWorkflowOnCancelLeaveAppApprovalRequestCode);
        // WFResponseHandler.AddResponsePredecessor(WFResponseHandler.CancelAllApprovalRequestsCode,
        //                                          SurestepWFEvents.RunWorkflowOnCancelLeaveAppApprovalRequestCode);

        //-----------------------------End AddOn--------------------------------------------------------------------------------------

    end;


    procedure ReleasePaymentVoucher(var PaymentHeader: Record Payments)
    var
        PHeader: Record Payments;
    begin
        PHeader.Reset;
        PHeader.SetRange(PHeader."No.", PaymentHeader."No.");
        if PHeader.FindFirst then begin
            PHeader.Status := PHeader.Status::Released;
            PHeader.Modify;
        end;
    end;


    procedure ReOpenPaymentVoucher(var PaymentHeader: Record Payments)
    var
        PHeader: Record Payments;
    begin
        PHeader.Reset;
        PHeader.SetRange(PHeader."No.", PaymentHeader."No.");
        if PHeader.FindFirst then begin
            PHeader.Status := PHeader.Status::Open;
            PHeader.Modify;
        end;
    end;


    procedure ReleaseLeaveApplication(var LeaveApplication: Record "HR Leave Application")
    var
        LeaveApp: Record "HR Leave Application";
    begin
        LeaveApp.Reset;
        LeaveApp.SetRange(LeaveApp."Application Code", LeaveApplication."Application Code");
        if LeaveApp.FindFirst then begin
            LeaveApp.Status := LeaveApp.Status::Released;
            LeaveApp.Modify;
        end;
    end;


    procedure ReOpenLeaveApplication(var LeaveApplication: Record "HR Leave Application")
    var
        LeaveApp: Record "HR Leave Application";
    begin
        LeaveApp.Reset;
        LeaveApp.SetRange(LeaveApp."Application Code", LeaveApplication."Application Code");
        if LeaveApp.FindFirst then begin
            LeaveApp.Status := LeaveApp.Status::Open;
            LeaveApp.Modify;
        end;
    end;
}
