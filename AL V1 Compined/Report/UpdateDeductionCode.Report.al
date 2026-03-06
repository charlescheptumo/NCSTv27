#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69150 "Update Deduction Code"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Deduction Code.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = where(Status = const(Active), "Employee Type" = const(Project));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if EarningNewCode = '' then
                    Error('Select Code!!');
                AssignmentMatrixX.Reset;
                AssignmentMatrixX.SetRange(Code, EarningNewCode);
                AssignmentMatrixX.SetRange(AssignmentMatrixX.Type, Assignmatrix.Type::Deduction);
                AssignmentMatrixX.SetRange(AssignmentMatrixX."Employee No", Employee."No.");
                AssignmentMatrixX.SetRange(AssignmentMatrixX."Payroll Period", Month);
                if not AssignmentMatrixX.FindSet then begin
                    Assignmatrix.Init;
                    Assignmatrix."Employee No" := Employee."No.";
                    Assignmatrix.Type := Assignmatrix.Type::Deduction;
                    Assignmatrix.Code := EarningNewCode;
                    Assignmatrix.Validate(Code);
                    Assignmatrix."Payroll Period" := Month;
                    Assignmatrix."Department Code" := Employee."Global Dimension 1 Code";
                    //Assignmatrix.Amount:=0;
                    //MESSAGE('Incometax=%1',IncomeTax);
                    //Assignmatrix.Paye:=TRUE;
                    //Assignmatrix."Taxable amount":=TaxableAmount;
                    //Assignmatrix."Less Pension Contribution":=RetireCont;
                    //Assignmatrix.Paye:=TRUE;
                    Assignmatrix."Posting Group Filter" := Employee."Posting Group";
                    Assignmatrix."Profit Centre" := Employee."Global Dimension 2 Code";
                    Assignmatrix."Salary Pointer" := Employee."Salary Scale";
                    Assignmatrix.Branch := Employee.Branch;
                    Assignmatrix."Pay Point" := Employee.Paypoint;
                    Assignmatrix."Staffing Group" := Employee."Staffing Group";
                    Assignmatrix."Department Code" := Employee.Department;
                    Assignmatrix.Validate(Amount);
                    if Assignmatrix.Amount <> 0 then
                        Assignmatrix.Insert;

                end else
                    AssignmentMatrixX.Validate(Code);
            end;

            trigger OnPreDataItem()
            begin
                Window.Open('Calculating Payroll To ##############################1', EmployeeName);
                PayrollPeriod.SetRange(Closed, false);
                if PayrollPeriod.Find('-') then
                    Month := PayrollPeriod."Starting Date";
                LastMonth := CalcDate('-1M', Month);
                if EarningNewCode = '' then
                    Error('Select Code!!');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("New Earning Code"; EarningNewCode)
                {
                    ApplicationArea = Basic;
                    TableRelation = DeductionsX.Code where(Block = const(false));
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
        AssignmentMatrixX: Record "Assignment Matrix-X";
        Assignmatrix: Record "Assignment Matrix-X";
        BeginDate: Date;
        DateSpecified: Date;
        BasicSalary: Decimal;
        TaxableAmount: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        TaxCode: Code[10];
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        IncomeTax: Decimal;
        relief: Decimal;
        EmpRec: Record Employee;
        NetPay: Decimal;
        NetPay1: Decimal;
        Index: Integer;
        Intex: Integer;
        AmountRemaining: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        DenomArray: array[1, 12] of Text[50];
        NoOfUnitsArray: array[1, 12] of Integer;
        AmountArray: array[1, 60] of Decimal;
        PayMode: Text[30];
        PayPeriodtext: Text[30];
        EndDate: Date;
        DaysinAmonth: Decimal;
        HoursInamonth: Decimal;
        Earnings: Record EarningsX;
        CfMpr: Decimal;
        Deductions: Record DeductionsX;
        NormalOvertimeHours: Decimal;
        WeekendOvertime: Decimal;
        PayrollPeriod: Record "Payroll PeriodX";
        Window: Dialog;
        EmployeeName: Text[230];
        NoOfDays: Integer;
        Month: Date;
        GetPaye: Codeunit Payroll3;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        ScalePointer: Record "Salary Pointers2";
        SalaryScale: Record "Salary Scales2";
        CurrentMonth: Integer;
        CurrentMonthtext: Text[30];
        HseAllow: Record "House Allowance Matrix2";
        Ded: Record DeductionsX;
        Assmatrix: Record "Assignment Matrix-X";
        LoanType: Record "Loan Product Type";
        LoanApplication: Record "Loan Application";
        LoanBalance: Decimal;
        InterestAmt: Decimal;
        RefNo: Code[20];
        LastMonth: Date;
        NextPointer: Code[10];
        UserRole: Record "Access Control";
        NETPAY3: Decimal;
        Assignmatrix2: Record "Assignment Matrix-X";
        InsuranceAmount: Decimal;
        Payments: Record EarningsX;
        HRSetup: Record "Human Resources Setup";
        EmployeeRec: Record Employee;
        ExcessP: Decimal;
        NetPayThird: Record Employee;
        PayrollPeriodF: Date;
        HumanResourcesSetupGRRec: Record "Human Resources Setup";
        AssignmentMatrixXGRRec: Record "Assignment Matrix-X";
        AssignmentMatrixXGRRec2: Record "Assignment Matrix-X";
        TotalGratuity: Decimal;
        BracketsX: Record "Bracket Tablesx";
        GratuityTax: Decimal;
        EarningNewCode: Code[50];
}
