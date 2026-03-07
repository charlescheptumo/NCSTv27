#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69625 "Work Shift Time"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Workshift Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Work Shift";
        }
        field(3;Day;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(4;"Deployment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Onsite,Remote';
            OptionMembers = Onsite,Remote;
        }
        field(5;"Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Minimum Work Hrs/Day";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Workshift Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

