#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50015 "Service Items"
{
    DrillDownPageID = "Service Item Lists";
    LookupPageID = "Service Item Lists";

    fields
    {
        field(1; "Service Code"; Code[20])
        {
            Editable = true;

            trigger OnValidate()
            begin

                if "Service Code" <> xRec."Service Code" then begin
                    Glsetup.Get;
                    NoSeriesMgt.TestManual(Glsetup."Service Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Service Name"; Text[100])
        {
        }
        field(3; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                if GlAcount.Get("G/L Account") then begin
                    "G/L Account Name" := GlAcount.Name;
                end;
            end;
        }
        field(4; "G/L Account Name"; Text[100])
        {
        }
        field(107; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108; Capex; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Service Code", "Service Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Service Code" = '' then begin
            Glsetup.Get;
            Glsetup.TestField(Glsetup."Service Nos.");
            "Service Code" := NoSeriesMgt.GetNextNo(Glsetup."Service Nos.", WorkDate(), true);
        end;
    end;

    var
        GlAcount: Record "G/L Account";
        NoSeriesMgt: Codeunit "No. Series";
        Glsetup: Record "General Ledger Setup";
}
