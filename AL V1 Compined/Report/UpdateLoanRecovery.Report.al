#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69010 "Update Loan Recovery"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Loan Recovery.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Loan Repayment Schedule"; "Loan Repayment Schedule")
        {
            RequestFilterFields = "Repayment Date", "Loan Product Type", "Employee No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin

                if ("Loan Repayment Schedule"."Principal Repayment" + "Loan Repayment Schedule"."Monthly Interest") <>
                "Loan Repayment Schedule"."Monthly Repayment" then begin
                    "Loan Repayment Schedule"."Monthly Repayment" := "Loan Repayment Schedule"."Principal Repayment" +
                    "Loan Repayment Schedule"."Monthly Interest";
                    "Loan Repayment Schedule".Modify;
                end;


                /*
                LoanProd.GET("Loan Repayment Schedule"."Loan Product Type");
                LoanProd.TESTFIELD(LoanProd."Deduction Code");
                LoanProd.TESTFIELD(LoanProd."Interest Deduction Code");
                
                //Insert Principal Recovery
                AssignMatrix2.INIT;
                AssignMatrix2."Employee No":="Loan Repayment Schedule"."Employee No.";
                AssignMatrix2.VALIDATE(AssignMatrix2."Employee No");
                AssignMatrix2.Type:=AssignMatrix2.Type::Deduction;
                AssignMatrix2.Code:=LoanProd."Deduction Code";
                
                AssignMatrix2.VALIDATE(Code);
                
                AssignMatrix2.Amount:="Loan Repayment Schedule"."Principal Repayment";
                AssignMatrix2.VALIDATE(Amount);
                AssignMatrix2."Opening Balance":="Loan Repayment Schedule"."Balance B/F";
                AssignMatrix2."Closing Balance":="Loan Repayment Schedule"."Balance C/F";
                AssignMatrix2."Loan Repay":=TRUE;
                AssignMatrix2."Loan Product Type":="Loan Repayment Schedule"."Loan Product Type";
                AssignMatrix2."Loan No":="Loan Repayment Schedule"."Loan No.";
                AssignMatrix2.INSERT;
                
                //Insert Interest Recovery
                AssignMatrix2.INIT;
                AssignMatrix2."Employee No":="Loan Repayment Schedule"."Employee No.";
                AssignMatrix2.VALIDATE(AssignMatrix2."Employee No");
                AssignMatrix2.Type:=AssignMatrix2.Type::Deduction;
                AssignMatrix2.Code:=LoanProd."Interest Deduction Code";
                
                AssignMatrix2.VALIDATE(Code);
                
                AssignMatrix2.Amount:="Loan Repayment Schedule"."Monthly Interest";
                AssignMatrix2.VALIDATE(Amount);
                AssignMatrix2."Loan Repay":=TRUE;
                AssignMatrix2."Loan Product Type":="Loan Repayment Schedule"."Loan Product Type";
                AssignMatrix2."Loan No":="Loan Repayment Schedule"."Loan No.";
                AssignMatrix2.Interest:=TRUE;
                
                AssignMatrix2.INSERT;
                
                 */
                //END;

            end;
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

    labels
    {
    }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        AssignMatrix: Record "Assignment Matrix-X";
        AssignMatrix2: Record "Assignment Matrix-X";
        LoanProd: Record "Loan Product Type";
        Emp: Record Employee;
        EmpPostingGrp: Record "Employee Posting GroupX";
        PayPeriod: Record "Payroll PeriodX";
        EmployeeReg: Record "Employee Absence";
}
