#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69009 "Process Loans Recovery"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Process Loans Recovery.rdlc';
    UsageCategory = Tasks;

    dataset
    {
        dataitem("Loan Repayment Schedule"; "Loan Repayment Schedule")
        {
            RequestFilterFields = "Repayment Date", "Loan Product Type", "Employee No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(LoanNo_LoanRepaymentSchedule; "Loan Repayment Schedule"."Loan No.")
            {
            }
            column(EmployeeNo_LoanRepaymentSchedule; "Loan Repayment Schedule"."Employee No.")
            {
            }
            column(InstalmentNo_LoanRepaymentSchedule; "Loan Repayment Schedule"."Instalment No")
            {
            }
            column(LoanAmount_LoanRepaymentSchedule; "Loan Repayment Schedule"."Loan Amount")
            {
            }
            column(RepaymentDate_LoanRepaymentSchedule; "Loan Repayment Schedule"."Repayment Date")
            {
            }
            column(PrincipalRepayment_LoanRepaymentSchedule; "Loan Repayment Schedule"."Principal Repayment")
            {
            }
            column(MonthlyRepayment_LoanRepaymentSchedule; "Loan Repayment Schedule"."Monthly Repayment")
            {
            }
            column(BalanceBF_LoanRepaymentSchedule; "Loan Repayment Schedule"."Balance B/F")
            {
            }
            column(BalanceCF_LoanRepaymentSchedule; "Loan Repayment Schedule"."Balance C/F")
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                IF "Cash Payment" =0 THEN BEGIN  ///.......................to rule out those loans which have been paid off........................
                
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
                
                
                END;    ///.......................end of ..to rule out those loans which have been paid off........................
                
                */

            end;

            trigger OnPreDataItem()
            begin
                /*PP:="Loan Repayment Schedule".GETRANGEMIN("Loan Repayment Schedule"."Repayment Date");
                //MESSAGE('%1',PP);
                IF PayPeriod.GET(PP) THEN BEGIN
                  //MESSAGE('%1',PP);
                    IF PayPeriod.Closed=TRUE THEN
                    ERROR('The selected Payroll Period is closed.Please Check!!');
                END;
                
                LastFieldNo := FIELDNO("Loan Product Type");
                //removing existing ones from payroll
                AssignMatrix3.RESET;
                AssignMatrix3.SETRANGE(AssignMatrix3."Payroll Period",PP);
                AssignMatrix3.SETFILTER(AssignMatrix3.Closed,'No');
                AssignMatrix3.SETFILTER(AssignMatrix3.Code,'%1|%2|%3|%4|%5|%6|%7|%8','D010','D011','D012','D013','D021','D022','D023','D024');
                IF AssignMatrix3.FINDSET THEN
                REPEAT
                AssignMatrix3.DELETE;
                UNTIL AssignMatrix3.NEXT=0;
                //..
                AssignMatrix3.RESET;
                AssignMatrix3.SETRANGE(AssignMatrix3."Payroll Period",PP);
                AssignMatrix3.SETFILTER(AssignMatrix3.Closed,'No');
                AssignMatrix3.SETFILTER(AssignMatrix3.Code,'%1|%2','D019','D025');
                IF AssignMatrix3.FINDSET THEN
                REPEAT
                AssignMatrix3.DELETE;
                UNTIL AssignMatrix3.NEXT=0;
                AssignMatrix3.RESET;
                
                */

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
        AssignMatrix3: Record "Assignment Matrix-X";
        PP: Date;
}
