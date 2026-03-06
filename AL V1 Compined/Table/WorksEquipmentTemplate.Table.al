#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70197 "Works Equipment Template"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.Get;
                    ProcurementSetup.TestField("Prequalification Score Header");
                    NoMgt.TestManual(ProcurementSetup."Prequalification Score Header");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Main Works Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;
        }
        field(4; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Purchase Requisitions"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Created Time"; Time)
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
            ProcurementSetup.TestField("Prequalification Score Header");
           // NoMgt.InitSeries(ProcurementSetup."Prequalification Score Header", xRec."No. Series", 0D, Code, "No. Series");
            Code := NoMgt.GetNextNo(ProcurementSetup."Prequalification Score Header", Today, true);

        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
