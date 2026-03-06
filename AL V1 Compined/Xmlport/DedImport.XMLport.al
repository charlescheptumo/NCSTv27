#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 69055 "Ded Import"
{
    DefaultFieldsValidation = false;
    Direction = Import;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Assignment Matrix-X"; "Assignment Matrix-X")
            {
                AutoReplace = false;
                AutoSave = false;
                AutoUpdate = false;
                XmlName = 'AssignMat';
                SourceTableView = where(Type = const(Deduction));
                fieldelement(EmpNo; "Assignment Matrix-X"."Employee No")
                {
                }
                fieldelement(PayPeriod; "Assignment Matrix-X"."Payroll Period")
                {
                }
                fieldelement(DedCode; "Assignment Matrix-X".Code)
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
                    "Assignment Matrix-X".Validate("Employee No");
                    "Assignment Matrix-X".Validate("Payroll Period");
                    //"Assignment Matrix-X".Amount:=amt;

                    //MESSAGE('%1',"Assignment Matrix-X".Amount);
                    //MESSAGE('%1',"Assignment Matrix-X".Code);
                    "Assignment Matrix-X".Validate(Amount);
                    Amnt := "Assignment Matrix-X".Amount;
                    "Assignment Matrix-X".Validate(Code);
                    "Assignment Matrix-X".Amount := Amnt;
                    //MESSAGE('%1',"Assignment Matrix-X".Amount);


                    Deductions.Get("Assignment Matrix-X".Code);
                    "Assignment Matrix-X".Description := Deductions.Description;


                    if AssignMatrix.Get("Assignment Matrix-X"."Employee No", "Assignment Matrix-X".Type::Deduction
                    , "Assignment Matrix-X".Code, "Assignment Matrix-X"."Payroll Period") = true then begin

                        if "Assignment Matrix-X".Amount = 0 then
                            "Assignment Matrix-X".Delete else begin
                            AssignMatrix.Description := Deductions.Description;
                            AssignMatrix.Amount := "Assignment Matrix-X".Amount;
                            AssignMatrix.Modify;



                            if Deductions."Balance Type" = Deductions."balance type"::Decreasing then begin
                                //AssignMatrix.Amount:=-amt;
                                //"Assignment Matrix-X".VALIDATE(Amount);
                                //AssignMatrix."Opening Balance":=amt;
                                if AssignMatrix."Opening Balance" > 0 then
                                    AssignMatrix."Closing Balance" := AssignMatrix."Opening Balance" + "Assignment Matrix-X".Amount
                                else
                                    AssignMatrix."Closing Balance" := 0;
                                AssignMatrix.Modify;
                            end;

                            if Deductions."Balance Type" = Deductions."balance type"::Increasing then begin
                                //AssignMatrix.Amount:=-amt;
                                //"Assignment Matrix-X".VALIDATE(Amount);
                                //AssignMatrix."Opening Balance":=amt;
                                if AssignMatrix."Opening Balance" > 0 then
                                    AssignMatrix."Closing Balance" := AssignMatrix."Opening Balance" - "Assignment Matrix-X".Amount
                                else
                                    AssignMatrix."Closing Balance" := 0;
                                AssignMatrix.Modify;
                            end;


                            AssignMatrix.Modify;
                        end;

                    end else begin
                        //"Assignment Matrix-X".MODIFY;

                        /*

                        "Assignment Matrix-X"."Employee No":="Assignment Matrix-X"."Employee No";
                        "Assignment Matrix-X".VALIDATE("Employee No");
                        "Assignment Matrix-X"."Payroll Period":="Assignment Matrix-X"."Payroll Period";
                        "Assignment Matrix-X".VALIDATE("Payroll Period");
                        "Assignment Matrix-X".Type:="Assignment Matrix-X".Type::Deduction;
                        "Assignment Matrix-X".Code:="Assignment Matrix-X".Code;

                        "Assignment Matrix-X".VALIDATE(Code);
                        //"Assignment Matrix-X".Amount:=amt;
                        "Assignment Matrix-X".VALIDATE(Amount);

                        */
                        //"Assignment Matrix-X".INSERT;

                        /*
                         "Assignment Matrix-X".VALIDATE("Employee No");
                         "Assignment Matrix-X".VALIDATE("Payroll Period");

                        "Assignment Matrix-X".Type:="Assignment Matrix-X".Type::Deduction;

                        "Assignment Matrix-X".VALIDATE(Code);
                        "Assignment Matrix-X".Amount:=amt;
                        "Assignment Matrix-X".VALIDATE(Amount);
                        */
                        "Assignment Matrix-X".Insert;

                    end;

                end;

                trigger OnBeforeInsertRecord()
                begin
                    "Assignment Matrix-X".Type := "Assignment Matrix-X".Type::Deduction;
                    //MESSAGE('%1',"Assignment Matrix-X"."Employee No");
                    //MESSAGE('%1',"Assignment Matrix-X"."Payroll Period");
                    //"Assignment Matrix-X".VALIDATE(Code);
                    // MESSAGE('%1',"Assignment Matrix-X".Code);
                    //"Assignment Matrix-X".Amount:=amt;


                    "Assignment Matrix-X".Validate(Amount);
                    // MESSAGE('%1',amt);
                    //"Assignment Matrix-X".VALIDATE(Amount);
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
        Deductions: Record DeductionsX;
        Emp: Record Employee;
        Amnt: Decimal;
}
