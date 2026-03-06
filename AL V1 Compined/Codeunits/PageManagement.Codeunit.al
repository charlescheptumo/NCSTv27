// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70000700 "Page Management700"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Page Management"(Codeunit 700)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=01312020D;
//         //      Time=134332T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Page Management"(Codeunit 700);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          CASE RecordRef.NUMBER OF
//         //                                            DATABASE::"Gen. Journal Template":
//         //                                              EXIT(PAGE::"General Journal Templates");
//         //                                          #4..38
//         //                                              EXIT(PAGE::"Text-to-Account Mapping Wksh.");
//         //                                            DATABASE::"Cash Flow Setup":
//         //                                              EXIT(PAGE::"Cash Flow Setup");
//         //                                            DATABASE::"Production Order":
//         //                                              EXIT(GetProductionOrderPageID(RecordRef));
//         //                                          END;
//         //                                          EXIT(0);
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          {The code has been merged but contained errors that could prevent import
//         //                                          and the code has been put in comments. Use Shift+Ctrl+O to Uncomment}
//         //                                          #1..41
//         //  
//         //                                          //   DATABASE::"Imprest Memo":
//         //                                          //    EXIT(GetImpMemoPageID(RecordRef));
//         //                                             DATABASE::Payments:
//         //                                              EXIT(GetPaymentsPageID(RecordRef));
//         //                                            DATABASE::"Payroll PeriodX":
//         //                                              EXIT(GetPayPeriodPageID(RecordRef));
//         //                                            DATABASE::"Imprest Memo":
//         //                                            EXIT(PAGE::"Imprest Memo");
//         //  
//         //                                            DATABASE::"Production Order":
//         //                                              EXIT(GetProductionOrderPageID(RecordRef));
//         //                                            //Added for procurement documents
//         //                                            DATABASE::"Procurement Request":
//         //                                              EXIT(PAGE::Quotation);
//         //                                            DATABASE::"File Movement Header":
//         //                                              EXIT(PAGE::"Pending File Requsition Card");
//         //                                          {<<<<<<<}
//         //                                          END;
//         //                                          EXIT(0);
//         //                                        END;
//         //  
//         //                           Target=GetConditionalCardPageID(PROCEDURE 3) }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          RecordRef.SETTABLE(PurchaseHeader);
//         //                                          CASE PurchaseHeader."Document Type" OF
//         //                                            PurchaseHeader."Document Type"::Quote:
//         //                                          #4..11
//         //                                              EXIT(PAGE::"Blanket Purchase Order");
//         //                                            PurchaseHeader."Document Type"::"Return Order":
//         //                                              EXIT(PAGE::"Purchase Return Order");
//         //                                          END;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..14
//         //                                            //Kugun--Add store requisition
//         //                                              PurchaseHeader."Document Type"::"Store Requisition":
//         //                                              EXIT(PAGE::"Store Requisition");
//         //                                            //end Kugun--store requisition
//         //  
//         //                                              //Kugun--Add Project Purchase Requisition
//         //                                              PurchaseHeader."Document Type"::"Purchase Requisition":
//         //                                              EXIT(PAGE::"Purchase Requisition Header");
//         //                                            //end Kugun--Project Purchase Requisition
//         //                                            //Kugun--Add Leave application
//         //                                                //end Kugun--store requsition
//         //                                          END;
//         //                                        END;
//         //  
//         //                           Target=GetPurchaseHeaderPageID(PROCEDURE 17) }
//         //      { Insertion         ;InsertAfter=VerifyPageID(PROCEDURE 11);
//         //                           ChangedElements=PROCEDURECollection
//         //                           {
//         //                             LOCAL PROCEDURE GetImpMemoPageID@1000000000(RecordRef@1000 : RecordRef) : Integer;
//         //                             VAR
//         //                               ImpMemo@1001 : Record "Imprest Memo";
//         //                             BEGIN
//         //                               RecordRef.SETTABLE(ImpMemo);
//         //  
//         //                               EXIT(PAGE::"Approver Imprest Memo");
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE GetPaymentsPageID@1000000001(RecordRef@1000 : RecordRef) : Integer;
//         //                             VAR
//         //                               Payments@1001 : Record Payments;
//         //                             BEGIN
//         //                               RecordRef.SETTABLE(Payments);
//         //                               CASE Payments."Payment Type" OF
//         //                                 Payments."Payment Type"::"Payment Voucher":
//         //                                   EXIT(PAGE::"Payment Voucher");
//         //                                 Payments."Payment Type"::Imprest:
//         //                                   EXIT(PAGE::"Imprest Memo");
//         //                                 Payments."Payment Type"::"Staff Claim":
//         //                                   EXIT(PAGE::"Staff Claim");
//         //                                 Payments."Payment Type"::Surrender:
//         //                                   EXIT(PAGE::"Imprest Surrender");
//         //                                 Payments."Payment Type"::"Petty Cash":
//         //                                   EXIT(PAGE::"Petty Cash Voucher");
//         //                                 Payments."Payment Type"::"Bank Transfer":
//         //                                   EXIT(PAGE::"Bank Transfer");
//         //                                 Payments."Payment Type"::"Standing Imprest":
//         //                                   EXIT(PAGE::"Standing Imprest Requsition");
//         //                                 Payments."Payment Type"::"Warrant Voucher":
//         //                                   EXIT(PAGE:: "Imprest Warrant Voucher");
//         //                               END;
//         //                             END;
//         //  
//         //                             LOCAL PROCEDURE GetPayPeriodPageID@1000000002(RecordRef@1000 : RecordRef) : Integer;
//         //                             VAR
//         //                               PayPeriod@1001 : Record "Payroll PeriodX";
//         //                             BEGIN
//         //                               RecordRef.SETTABLE(PayPeriod);
//         //  
//         //                               EXIT(PAGE::"Pay Periods List");
//         //                             END;
//         //  
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
