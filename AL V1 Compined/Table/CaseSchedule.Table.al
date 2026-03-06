#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56037 "Case Schedule"
{

    fields
    {
        field(1; "Case ID"; Code[20])
        {

            trigger OnValidate()
            begin
                if "Case ID" <> xRec."Case ID" then begin
                    NoSetup.Get;
                    NoSeriesMgt.TestManual(NoSetup."Case Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Court Date"; Date)
        {
        }
        field(3; "Type of Proceedings"; Code[10])
        {
            TableRelation = "Case Document Types".Code;

            trigger OnValidate()
            begin
                if proceed.Get("Type of Proceedings") then
                    "Proceedings Description" := proceed.Description;
            end;
        }
        field(4; "Proceedings Description"; Text[60])
        {
        }
        field(5; "Date Created"; Date)
        {
            Editable = false;
        }
        field(6; "Time Created"; Date)
        {
            Editable = false;
        }
        field(7; "Created By"; Code[20])
        {
            Editable = false;
        }
        field(8; "No. Series"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Case ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Case ID" = '' then begin
            NoSetup.Get;
            NoSetup.TestField(NoSetup."Case Nos");
          //      NoSeriesMgt.InitSeries(NoSetup."Case Nos", xRec."No. Series", 0D, "Case ID", "No. Series");
            "Case ID" := NoSeriesMgt.GetNextNo(NoSetup."Case Nos", Today, true);
        end;

        "Date Created" := Today;
        "Created By" := UserId;
        "Time Created" := "Time Created";
    end;

    var
        NoSetup: Record "Copyright Setup";
        NoSeriesMgt: Codeunit "No. Series";
        proceed: Record "Case Document Types";
}
