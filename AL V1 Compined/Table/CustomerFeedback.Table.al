#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 58200 "Customer Feedback"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Customer Name"; Text[250])
        {
        }
        field(3; "Feedback Date"; Date)
        {
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Action"; Text[250])
        {
        }
        field(6; "Created By"; Code[100])
        {
            Editable = false;
            Enabled = true;
        }
        field(7; "Date created"; Date)
        {
            Editable = false;
        }
        field(8; "Time created"; Time)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; No)
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
        "Date created" := Today;
        "Time created" := Time;
        "Feedback Date" := Today;
    end;
}
