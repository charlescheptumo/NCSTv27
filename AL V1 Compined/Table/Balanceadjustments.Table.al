#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69017 "Balance adjustments"
{
    DrillDownPageID = "Scale Benefits";
    LookupPageID = "Scale Benefits";

    fields
    {
        field(1; "Employee Number"; Code[10])
        {
            NotBlank = true;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if emp.Get("Employee Number") then
                    Names := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
            end;
        }
        field(2; Names; Text[100])
        {
            Editable = false;
        }
        field(3; "Code"; Code[10])
        {
            NotBlank = true;
            TableRelation = DeductionsX.Code where(Block = const(false),
                                                    "Show Balance" = const(true),
                                                    "Insurance Code" = const(true),
                                                    Shares = const(true));

            trigger OnValidate()
            begin
                if deduct.Get(Code) then
                    Description := deduct.Description;
            end;
        }
        field(4; Description; Text[30])
        {
            Editable = false;
        }
        field(5; Amount; Decimal)
        {
            NotBlank = true;
        }
        field(6; "User ID"; Text[30])
        {
            Editable = false;
            NotBlank = true;
        }
        field(7; "Source Doc.No."; Text[30])
        {
        }
        field(8; "Payroll Date"; Date)
        {
            NotBlank = true;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
    }

    keys
    {
        key(Key1; "Payroll Date", "Employee Number", "Code")
        {
            Clustered = true;
        }
        key(Key2; "Employee Number", "Code")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "User ID" := UserId;
        bal.Init;
        bal.SetRange(bal."Employee No.", Code);
        bal.SetRange(bal."Loan No.", "Employee Number");
        if bal.Get(Code) then begin
            bal.Delete;
        end
        else
            bal."Employee No." := Code;
        bal."Loan No." := "Employee Number";
        bal.Insert;
    end;

    var
        bal: Record "Loan Repayment Schedule";
        emp: Record Employee;
        deduct: Record DeductionsX;
}
