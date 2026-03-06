// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70001521 "Workflow Response Handling1521"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Workflow Response Handling"(Codeunit 1521)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=04012021D;
//         //      Time=145511T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Workflow Response Handling"(Codeunit 1521);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          AddResponseToLibrary(DoNothingCode,0,DoNothingTxt,'GROUP 0');
//         //                                          AddResponseToLibrary(CreateNotificationEntryCode,0,CreateNotifEntryTxt,'GROUP 3');
//         //                                          AddResponseToLibrary(ReleaseDocumentCode,0,ReleaseDocumentTxt,'GROUP 0');
//         //                                          #4..35
//         //                                          AddResponseToLibrary(RevertValueForFieldCode,0,RevertRecordValueTxt,'GROUP 6');
//         //                                          AddResponseToLibrary(ApplyNewValuesCode,0,ApplyNewValuesTxt,'GROUP 7');
//         //                                          AddResponseToLibrary(DiscardNewValuesCode,0,DiscardNewValuesTxt,'GROUP 0');
//         //  
//         //                                          OnAddWorkflowResponsesToLibrary;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..38
//         //                                          //Dynasoft
//         //                                           //Wresponse.AddResponsesToLib;
//         //                                          //End Dynasoft
//         //                                          OnAddWorkflowResponsesToLibrary;
//         //                                        END;
//         //  
//         //                           Target=CreateResponsesLibrary(PROCEDURE 25) }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          CASE ResponseFunctionName OF
//         //                                            SetStatusToPendingApprovalCode:
//         //                                              BEGIN
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPurchaseDocForApprovalCode);
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSalesDocForApprovalCode);
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIncomingDocForApprovalCode);
//         //                                                AddResponsePredecessor(
//         //                                                  SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnCustomerCreditLimitNotExceededCode);
//         //                                              END;
//         //                                            CreateApprovalRequestsCode:
//         //                                              BEGIN
//         //                                          #12..22
//         //                                                AddResponsePredecessor(
//         //                                                  CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendGeneralJournalBatchForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnGeneralJournalBatchBalancedCode);
//         //                                              END;
//         //                                            SendApprovalRequestForApprovalCode:
//         //                                              BEGIN
//         //                                          #29..44
//         //                                                  SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnGeneralJournalBatchBalancedCode);
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode);
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode);
//         //                                              END;
//         //                                            ReleaseDocumentCode:
//         //                                              BEGIN
//         //                                          #51..63
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelItemApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelGeneralJournalLineApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelGeneralJournalBatchApprovalRequestCode);
//         //                                              END;
//         //                                            CancelAllApprovalRequestsCode:
//         //                                              BEGIN
//         //                                          #70..77
//         //                                                  WorkflowEventHandling.RunWorkflowOnCancelGeneralJournalLineApprovalRequestCode);
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,
//         //                                                  WorkflowEventHandling.RunWorkflowOnCancelGeneralJournalBatchApprovalRequestCode);
//         //                                              END;
//         //                                            RevertValueForFieldCode:
//         //                                              BEGIN
//         //                                          #84..118
//         //                                            GetSendToOCRAsyncCode:
//         //                                              AddResponsePredecessor(GetSendToOCRAsyncCode,WorkflowEventHandling.RunWorkflowOnAfterReadyForOCRIncomingDocCode);
//         //                                          END;
//         //                                          OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName);
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..8
//         //                                              //Added By Coremen on 28/11/2015
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendImpMemoForApprovalCode);
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPaymentsForApprovalCode);
//         //                                                //
//         //                                                //Added By Kugun on 01/05/2016
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPayPeriodForApprovalCode);
//         //                                                //
//         //                                                //Salaryvouchers
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSalaryForApprovalCode);
//         //                                                //copyright registration
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendCopyRegForApprovalCode);
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendOvertimeForApprovalCode);
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTrainingAppForApprovalCode);
//         //                                                //Grant Funding Application
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendGFAForApprovalCode);
//         //                                                 //Fleet Requisition
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendFleetForApprovalCode);
//         //                                                //Project Contracts
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProjectContractForApprovalCode);
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProcDocForApprovalCode);
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendFileMovementForApprovalCode);
//         //                                                 ///Committee....22.10.2019 Hunaina
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendCommitteeDocForApprovalCode);
//         //                                                 ///Inspection...22.10.2019 Hunainah
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendInspectionDocForApprovalCode);
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIFPForApprovalCode);
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendVendDebarmentForApprovalCode);
//         //                                                 AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProcPlanForApprovalCode);
//         //                                                AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTenderCommitteForApprovalCode);
//         //                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBidEvaluationForApprovalCode);
//         //                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBidOpeningForApprovalCode);
//         //                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendBidTabulationForApprovalCode);
//         //                                                   AddResponsePredecessor(SetStatusToPendingApprovalCode,WorkflowEventHandling.RunWorkflowOnSendIFSForApprovalCode);
//         //  
//         //                                          #9..25
//         //                                              //Added by Coremen on 28/11/2015
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendImpMemoForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPaymentsForApprovalCode);
//         //                                                //
//         //                                                //Added by Kugun on 01/05/2016
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendPayPeriodForApprovalCode);
//         //                                                //Salary Vouchers;
//         //                                                 AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendSalaryForApprovalCode);
//         //                                                //Copyright Registration
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendCopyRegForApprovalCode);
//         //                                                //Overtime Application
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendOvertimeForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTrainingAppForApprovalCode);
//         //                                                //Grant Funding Application
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendGFAForApprovalCode);
//         //                                                //Fleet Requisition
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFleetForApprovalCode);
//         //                                                //Project Contract
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProjectContractForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProcDocForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFileMovementForApprovalCode);
//         //                                                ///Inspection...22.10.2019 Hunaina
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendInspectionDocForApprovalCode);
//         //                                                ///Committee...22.10.2019 Hunaina
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendCommitteeDocForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIFPForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendVendDebarmentForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProcPlanForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTenderCommitteForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidEvaluationForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidOpeningForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidTabulationForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIFSForApprovalCode);
//         //                                          #26..47
//         //                                              //Added by Coremen on 28/11/2015
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendImpMemoForApprovalCode);
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPaymentsForApprovalCode);
//         //                                                //
//         //                                                //Added by Kugun on 01/05/2016
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendPayPeriodForApprovalCode);
//         //                                                //Salary Voucher
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendSalaryForApprovalCode);
//         //                                                //Copyright registration
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendCopyRegForApprovalCode);
//         //                                                //Overtime Application
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendOvertimeForApprovalCode);
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendTrainingAppForApprovalCode);
//         //                                                //Grant Funding Application
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendGFAForApprovalCode);
//         //                                                //Fleet Requisition
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendFleetForApprovalCode);
//         //                                                //Project Contracts
//         //                                                AddResponsePredecessor(SendApprovalRequestForApprovalCode,WorkflowEventHandling.RunWorkflowOnSendProjectContractForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProcDocForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendFileMovementForApprovalCode);
//         //                                                ///Inspection....22.10.2019 Hunaina
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendInspectionDocForApprovalCode);
//         //                                                ///Committee.....22.10.2019 Hunaina
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendCommitteeDocForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIFPForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendVendDebarmentForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendProcPlanForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendTenderCommitteForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidEvaluationForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidOpeningForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendBidTabulationForApprovalCode);
//         //                                                AddResponsePredecessor(CreateApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnSendIFSForApprovalCode);
//         //  
//         //                                          #48..66
//         //                                              //Added by Coremen on 28/11/2015
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelImpMemoApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelPaymentsApprovalRequestCode);
//         //                                                //
//         //                                                //Added by Kugun on 01/05/2016
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelPayPeriodApprovalRequestCode);
//         //                                                //Salary Vouchers
//         //                                                 AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelSalaryApprovalRequestCode);
//         //                                                //Copyright Registration
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelCopyRegApprovalRequestCode);
//         //                                                //Overtime application
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelOvertimeApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelTrainingAppApprovalRequestCode);
//         //                                                 //Grant Funding Application
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelGFAApprovalRequestCode);
//         //                                                //Fleet Requisition
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelFleetApprovalRequestCode);
//         //                                                //Project Contracts
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelProjectContractApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelProcDocApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelFileMovementApprovalRequestCode);
//         //                                                ///Inspection.....22.10.2019 Hunaina
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelInspectionDocApprovalRequestCode);
//         //                                                ///Committee.....22.10.2019 Hunaina
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelCommitteeDocApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelIFPApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelVendDebarmentApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelProcPlanApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelTenderCommitteApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelBidEvaluationApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelBidOpeningApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelBidTabulationApprovalRequestCode);
//         //                                                AddResponsePredecessor(OpenDocumentCode,WorkflowEventHandling.RunWorkflowOnCancelIFSApprovalRequestCode);
//         //                                          #67..80
//         //                                               //Added by Coremen on 28/11/2015
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelImpMemoApprovalRequestCode);
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelPaymentsApprovalRequestCode);
//         //                                                //
//         //                                               //Added by Kugun on 01/05/2016
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelPayPeriodApprovalRequestCode);
//         //                                                //Salary Vouchers
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelSalaryApprovalRequestCode);
//         //                                                //Copyright reg
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelCopyRegApprovalRequestCode);
//         //                                                //Overtime Application
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelOvertimeApprovalRequestCode);
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelTrainingAppApprovalRequestCode);
//         //                                                 //Grant Funding Application
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelGFAApprovalRequestCode);
//         //                                                 //Fleet Requisition
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelFleetApprovalRequestCode);
//         //                                                 //Project Contracts
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelProjectContractApprovalRequestCode);
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelProcDocApprovalRequestCode);
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelFileMovementApprovalRequestCode);
//         //                                                 ///Inspection.....22.10.2019 Hunaina
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelInspectionDocApprovalRequestCode);
//         //                                                 ///Committee....22.10.2019 Hunaina
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelCommitteeDocApprovalRequestCode);
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelIFPApprovalRequestCode);
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelVendDebarmentApprovalRequestCode);
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelProcPlanApprovalRequestCode);
//         //                                                 AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelTenderCommitteApprovalRequestCode);
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelBidEvaluationApprovalRequestCode);
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelBidOpeningApprovalRequestCode);
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelBidTabulationApprovalRequestCode);
//         //                                                AddResponsePredecessor(CancelAllApprovalRequestsCode,WorkflowEventHandling.RunWorkflowOnCancelIFSApprovalRequestCode);
//         //  
//         //                                          #81..121
//         //                                          //Dynasoft
//         //                                          // Wresponse.AddResponsePredecessors;
//         //                                          //End Dynasoft
//         //                                          OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName);
//         //                                        END;
//         //  
//         //                           Target=AddResponsePredecessors(PROCEDURE 33) }
//         //      { PropertyModification;
//         //                           Target=ReleaseDocument(PROCEDURE 5).Handled(Variable 1002);
//         //                           Property=Id;
//         //                           OriginalValue=1002;
//         //                           ModifiedValue=1400 }
//         //      { Insertion         ;Target=ReleaseDocument(PROCEDURE 5);
//         //                           InsertAfter=TargetRecRef(Variable 1008);
//         //                           ChangedElements=VariableCollection
//         //                           {
//         //                             ReleaseImprestMemo@1300 : Codeunit "Imprest Memo";
//         //                             ReleasePayments@1455 : Codeunit Payments;
//         //                             ReleasePayPeriod@1002 : Codeunit "Release Payroll period";
//         //                             ReleaseDoc@1010 : Codeunit "Release Approval Document";
//         //                             LeaveApp@1011 : Record "HR Leave Application";
//         //                           }
//         //                            }
//         //      { Insertion         ;Target=ReleaseDocument(PROCEDURE 5);
//         //                           InsertAfter=Handled(Variable 1002);
//         //                           ChangedElements=VariableCollection
//         //                           {
//         //                             Procurement@1003 : Record "Procurement Request";
//         //                           }
//         //                            }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          RecRef.GETTABLE(Variant);
//         //  
//         //                                          CASE RecRef.NUMBER OF
//         //                                          #4..15
//         //                                                ReleaseDocument(Variant);
//         //                                              END;
//         //                                            DATABASE::"Purchase Header":
//         //                                              ReleasePurchaseDocument.PerformManualCheckAndRelease(Variant);
//         //                                            DATABASE::"Sales Header":
//         //                                              ReleaseSalesDocument.PerformManualCheckAndRelease(Variant);
//         //                                            DATABASE::"Incoming Document":
//         //                                              ReleaseIncomingDocument.PerformManualRelease(Variant);
//         //                                            ELSE BEGIN
//         //                                              OnReleaseDocument(RecRef,Handled);
//         //                                              IF NOT Handled THEN
//         //                                                ERROR(UnsupportedRecordTypeErr,RecRef.CAPTION);
//         //                                            END;
//         //                                          END;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          {The code has been merged but contained errors that could prevent import
//         //                                          and the code has been put in comments. Use Shift+Ctrl+O to Uncomment}
//         //                                          #1..18
//         //                                            BEGIN
//         //                                              ReleasePurchaseDocument.PerformManualCheckAndRelease(Variant);
//         //                                          ///Sending Notifications on approvals of Purchase Documents...22.10.2019 Hunaina
//         //                                              FnSendEmaiNotificationOnPurchDocApproval(Variant);
//         //                                          ///.....End 22.10.2019 Hunaina
//         //                                          END;
//         //  
//         //                                          #20..23
//         //  
//         //                                             //Added by Coremen on 28/11/2015
//         //                                            DATABASE::"Imprest Memo":
//         //                                              ReleaseImprestMemo.PerformManualRelease(Variant);
//         //                                            DATABASE::Payments:
//         //                                            BEGIN
//         //                                              ReleasePayments.PerformManualRelease(Variant);
//         //                                              ///Sending Notifications on approvals of Payments...30.03.2021 Muraya
//         //                                              FnSendEmaiNotificationOnPaymentDocApproval(Variant);
//         //                                              ///.....End 0.03.2021 Muraya
//         //                                             END;
//         //                                            //
//         //                                             //Added by Kugun on 01/05/2016
//         //                                            DATABASE::"Payroll PeriodX":
//         //                                            ReleasePayPeriod.PerformManualRelease(Variant);
//         //                                            //Salary Vouchers
//         //                                             DATABASE::"Payroll Header":
//         //                                              ReleasePayments.PerformSalaryRelease(Variant);
//         //                                            //
//         //                                            DATABASE::"HR Leave Application":
//         //                                            ReleaseDoc.ReleaseLeaveApp(Variant);
//         //  
//         //                                            DATABASE::"Copyright Registration Table":
//         //                                            ReleaseDoc.ReleaseCopyReg(Variant);
//         //                                            //overtime
//         //                                            DATABASE::"Overtime Header":
//         //                                            ReleaseDoc.ReleaseOvertime(Variant);
//         //                                            DATABASE::"Training Requests":
//         //                                            ReleaseDoc.ReleaseTrainingApp(Variant);
//         //  
//         //                                          //Grant Funding Application
//         //                                            DATABASE::"Grant Funding Application":
//         //                                            ReleaseDoc.ReleaseGFA(Variant);
//         //  
//         //                                          //Project Contract
//         //                                            DATABASE::"Project Contract Header":
//         //                                            ReleaseDoc.ReleaseProjectContract(Variant);
//         //  
//         //                                          //Fleet Requisition
//         //                                            DATABASE::"Transport Requisition":
//         //                                            ReleaseDoc.ReleaseFleet(Variant);
//         //  
//         //                                          DATABASE::"File Movement Header":
//         //                                          ReleaseDoc.ReleaseFileMovement(Variant);
//         //                                           //Procurement method
//         //                                            DATABASE::"Procurement Request":
//         //                                            ReleaseDoc.ReleaseProcDOc(Variant);
//         //  
//         //                                           //Inspection......22.10.2019 Hunaina
//         //                                            DATABASE::"Inspection Header1":
//         //                                            ReleaseDoc.ReleaseInspectionDOc(Variant);
//         //  
//         //                                           //Committee......22.10.2019 Hunaina
//         //                                            DATABASE::"Tender Commitee Appointment1":
//         //                                            BEGIN
//         //                                            ReleaseDoc.ReleaseCommitteeDOc(Variant);
//         //                                            ///Sending Notifications on approvals of Committee Document...22.10.2019 Hunaina
//         //                                              FnSendEmaiNotificationOnCommitteeDocApproval(Variant);
//         //                                          ///.....End 22.10.2019 Hunaina
//         //                                            END;
//         //                                          //File Movement
//         //                                           { DATABASE::"File Movement Header":
//         //                                            ReleaseDoc.ReleaseFileMovement(Variant)}
//         //                                             //RFI
//         //                                            DATABASE::"Request For Information":
//         //                                            ReleaseDoc.ReleaseIFP(Variant);
//         //                                            //Vendor Debarment Voucher
//         //                                            DATABASE::"Vendor Debarment Voucher":
//         //                                            ReleaseDoc.ReleaseVendDebarment(Variant);
//         //  
//         //                                          //Procurement Plan
//         //                                            DATABASE::"Procurement Plan":
//         //                                            ReleaseDoc.ReleaseProcPlan(Variant);
//         //                                            //Tender Committe
//         //                                            DATABASE::"IFS Tender Committee":
//         //                                            ReleaseDoc.ReleaseTenderCommitte(Variant);
//         //                                            //Bid Evaluation
//         //                                            DATABASE::"Bid Evaluation Register":
//         //                                            ReleaseDoc.ReleaseBidEvaluation(Variant);
//         //                                            //Bid Opening
//         //                                            DATABASE::"Bid Opening Register":
//         //                                            ReleaseDoc.ReleaseBidOpening(Variant);
//         //                                            //Bid Tabulation
//         //                                            DATABASE::"Bid Tabulation Header":
//         //                                            ReleaseDoc.ReleaseBidTabulation(Variant);
//         //                                            //IFS
//         //                                            DATABASE::"Standard Purchase Code":
//         //                                            ReleaseDoc.ReleaseITT(Variant);
//         //  
//         //  
//         //                                          #24..28
//         //                                          {<<<<<<<}
//         //                                          END;
//         //                                        END;
//         //  
//         //                           Target=ReleaseDocument(PROCEDURE 5) }
//         //      { Insertion         ;Target=OpenDocument(PROCEDURE 6);
//         //                           InsertAfter=TargetRecRef(Variable 1007);
//         //                           ChangedElements=VariableCollection
//         //                           {
//         //                             ReleaseImprestMemo@1455 : Codeunit "Imprest Memo";
//         //                             ReleasePayments@1004 : Codeunit Payments;
//         //                             ReleasePayPeriod@1800 : Codeunit "Release Payroll period";
//         //                             ReleaseDoc@1010 : Codeunit "Release Approval Document";
//         //                           }
//         //                            }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          RecRef.GETTABLE(Variant);
//         //  
//         //                                          CASE RecRef.NUMBER OF
//         //                                          #4..20
//         //                                              ReleaseSalesDocument.Reopen(Variant);
//         //                                            DATABASE::"Incoming Document":
//         //                                              ReleaseIncomingDocument.Reopen(Variant);
//         //                                            ELSE BEGIN
//         //                                              OnOpenDocument(RecRef,Handled);
//         //                                              IF NOT Handled THEN
//         //                                                ERROR(UnsupportedRecordTypeErr,RecRef.CAPTION);
//         //                                            END;
//         //                                          END;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          {The code has been merged but contained errors that could prevent import
//         //                                          and the code has been put in comments. Use Shift+Ctrl+O to Uncomment}
//         //                                          #1..23
//         //  
//         //                                            //added by daudi
//         //                                              DATABASE::"Imprest Memo":
//         //                                              ReleaseImprestMemo.Reopen(Variant);
//         //                                            DATABASE::Payments:
//         //                                              ReleasePayments.Reopen(Variant);
//         //                                            DATABASE::"Payroll PeriodX":
//         //                                            ReleasePayPeriod.Reopen(Variant);
//         //                                            DATABASE::"HR Leave Application":
//         //                                            ReleaseDoc.ReopenLeaveApp(Variant);
//         //                                            DATABASE::"Copyright Registration Table":
//         //                                            ReleaseDoc.ReopenCopyReg(Variant);
//         //                                            DATABASE::"Overtime Header":
//         //                                            ReleaseDoc.ReopenOvertime(Variant);
//         //                                            DATABASE::"Training Requests":
//         //                                            ReleaseDoc.ReopenTrainingApp(Variant);
//         //                                             DATABASE::"Grant Funding Application":
//         //                                            ReleaseDoc.ReopenGFA(Variant);
//         //                                             DATABASE::"Project Contract Header":
//         //                                            ReleaseDoc.ReopenProjectContract(Variant);
//         //                                              DATABASE::"Transport Requisition":
//         //                                            ReleaseDoc.ReopenFleet(Variant);
//         //                                            DATABASE::"Payroll Header":
//         //                                            ReleasePayments.PerformSalaryReopen(Variant);
//         //                                            DATABASE::"Procurement Request":
//         //                                             ReleaseDoc.ReopenProcDoc(Variant);
//         //                                            ///Inspection....22.10.2019 Hunaina
//         //                                             DATABASE::"Inspection Header1":
//         //                                             ReleaseDoc.ReopenInspectionDoc(Variant);
//         //                                             ///Committee....22.10.2019 Hunaina
//         //                                             DATABASE::"Tender Commitee Appointment1":
//         //                                             ReleaseDoc.ReopenCommitteeDoc(Variant);
//         //  
//         //                                              DATABASE::"File Movement Header":
//         //                                             ReleaseDoc.ReopenFileMovement(Variant);
//         //                                             DATABASE::"Request For Information":
//         //                                            ReleaseDoc.ReopenIFP(Variant);
//         //  
//         //                                            DATABASE::"Vendor Debarment Voucher":
//         //                                            ReleaseDoc.ReopenVendDebarment(Variant);
//         //  
//         //                                            DATABASE::"Procurement Plan":
//         //                                            ReleaseDoc.ReopenProcPlan(Variant);
//         //                                            //Tender Committe
//         //                                            DATABASE::"IFS Tender Committee":
//         //                                            ReleaseDoc.ReopenTenderCommitte(Variant);
//         //  
//         //                                            //Bid Evaluation
//         //                                            DATABASE::"Bid Evaluation Register":
//         //                                            ReleaseDoc.ReopenBidEvaluation(Variant);
//         //                                            //Bid Opening
//         //                                            DATABASE::"Bid Opening Register":
//         //                                            ReleaseDoc.ReopenBidOpening(Variant);
//         //                                            //Bid Tabulation
//         //                                            DATABASE::"Bid Tabulation Header":
//         //                                            ReleaseDoc.ReopenBidTabulation(Variant);
//         //                                            //IFS
//         //                                            DATABASE::"Standard Purchase Code":
//         //                                            ReleaseDoc.ReopenITT(Variant);
//         //  
//         //  
//         //  
//         //                                          #24..28
//         //                                          {<<<<<<<}
//         //                                          END;
//         //                                        END;
//         //  
//         //                           Target=OpenDocument(PROCEDURE 6) }
//         //      { Insertion         ;InsertAfter=OnCheckHasRequiredArguments(PROCEDURE 77);
//         //                           ChangedElements=PROCEDURECollection
//         //                           {
//         //                             PROCEDURE FnSendEmaiNotificationOnPurchDocApproval@80(PurchaseHeader@1000 : Record "Purchase Header");
//         //                             VAR
//         //                               PurchaseH@1001 : Record "Purchase Header";
//         //                               LastFieldNo@1048 : Integer;
//         //                               FooterPrinted@1047 : Boolean;
//         //                               FileDirectory@1046 : Text[100];
//         //                               FileName@1045 : Text[100];
//         //                               ReportID@1044 : Integer;
//         //                               Object@1043 : Record Object;
//         //                               Window@1042 : Dialog;
//         //                               RunOnceFile@1041 : Text[1000];
//         //                               TimeOut@1040 : Integer;
//         //                               Customer2@1039 : Record Customer;
//         //                               Cust@1038 : Record Customer;
//         //                               cr@1037 : Integer;
//         //                               lf@1036 : Integer;
//         //                               EmailBody@1035 : ARRAY [2] OF Text[30];
//         //                               BodyText@1034 : Text[250];
//         //                               mymail@1033 : Codeunit Mail;
//         //                               DefaultPrinter@1032 : Text[200];
//         //                               WindowisOpen@1031 : Boolean;
//         //                               FileDialog@1030 : Codeunit "SMTP Test Mail";
//         //                               SendingDate@1029 : Date;
//         //                               SendingTime@1028 : Time;
//         //                               Counter@1027 : Integer;
//         //                               cu400@1026 : Codeunit "SMTP Mail";
//         //                               DocLog@1025 : Record "Document E-mail Log";
//         //                               BranchName@1024 : Code[80];
//         //                               DimValue@1023 : Record "Dimension Value";
//         //                               SenderAddress@1022 : Text[100];
//         //                               CustEmail@1021 : Text[100];
//         //                               UserSetup@1020 : Record "User Setup";
//         //                               HRSetup@1019 : Record "Company Information";
//         //                               Emp@1018 : Record Vendor;
//         //                               PayrollMonth@1017 : Date;
//         //                               PayrollMonthText@1016 : Text[30];
//         //                               PayPeriodtext@1015 : Text;
//         //                               PayPeriod@1014 : Record "Payroll PeriodX";
//         //                               CompInfo@1013 : Record "Company Information";
//         //                               DateFilter@1011 : Text;
//         //                               FromDate@1010 : Date;
//         //                               ToDate@1009 : Date;
//         //                               FromDateS@1008 : Text;
//         //                               ToDateS@1007 : Text;
//         //                               vend@1006 : Record Vendor;
//         //                               StartDate@1005 : Date;
//         //                               EndDAte@1004 : Date;
//         //                               EmailVerifier@1003 : Codeunit Payroll3;
//         //                               IsEmailValid@1002 : Boolean;
//         //                               PPayableSetup@1049 : Record "Purchases & Payables Setup";
//         //                               RequesterName@1012 : Text[100];
//         //                               RequesterEmail@1050 : Text[100];
//         //                               emailhdr@1051 : Text[100];
//         //                             BEGIN
//         //                               ///Notifying Procurement Manager and the Requester on Document approval 22.10.2019 Hunaina
//         //                               PurchaseH.RESET;
//         //                               PurchaseH.SETRANGE(PurchaseH."No.",PurchaseHeader."No.");
//         //                               PurchaseH.SETRANGE("Document Type",PurchaseH."Document Type"::"Purchase Requisition");
//         //                               IF PurchaseH.FIND('-') THEN BEGIN
//         //  
//         //                                  CompInfo.GET;
//         //                                  HRSetup.GET;
//         //                                  PPayableSetup.GET;
//         //  
//         //                               UserSetup.RESET;
//         //                               UserSetup.SETRANGE("User ID", PurchaseHeader."Requester ID");
//         //                               //UserSetup.SETRANGE("User ID", PurchaseH."Requester ID");
//         //                               IF UserSetup.FINDSET THEN BEGIN
//         //                               RequesterName:= UserSetup."Employee Name";
//         //                               RequesterEmail:=UserSetup."E-Mail";
//         //                               END;
//         //  
//         //                               Window.OPEN('Notifying the Requester and Deputy Director SCM...');
//         //  
//         //                               WindowisOpen := TRUE;
//         //  
//         //  
//         //                               Counter:=Counter+1;
//         //  
//         //                               //Create message
//         //                               IF HRSetup."E-Mail"='' THEN
//         //                                 ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
//         //                               SenderAddress:=HRSetup."E-Mail";
//         //  
//         //                               IF PPayableSetup."Procurement Manager Email" = '' THEN
//         //                                 ERROR('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
//         //                                 CustEmail:=PPayableSetup."Procurement Manager Email";
//         //  
//         //                               IF RequesterEmail='' THEN
//         //                                ERROR('Please Contact the IT Admin to specify the Requester E-mail address under User Setup page!!');
//         //                                 RequesterEmail:=UserSetup."E-Mail";
//         //  
//         //                               IF CustEmail='' THEN
//         //                                EXIT;
//         //  
//         //                               MESSAGE:='This is to notify you that Purchase Requisition No. ' +  PurchaseH."No." + ' has been approved';
//         //                               emailhdr:='DOCUMENT APPROVAL NOTIFICATION:';
//         //  
//         //                               cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
//         //                               'Dear '+RequesterName+'<BR>This is to notify you that purchase Requisition No. '+ PurchaseH."No."+' has been approved</BR>', TRUE);
//         //  
//         //                               cu400.AddCC(CustEmail);
//         //  
//         //                               cu400.AppendBody(
//         //                               '<BR><BR>Kind Regards,'+
//         //                               '<BR><BR>'+CompInfo.Name+'.<BR>');
//         //  
//         //  
//         //                               cu400.Send;
//         //                               SendingDate:=TODAY;
//         //                               SendingTime:=TIME;
//         //  
//         //                                SLEEP(1000);
//         //                                Window.CLOSE;
//         //  
//         //                               END;
//         //                             END;
//         //  
//         //                             PROCEDURE FnSendEmaiNotificationOnCommitteeDocApproval@76(CommitteeH@1000 : Record "Tender Commitee Appointment1");
//         //                             VAR
//         //                               CommitteeHeader@1001 : Record "Tender Commitee Appointment1";
//         //                               CommitteeLines@1053 : Record "Commitee Members";
//         //                               LastFieldNo@1048 : Integer;
//         //                               FooterPrinted@1047 : Boolean;
//         //                               ReportID@1044 : Integer;
//         //                               Object@1043 : Record Object;
//         //                               Window@1042 : Dialog;
//         //                               RunOnceFile@1041 : Text[1000];
//         //                               TimeOut@1040 : Integer;
//         //                               Customer2@1039 : Record Customer;
//         //                               Cust@1038 : Record Customer;
//         //                               cr@1037 : Integer;
//         //                               lf@1036 : Integer;
//         //                               EmailBody@1035 : ARRAY [2] OF Text[30];
//         //                               BodyText@1034 : Text[250];
//         //                               mymail@1033 : Codeunit Mail;
//         //                               DefaultPrinter@1032 : Text[200];
//         //                               WindowisOpen@1031 : Boolean;
//         //                               FileDialog@1030 : Codeunit "SMTP Test Mail";
//         //                               SendingDate@1029 : Date;
//         //                               SendingTime@1028 : Time;
//         //                               Counter@1027 : Integer;
//         //                               cu400@1026 : Codeunit "SMTP Mail";
//         //                               DocLog@1025 : Record "Document E-mail Log";
//         //                               BranchName@1024 : Code[80];
//         //                               DimValue@1023 : Record "Dimension Value";
//         //                               SenderAddress@1022 : Text[100];
//         //                               CommitteeMemberEmail@1021 : Text[100];
//         //                               CommitteeMemberName@1002 : Text[100];
//         //                               UserSetup@1020 : Record "User Setup";
//         //                               HRSetup@1019 : Record "Company Information";
//         //                               Emp@1018 : Record Employee;
//         //                               CompInfo@1013 : Record "Company Information";
//         //                               DateFilter@1011 : Text;
//         //                               FromDate@1010 : Date;
//         //                               ToDate@1009 : Date;
//         //                               FromDateS@1008 : Text;
//         //                               ToDateS@1007 : Text;
//         //                               StartDate@1005 : Date;
//         //                               EndDAte@1004 : Date;
//         //                               RequesterName@1012 : Text[100];
//         //                               RequesterEmail@1050 : Text[100];
//         //                               emailhdr@1051 : Text[100];
//         //                             BEGIN
//         //                               ///Notifying Committee Members on Committee Document fully approval 22.10.2019 Hunaina
//         //                               CommitteeHeader.RESET;
//         //                               CommitteeHeader.SETRANGE(CommitteeHeader."Appointment No",CommitteeH."Appointment No");
//         //                               IF CommitteeHeader.FIND('-') THEN BEGIN
//         //                                 CommitteeLines.RESET;
//         //                                 CommitteeLines.SETRANGE("Appointment No", CommitteeHeader."Appointment No");
//         //                                 IF CommitteeLines.FINDSET THEN BEGIN
//         //                                   REPEAT
//         //                                   Emp.RESET;
//         //                                   Emp.SETRANGE("No.",CommitteeLines."Employee No");
//         //                                   IF Emp.FINDSET THEN BEGIN
//         //                                   CommitteeMemberEmail:= Emp."Company E-Mail";
//         //                                   CommitteeMemberName:=Emp."First Name"+'  '+Emp."Middle Name"+'  '+Emp."Last Name";
//         //  
//         //                               CompInfo.GET;
//         //                               HRSetup.GET;
//         //  
//         //                               Window.OPEN('Notifying the Committee Members...');
//         //  
//         //                               WindowisOpen := TRUE;
//         //  
//         //                               Counter:=Counter+1;
//         //  
//         //                               //Create message
//         //                               IF HRSetup."E-Mail"='' THEN
//         //                                 ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
//         //                               SenderAddress:=HRSetup."E-Mail";
//         //  
//         //                               IF CommitteeMemberEmail='' THEN
//         //                                ERROR('Please Contact the IT Admin to specify the Member E-mail address under Employee Card Setup page!!');
//         //                                 CommitteeMemberEmail:= Emp."Company E-Mail";
//         //  
//         //  
//         //                               MESSAGE:='You have been Appointed to Participate in the ' +  CommitteeHeader."Committee Name" + 'for' + CommitteeHeader.Title + 'at' + CommitteeHeader.Location + 'headquaters';
//         //                               emailhdr:='DOCUMENT APPROVAL NOTIFICATION:';
//         //  
//         //                               cu400.CreateMessage(CompInfo.Name,SenderAddress,CommitteeMemberEmail,emailhdr,
//         //                               'Dear '+CommitteeMemberName +'<BR> You have been appointed to participate in the  '+ CommitteeHeader."Committee Name" + 'for' + CommitteeHeader.Title + 'at' + CommitteeHeader.Location +' offices</BR>', TRUE);
//         //  
//         //                               cu400.AppendBody(
//         //                               '<BR><BR>Kind Regards,'+
//         //                               '<BR><BR>'+CompInfo.Name+'.<BR>');
//         //                               cu400.Send;
//         //                               SendingDate:=TODAY;
//         //                               SendingTime:=TIME;
//         //  
//         //                                SLEEP(1000);
//         //                                Window.CLOSE;
//         //                                END;
//         //                                   UNTIL CommitteeLines.NEXT=0;
//         //                                   END;
//         //                               END;
//         //                             END;
//         //  
//         //                             PROCEDURE FnSendEmaiNotificationOnPaymentDocApproval@84(PaymentsTable@1000 : Record Payments);
//         //                             VAR
//         //                               Payments@1001 : Record Payments;
//         //                               LastFieldNo@1048 : Integer;
//         //                               FooterPrinted@1047 : Boolean;
//         //                               FileDirectory@1046 : Text[100];
//         //                               FileName@1045 : Text[100];
//         //                               ReportID@1044 : Integer;
//         //                               Object@1043 : Record Object;
//         //                               Window@1042 : Dialog;
//         //                               RunOnceFile@1041 : Text[1000];
//         //                               TimeOut@1040 : Integer;
//         //                               Customer2@1039 : Record Customer;
//         //                               Cust@1038 : Record Customer;
//         //                               cr@1037 : Integer;
//         //                               lf@1036 : Integer;
//         //                               EmailBody@1035 : ARRAY [2] OF Text[30];
//         //                               BodyText@1034 : Text[250];
//         //                               mymail@1033 : Codeunit Mail;
//         //                               DefaultPrinter@1032 : Text[200];
//         //                               WindowisOpen@1031 : Boolean;
//         //                               FileDialog@1030 : Codeunit "SMTP Test Mail";
//         //                               SendingDate@1029 : Date;
//         //                               SendingTime@1028 : Time;
//         //                               Counter@1027 : Integer;
//         //                               cu400@1026 : Codeunit "SMTP Mail";
//         //                               DocLog@1025 : Record "Document E-mail Log";
//         //                               BranchName@1024 : Code[80];
//         //                               DimValue@1023 : Record "Dimension Value";
//         //                               SenderAddress@1022 : Text[100];
//         //                               CustEmail@1021 : Text[100];
//         //                               UserSetup@1020 : Record "User Setup";
//         //                               HRSetup@1019 : Record "Company Information";
//         //                               Emp@1018 : Record Vendor;
//         //                               PayrollMonth@1017 : Date;
//         //                               PayrollMonthText@1016 : Text[30];
//         //                               PayPeriodtext@1015 : Text;
//         //                               PayPeriod@1014 : Record "Payroll PeriodX";
//         //                               CompInfo@1013 : Record "Company Information";
//         //                               DateFilter@1011 : Text;
//         //                               FromDate@1010 : Date;
//         //                               ToDate@1009 : Date;
//         //                               FromDateS@1008 : Text;
//         //                               ToDateS@1007 : Text;
//         //                               vend@1006 : Record Vendor;
//         //                               StartDate@1005 : Date;
//         //                               EndDAte@1004 : Date;
//         //                               EmailVerifier@1003 : Codeunit Payroll3;
//         //                               IsEmailValid@1002 : Boolean;
//         //                               PPayableSetup@1049 : Record "Purchases & Payables Setup";
//         //                               RequesterName@1012 : Text[100];
//         //                               RequesterEmail@1050 : Text[100];
//         //                               emailhdr@1051 : Text[100];
//         //                             BEGIN
//         //                               ///Notifying Procurement Manager and the Requester on Document approval 22.10.2019 Hunaina
//         //                               Payments.RESET;
//         //                               Payments.SETRANGE(Payments."No.",PaymentsTable."No.");
//         //                               //Payments.SETRANGE("Document Type",Payments."Document Type"::);
//         //                               IF Payments.FIND('-') THEN BEGIN
//         //  
//         //                                  CompInfo.GET;
//         //                                  HRSetup.GET;
//         //                                  PPayableSetup.GET;
//         //  
//         //                               UserSetup.RESET;
//         //                               UserSetup.SETRANGE("User ID", PaymentsTable."Created By");
//         //                               //UserSetup.SETRANGE("User ID", Payments."Requester ID");
//         //                               IF UserSetup.FINDSET THEN BEGIN
//         //                               RequesterName:= UserSetup."Employee Name";
//         //                               RequesterEmail:=UserSetup."E-Mail";
//         //                               END;
//         //  
//         //                               Window.OPEN('Notifying the Requester......');
//         //  
//         //                               WindowisOpen := TRUE;
//         //  
//         //  
//         //                               Counter:=Counter+1;
//         //  
//         //                               //Create message
//         //                               IF HRSetup."E-Mail"='' THEN
//         //                                 ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
//         //                               SenderAddress:=HRSetup."E-Mail";
//         //  
//         //                               // IF PPayableSetup."Procurement Manager Email" = '' THEN
//         //                               //  ERROR('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
//         //                               //  CustEmail:=PPayableSetup."Procurement Manager Email";
//         //  
//         //                               IF RequesterEmail='' THEN
//         //                                ERROR('Please Contact the IT Admin to specify the Requester E-mail address under User Setup page!!');
//         //                                 RequesterEmail:=UserSetup."E-Mail";
//         //  
//         //                               // IF CustEmail='' THEN
//         //                               // EXIT;
//         //  
//         //                               //MESSAGE:='This is to notify you that Payment No. ' +  Payments."No." + ' has been approved';
//         //                               emailhdr:='DOCUMENT APPROVAL NOTIFICATION:';
//         //  
//         //                               cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
//         //                               'Dear '+RequesterName+'<BR>This is to notify you that Payment No. '+ Payments."No."+' has been approved</BR>', TRUE);
//         //  
//         //                               //cu400.AddCC(CustEmail);
//         //  
//         //                               cu400.AppendBody(
//         //                               '<BR><BR>Kind Regards,'+
//         //                               '<BR><BR>'+CompInfo.Name+'.<BR>');
//         //  
//         //  
//         //                               cu400.Send;
//         //                               SendingDate:=TODAY;
//         //                               SendingTime:=TIME;
//         //  
//         //                                SLEEP(1000);
//         //                                Window.CLOSE;
//         //  
//         //                               END;
//         //                             END;
//         //  
//         //                           }
//         //                            }
//         //      { Insertion         ;InsertAfter=DiscardNewValuesTxt(Variable 1001);
//         //                           ChangedElements=VariableCollection
//         //                           {
//         //                             Wresponse@1048 : Codeunit "Dynasoft Workflow Responses";
//         //                             WorkflowManagement@1049 : Codeunit "Workflow Management";
//         //                           }
//         //                            }
//         //    }
//         //    CODE
//         //    {
//         //  
//         //      BEGIN
//         //      END.
//         //    }
//         //  }
//         //  
//         //  

//     end;
// }
