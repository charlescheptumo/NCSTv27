#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70172 "Bid Modification Notice"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Bid Action Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Modification,Withdrawal';
            OptionMembers = ,Modification,Withdrawal;
        }
        field(3; "Notice Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'It should be any date before Bid closure deadline';
        }
        field(4; "Bid No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "IFS No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Reason for Action"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "External Reference No"; Code[30])
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
