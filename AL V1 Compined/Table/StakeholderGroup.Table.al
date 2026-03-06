#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80004 "Stakeholder Group"
{
    DrillDownPageID = "Stakeholder Groups";
    LookupPageID = "Stakeholder Groups";

    fields
    {
        field(1; "Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Page ID Link"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = AllObjWithCaption;
        }
        field(4; "No. of Sub-Groups"; Integer)
        {
            CalcFormula = count("Stakeholder Sub-Group" where("Stakeholder Group" = field(Code)));
            FieldClass = FlowField;
        }
        field(5; "Blocked?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Object Type"; Option)
        {
            Caption = 'Link Page To';
            DataClassification = ToBeClassified;
            OptionCaption = ',,,Report,,,,,Page';
            OptionMembers = ,,,"Report",,,,,"Page";
        }
        field(18; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            DataClassification = ToBeClassified;
            TableRelation = AllObj."Object ID" where("Object Type" = field("Object Type"));
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
