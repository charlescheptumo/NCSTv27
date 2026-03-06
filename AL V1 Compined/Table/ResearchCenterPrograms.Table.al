#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65002 "Research Center Programs"
{
    DrillDownPageID = "Research Center Programs List";
    LookupPageID = "Research Center Programs List";

    fields
    {
        field(1; "Center Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Research Center?" = const(true));
        }
        field(2; "Program Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Program".Code;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Center Name"; Code[150])
        {
            CalcFormula = lookup("Research Center".Name where(Code = field("Center Code")));
            FieldClass = FlowField;
        }
        field(5; "Program Name"; Code[150])
        {
            CalcFormula = lookup("Research Program".Name where(Code = field("Program Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Center Code", "Program Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
