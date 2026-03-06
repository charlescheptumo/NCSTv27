#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 69060 "Earnings Import"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Assignment Matrix-X"; "Assignment Matrix-X")
            {
                AutoReplace = true;
                XmlName = 'AssgnMat';
                SourceTableView = where(Type = const(Payment));
                fieldelement(EmplNo; "Assignment Matrix-X"."Employee No")
                {
                }
                fieldelement(PayPeriod; "Assignment Matrix-X"."Payroll Period")
                {
                }
                fieldelement(Code; "Assignment Matrix-X".Code)
                {
                }
                fieldelement(amt; "Assignment Matrix-X".Amount)
                {
                }

                trigger OnAfterInsertRecord()
                begin

                    Emp.Get("Assignment Matrix-X"."Employee No");
                    if Emp.Status = Emp.Status::Terminated then
                        currXMLport.Skip;


                    /*
                    HRSetup.GET;
                    //HRSetup.TESTFIELD(HRSetup."Overtime @1.5 Code");
                    //HRSetup.TESTFIELD(HRSetup."Overtime @2.0 Code");
                    HRSetup.TESTFIELD(HRSetup."Absence Code");
                    HRSetup.TESTFIELD(HRSetup."Basic Salary Code");
                    
                    
                    IF AssignMatrix.GET("Assignment Matrix-X"."Employee No","Assignment Matrix-X".Type::Payment,HRSetup."Basic Salary Code",
                    "Assignment Matrix-X"."Payroll Period") THEN BEGIN
                    
                    
                    //AssignMatrix2.INIT;
                     "Assignment Matrix-X".VALIDATE("Assignment Matrix-X"."Employee No");
                    "Assignment Matrix-X".Type:="Assignment Matrix-X".Type::Payment;
                    "Assignment Matrix-X".Code:=HRSetup."Absence Code";
                    "Assignment Matrix-X".VALIDATE(Code);
                    
                    "Assignment Matrix-X".Amount:=-ROUND(("Assignment Matrix-X"."No. Of Hours"/225*AssignMatrix.Amount),1);
                    "Assignment Matrix-X".VALIDATE(Amount);
                    "Assignment Matrix-X".INSERT;
                    
                    END;
                    */

                    "Assignment Matrix-X".Validate("Assignment Matrix-X"."Employee No");
                    "Assignment Matrix-X".Validate("Assignment Matrix-X"."Payroll Period");
                    "Assignment Matrix-X".Type := "Assignment Matrix-X".Type::Payment;
                    //"Assignment Matrix-X".Code:="Assignment Matrix-X".Code;
                    //message('%1',);
                    "Assignment Matrix-X".Validate("Assignment Matrix-X".Code);
                    "Assignment Matrix-X".Amount := amt;
                    "Assignment Matrix-X".Validate("Assignment Matrix-X".Amount);

                    /*
                    IF AssignMatrix.GET("Assignment Matrix-X"."Employee No","Assignment Matrix-X".Type::Payment
                    ,"Assignment Matrix-X".Code,"Assignment Matrix-X"."Payroll Period")=TRUE THEN BEGIN
                    MESSAGE('%1',"Assignment Matrix-X".Amount);
                    
                    //IF "Assignment Matrix-X".Amount=0 THEN
                    //"Assignment Matrix-X".DELETE ELSE
                    
                    "Assignment Matrix-X".MODIFY;
                    END ELSE BEGIN
                     "Assignment Matrix-X".INSERT;
                    
                    END;
                    */
                    // "Assignment Matrix-X".INSERT;

                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        AssignMatrix: Record "Assignment Matrix-X";
        AssignMatrix2: Record "Assignment Matrix-X";
        HRSetup: Record "Human Resources Setup";
        amt: Decimal;
        Emp: Record Employee;
}
