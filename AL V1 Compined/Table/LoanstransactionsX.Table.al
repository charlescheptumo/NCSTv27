#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69002 "Loans transactionsX"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            NotBlank = true;
            TableRelation = DeductionsX where(Loan = const(true));

            trigger OnValidate()
            begin
                if Deductions.Get(Code) then begin
                    Name := Deductions.Description;
                    "Maximum limit" := Deductions."Maximum Amount";
                    "Repayment Grace period" := Deductions."Grace period";
                    "Repayment Period" := Deductions."Repayment Period";
                end;
                if EmpRec.Get(Employee) then
                    "Debtor Code" := EmpRec."Debtor Code";
            end;
        }
        field(2; Name; Text[30])
        {
        }
        field(3; Employee; Code[20])
        {
            TableRelation = Employee;
        }
        field(4; "Maximum limit"; Decimal)
        {
        }
        field(5; "Loan Amount"; Decimal)
        {
        }
        field(6; "Repayment Grace period"; DateFormula)
        {
        }
        field(7; "Repayment Period"; DateFormula)
        {
        }
        field(8; "Outstanding Amount"; Decimal)
        {
        }
        field(9; "Amount Paid"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field(Employee),
                                                                  Type = const(Deduction),
                                                                  Code = field(Code),
                                                                  "Payroll Period" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(10; "Period Repayments"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Period Repayments" <> 0 then begin
                    "No. of Repayments Period" := ROUND("Loan Amount" / "Period Repayments", 1);

                end;
            end;
        }
        field(11; "Repayment Begin Date"; Date)
        {
        }
        field(12; "Repayment End Date"; Date)
        {
        }
        field(13; "Loan Date"; Date)
        {

            trigger OnValidate()
            begin
                "Repayment Begin Date" := CalcDate("Repayment Grace period", "Loan Date");
                "Repayment End Date" := CalcDate("Repayment Period", "Repayment Begin Date");
            end;
        }
        field(14; "No. of Repayments Period"; Integer)
        {
            InitValue = 1;

            trigger OnValidate()
            begin
                if "No. of Repayments Period" <> 0 then
                    "Period Repayments" := "Loan Amount" / "No. of Repayments Period";
                "Period Repayments" := ROUND("Period Repayments", 1, '>');
            end;
        }
        field(15; "Interest Rate"; Decimal)
        {
        }
        field(16; "Opening Balance"; Decimal)
        {
        }
        field(17; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(18; "Interest Type"; Option)
        {
            OptionMembers = Compound,Simple,"Simple Reducing Balance";
        }
        field(19; "Interest Repaid to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Interest Amount" where("Employee No" = field(Employee),
                                                                             Type = const(Deduction),
                                                                             Code = field(Code),
                                                                             "Payroll Period" = field(upperlimit("Date Filter"))));
            FieldClass = FlowField;
        }
        field(20; "Cumm. Period Repayments"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Period Repayment" where("Employee No" = field(Employee),
                                                                              Type = const(Deduction),
                                                                              Code = field(Code),
                                                                              "Payroll Period" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(21; "Bal Account Type"; Option)
        {
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(22; "Bal Account No"; Code[10])
        {
            TableRelation = if ("Bal Account Type" = const("G/L Account")) "G/L Account"
            else if ("Bal Account Type" = const("Bank Account")) "Bank Account";
        }
        field(23; "Interest Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(24; "Debt Updated"; Boolean)
        {
        }
        field(25; "Debtor Code"; Code[10])
        {
            TableRelation = Customer;
        }
        field(26; "External Interest Rate"; Decimal)
        {
        }
        field(27; "Cumm. Period Repayments1"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Period Repayment" where("Employee No" = field(Employee),
                                                                              Type = const(Deduction),
                                                                              Code = field(Code),
                                                                              "Payroll Period" = field("Date Filter"),
                                                                              Closed = const(true)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code", Employee)
        {
            Clustered = true;
            SumIndexFields = "Loan Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if "Amount Paid" <> 0 then
            Error('Cannot delete a loan with repayments');
    end;

    var
        Deductions: Record DeductionsX;
        EmpRec: Record Employee;
}
