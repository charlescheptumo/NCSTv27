#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70152 "IFS Staff Min Qualification"
{
    Caption = 'IFS Staff Min Qualification';

    fields
    {
        field(1; "IFS Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Project Role Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',PhD,Masters,Post-Graduate Diploma,Undergraduate,HND-Diploma,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = ,PhD,Masters,"Post-Graduate Diploma",Undergraduate,"HND-Diploma",Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(7; "Minimum Qualification Req"; Text[100])
        {
            Caption = 'Minimum Qualification Requirements';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "IFS Code", "Project Role Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
