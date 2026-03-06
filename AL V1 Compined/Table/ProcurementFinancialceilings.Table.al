#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70010 "Procurement Financial ceilings"
{

    fields
    {
        field(1; "Method of Procurement"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Method";
        }
        field(2; "Minimum Ceiling"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Maximum Ceiling"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Procument Description"; Text[30])
        {
            CalcFormula = lookup("Procurement Method".Description where(Code = field("Method of Procurement")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Effective date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Procurement Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Classes";
        }
        field(8; "Procurement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Goods,Services,Works;
        }
    }

    keys
    {
        key(Key1; "Method of Procurement", "Procurement Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
