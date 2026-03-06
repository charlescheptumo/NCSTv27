#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69003 "Employee Bank AccountX"
{
    DrillDownPageID = "Employee Bank List";
    LookupPageID = "Employee Bank List";

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee;
        }
        field(2; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(3; "Bank Name"; Text[100])
        {
        }
        field(5; "Branch Name"; Text[100])
        {
        }
        field(6; Address; Text[30])
        {
        }
        field(7; "Address 2"; Text[30])
        {
        }
        field(8; City; Text[30])
        {
        }
        field(9; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if PostCode.Get("Post Code") then
                    City := PostCode.City;
            end;
        }
        field(10; Contact; Text[30])
        {
        }
        field(11; "Phone No."; Text[30])
        {
        }
        field(12; "Telex No."; Text[20])
        {
        }
        field(13; "Bank Branch No."; Text[20])
        {
            NotBlank = false;
        }
        field(14; "Bank Account No."; Text[30])
        {
        }
        field(15; "Transit No."; Text[20])
        {
        }
        field(16; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
        }
        field(17; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(18; County; Text[30])
        {
        }
        field(19; "Fax No."; Text[30])
        {
        }
        field(20; "Telex Answer Back"; Text[20])
        {
        }
        field(21; "Language Code"; Code[10])
        {
            TableRelation = Language;
        }
        field(22; "E-Mail"; Text[80])
        {
        }
        field(23; "Home Page"; Text[80])
        {
        }
        field(24; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(25; Agent; Boolean)
        {
        }
        field(26; "No.Of Employees"; Integer)
        {
            CalcFormula = count(Employee where("Employee's Bank" = field(Code),
                                                "Bank Branch" = field("Bank Branch No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "No.Of Employees-Guards"; Integer)
        {
            CalcFormula = count(Employee where("Employee's Bank" = field(Code),
                                                "Bank Branch" = field("Bank Branch No."),
                                                "Payroll Group" = const(Guards)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "No.Of Employees-Admin"; Integer)
        {
            CalcFormula = count(Employee where("Employee's Bank" = field(Code),
                                                "Bank Branch" = field("Bank Branch No."),
                                                "Payroll Group" = const(Admin)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code", "Bank Branch No.", "Branch Name", "Bank Name")
        {
            Clustered = true;
        }
        key(Key2; "Employee No.")
        {
        }

    }

    fieldgroups
    {
        fieldgroup(DROPDOWN; "Code", "Bank Branch No.", "Bank Name", "Branch Name")
        {
        }
    }

    var
        PostCode: Record "Post Code";
}

