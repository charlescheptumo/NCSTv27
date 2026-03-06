#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55014 "Board Resolution Lines"
{

    fields
    {
        field(1; Resolution; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Action Owner"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Action Taken"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Pending,Closed';
            OptionMembers = " Pending",Closed;
        }
        field(6; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Date Closed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Agenda No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Agenda Item"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Resolution)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
