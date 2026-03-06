#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69016 "Process Loan Interest"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Process Loan Interest.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Loan Product Type"; "Loan Product Type")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Code_LoanProductType; "Loan Product Type".Code)
            {
            }

            trigger OnAfterGetRecord()
            begin

                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                //AssignMatrix.SETRANGE(AssignMatrix.Code,"Loan Product Type"."Deduction Code","Loan Product Type"."Interest Deduction Code");
                AssignMatrix.SetRange(AssignMatrix.Code, "Loan Product Type"."Deduction Code");
                if Emp <> '' then
                    AssignMatrix.SetRange(AssignMatrix."Employee No", Emp);
                if AssignMatrix.Find('-') then begin
                    repeat
                        if AssignMatrix."Opening Balance" <> 0 then begin
                            //MESSAGE('%1',AssignMatrix."Opening Balance");
                            //Insert Interest Recovery
                            AssignMatrix2.Init;
                            AssignMatrix2.Code := "Loan Product Type"."Interest Deduction Code";
                            AssignMatrix2."Employee No" := AssignMatrix."Employee No";
                            AssignMatrix2.Validate(AssignMatrix2."Employee No");
                            AssignMatrix2."Pay Period" := AssignMatrix."Pay Period";
                            AssignMatrix2.Type := AssignMatrix2.Type::Deduction;
                            AssignMatrix2."Reference No" := "Loan Product Type"."Deduction Code";

                            AssignMatrix2.Validate(Code);

                            AssignMatrix2.Amount := AssignMatrix."Opening Balance" * "Loan Product Type"."Interest Rate" / 100;
                            AssignMatrix2.Validate(Amount);

                            //MESSAGE('%1',AssignMatrix.Amount);
                            AssignMatrix2."Loan Repay" := true;
                            AssignMatrix2."Loan Product Type" := "Loan Product Type".Code;
                            //AssignMatrix2."Loan No":="Loan Repayment Schedule"."Loan No.";
                            AssignMatrix2.Interest := true;
                            if not AssignMatrix2.Get(AssignMatrix2."Employee No", AssignMatrix2.Type, AssignMatrix2.Code,
                              AssignMatrix2."Payroll Period", AssignMatrix2."Reference No") then
                                AssignMatrix2.Insert;


                        end;

                    until AssignMatrix.Next = 0;
                end else
                    Error('The interest for the period %1', DateSpecified, 'Exists');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control1000000001)
                {
                    field("Payroll Period"; DateSpecified)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Payroll Period';
                        TableRelation = "Payroll PeriodX";
                    }
                    field("Employee No"; Emp)
                    {
                        ApplicationArea = Basic;
                        TableRelation = Employee;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        DateSpecified: Date;
        AssignMatrix2: Record "Assignment Matrix-X";
        AssignMatrix: Record "Assignment Matrix-X";
        Emp: Code[20];
}
