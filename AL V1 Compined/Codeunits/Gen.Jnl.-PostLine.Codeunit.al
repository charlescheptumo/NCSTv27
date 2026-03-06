// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70000012 "Gen. Jnl.-Post Line12"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Gen. Jnl.-Post Line"(Codeunit 12)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=11172022D;
//         //      Time=183831T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Gen. Jnl.-Post Line"(Codeunit 12);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          OnBeforePostGLAcc(GenJnlLine,GLEntry);
//         //  
//         //                                          WITH GenJnlLine DO BEGIN
//         //                                          #4..19
//         //                                            GLEntry."Bal. Account Type" := "Bal. Account Type";
//         //                                            GLEntry."Bal. Account No." := "Bal. Account No.";
//         //                                            GLEntry."No. Series" := "Posting No. Series";
//         //                                            IF "Additional-Currency Posting" =
//         //                                               "Additional-Currency Posting"::"Additional-Currency Amount Only"
//         //                                            THEN BEGIN
//         //                                          #26..39
//         //                                          END;
//         //  
//         //                                          OnAfterPostGLAcc(GenJnlLine,TempGLEntryBuf,NextEntryNo,NextTransactionNo,Balancing);
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..22
//         //  
//         //                                            //added by daudi for procurement
//         //                                            GLEntry."Procurement Plan":="Procurement Plan";
//         //                                            GLEntry."Procurement Plan Item":="Procurement Plan Item";
//         //                                            GLEntry."Responsibility Center":="Responsibility Center";
//         //  
//         //  
//         //                                          #23..42
//         //                                        END;
//         //  
//         //                           Target=PostGLAcc(PROCEDURE 11) }
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          OnBeforePrepareTempVendLedgEntry(GenJnlLine,NewCVLedgEntryBuf);
//         //  
//         //                                          IF GenJnlLine."Applies-to Doc. No." <> '' THEN BEGIN
//         //                                            // Find the entry to be applied to
//         //                                            OldVendLedgEntry.RESET;
//         //                                            OldVendLedgEntry.SETCURRENTKEY("Document No.");
//         //                                            OldVendLedgEntry.SETRANGE("Document No.",GenJnlLine."Applies-to Doc. No.");
//         //                                            OldVendLedgEntry.SETRANGE("Document Type",GenJnlLine."Applies-to Doc. Type");
//         //                                            OldVendLedgEntry.SETRANGE("Vendor No.",NewCVLedgEntryBuf."CV No.");
//         //                                            OldVendLedgEntry.SETRANGE(Open,TRUE);
//         //                                            OldVendLedgEntry.FINDFIRST;
//         //                                          #12..70
//         //                                            EXIT(TempOldVendLedgEntry.FIND('-'));
//         //                                          END;
//         //                                          EXIT(TRUE);
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..7
//         //                                            //OldVendLedgEntry.SETRANGE("Document Type",GenJnlLine."Applies-to Doc. Type");
//         //                                          #9..73
//         //                                        END;
//         //  
//         //                           Target=PrepareTempVendLedgEntry(PROCEDURE 119) }
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
