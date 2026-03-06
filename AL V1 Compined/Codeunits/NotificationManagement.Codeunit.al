// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70001510 "Notification Management1510"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Notification Management"(Codeunit 1510)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=10172019D;
//         //      Time=092334T;
//         //      Modified=Yes;
//         //      Version List=NAVW113.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Notification Management"(Codeunit 1510);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          CASE RecRef.NUMBER OF
//         //                                            DATABASE::"Incoming Document":
//         //                                              BEGIN
//         //                                                DocumentType := RecRef.CAPTION;
//         //                                                FieldRef := RecRef.FIELD(2);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Sales Header":
//         //                                              BEGIN
//         //                                                FieldRef := RecRef.FIELD(1);
//         //                                                DocumentType := SalesTxt + ' ' + FORMAT(FieldRef.VALUE);
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Purchase Header":
//         //                                              BEGIN
//         //                                                FieldRef := RecRef.FIELD(1);
//         //                                                DocumentType := PurchaseTxt + ' ' + FORMAT(FieldRef.VALUE);
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Service Header":
//         //                                              BEGIN
//         //                                                FieldRef := RecRef.FIELD(1);
//         //                                                DocumentType := ServiceTxt + ' ' + FORMAT(FieldRef.VALUE);
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Sales Invoice Header":
//         //                                              BEGIN
//         //                                                DocumentType := SalesInvoiceTxt;
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Purch. Inv. Header":
//         //                                              BEGIN
//         //                                                DocumentType := PurchaseInvoiceTxt;
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Service Invoice Header":
//         //                                              BEGIN
//         //                                                DocumentType := ServiceInvoiceTxt;
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Sales Cr.Memo Header":
//         //                                              BEGIN
//         //                                                DocumentType := SalesCreditMemoTxt;
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Purch. Cr. Memo Hdr.":
//         //                                              BEGIN
//         //                                                DocumentType := PurchaseCreditMemoTxt;
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Service Cr.Memo Header":
//         //                                              BEGIN
//         //                                                DocumentType := ServiceCreditMemoTxt;
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Gen. Journal Line":
//         //                                              BEGIN
//         //                                                DocumentType := RecRef.CAPTION;
//         //                                                FieldRef := RecRef.FIELD(1);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                                FieldRef := RecRef.FIELD(51);
//         //                                                DocumentNo += ',' + FORMAT(FieldRef.VALUE);
//         //                                                FieldRef := RecRef.FIELD(2);
//         //                                                DocumentNo += ',' + FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::"Gen. Journal Batch":
//         //                                              BEGIN
//         //                                                DocumentType := RecRef.CAPTION;
//         //                                                FieldRef := RecRef.FIELD(1);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                                FieldRef := RecRef.FIELD(2);
//         //                                                DocumentNo += ',' + FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            DATABASE::Customer,
//         //                                            DATABASE::Vendor,
//         //                                            DATABASE::Item:
//         //                                              BEGIN
//         //                                                DocumentType := RecRef.CAPTION;
//         //                                                FieldRef := RecRef.FIELD(1);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            ELSE BEGIN
//         //                                              IsHandled := FALSE;
//         //                                              OnGetDocumentTypeAndNumber(RecRef,DocumentType,DocumentNo,IsHandled);
//         //                                              IF NOT IsHandled THEN BEGIN
//         //                                                DocumentType := RecRef.CAPTION;
//         //                                                FieldRef := RecRef.FIELD(3);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //                                            END;
//         //                                          END;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          CASE RecRef.NUMBER OF
//         //                                              ///......16.10.2019 Hunaina
//         //                                            ///.....Imprest Memo Table
//         //                                            DATABASE::"Imprest Memo":
//         //                                              BEGIN
//         //                                                FieldRef := RecRef.FIELD(57008);
//         //                                                DocumentType := FORMAT(FieldRef.VALUE);
//         //                                          #88..90
//         //  
//         //                                            ///......Payments Table
//         //                                             DATABASE::Payments:
//         //                                              BEGIN
//         //                                                FieldRef := RecRef.FIELD(80);
//         //                                                DocumentType := FORMAT(FieldRef.VALUE);
//         //                                                FieldRef := RecRef.FIELD(1);
//         //                                                DocumentNo := FORMAT(FieldRef.VALUE);
//         //                                              END;
//         //  
//         //                                              ///......HR Leave Table
//         //                                             DATABASE::"HR Leave Application":
//         //                                          #66..69
//         //                                              END;
//         //  
//         //                                            ///.....End 16.10.2019 Hunaina
//         //                                          #2..100
//         //                                        END;
//         //  
//         //                           Target=GetDocumentTypeAndNumber(PROCEDURE 3) }
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
