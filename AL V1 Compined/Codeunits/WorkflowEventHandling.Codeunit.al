// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70001520 "Workflow Event Handling1520"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Workflow Event Handling"(Codeunit 1520)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=09042020D;
//         //      Time=113258T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Workflow Event Handling"(Codeunit 1520);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          AddEventToLibrary(
//         //                                            RunWorkflowOnAfterInsertIncomingDocumentCode,DATABASE::"Incoming Document",IncDocCreatedEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(
//         //                                          #4..98
//         //                                            RunWorkflowOnAfterCreateGenJnlLineFromIncomingDocFailCode,DATABASE::"Incoming Document",
//         //                                            CreateGenJnlLineFromIncDocFailsEventDescTxt,0,FALSE);
//         //  
//         //                                          OnAddWorkflowEventsToLibrary;
//         //                                          OnAddWorkflowTableRelationsToLibrary;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..101
//         //                                          //added by daudi on 09/05/2017
//         //                                          AddEventToLibrary(RunWorkflowOnSendImpMemoForApprovalCode,DATABASE::"Imprest Memo",
//         //                                            ImpMemoSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelImpMemoApprovalRequestCode,DATABASE::"Imprest Memo",
//         //                                            ImpMemoApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseImpMemoCode,DATABASE::"Imprest Memo",
//         //                                            ImpMemoReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          AddEventToLibrary(RunWorkflowOnSendPaymentsForApprovalCode,DATABASE::Payments,
//         //                                            PaymentsSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelPaymentsApprovalRequestCode,DATABASE::Payments,
//         //                                            PaymentsApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleasePaymentsCode,DATABASE::Payments,
//         //                                            PaymentsReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          AddEventToLibrary(RunWorkflowOnSendPayPeriodForApprovalCode,DATABASE::"Payroll PeriodX",
//         //                                            PayPeriodSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelPayPeriodApprovalRequestCode,DATABASE::"Payroll PeriodX",
//         //                                            PayPeriodApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleasePayPeriodCode,DATABASE::"Payroll PeriodX",
//         //                                            PayPeriodReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///copyright registation
//         //                                          AddEventToLibrary(RunWorkflowOnSendCopyRegForApprovalCode,DATABASE::"Copyright Registration Table",
//         //                                            CopyRegSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelCopyRegApprovalRequestCode,DATABASE::"Copyright Registration Table",
//         //                                            CopyRegApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseCopyRegCode,DATABASE::"Copyright Registration Table",
//         //                                            CopyRegReleasedEventDescTxt,0,FALSE);
//         //                                          //
//         //                                          ///Overtime Application
//         //                                          AddEventToLibrary(RunWorkflowOnSendOvertimeForApprovalCode,DATABASE::"Overtime Header",
//         //                                            OvertimeSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelOvertimeApprovalRequestCode,DATABASE::"Overtime Header",
//         //                                            OvertimeApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseOvertimeCode,DATABASE::"Overtime Header",
//         //                                            OvertimeReleasedEventDescTxt,0,FALSE);
//         //                                          //
//         //                                          ///Training Application
//         //                                          AddEventToLibrary(RunWorkflowOnSendTrainingAppForApprovalCode,DATABASE::"Training Requests",
//         //                                            TrainingAppSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelTrainingAppApprovalRequestCode,DATABASE::"Training Requests",
//         //                                            TrainingAPPApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseTrainingAppCode,DATABASE::"Training Requests",
//         //                                            TrainingAPPReleasedEventDescTxt,0,FALSE);
//         //  
//         //  
//         //                                          ///Salary Voucher
//         //                                          AddEventToLibrary(RunWorkflowOnSendSalaryForApprovalCode,DATABASE::"Payroll Header",
//         //                                            SalarySendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelSalaryApprovalRequestCode,DATABASE::"Payroll Header",
//         //                                            SalaryApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseSalaryCode,DATABASE::"Payroll Header",
//         //                                            SalaryReleasedEventDescTxt,0,FALSE);
//         //                                          //
//         //  
//         //                                          ///Grant Funding Application
//         //                                          AddEventToLibrary(RunWorkflowOnSendGFAForApprovalCode,DATABASE::"Grant Funding Application",
//         //                                            GFASendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelGFAApprovalRequestCode,DATABASE::"Grant Funding Application",
//         //                                            GFAApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseGFACode,DATABASE::"Grant Funding Application",
//         //                                            GFAReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Project Contract
//         //                                          AddEventToLibrary(RunWorkflowOnSendProjectContractForApprovalCode,DATABASE::"Project Contract Header",
//         //                                            ProjectContractSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelProjectContractApprovalRequestCode,DATABASE::"Project Contract Header",
//         //                                            ProjectContractApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseProjectContractCode,DATABASE::"Project Contract Header",
//         //                                            ProjectContractReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Fleet Requisition
//         //                                          AddEventToLibrary(RunWorkflowOnSendFleetForApprovalCode,DATABASE::"Transport Requisition",
//         //                                            FleetSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelFleetApprovalRequestCode,DATABASE::"Transport Requisition",
//         //                                            FleetApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseFleetCode,DATABASE::"Transport Requisition",
//         //                                            FleetReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Procurement Methods
//         //                                          AddEventToLibrary(RunWorkflowOnSendProcDocForApprovalCode,DATABASE::"Procurement Request",
//         //                                            ProcDocSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelProcDocApprovalRequestCode,DATABASE::"Procurement Request",
//         //                                            ProcDocApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseProcDocCode,DATABASE::"Procurement Request",
//         //                                            ProcDOcReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///File Movement
//         //                                          AddEventToLibrary(RunWorkflowOnSendFileMovementForApprovalCode,DATABASE::"File Movement Header",
//         //                                            FileMovementSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelFileMovementApprovalRequestCode,DATABASE::"File Movement Header",
//         //                                            FileMovementApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseFileMovementCode,DATABASE::"File Movement Header",
//         //                                            FileMovementReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Inspection.....22.10.2019 Hunaina
//         //                                          AddEventToLibrary(RunWorkflowOnSendInspectionDocForApprovalCode,DATABASE::"Inspection Header1",
//         //                                            InspectionDocSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelInspectionDocApprovalRequestCode,DATABASE::"Inspection Header1",
//         //                                            InspectionDocApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseInspectionDocCode,DATABASE::"Inspection Header1",
//         //                                            InspectionDocReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Committee.....22.10.2019 Hunaina
//         //                                          AddEventToLibrary(RunWorkflowOnSendCommitteeDocForApprovalCode,DATABASE::"Tender Commitee Appointment1",
//         //                                            CommitteeDocSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelCommitteeDocApprovalRequestCode,DATABASE::"Tender Commitee Appointment1",
//         //                                            CommitteeDocApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseCommitteeDocCode,DATABASE::"Tender Commitee Appointment1",
//         //                                            CommitteeDocReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Request for Information
//         //                                          AddEventToLibrary(RunWorkflowOnSendIFPForApprovalCode,DATABASE::"Request For Information",
//         //                                            IFPSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelIFPApprovalRequestCode,DATABASE::"Request For Information",
//         //                                            IFPApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseIFPCode,DATABASE::"Request For Information",
//         //                                            IFPReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Vendor Debarment Voucher
//         //                                          AddEventToLibrary(RunWorkflowOnSendVendDebarmentForApprovalCode,DATABASE::"Vendor Debarment Voucher",
//         //                                            VendDebarmentSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelVendDebarmentApprovalRequestCode,DATABASE::"Vendor Debarment Voucher",
//         //                                            VendDebarmentApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseVendDebarmentCode,DATABASE::"Vendor Debarment Voucher",
//         //                                            VendDebarmentReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Procurement Methods
//         //                                          AddEventToLibrary(RunWorkflowOnSendProcPlanForApprovalCode,DATABASE::"Procurement Plan",
//         //                                            ProcPlanSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelProcPlanApprovalRequestCode,DATABASE::"Procurement Plan",
//         //                                            ProcPlanApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseProcPlanCode,DATABASE::"Procurement Plan",
//         //                                            ProcPlanReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                            ///Tender Committee
//         //                                          AddEventToLibrary(RunWorkflowOnSendTenderCommitteForApprovalCode,DATABASE::"IFS Tender Committee",
//         //                                            TenderCommitteSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelTenderCommitteApprovalRequestCode,DATABASE::"IFS Tender Committee",
//         //                                            TenderCommitteApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseTenderCommitteCode,DATABASE::"IFS Tender Committee",
//         //                                            TenderCommitteReleasedEventDescTxt,0,FALSE);
//         //                                            ///Bid Evaluation
//         //                                          AddEventToLibrary(RunWorkflowOnSendBidEvaluationForApprovalCode,DATABASE::"Bid Evaluation Register",
//         //                                            BidEvaluationSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelBidEvaluationApprovalRequestCode,DATABASE::"Bid Evaluation Register",
//         //                                            BidEvaluationApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBidEvaluationCode,DATABASE::"Bid Evaluation Register",
//         //                                            BidEvaluationReleasedEventDescTxt,0,FALSE);
//         //                                            ///Bid Opening
//         //                                          AddEventToLibrary(RunWorkflowOnSendBidOpeningForApprovalCode,DATABASE::"Bid Opening Register",
//         //                                            BidOpeningSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelBidOpeningApprovalRequestCode,DATABASE::"Bid Opening Register",
//         //                                            BidOpeningApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBidOpeningCode,DATABASE::"Bid Opening Register",
//         //                                            BidOpeningReleasedEventDescTxt,0,FALSE);
//         //                                            ///Bid Tabulation
//         //                                          AddEventToLibrary(RunWorkflowOnSendBidTabulationForApprovalCode,DATABASE::"Bid Tabulation Header",
//         //                                            BidTabulationSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelBidTabulationApprovalRequestCode,DATABASE::"Bid Tabulation Header",
//         //                                            BidTabulationApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseBidTabulationCode,DATABASE::"Bid Tabulation Header",
//         //                                            BidTabulationReleasedEventDescTxt,0,FALSE);
//         //  
//         //                                          ///Invitation For Supply
//         //                                          AddEventToLibrary(RunWorkflowOnSendIFSForApprovalCode,DATABASE::"Standard Purchase Code",
//         //                                            IFSSendForApprovalEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnCancelIFSApprovalRequestCode,DATABASE::"Standard Purchase Code",
//         //                                            IFSApprReqCancelledEventDescTxt,0,FALSE);
//         //                                          AddEventToLibrary(RunWorkflowOnAfterReleaseIFSCode,DATABASE::"Standard Purchase Code",
//         //                                            IFSReleasedEventDescTxt,0,FALSE);
//         //  
//         //  
//         //                                          WREvents.AddEventsToLib;
//         //                                          OnAddWorkflowEventsToLibrary;
//         //                                          OnAddWorkflowTableRelationsToLibrary;
//         //                                        END;
//         //  
//         //                           Target=CreateEventsLibrary(PROCEDURE 13) }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          CASE EventFunctionName OF
//         //                                            RunWorkflowOnAfterPostPurchaseDocCode:
//         //                                              AddEventPredecessor(RunWorkflowOnAfterPostPurchaseDocCode,RunWorkflowOnAfterReleasePurchaseDocCode);
//         //                                          #4..22
//         //                                              AddEventPredecessor(RunWorkflowOnCustomerCreditLimitExceededCode,RunWorkflowOnSendSalesDocForApprovalCode);
//         //                                            RunWorkflowOnCustomerCreditLimitNotExceededCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCustomerCreditLimitNotExceededCode,RunWorkflowOnSendSalesDocForApprovalCode);
//         //                                            RunWorkflowOnApproveApprovalRequestCode:
//         //                                              BEGIN
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIncomingDocForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPurchaseDocForApprovalCode);
//         //                                          #30..36
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnCustomerChangedCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnVendorChangedCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnItemChangedCode);
//         //                                              END;
//         //                                            RunWorkflowOnRejectApprovalRequestCode:
//         //                                              BEGIN
//         //                                          #43..51
//         //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnCustomerChangedCode);
//         //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnVendorChangedCode);
//         //                                                AddEventPredecessor(RunWorkflowOnRejectApprovalRequestCode,RunWorkflowOnItemChangedCode);
//         //                                              END;
//         //                                            RunWorkflowOnDelegateApprovalRequestCode:
//         //                                              BEGIN
//         //                                          #58..66
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnCustomerChangedCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnVendorChangedCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnItemChangedCode);
//         //                                              END;
//         //                                            RunWorkflowOnGeneralJournalBatchBalancedCode:
//         //                                              AddEventPredecessor(RunWorkflowOnGeneralJournalBatchBalancedCode,RunWorkflowOnSendGeneralJournalBatchForApprovalCode);
//         //                                            RunWorkflowOnGeneralJournalBatchNotBalancedCode:
//         //                                              AddEventPredecessor(RunWorkflowOnGeneralJournalBatchNotBalancedCode,RunWorkflowOnSendGeneralJournalBatchForApprovalCode);
//         //                                          END;
//         //  
//         //                                          OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName);
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..25
//         //                                            //added by daudi on 09/05/2017
//         //                                            RunWorkflowOnCancelImpMemoApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelImpMemoApprovalRequestCode,RunWorkflowOnSendImpMemoForApprovalCode);
//         //                                            RunWorkflowOnCancelPaymentsApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelPaymentsApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
//         //                                             RunWorkflowOnCancelPayPeriodApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelPayPeriodApprovalRequestCode,RunWorkflowOnSendPayPeriodForApprovalCode);
//         //  
//         //                                            //copyright registration
//         //                                            RunWorkflowOnCancelCopyRegApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelCopyRegApprovalRequestCode,RunWorkflowOnSendCopyRegForApprovalCode);
//         //  
//         //                                            //
//         //                                             RunWorkflowOnCancelOvertimeApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelOvertimeApprovalRequestCode,RunWorkflowOnSendOvertimeForApprovalCode);
//         //                                             RunWorkflowOnCancelTrainingAppApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelTrainingAppApprovalRequestCode,RunWorkflowOnSendTrainingAppForApprovalCode);
//         //                                            RunWorkflowOnCancelSalaryApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelSalaryApprovalRequestCode,RunWorkflowOnSendSalaryForApprovalCode);
//         //                                            RunWorkflowOnCancelProcDocApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelProcDocApprovalRequestCode,RunWorkflowOnSendProcDocForApprovalCode);
//         //                                            RunWorkflowOnCancelFileMovementApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelFileMovementApprovalRequestCode,RunWorkflowOnSendFileMovementForApprovalCode);
//         //                                            //Inspection....22.10.2019 Hunaina
//         //                                            RunWorkflowOnCancelInspectionDocApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelInspectionDocApprovalRequestCode,RunWorkflowOnSendInspectionDocForApprovalCode);
//         //                                            //Committee....22.10.2019 Hunaina
//         //                                            RunWorkflowOnCancelCommitteeDocApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelCommitteeDocApprovalRequestCode,RunWorkflowOnSendCommitteeDocForApprovalCode);
//         //                                            RunWorkflowOnCancelIFPApprovalRequestCode:
//         //                                            AddEventPredecessor(RunWorkflowOnCancelIFPApprovalRequestCode,RunWorkflowOnSendIFPForApprovalCode);
//         //                                            RunWorkflowOnCancelVendDebarmentApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelVendDebarmentApprovalRequestCode,RunWorkflowOnSendVendDebarmentForApprovalCode);
//         //                                            RunWorkflowOnCancelProcPlanApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelProcPlanApprovalRequestCode,RunWorkflowOnSendProcPlanForApprovalCode);
//         //                                            //Tender Committe
//         //                                            RunWorkflowOnCancelTenderCommitteApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelTenderCommitteApprovalRequestCode,RunWorkflowOnSendTenderCommitteForApprovalCode);
//         //                                            RunWorkflowOnCancelBidEvaluationApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelBidEvaluationApprovalRequestCode,RunWorkflowOnSendBidEvaluationForApprovalCode);
//         //                                            RunWorkflowOnCancelBidOpeningApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelBidOpeningApprovalRequestCode,RunWorkflowOnSendBidOpeningForApprovalCode);
//         //                                            RunWorkflowOnCancelBidTabulationApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelBidTabulationApprovalRequestCode,RunWorkflowOnSendBidTabulationForApprovalCode);
//         //                                            RunWorkflowOnCancelIFSApprovalRequestCode:
//         //                                              AddEventPredecessor(RunWorkflowOnCancelIFSApprovalRequestCode,RunWorkflowOnSendIFSForApprovalCode);
//         //                                             RunWorkflowOnApproveApprovalRequestCode:
//         //                                          #27..39
//         //                                              //added by daudi on 09/05/2017
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendImpMemoForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
//         //                                                  AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPayPeriodForApprovalCode);
//         //                                              //Copyright Registration
//         //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendCopyRegForApprovalCode);
//         //                                                //
//         //                                                 //Overtime Application
//         //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendOvertimeForApprovalCode);
//         //                                                //
//         //  
//         //                                              //Grant Funding Application
//         //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendGFAForApprovalCode);
//         //                                                //Project Contracts
//         //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProjectContractForApprovalCode);
//         //                                              //Fleet Requisition
//         //                                              AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFleetForApprovalCode);
//         //                                                //
//         //                                                    AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTrainingAppForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSalaryForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProcDocForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFileMovementForApprovalCode);
//         //                                                ///Inspection....22.10.2019 Hunaina
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendInspectionDocForApprovalCode);
//         //                                                ///Committee....22.10.2019 Hunaina
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendCommitteeDocForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIFPForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendVendDebarmentForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProcPlanForApprovalCode);
//         //                                                //Tender Committe
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTenderCommitteForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidEvaluationForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidOpeningForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidTabulationForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIFSForApprovalCode);
//         //                                          #40..54
//         //                                              //added by daudi on 09/05/2017
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendImpMemoForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendPayPeriodForApprovalCode);
//         //                                                //copyright registration
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendCopyRegForApprovalCode);
//         //                                                //
//         //                                                //Overtime Application
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendOvertimeForApprovalCode);
//         //                                                //
//         //                                                //Grant Funding Application
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendGFAForApprovalCode);
//         //                                                //
//         //                                                //Project Contracts
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProjectContractForApprovalCode);
//         //                                                //Fleet Requisition
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFleetForApprovalCode);
//         //                                                //
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTrainingAppForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendSalaryForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProcDocForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendFileMovementForApprovalCode);
//         //                                                ///Inspection....22.10.2019 Hunaina
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendInspectionDocForApprovalCode);
//         //                                                ///Committee...22.10.2019 Hunaina
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendCommitteeDocForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIFPForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendVendDebarmentForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendProcPlanForApprovalCode);
//         //                                                //Tender Committee
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendTenderCommitteForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidEvaluationForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidOpeningForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendBidTabulationForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnApproveApprovalRequestCode,RunWorkflowOnSendIFSForApprovalCode);
//         //                                          #55..69
//         //                                              //added by daudi on 09/05/2017
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendImpMemoForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPaymentsForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendPayPeriodForApprovalCode);
//         //                                                //Copyright registation
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendCopyRegForApprovalCode);
//         //                                                //
//         //                                                //Overtime Application
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendOvertimeForApprovalCode);
//         //                                                //
//         //                                                //Grant Funding Application
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendGFAForApprovalCode);
//         //                                                //Project Contract
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendProjectContractForApprovalCode);
//         //                                                 //Fleet Requisition
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendFleetForApprovalCode);
//         //                                                //
//         //  
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendTrainingAppForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendSalaryForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendProcDocForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendFileMovementForApprovalCode);
//         //                                                ///Inspection...22.10.2019
//         //                                                 AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendInspectionDocForApprovalCode);
//         //                                                 ///Committee...22.10.2019
//         //                                                  AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendCommitteeDocForApprovalCode);
//         //  
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendIFPForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendVendDebarmentForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendProcPlanForApprovalCode);
//         //                                                //Tender Committe
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendTenderCommitteForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBidEvaluationForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBidOpeningForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendBidTabulationForApprovalCode);
//         //                                                AddEventPredecessor(RunWorkflowOnDelegateApprovalRequestCode,RunWorkflowOnSendIFSForApprovalCode);
//         //                                          #70..75
//         //                                          WREvents.AddEventsPredecessor;
//         //                                          OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName);
//         //                                        END;
//         //  
//         //                           Target=AddEventPredecessors(PROCEDURE 67) }
//         //      { Insertion         ;InsertAfter=RunWorkflowOnAfterCreateGenJnlLineFromIncomingDocFail(PROCEDURE 72);
//         //                           ChangedElements=PROCEDURECollection
//         //                           {
//         //                             LOCAL PROCEDURE ".........Daudi added......"@74();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendImpMemoForApprovalCode@1000000000() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendImpMemoForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelImpMemoApprovalRequestCode@1000000002() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelImpMemoApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseImpMemoCode@1000000001() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseImpMemo'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendImpMemoForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendImpMemoForApproval@1000000005(VAR ImprestMemo@1000 : Record "Imprest Memo");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendImpMemoForApprovalCode,ImprestMemo);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelImpMemoApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelImpMemoApprovalRequest@1000000004(VAR ImprestMemo@1000 : Record "Imprest Memo");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelImpMemoApprovalRequestCode,ImprestMemo);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57002,OnAfterReleaseImpMemo)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseImpMemoDoc@1000000003(VAR ImprestMemo@1000000000 : Record "Imprest Memo");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseImpMemoCode,ImprestMemo);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for Payments-----------------------------------------"@1000000012();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendPaymentsForApprovalCode@1000000011() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendPaymentsForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelPaymentsApprovalRequestCode@1000000010() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelPaymentsApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleasePaymentsCode@1000000009() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasePayments'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendPaymentsForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendPaymentsForApproval@1000000008(VAR Payments@1000 : Record Payments);
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendPaymentsForApprovalCode,Payments);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelPaymentsApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelPaymentsApprovalRequest@1000000007(VAR Payments@1000 : Record Payments);
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelPaymentsApprovalRequestCode,Payments);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
//         //                             PROCEDURE RunWorkflowOnAfterReleasePaymentsDoc@1000000006(VAR Payments@1000000000 : Record Payments);
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePaymentsCode,Payments);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for PayPeriods-----------------------------------------"@1000000019();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendPayPeriodForApprovalCode@1000000018() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendPayPeriodForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelPayPeriodApprovalRequestCode@1000000017() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelPayPeriodApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleasePayPeriodCode@1000000016() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleasePayPeriod'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendPayPeriodForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendPayPeriodForApproval@1000000015(VAR PayPeriod@1000000000 : Record "Payroll PeriodX");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendPayPeriodForApprovalCode,PayPeriod);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelPayPeriodApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelPayPeriodApprovalRequest@1000000014(VAR PayPeriod@1000 : Record "Payroll PeriodX");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelPayPeriodApprovalRequestCode,PayPeriod);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,69005,OnAfterReleasePayPeriod)]
//         //                             PROCEDURE RunWorkflowOnAfterReleasePayPeriodDoc@1000000013(VAR PayPeriod@1000000000 : Record "Payroll PeriodX");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleasePayPeriodCode,PayPeriod);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for Copyright registration-----------------------------------------"@97();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendCopyRegForApprovalCode@96() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendCopyRegForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelCopyRegApprovalRequestCode@95() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelCopyRegApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseCopyRegCode@94() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseCopyReg'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendCopyRegForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendCopyRegForApproval@93(VAR CopyReg@1000 : Record "Copyright Registration Table");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendCopyRegForApprovalCode,CopyReg);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelCopyRegApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelCopyRegApprovalRequest@91(VAR CopyReg@1000 : Record "Copyright Registration Table");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelCopyRegApprovalRequestCode,CopyReg);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseCopyRegDoc@76(VAR CopyReg@1000000000 : Record "Copyright Registration Table");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseCopyRegCode,CopyReg);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for Overtime Application-----------------------------------------"@104();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendOvertimeForApprovalCode@103() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendOvertimeForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelOvertimeApprovalRequestCode@102() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelOvertimeApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseOvertimeCode@101() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseOvertime'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendOvertimeForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendOvertimeForApproval@100(VAR Overtime@1000 : Record "Overtime Header");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendOvertimeForApprovalCode,Overtime);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelOvertimeApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelOvertimeApprovalRequest@99(VAR Overtime@1000 : Record "Overtime Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelOvertimeApprovalRequestCode,Overtime);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseOvertimeDoc@98(VAR Overtime@1000 : Record "Overtime Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseOvertimeCode,Overtime);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for Training Application-----------------------------------------"@111();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendTrainingAppForApprovalCode@110() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendOvertimeForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelTrainingAppApprovalRequestCode@109() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelOvertimeApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseTrainingAppCode@108() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseOvertime'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendTrainingAppForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendTrainingAppForApproval@107(VAR TrainingApp@1000 : Record "Training Requests");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendOvertimeForApprovalCode,TrainingApp);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelTrainingAppApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelTrainingAppApprovalRequest@106(VAR TrainingApp@1000 : Record "Training Requests");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelOvertimeApprovalRequestCode,TrainingApp);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseTrainingAppDoc@105(VAR TrainingApp@1000 : Record "Training Requests");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseOvertimeCode,TrainingApp);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for Salary Vouchers-----------------------------------------"@1000000026();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendSalaryForApprovalCode@1000000025() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendSalaryForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelSalaryApprovalRequestCode@1000000024() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelSalaryApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseSalaryCode@1000000023() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseSalary'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendSalaryForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendSalaryForApproval@1000000022(VAR Salary@1000 : Record "Payroll Header");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendSalaryForApprovalCode,Salary);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelSalaryApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelSalaryApprovalRequest@1000000021(VAR Salary@1000 : Record "Payroll Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelSalaryApprovalRequestCode,Salary);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleasePayments)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseSalaryDoc@1000000020(VAR Salary@1000000000 : Record "Payroll Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseSalaryCode,Salary);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for Grant Funding Application-----------------------------------------"@120();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendGFAForApprovalCode@119() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendGFAForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelGFAApprovalRequestCode@118() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelGFAApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseGFACode@117() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseGFA'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendGFAForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendGFAForApproval@116(VAR GFA@1000 : Record "Grant Funding Application");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendGFAForApprovalCode,GFA);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelGFAApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelGFAApprovalRequest@115(VAR GFA@1000 : Record "Grant Funding Application");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelGFAApprovalRequestCode,GFA);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseGFA)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseGFADoc@114(VAR GFA@1000 : Record "Grant Funding Application");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseGFACode,GFA);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for Project Contracts-----------------------------------------"@125();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendProjectContractForApprovalCode@124() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendProjectContractForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelProjectContractApprovalRequestCode@123() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelProjectContractApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseProjectContractCode@122() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseProjectContract'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendProjectContractForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendProjectContractForApproval@121(VAR ProjectContract@1000 : Record "Project Contract Header");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectContractForApprovalCode,ProjectContract);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelProjectContractApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelProjectContractApprovalRequest@113(VAR ProjectContract@1000 : Record "Project Contract Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectContractApprovalRequestCode,ProjectContract);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProjectContract)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseProjectContractDoc@112(VAR ProjectContract@1000 : Record "Project Contract Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseProjectContractCode,ProjectContract);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "--------------additions for Fleet -----------------------------------------"@139();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnSendFleetForApprovalCode@138() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendFleetForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelFleetApprovalRequestCode@137() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelFleetApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseFleetCode@136() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseFleet'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendFleetForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendFleetForApproval@135(VAR Fleet@1000 : Record "Transport Requisition");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendFleetForApprovalCode,Fleet);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelFleetApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelFleetApprovalRequest@134(VAR Fleet@1000 : Record "Transport Requisition");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelFleetApprovalRequestCode,Fleet);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseFleet)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseFleetDoc@132(VAR Fleet@1000 : Record "Transport Requisition");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseFleetCode,Fleet);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Additions for Procuremnt methods............................"@126();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendProcDocForApprovalCode@133() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendProcDocForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelProcDocApprovalRequestCode@131() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelProcApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseProcDocCode@130() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseProc'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendProcDocForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendProcDocForApproval@129(VAR Procurement@1000 : Record "Procurement Request");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendProcDocForApprovalCode,Procurement);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelProcDocApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelProcDocApprovalRequest@128(VAR Procurement@1000 : Record "Procurement Request");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelProcDocApprovalRequestCode,Procurement);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProCDoc)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseProcDoc@127(VAR Procurement@1000 : Record "Procurement Request");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseProcDocCode,Procurement);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Additions for FileMovement............................"@146();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendFileMovementForApprovalCode@145() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendFileMovementForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelFileMovementApprovalRequestCode@144() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelFileMovementApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseFileMovementCode@143() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseFileMovement'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendFileMovementForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendFileMovementForApproval@142(VAR FileMovement@1000 : Record "File Movement Header");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendFileMovementForApprovalCode,FileMovement);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelFileMovementApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelFileMovementApprovalRequest@141(VAR FileMovement@1000 : Record "File Movement Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelFileMovementApprovalRequestCode,FileMovement);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseFileMovement)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseFileMovement@140(VAR FileMovement@1000 : Record "File Movement Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseFileMovementCode,FileMovement);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Additions for Inspection............................"@155();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendInspectionDocForApprovalCode@154() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendInspectionDocForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelInspectionDocApprovalRequestCode@153() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelInspectionApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseInspectionDocCode@152() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseInspection'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendInspectionDocForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendInspectionDocForApproval@151(VAR Inspection@1000 : Record "Inspection Header1");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendInspectionDocForApprovalCode,Inspection);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelInspectionDocApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelInspectionDocApprovalRequest@150(VAR Inspection@1000 : Record "Inspection Header1");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelInspectionDocApprovalRequestCode,Inspection);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseInspectionDoc)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseInspectionDoc@149(VAR Inspection@1000 : Record "Inspection Header1");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseInspectionDocCode,Inspection);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Additions for Committee............................"@164();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendCommitteeDocForApprovalCode@163() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendCommitteeDocForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelCommitteeDocApprovalRequestCode@162() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelCommitteeApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseCommitteeDocCode@159() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseCommittee'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendCommitteeDocForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendCommitteeDocForApproval@158(VAR Committee@1000 : Record "Tender Commitee Appointment1");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendCommitteeDocForApprovalCode,Committee);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelCommitteeDocApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelCommitteeDocApprovalRequest@157(VAR Committee@1000 : Record "Tender Commitee Appointment1");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelCommitteeDocApprovalRequestCode,Committee);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseCommitteeDoc)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseCommitteeDoc@156(VAR Committee@1000 : Record "Tender Commitee Appointment1");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseCommitteeDocCode,Committee);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Additions for RFI............................"@295();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendIFPForApprovalCode@294() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendIFPForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelIFPApprovalRequestCode@293() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelIFPApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseIFPCode@292() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseIFP'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendIFPForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendIFPForApproval@291(VAR IFP@1000 : Record "Request For Information");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendIFPForApprovalCode,IFP);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelIFPApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelIFPApprovalRequest@290(VAR IFP@1000 : Record "Request For Information");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFPApprovalRequestCode,IFP);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseIFP)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseIFP@289(VAR IFP@1000 : Record "Request For Information");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseIFPCode,IFP);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Additions for VendDebarment............................"@288();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendVendDebarmentForApprovalCode@287() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendVendDebarmentForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelVendDebarmentApprovalRequestCode@286() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelVendDebarmentApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseVendDebarmentCode@285() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseVendDebarment'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendVendDebarmentForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendVendDebarmentForApproval@284(VAR VendDebarment@1000 : Record "Vendor Debarment Voucher");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendVendDebarmentForApprovalCode,VendDebarment);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelVendDebarmentApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelVendDebarmentApprovalRequest@283(VAR VendDebarment@1000 : Record "Vendor Debarment Voucher");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelVendDebarmentApprovalRequestCode,VendDebarment);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseVendDebarment)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseVendDebarment@282(VAR VendDebarment@1000 : Record "Vendor Debarment Voucher");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseVendDebarmentCode,VendDebarment);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Additions for ProcPlan............................"@176();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendProcPlanForApprovalCode@175() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendProcPlanForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelProcPlanApprovalRequestCode@174() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelProcPlanApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseProcPlanCode@173() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseProcPlan'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendProcPlanForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendProcPlanForApproval@172(VAR ProcPlan@1000 : Record "Procurement Plan");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendProcPlanForApprovalCode,ProcPlan);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelProcPlanApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelProcPlanApprovalRequest@171(VAR ProcPlan@1000 : Record "Procurement Plan");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelProcPlanApprovalRequestCode,ProcPlan);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseProcPlan)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseProcPlan@170(VAR ProcPlan@1000 : Record "Procurement Plan");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseProcPlanCode,ProcPlan);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Tender Committe............................"@232();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendTenderCommitteForApprovalCode@231() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendTenderCommitteForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelTenderCommitteApprovalRequestCode@230() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelTenderCommitteApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseTenderCommitteCode@229() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseTenderCommitte'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendTenderCommitteForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendTenderCommitteForApproval@228(VAR TenderCommitte@1000 : Record "IFS Tender Committee");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendTenderCommitteForApprovalCode,TenderCommitte);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelTenderCommitteApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelTenderCommitteApprovalRequest@227(VAR TenderCommitte@1000 : Record "IFS Tender Committee");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelTenderCommitteApprovalRequestCode,TenderCommitte);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseTenderCommitte)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseTenderCommitte@226(VAR TenderCommitte@1000 : Record "IFS Tender Committee");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseTenderCommitteCode,TenderCommitte);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE ".......................Bid Evaluation............................"@239();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendBidEvaluationForApprovalCode@238() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendBidEvaluationForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelBidEvaluationApprovalRequestCode@237() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelBidEvaluationApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseBidEvaluationCode@236() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBidEvaluation'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendBidEvaluationForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendBidEvaluationForApproval@235(VAR BidEvaluation@1000 : Record "Bid Evaluation Register");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBidEvaluationForApprovalCode,BidEvaluation);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelBidEvaluationApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelBidEvaluationApprovalRequest@234(VAR BidEvaluation@1000 : Record "Bid Evaluation Register");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidEvaluationApprovalRequestCode,BidEvaluation);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseBidEvaluation)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseBidEvaluation@233(VAR BidEvaluation@1000 : Record "Bid Evaluation Register");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBidEvaluationCode,BidEvaluation);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE ".......................Bid Opening............................"@246();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendBidOpeningForApprovalCode@245() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendBidOpeningForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelBidOpeningApprovalRequestCode@244() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelBidOpeningApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseBidOpeningCode@243() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBidOpening'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendBidOpeningForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendBidOpeningForApproval@242(VAR BidOpening@1000 : Record "Bid Opening Register");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBidOpeningForApprovalCode,BidOpening);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelBidOpeningApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelBidOpeningApprovalRequest@241(VAR BidOpening@1000 : Record "Bid Opening Register");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidOpeningApprovalRequestCode,BidOpening);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseBidOpening)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseBidOpening@240(VAR BidOpening@1000 : Record "Bid Opening Register");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBidOpeningCode,BidOpening);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE ".......................Bid Tabulation............................"@253();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendBidTabulationForApprovalCode@252() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendBidTabulationForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelBidTabulationApprovalRequestCode@251() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelBidTabulationApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseBidTabulationCode@250() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBidTabulation'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendBidTabulationForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendBidTabulationForApproval@249(VAR BidTabulation@1000 : Record "Bid Tabulation Header");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendBidTabulationForApprovalCode,BidTabulation);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelBidTabulationApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelBidTabulationApprovalRequest@248(VAR BidTabulation@1000 : Record "Bid Tabulation Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidTabulationApprovalRequestCode,BidTabulation);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseBidTabulation)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseBidTabulation@247(VAR BidTabulation@1000 : Record "Bid Tabulation Header");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseBidTabulationCode,BidTabulation);
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE "........................Additions for IFS............................"@260();
//         //                             BEGIN
//         //                             END;
//         //  
//         //                             [External]
//         //                             PROCEDURE RunWorkflowOnSendIFSForApprovalCode@259() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnSendIFSForApproval'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnCancelIFSApprovalRequestCode@258() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnCancelIFSApprovalRequest'));
//         //                             END;
//         //  
//         //                             PROCEDURE RunWorkflowOnAfterReleaseIFSCode@257() : Code[128];
//         //                             BEGIN
//         //                               EXIT(UPPERCASE('RunWorkflowOnAfterReleaseIFS'));
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnSendIFSForApproval)]
//         //                             PROCEDURE RunWorkflowOnSendIFSForApproval@256(VAR IFS@1000 : Record "Standard Purchase Code");
//         //                             BEGIN
//         //  
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnSendIFSForApprovalCode,IFS);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,1535,OnCancelIFSApprovalRequest)]
//         //                             PROCEDURE RunWorkflowOnCancelIFSApprovalRequest@255(VAR IFS@1000 : Record "Standard Purchase Code");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFSApprovalRequestCode,IFS);
//         //                             END;
//         //  
//         //                             [EventSubscriber(Codeunit,57003,OnAfterReleaseIFS)]
//         //                             PROCEDURE RunWorkflowOnAfterReleaseIFS@254(VAR IFS@1000 : Record "Standard Purchase Code");
//         //                             BEGIN
//         //                               WorkflowManagement.HandleEvent(RunWorkflowOnAfterReleaseIFSCode,IFS);
//         //                             END;
//         //  
//         //                           }
//         //                            }
//         //      { Insertion         ;InsertAfter=CreateGenJnlLineFromIncDocFailsEventDescTxt(Variable 1036);
//         //                           ChangedElements=VariableCollection
//         //                           {
//         //                             "....daudi added...."@1037 : TextConst;
//         //                             ImpMemoSendForApprovalEventDescTxt@1052 : TextConst 'ENU=Approval of an Imprest Memo is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             ImpMemoApprReqCancelledEventDescTxt@1051 : TextConst 'ENU=An approval request for an Imprest Memo has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             ImpMemoReleasedEventDescTxt@1050 : TextConst 'ENU=An Imprest Memo has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             PaymentsSendForApprovalEventDescTxt@1049 : TextConst 'ENU=Approval of a payment is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             PaymentsApprReqCancelledEventDescTxt@1048 : TextConst 'ENU=An approval request for a payment has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             PaymentsReleasedEventDescTxt@1047 : TextConst 'ENU=A payment has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             PayPeriodSendForApprovalEventDescTxt@1046 : TextConst 'ENU=Approval of a Payroll Period is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             PayPeriodApprReqCancelledEventDescTxt@1039 : TextConst 'ENU=An approval request for a Payroll Period has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             PayPeriodReleasedEventDescTxt@1038 : TextConst 'ENU=A Payroll Period has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             WREvents@1053 : Codeunit "Dynasoft Workflow Events";
//         //                             ".....Copyright registration...."@1054 : TextConst;
//         //                             CopyRegSendForApprovalEventDescTxt@1057 : TextConst 'ENU=Approval of a Copyright Registration is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             CopyRegApprReqCancelledEventDescTxt@1056 : TextConst 'ENU=An approval request for a Copyright Registration has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             CopyRegReleasedEventDescTxt@1055 : TextConst 'ENU=A Copyright Registration has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             ".....Overtime Application...."@1061 : TextConst;
//         //                             OvertimeSendForApprovalEventDescTxt@1060 : TextConst 'ENU=Approval of an Overtime Application is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             OvertimeApprReqCancelledEventDescTxt@1059 : TextConst 'ENU=An approval request for an Overtime Application has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             OvertimeReleasedEventDescTxt@1058 : TextConst 'ENU=An Overtime Application has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             ".....Training Application...."@1065 : TextConst;
//         //                             TrainingAppSendForApprovalEventDescTxt@1064 : TextConst 'ENU=Approval of a Training Application is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             TrainingAPPApprReqCancelledEventDescTxt@1063 : TextConst 'ENU=An approval request for a Training Application has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             TrainingAPPReleasedEventDescTxt@1062 : TextConst 'ENU=A Training Application has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "......salary Voucher..."@1069 : TextConst 'ENU=..........................';
//         //                             SalarySendForApprovalEventDescTxt@1068 : TextConst 'ENU=A Salary Approval Voucher is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             SalaryApprReqCancelledEventDescTxt@1067 : TextConst 'ENU=A Salary Voucher approval request has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             SalaryReleasedEventDescTxt@1066 : TextConst 'ENU=A Salary Voucher has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Grant Funding Application...."@1073 : TextConst;
//         //                             GFASendForApprovalEventDescTxt@1072 : TextConst 'ENU=Approval of a Grant Funding Application is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             GFAApprReqCancelledEventDescTxt@1071 : TextConst 'ENU=An approval request for a  Grant Funding Application has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             GFAReleasedEventDescTxt@1070 : TextConst 'ENU=A  Grant Funding Application has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Project Contract...."@1077 : TextConst;
//         //                             ProjectContractSendForApprovalEventDescTxt@1076 : TextConst 'ENU=Approval of a Project Contract  is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             ProjectContractApprReqCancelledEventDescTxt@1075 : TextConst 'ENU=An approval request for a  Project Contract has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             ProjectContractReleasedEventDescTxt@1074 : TextConst 'ENU=A  Project Contract has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Fleet Requsition...."@1085 : TextConst;
//         //                             FleetSendForApprovalEventDescTxt@1084 : TextConst 'ENU=Approval of a Fleet requistion  is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             FleetApprReqCancelledEventDescTxt@1083 : TextConst 'ENU=An approval request for a  Fleet requistion  has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             FleetReleasedEventDescTxt@1082 : TextConst 'ENU=A   Fleet requistion has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Procurement Methods....."@1078 : TextConst;
//         //                             ProcDocSendForApprovalEventDescTxt@1081 : TextConst 'ENU=Approval of a Procurement method is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             ProcDocApprReqCancelledEventDescTxt@1080 : TextConst 'ENU=An approval request for a  Procurement method has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             ProcDOcReleasedEventDescTxt@1079 : TextConst 'ENU=A  Procurement method has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....File Movement....."@1089 : TextConst;
//         //                             FileMovementSendForApprovalEventDescTxt@1088 : TextConst 'ENU=Approval of a File Movement is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             FileMovementApprReqCancelledEventDescTxt@1092 : TextConst 'ENU=An approval request for a  File Movement has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             FileMovementReleasedEventDescTxt@1090 : TextConst 'ENU=A  File Movement has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Inspection......."@1086 : TextConst;
//         //                             InspectionDocSendForApprovalEventDescTxt@1094 : TextConst 'ENU=Approval of a Inspection Document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             InspectionDocApprReqCancelledEventDescTxt@1093 : TextConst 'ENU=An approval request for a  Inspection Document has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             InspectionDocReleasedEventDescTxt@1087 : TextConst 'ENU=A  Inspection Document has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Committee...."@1095 : TextConst;
//         //                             CommitteeDocSendForApprovalEventDescTxt@1098 : TextConst 'ENU=Approval of a Committee Document is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a Committee Document is requested.';
//         //                             CommitteeDocApprReqCancelledEventDescTxt@1097 : TextConst 'ENU=An approval request for a   Committee Document has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             CommitteeDocReleasedEventDescTxt@1096 : TextConst 'ENU=A   Committee Document has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....RFI....."@1130 : TextConst;
//         //                             IFPSendForApprovalEventDescTxt@1129 : TextConst 'ENU=Approval of a Request For Information is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             IFPApprReqCancelledEventDescTxt@1128 : TextConst 'ENU=An approval request for a Request For Information has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             IFPReleasedEventDescTxt@1127 : TextConst 'ENU=A Request For Information has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....VendDebarment....."@1126 : TextConst;
//         //                             VendDebarmentSendForApprovalEventDescTxt@1125 : TextConst 'ENU=Approval of a Vendor Debarment/Reinstatement is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             VendDebarmentApprReqCancelledEventDescTxt@1124 : TextConst 'ENU=An approval request for a Vendor Debarment/Reinstatement has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             VendDebarmentReleasedEventDescTxt@1123 : TextConst 'ENU=A Vendor Debarment/Reinstatement  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....ProcPlan....."@1122 : TextConst;
//         //                             ProcPlanSendForApprovalEventDescTxt@1121 : TextConst 'ENU=Approval of a Procuremnet Plan is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             ProcPlanApprReqCancelledEventDescTxt@1120 : TextConst 'ENU=An approval request for a Procurement Plan has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             ProcPlanReleasedEventDescTxt@1119 : TextConst 'ENU=A Procurement Plan  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....TenderCommitte....."@1118 : TextConst;
//         //                             TenderCommitteSendForApprovalEventDescTxt@1117 : TextConst 'ENU=Approval of a Tender Committe is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             TenderCommitteApprReqCancelledEventDescTxt@1116 : TextConst 'ENU=An approval request for a Tender Committe has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             TenderCommitteReleasedEventDescTxt@1115 : TextConst 'ENU=A Tender Committe  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Bid Evaluation....."@1114 : TextConst;
//         //                             BidEvaluationSendForApprovalEventDescTxt@1113 : TextConst 'ENU=Approval of a Bid Evaluation is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             BidEvaluationApprReqCancelledEventDescTxt@1112 : TextConst 'ENU=An approval request for a Bid Evaluation has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             BidEvaluationReleasedEventDescTxt@1111 : TextConst 'ENU=A Bid Evaluation  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Bid Opening....."@1110 : TextConst;
//         //                             BidOpeningSendForApprovalEventDescTxt@1109 : TextConst 'ENU=Approval of a Bid Opening is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             BidOpeningApprReqCancelledEventDescTxt@1108 : TextConst 'ENU=An approval request for a Bid Opening has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             BidOpeningReleasedEventDescTxt@1107 : TextConst 'ENU=A Bid Opening  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....Bid Tabulation....."@1106 : TextConst;
//         //                             BidTabulationSendForApprovalEventDescTxt@1105 : TextConst 'ENU=Approval of a Bid Tabulation is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             BidTabulationApprReqCancelledEventDescTxt@1104 : TextConst 'ENU=An approval request for a Bid Tabulation has been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             BidTabulationReleasedEventDescTxt@1103 : TextConst 'ENU=A Bid Tabulation  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
//         //                             "....IFS....."@1102 : TextConst;
//         //                             IFSSendForApprovalEventDescTxt@1101 : TextConst 'ENU=Approval of an Invitation For Supply is requested.;ESM=Se ha solicitado la aprobación de un documento de ventas.;FRC=L''approbation d''un document vente est exigée.;ENC=Approval of a sales document is requested.';
//         //                             IFSApprReqCancelledEventDescTxt@1100 : TextConst 'ENU=An approval request for an Invitation For Supplyhas been canceled.;ESM=Se canceló una solicitud de aprobación de un documento de venta.;FRC=Une demande d''approbation de document vente est annulée.;ENC=An approval request for a sales document is cancelled.';
//         //                             IFSReleasedEventDescTxt@1099 : TextConst 'ENU=An Invitation For Supply  has been released.;ESM=Se ha lanzado un documento de ventas.;FRC=Un document de vente est libéré.;ENC=A sales document is released.';
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
