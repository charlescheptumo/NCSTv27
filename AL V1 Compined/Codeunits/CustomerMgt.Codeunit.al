// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 70001302 "Customer Mgt.1302"
// {

//     trigger OnRun()
//     begin

//         //  OBJECT Modification "Customer Mgt."(Codeunit 1302)
//         //  {
//         //    OBJECT-PROPERTIES
//         //    {
//         //      Date=02062025D;
//         //      Time=164111T;
//         //      Modified=Yes;
//         //      Version List=NAVW114.00;
//         //    }
//         //    PROPERTIES
//         //    {
//         //      Target="Customer Mgt."(Codeunit 1302);
//         //    }
//         //    CHANGES
//         //    {
//         //      { Insertion         ;InsertAfter=SkipSettingFilter(PROCEDURE 18);
//         //                           ChangedElements=PROCEDURECollection
//         //                           {
//         //                             [External]
//         //                             PROCEDURE ValidateOTP@21(USERID@1000 : Text;EnteredPassword@1001 : Text) : Boolean;
//         //                             VAR
//         //                               Emp@1002 : Record Employee;
//         //                               usersetup@1003 : Record "User Setup";
//         //                             BEGIN
//         //                                 usersetup.RESET;
//         //                                 usersetup.SETRANGE("User ID",USERID);
//         //                                 IF usersetup.FINDSET THEN BEGIN
//         //                                 Emp.RESET;
//         //                                   Emp.SETRANGE("No.",usersetup."Employee No.");
//         //                                   IF Emp.FINDSET THEN
//         //                                           IF Emp."ID Number" = EnteredPassword THEN BEGIN
//         //                                               EXIT(TRUE);
//         //                                           END ELSE
//         //                                               ERROR('Invalid ID Number!!!');
//         //                                       EXIT(FALSE);
//         //                                       END;
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
