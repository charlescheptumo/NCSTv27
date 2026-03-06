#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70077 "Vendor Staff Experience"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Enabled = true;
        }
        field(2; "Staff ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(4; "Experience Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',General Experience,Specialized Experience,Training Experience,No. of Handled Projects,Other Experience';
            OptionMembers = ,"General Experience","Specialized Experience","Training Experience","No. of Handled Projects","Other Experience";
        }
        field(5; "Experience Summary"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Assignment Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Years of Experience"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Start Year"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "End Year"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Staff ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
