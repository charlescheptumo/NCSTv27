#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59102 "Board Of Directors"
{
    LookupPageID = "Committee Members";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Surname; Text[100])
        {
        }
        field(3; "Other Names"; Text[150])
        {
        }
        field(4; Remarks; Text[200])
        {
        }
        field(5; "Telephone No"; Text[50])
        {
        }
        field(6; "Postal Address"; Text[100])
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;
        }
        field(8; Email; Text[100])
        {
        }
        field(9; Category; Option)
        {
            OptionCaption = ' ,Staff,Board_Member,Committee Member';
            OptionMembers = " ",Staff,Board_Member,"Committee Member";
        }
        field(10; Title; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Prof,Dr, Hon,Eng,Mr,Mrs,Ms';
            OptionMembers = " ",Prof,Dr," Hon",Eng,Mr,Mrs,Ms;
        }
        field(11; "ID/Passport No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Nationality; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Ethnicity; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(15; Position; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Jobs"."Job ID";
        }
        field(16; "Area of Expertise"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Highest Academic Qualification"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Doctorate,Masters,Bachelors,Diploma,Certificate';
            OptionMembers = " ",Doctorate,Masters,Bachelors,Diploma,Certificate;
        }
        field(18; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Disability; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(20; "Home County"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = County.Code;
        }
        field(21; "Sub-County"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Description;
        }
        field(22; "County of Residence"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region".Code;
        }
        field(23; "Appointment Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Independent,Appointed,Representative';
            OptionMembers = " ",Independent,Appointed,Representative;
        }
        field(24; "Nominating Body"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Appointing Body"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,President,Cabinet Secretary,Other';
            OptionMembers = " ",President,"Cabinet Secretary",Other;
        }
        field(26; "Gazzette Notice No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Appointment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Term Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Board Position"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Chairperson,Member,Ex-Officio';
            OptionMembers = " ",Chairperson,Member,"Ex-Officio";
        }
        field(30; "Ex-officio"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", Surname, "Other Names")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
