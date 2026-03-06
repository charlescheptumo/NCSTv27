#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56213 "Appraisal Comments"
{

    fields
    {
        field(1; "Appraisal No"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(3; Comment; Text[250])
        {
        }
        field(4; "Comment By"; Text[50])
        {
        }
        field(5; "Commment date"; Date)
        {
        }
        field(6; "Comment time"; Time)
        {
        }
        field(7; Type; Option)
        {
            OptionCaption = ' ,Appraisee,First Supervisor,Second Supervisor,Managing Director';
            OptionMembers = " ",Appraisee,"First Supervisor","Second Supervisor","Managing Director";
        }
        field(8; "Based on 3a & b"; Boolean)
        {
        }
        field(9; "Based on Targets"; Boolean)
        {
        }
        field(10; "Overall Performance"; Boolean)
        {
        }
        field(11; "Mid Year"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
