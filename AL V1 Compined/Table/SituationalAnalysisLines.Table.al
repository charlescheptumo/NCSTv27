#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80025 "Situational Analysis Lines"
{

    fields
    {
        field(1; "Matrix ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Situational Analysis Matrix";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Situational Analysis Model"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Entry Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Strength,Weakness,Opportunity,Threat';
            OptionMembers = Strength,Weakness,Opportunity,Threat;
        }
        field(5; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(7; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department));
        }
    }

    keys
    {
        key(Key1; "Matrix ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
