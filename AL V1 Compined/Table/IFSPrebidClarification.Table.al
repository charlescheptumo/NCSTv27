#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70157 "IFS Prebid Clarification"
{

    fields
    {
        field(1; "Prebid Register ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(2; "IFS Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(3; "Agenda Code"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Agenda Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Prebid Register ID", "IFS Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record "Standard Vendor Purchase Code";
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
