#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80007 "Organization Unit Mandate"
{

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Organization Unit Code"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,Section,Region,Branch;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
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
