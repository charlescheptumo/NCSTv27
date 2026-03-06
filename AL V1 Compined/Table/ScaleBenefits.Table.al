#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69019 "Scale Benefits"
{

    fields
    {
        field(1; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
        field(2; "Salary Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer";
        }
        field(3; "ED Code"; Code[10])
        {
            NotBlank = true;
            TableRelation = EarningsX;

            trigger OnValidate()
            begin
                if EarningRec.Get("ED Code") then begin
                    "ED Description" := EarningRec.Description;
                end;
            end;
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "ED Description"; Text[30])
        {
        }
        field(6; "G/L Account"; Code[20])
        {
        }
        field(7; "Basic Salary"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Salary Scale", "Salary Pointer", "ED Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EarningRec: Record EarningsX;
}
