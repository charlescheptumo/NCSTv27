#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65006 "Research Project Area"
{
    DrillDownPageID = "Research Project Area List";
    LookupPageID = "Research Project Area List";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Research Program ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Program";

            trigger OnValidate()
            begin
                if RProgram.Get("Research Program ID") then begin
                    "Program Name" := RProgram.Name;
                end;
            end;
        }
        field(3; "Program Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Project Area Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", "Research Program ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RProgram: Record "Research Program";
}
