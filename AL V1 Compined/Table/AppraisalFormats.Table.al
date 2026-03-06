#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69147 "Appraisal Formats"
{

    fields
    {
        field(1; "Appraisal Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Appraisal Types".Code;
        }
        field(2; Sequence; Integer)
        {
            NotBlank = true;
        }
        field(3; Type; Option)
        {
            OptionMembers = Question,"Heading 2",Category,"Heading 1";
        }
        field(4; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Entry By"; Code[20])
        {
        }
        field(7; "After Entry Of Prev. Group"; Boolean)
        {
        }
        field(8; "Allow Previous Groups Rights"; Boolean)
        {
        }
        field(9; "In Put"; Option)
        {
            OptionMembers = " ",Grades,Marks,Details;
        }
        field(10; "Appraisal Heading Type"; Option)
        {
            OptionMembers = " ",Objectives,"Core Values","Core Competencies","Managerial and Supervisory";
        }
        field(11; "Appraisal Header"; Text[50])
        {
            TableRelation = "Appraisal Format Header";
        }
        field(12; Value; Text[80])
        {
        }
        field(13; Bold; Boolean)
        {
        }
        field(14; "Line No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal Code", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Appraisal Code", Sequence)
        {
        }
    }

    fieldgroups
    {
    }
}
