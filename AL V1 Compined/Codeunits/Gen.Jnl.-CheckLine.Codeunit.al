// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70000011 "Gen. Jnl.-Check Line11"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Gen. Jnl.-Check Line"(Codeunit 11)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=10212021D;
//         //      Time=194448T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Gen. Jnl.-Check Line"(Codeunit 11);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          OnBeforeCheckAccountNo(GenJnlLine,CheckDone);
//         //                                          IF CheckDone THEN
//         //                                            EXIT;
//         //                                          #4..47
//         //                                                     (((Amount < 0) XOR ("Sales/Purch. (LCY)" < 0)) AND (Amount <> 0) AND ("Sales/Purch. (LCY)" <> 0))
//         //                                                  THEN
//         //                                                    FIELDERROR("Sales/Purch. (LCY)",STRSUBSTNO(Text003,FIELDCAPTION(Amount)));
//         //                                                  TESTFIELD("Job No.",'');
//         //  
//         //                                                  CheckICPartner("Account Type","Account No.","Document Type");
//         //                                                END;
//         //                                          #55..77
//         //                                                      FIELDERROR("Account Type");
//         //                                                END;
//         //                                            END;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..50
//         //                                                 // TESTFIELD("Job No.",'');
//         //                                          #52..80
//         //                                        END;
//         //  
//         //                           Target=CheckAccountNo(PROCEDURE 10) }
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
