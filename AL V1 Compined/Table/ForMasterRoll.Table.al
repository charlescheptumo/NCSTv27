#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 90001 "For Master Roll"
{

    fields
    {
        field(10; "Employee Code"; Code[20])
        {
        }
        field(20; "Employee Name"; Text[100])
        {
            CalcFormula = lookup(Employee.Initials where("No." = field("Employee Code")));
            FieldClass = FlowField;
        }
        field(30; "Gross Pay"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  "Tax Relief" = filter(false),
                                                                  Type = filter(Payment),
                                                                  "Payroll Period" = field(PeriodFilter),
                                                                  "Non-Cash Benefit" = filter(false)));
            FieldClass = FlowField;
        }
        field(40; PAYE; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Paye = filter(true),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(50; NHIF; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = filter('D002'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(60; NSSF; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D003'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(70; PeriodFilter; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX"."Starting Date";

            trigger OnLookup()
            begin
                //MESSAGE('%1',PeriodFilter);
            end;

            trigger OnValidate()
            begin
                //MESSAGE('%1',PeriodFilter);
                Message('%1', PeriodFilter);
            end;
        }
        field(80; Department; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("No." = field("Employee Code"),
                                                                                   "Table ID" = const(5200),
                                                                                   "Dimension Code" = const('DEPARTMENT')));
            FieldClass = FlowField;
        }
        field(90; "Total Deduction"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = filter(Deduction),
                                                                  "Employee No" = field("Employee Code"),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(91; "Net Pay"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  "Tax Relief" = filter(false),
                                                                  "Payroll Period" = field(PeriodFilter),
                                                                  "Non-Cash Benefit" = filter(false)));
            FieldClass = FlowField;
        }
        field(100; "Cimbria Investment Group"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D004'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(110; "Co-op Share Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D005'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(120; Pinnacle; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D006'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(130; "Taqwa Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D007'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(140; Welfare; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D008'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(150; "X-Mas"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D009'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(160; "Emergency Co-op Loan"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = filter('D010' | 'D021'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(170; "Normal Co-op Loan"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = filter('D022' | 'D011'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(180; "School Fees Co-op Loan"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = filter('D012' | 'D023'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(190; "Subsidiary Loan"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = filter('D013' | 'D024'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(200; Pension; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D014'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(210; "Co-op Share Registration"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D015'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(220; "Salary Advance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D016'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(230; "Staff Debts"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D017'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(240; "Motor Vehicle1"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D018'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(250; "Instant Loan"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = filter('D019' | 'D025'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(260; "Medical Insurance Deduction"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D020'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(320; HELB; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D026'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(330; "Motor Vehicle"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D027'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(340; "Loan guarantee"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D028'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(350; "All Loans"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = filter('D022' | 'D011' | 'D010' | 'D021' | 'D012' | 'D023' | 'D013' | 'D024' | 'D019' | 'D025'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(351; "Bal bf"; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Opening Balance" where("Employee No" = field("Employee Code"),
                                                                                "Payroll Period" = field(PeriodFilter),
                                                                                Code = field("Loan Code")));
            FieldClass = FlowField;
        }
        field(352; "Bal Cf"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Closing Balance" where("Employee No" = field("Employee Code"),
                                                                             "Payroll Period" = field(PeriodFilter),
                                                                             Code = field("Loan Code")));
            FieldClass = FlowField;
        }
        field(353; "Loan Code"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = DeductionsX.Code where("Loan?" = const(true));
        }
        field(355; AddLoan; Decimal)
        {
        }
        field(356; LoanID; Code[20])
        {
            CalcFormula = lookup("Assignment Matrix-X"."Loan Product Type" where("Payroll Period" = field(PeriodFilter),
                                                                                  Code = field("Loan Code")));
            FieldClass = FlowField;
        }
        field(358; Interests; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Type = filter(Deduction),
                                                                  "Payroll Period" = field(PeriodFilter),
                                                                  Interest = filter(true),
                                                                  "Loan Product Type" = field(LoanID)));
            FieldClass = FlowField;
        }
        field(359; BdDates; Date)
        {
        }
        field(360; BdInterest; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Interest = filter(true),
                                                                     "Employee No" = field("Employee Code"),
                                                                     "Payroll Period" = field(PeriodFilter),
                                                                     MainLoanCode = field("Loan Code")));
            FieldClass = FlowField;
        }
        field(3662; "Benevolence Insurance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('D029'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(3663; "1.5"; Integer)
        {
            CalcFormula = sum("Assignment Matrix-X"."Hours 1.5" where("Employee No" = field("Employee Code"),
                                                                       "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(3664; "2.0"; Integer)
        {
            CalcFormula = sum("Assignment Matrix-X"."Hours 2.0" where("Employee No" = field("Employee Code"),
                                                                       "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(3665; leave; Integer)
        {
            CalcFormula = sum("Assignment Matrix-X"."Leave Days" where("Employee No" = field("Employee Code"),
                                                                        "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(3666; "1.5 Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('E007'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(3667; "2.0 Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('E009'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
        field(3668; "Leave Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee Code"),
                                                                  Code = const('E013'),
                                                                  "Payroll Period" = field(PeriodFilter)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Employee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        TBL.CalcFields(TBL."Gross Pay", TBL.PAYE, TBL.NHIF, TBL.NSSF, TBL."Total Deduction");
    end;

    var
        TBL: Record "For Master Roll";
}
