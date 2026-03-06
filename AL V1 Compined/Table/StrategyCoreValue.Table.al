#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80011 "Strategy Core Value"
{
    DrillDownPageID = "Strategy Core Value";
    LookupPageID = "Strategy Core Value";

    fields
    {
        field(1; "Strategic Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Core Value"; Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Core Values".Code;

            trigger OnValidate()
            begin
                Corevalue.Reset;
                Corevalue.SetRange(Description, "Core Value");
                if Corevalue.Find('-') then begin
                    Description := Corevalue.Description;
                end;
            end;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Core Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Corevalue: Record "Core Values";
}
