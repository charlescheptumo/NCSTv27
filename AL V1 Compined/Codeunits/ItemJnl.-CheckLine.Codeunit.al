// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70000021 "Item Jnl.-Check Line21"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Item Jnl.-Check Line"(Codeunit 21)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=10222019D;
//         //      Time=124552T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Item Jnl.-Check Line"(Codeunit 21);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          GLSetup.GET;
//         //                                          InvtSetup.GET;
//         //  
//         //                                          #4..8
//         //                                              IF NOT OnlyStopTime THEN
//         //                                                TESTFIELD("Item No.");
//         //  
//         //                                            IF Item.GET("Item No.") THEN
//         //                                              Item.TESTFIELD("Base Unit of Measure");
//         //  
//         //                                            TESTFIELD("Posting Date");
//         //                                            TESTFIELD("Document No.");
//         //                                          #17..138
//         //                                          END;
//         //  
//         //                                          OnAfterCheckItemJnlLine(ItemJnlLine);
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..11
//         //                                            {IF Item.GET("Item No.") THEN
//         //                                              Item.TESTFIELD("Base Unit of Measure");}
//         //                                          #14..141
//         //                                        END;
//         //  
//         //                           Target=RunCheck(PROCEDURE 1) }
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
