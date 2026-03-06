#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69153 "KPA Objectives"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(2; Period; Code[20])
        {
            NotBlank = true;
            TableRelation = "Appraisal Periods".Period;
        }
        field(3; "KPA Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Key Performance Areas".Code;

            trigger OnValidate()
            begin
                KPAreas.Reset;
                //KPAreas.SETRANGE(KPAreas."Employee No","Employee No");
                //KPAreas.SETRANGE(KPAreas.Period,Period);
                KPAreas.SetRange(KPAreas.Code, "KPA Code");
                if KPAreas.Find('-') then
                    "KPA Description" := KPAreas.Description;
            end;
        }
        field(4; "KPA Description"; Text[200])
        {
            Editable = false;
        }
        field(5; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(6; Description; Text[200])
        {
        }
        field(7; Comments; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", Period, "KPA Code", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        KPAreas: Record "Key Performance Areas";
}
