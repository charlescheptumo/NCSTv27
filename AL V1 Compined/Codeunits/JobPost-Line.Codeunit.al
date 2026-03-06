// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70001001 "Job Post-Line1001"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Job Post-Line"(Codeunit 1001)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=11172025D;
//         //      Time=101150T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Job Post-Line"(Codeunit 1001);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          IsHandled := FALSE;
//         //                                          OnBeforePostJobOnPurchaseLine(PurchHeader,PurchInvHeader,PurchCrMemoHdr,PurchLine,JobJnlLine,IsHandled);
//         //                                          IF IsHandled THEN
//         //                                          #4..6
//         //                                            EXIT;
//         //                                          CLEAR(JobJnlLine);
//         //                                          PurchLine.TESTFIELD("Job No.");
//         //                                          PurchLine.TESTFIELD("Job Task No.");
//         //                                          Job.LOCKTABLE;
//         //                                          JobTask.LOCKTABLE;
//         //                                          Job.GET(PurchLine."Job No.");
//         //                                          PurchLine.TESTFIELD("Job Currency Code",Job."Currency Code");
//         //                                          JobTask.GET(PurchLine."Job No.",PurchLine."Job Task No.");
//         //                                          JobTransferLine.FromPurchaseLineToJnlLine(
//         //                                            PurchHeader,PurchInvHeader,PurchCrMemoHdr,PurchLine,Sourcecode,JobJnlLine);
//         //                                          JobJnlLine."Job Posting Only" := TRUE;
//         //                                          #19..22
//         //                                            InsertTempJobJournalLine(JobJnlLine,TempPurchaseLineJob."Line No.");
//         //                                          END ELSE
//         //                                            JobJnlPostLine.RunWithCheck(JobJnlLine);
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          #1..9
//         //                                          //PurchLine.TESTFIELD("Job Task No.");
//         //                                          #11..14
//         //                                          //JobTask.GET(PurchLine."Job No.",PurchLine."Job Task No.");
//         //                                          #16..25
//         //                                        END;
//         //  
//         //                           Target=PostJobOnPurchaseLine(PROCEDURE 12) }
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
