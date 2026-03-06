// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70000400 "SMTP Mail400"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "SMTP Mail"(Codeunit 400)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=10222019D;
//         //      Time=163619T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="SMTP Mail"(Codeunit 400);
//         //    }
//         //    CHANGES
//         //    {
//         //      { CodeModification  ;OriginalCode=BEGIN
//         //                                          OnBeforeCreateMessage(SenderName,SenderAddress,Recipients,Subject,Body,HtmlFormatted);
//         //  
//         //                                          IF Recipients <> '' THEN
//         //                                            CheckValidEmailAddresses(Recipients);
//         //                                          CheckValidEmailAddresses(SenderAddress);
//         //                                          #6..19
//         //  
//         //                                          IF HtmlFormatted THEN
//         //                                            Mail.ConvertBase64ImagesToContentId;
//         //                                        END;
//         //  
//         //                           ModifiedCode=BEGIN
//         //                                          OnBeforeCreateMessage(SenderName,SenderAddress,Recipients,Subject,Body,HtmlFormatted);
//         //                                          SenderAddress:='scifpro@nacosti.go.ke';
//         //                                          #3..22
//         //                                        END;
//         //  
//         //                           Target=CreateMessage(PROCEDURE 1) }
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
