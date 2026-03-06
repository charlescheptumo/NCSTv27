#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69136 "Employee Disciplinary Cases"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(2; "Refference No"; Code[20])
        {
            NotBlank = true;
        }
        field(3; Date; Date)
        {
        }
        field(4; "Disciplinary Case"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Disciplinary Cases".Code;
        }
        field(5; "Recommended Action"; Code[20])
        {
            TableRelation = "Disciplinary Actions".Code;
        }
        field(6; "Case Description"; Text[250])
        {
        }
        field(7; "Accused Defence"; Text[250])
        {
        }
        field(8; "Witness #1"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(9; "Witness #2"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(10; "Action Taken"; Code[20])
        {
            TableRelation = "Disciplinary Actions".Code;
        }
        field(11; "Date Taken"; Date)
        {
        }
        field(12; "Document Link"; Text[200])
        {
        }
        field(13; "Disciplinary Remarks"; Code[50])
        {
            TableRelation = "Disciplinary Remarks".Remark;
        }
        field(14; Comments; Text[250])
        {
        }
        field(15; "Cases Discusion"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", "Refference No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
