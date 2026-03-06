#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69106 "Job Requirementx"
{
    // DrillDownPageID = UnknownPage52273;
    //LookupPageID = UnknownPage52273;

    fields
    {
        field(1; "Job Id"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Company Jobs"."Job ID";
        }
        field(2; "Qualification Type"; Option)
        {
            NotBlank = false;
            OptionMembers = " ",Academic,Professional,Technical,Experience,"Personal Attributes";
        }
        field(3; "Qualification Code"; Code[10])
        {
            Editable = true;
            NotBlank = true;
            //cc//    TableRelation = Qualification.Code where(Field50001 = field("Qualification Type"));

            trigger OnValidate()
            begin
                QualificationSetUp.Reset;
                QualificationSetUp.SetRange(QualificationSetUp.Code, "Qualification Code");
                if QualificationSetUp.Find('-') then
                    Qualification := QualificationSetUp.Description;
            end;
        }
        field(4; Qualification; Text[200])
        {
            NotBlank = false;
        }
        field(5; "Job Requirements"; Text[250])
        {
            NotBlank = true;
        }
        field(6; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
        }
        field(7; "Job Specification"; Option)
        {
            OptionMembers = " ",Academic,Professional,Technical,Experience;
        }
        field(8; "Score ID"; Decimal)
        {
        }
        field(9; "Need code"; Code[10])
        {
            DataClassification = ToBeClassified;
            //cc//       TableRelation = Table0;
        }
        field(10; "Stage Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Models".Code where(Type = const(Scores));
        }
        field(11; Mandatory; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Desired Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Total (Stage)Desired Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Qualification Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Job Id", "Qualification Type", "Qualification Code")
        {
            Clustered = true;
            SumIndexFields = "Score ID";
        }
    }

    fieldgroups
    {
    }

    var
        QualificationSetUp: Record Qualification;
}
