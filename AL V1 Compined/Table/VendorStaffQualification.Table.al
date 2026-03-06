#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70076 "Vendor Staff Qualification"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(3; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',PHD,Masters,Post-Graduate Diploma,Undergraduate,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = ,PHD,Masters,"Post-Graduate Diploma",Undergraduate,Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(4; "Qualification Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Institution; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Start Year"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Year"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Outstanding Achievements"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Staff Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Staff Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
