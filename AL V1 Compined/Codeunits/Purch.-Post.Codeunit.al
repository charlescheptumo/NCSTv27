// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70000090 "Purch.-Post90"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Purch.-Post"(Codeunit 90)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=11172025D;
//         //      Time=100451T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Purch.-Post"(Codeunit 90);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          OnBeforeTestPurchLine(PurchLine,PurchHeader,SuppressCommit);
//         //  
//         //                                          WITH PurchLine DO BEGIN
//         //                                          #4..10
//         //                                              TESTFIELD("Job No.",'');
//         //                                            END;
//         //                                            IF "Job No." <> '' THEN
//         //                                              TESTFIELD("Job Task No.");
//         //                                            IF Type = Type::"Fixed Asset" THEN BEGIN
//         //                                              TESTFIELD("Job No.",'');
//         //                                              TESTFIELD("Depreciation Book Code");
//         //                                          #18..72
//         //                                          END;
//         //  
//         //                                          OnAfterTestPurchLine(PurchHeader,PurchLine,WhseReceive,WhseShip);
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..13
//         //                                              ;//TESTFIELD("Job Task No.");
//         //                                          #15..75
//         //                                        END;
//         //  
//         //                           Target=TestPurchLine(PROCEDURE 139) }
//         //      { Insertion         ;Target=PostVendorEntry(PROCEDURE 68);
//         //                           InsertAfter=GenJnlLine(Variable 1007);
//         //                           ChangedElements=VariableCollection
//         //                           {
//         //                             Purchline@1008 : Record "Purchase Line";
//         //                           }
//         //                            }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          WITH GenJnlLine DO BEGIN
//         //                                            InitNewLine(
//         //                                              PurchHeader."Posting Date",PurchHeader."Document Date",PurchHeader."Posting Description",
//         //                                          #4..9
//         //                                            CopyFromPurchHeader(PurchHeader);
//         //                                            SetCurrencyFactor(PurchHeader."Currency Code",PurchHeader."Currency Factor");
//         //                                            "System-Created Entry" := TRUE;
//         //  
//         //                                            CopyFromPurchHeaderApplyTo(PurchHeader);
//         //                                            CopyFromPurchHeaderPayment(PurchHeader);
//         //                                          #16..19
//         //                                            "Sales/Purch. (LCY)" := -TotalPurchLineLCY2.Amount;
//         //                                            "Inv. Discount (LCY)" := -TotalPurchLineLCY2."Inv. Discount Amount";
//         //  
//         //                                            OnBeforePostVendorEntry(GenJnlLine,PurchHeader,TotalPurchLine2,TotalPurchLineLCY2,PreviewMode,SuppressCommit);
//         //                                            GenJnlPostLine.RunWithCheck(GenJnlLine);
//         //                                            OnAfterPostVendorEntry(GenJnlLine,PurchHeader,TotalPurchLine2,TotalPurchLineLCY2,SuppressCommit,GenJnlPostLine);
//         //                                          END;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..12
//         //                                            //added by daudi for procurement
//         //  
//         //                                          #13..22
//         //                                          //added by daudi for description posting
//         //                                           //added by daudi for description posting
//         //  
//         //  
//         //                                            //Description:=TotalPurchLine2.Description;
//         //                                            //added by daudi for procurement
//         //                                            "Procurement Plan":=TotalPurchLine2."Procurement Plan";
//         //                                            "Procurement Plan Item":=TotalPurchLine2."Procurement Plan Item";
//         //                                            "Responsibility Center":=TotalPurchLine2."Responsibility Center";
//         //  
//         //                                          #23..26
//         //                                        END;
//         //  
//         //                           Target=PostVendorEntry(PROCEDURE 68) }
//         //      { Insertion         ;Target=PostBalancingEntry(PROCEDURE 149);
//         //                           InsertAfter=VendLedgEntry(Variable 1008);
//         //                           ChangedElements=VariableCollection
//         //                           {
//         //                             Purchline@1009 : Record "Purchase Line";
//         //                           }
//         //                            }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          FindVendorLedgerEntry(DocType,DocNo,VendLedgEntry);
//         //  
//         //                                          WITH GenJnlLine DO BEGIN
//         //                                          #4..29
//         //                                                ROUND(VendLedgEntry."Remaining Pmt. Disc. Possible" / VendLedgEntry."Adjusted Currency Factor");
//         //                                            "Allow Zero-Amount Posting" := TRUE;
//         //  
//         //                                            OnBeforePostBalancingEntry(GenJnlLine,PurchHeader,TotalPurchLine2,TotalPurchLineLCY2,PreviewMode,SuppressCommit);
//         //                                            GenJnlPostLine.RunWithCheck(GenJnlLine);
//         //                                            OnAfterPostBalancingEntry(GenJnlLine,PurchHeader,TotalPurchLine2,TotalPurchLineLCY2,SuppressCommit,GenJnlPostLine);
//         //                                          END;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..32
//         //  
//         //                                             //added by daudi for procurement
//         //                                            "Procurement Plan":=TotalPurchLine2."Procurement Plan";
//         //                                            "Procurement Plan Item":=TotalPurchLine2."Procurement Plan Item";
//         //                                            "Responsibility Center":=TotalPurchLine2."Responsibility Center";
//         //  
//         //                                          #33..36
//         //                                        END;
//         //  
//         //                           Target=PostBalancingEntry(PROCEDURE 149) }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          PurchHeader.TESTFIELD("Buy-from IC Partner Code",'');
//         //                                          PurchHeader.TESTFIELD("Pay-to IC Partner Code",'');
//         //                                          PurchLine.TESTFIELD("IC Partner Ref. Type",PurchLine."IC Partner Ref. Type"::"G/L Account");
//         //                                          #4..26
//         //                                            "Shortcut Dimension 2 Code" := PurchLine."Shortcut Dimension 2 Code";
//         //                                            "Dimension Set ID" := PurchLine."Dimension Set ID";
//         //  
//         //                                            Cust.SETRANGE("IC Partner Code",PurchLine."IC Partner Code");
//         //                                            IF Cust.FINDFIRST THEN BEGIN
//         //                                              VALIDATE("Bal. Gen. Bus. Posting Group",Cust."Gen. Bus. Posting Group");
//         //                                          #33..66
//         //                                            VALIDATE(Amount);
//         //                                            INSERT;
//         //                                          END;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..29
//         //  
//         //  
//         //                                          #30..69
//         //                                        END;
//         //  
//         //                           Target=InsertICGenJnlLine(PROCEDURE 150) }
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
