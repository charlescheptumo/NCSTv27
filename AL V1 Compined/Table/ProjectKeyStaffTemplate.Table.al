#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70126 "Project Key Staff Template"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Project Key Staff Template No. Series in the E-Procurement Setup';
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Project Key Staff Temp Nos");
                    NoMgt.TestManual(ProcurementSetup."Project Key Staff Temp Nos");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(4; "Works Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;
        }
        field(5; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Project Key Staff Temp Nos");
            // NoMgt.InitSeries(ProcurementSetup."Project Key Staff Temp Nos", xRec."No. Series", 0D, Code, "No. Series");
            Code := NoMgt.GetNextNo(ProcurementSetup."Project Key Staff Temp Nos", WorkDate(), true);
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
