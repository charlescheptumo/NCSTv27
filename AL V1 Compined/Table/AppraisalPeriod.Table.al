#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56203 "Appraisal  Period"
{
    DrillDownPageID = "Appraisal Period";
    LookupPageID = "Appraisal Period";

    fields
    {
        field(1; Period; Code[20])
        {
        }
        field(2; Comments; Text[250])
        {
        }
        field(3; "Start Date"; Date)
        {
        }
        field(4; "End Date"; Date)
        {
        }
        field(5; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(6; "Date Created"; Date)
        {
            Editable = false;
        }
        field(7; "Time created"; Time)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; Period)
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
        "Date Created" := Today;
        "Time created" := Time;
    end;
}
