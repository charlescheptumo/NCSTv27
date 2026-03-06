#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70096 "Procurement Law & Regulation"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Laws, Regulations,Policy,Procdere & Guidelines';
            OptionMembers = ,Laws," Regulations",Policy,"Procdere & Guidelines";
        }
        field(3; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Versions"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Current Version No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Proc Regulation Version"."Version Code";
        }
        field(6; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Active,Blocked';
            OptionMembers = Draft,Active,Blocked;
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
