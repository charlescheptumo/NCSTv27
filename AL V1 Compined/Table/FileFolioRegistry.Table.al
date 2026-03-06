#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59082 "File Folio Registry"
{

    fields
    {
        field(1; "Folio No"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Folio Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "File No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "File Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Document No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Folio No", "File No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
    end;

    var
        RecordCreation: Record "Record Creation";
}
