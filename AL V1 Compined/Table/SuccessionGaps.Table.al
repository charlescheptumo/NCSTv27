#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69122 "Succession Gaps"
{
    DrillDownPageID = "Training Needs-Approved";
    LookupPageID = "Training Needs-Approved";

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Job Id"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs"."Job ID";
        }
        field(3; "Qualification Type"; Option)
        {
            NotBlank = false;
            OptionMembers = " ",Academic,Professional,Technical,Experience,"Personal Attributes";
        }
        field(4; "Qualification Code"; Code[10])
        {
            Editable = true;
            NotBlank = true;
            //CC//      TableRelation = Qualification.Code where(Field50000 = field("Qualification Type"));

            trigger OnValidate()
            begin
                QualificationSetUp.Reset;
                QualificationSetUp.SetRange(QualificationSetUp.Code, Qualification);
                if QualificationSetUp.Find('-') then
                    "Qualification Code" := QualificationSetUp.Description;
            end;
        }
        field(5; Qualification; Text[200])
        {
            NotBlank = false;
        }
        field(6; "Job Requirements"; Text[250])
        {
            NotBlank = true;
        }
        field(7; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
        }
        field(8; "Job Specification"; Option)
        {
            OptionMembers = " ",Academic,Professional,Technical,Experience;
        }
        field(9; "Score ID"; Decimal)
        {
            TableRelation = Qualification."Qualified Employees";
        }
    }

    keys
    {
        key(Key1; "Employee No", "Job Id", "Qualification Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        QualificationSetUp: Record Qualification;
}
