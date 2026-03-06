#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65033 "Effort & Payroll Matrix"
{

    fields
    {
        field(1; "Project No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where("Document Type" = const(Project));
        }
        field(2; "Task No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project No"));
        }
        field(3; "Resource ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Research Team"."Researcher ID" where("Default Payment Mentod" = const(Payroll));

            trigger OnValidate()
            begin
                if Resource.Get("Resource ID") then begin
                    "Emp No" := Resource."Employee No";
                end;
            end;
        }
        field(4; "Employee No"; Code[50])
        {
            CalcFormula = lookup(Resource."Employee No" where("No." = field("Resource ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Employee Name"; Code[100])
        {
            CalcFormula = lookup(Resource."Employee Name" where("No." = field("Resource ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Project Position"; Code[100])
        {
            CalcFormula = lookup("Project Research Team"."Primary Role" where("Researcher ID" = field("Resource ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "FTE Effort (%)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Project Invoice Currency Code"; Code[50])
        {
            CalcFormula = lookup(Job."Invoice Currency Code" where("No." = field("Project No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Payroll Earning Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX;

            trigger OnValidate()
            begin
                if EarningX.Get("Payroll Earning Code") then begin
                    "Earning Description" := EarningX.Description;
                end;
            end;
        }
        field(10; "Earning Description"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "FTE Annual Earning Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Monthly Earned Amount" := ROUND("FTE Annual Earning Amount" / 12, 0.01, '=');
            end;
        }
        field(12; "FTE Annual Earning Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Monthly Earned Amount(LCY)" := ROUND("FTE Annual Earning Amount(LCY)" / 12, 0.01, '=');
            end;
        }
        field(13; "Monthly Earned Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Monthly Earned Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Starting Pay Period"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX" where(Closed = const(false));
        }
        field(16; "Ending Pay Period"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX" where(Closed = const(false));
        }
        field(17; "Last Payroll Run Period"; Date)
        {
            CalcFormula = max("Assignment Matrix-X"."Payroll Period");
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Total Posted Earnin(LCY)"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Emp No"),
                                                                  Code = field("Payroll Earning Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Emp No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Project No", "Task No", "Resource ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EarningX: Record EarningsX;
        Resource: Record Resource;
}
