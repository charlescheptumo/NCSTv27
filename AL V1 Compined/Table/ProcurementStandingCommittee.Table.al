#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70136 "Procurement Standing Committee"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to E-Procurement No. Series (Procurement Standing Committee No. Series field)';

            trigger OnValidate()
            begin
                if "Document No." <> '' then begin

                    ProcurementSetup.TestField("Standing Proc Committee  No.");
                    NoMgt.TestManual(ProcurementSetup."Standing Proc Committee  No.");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Committee Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Committee Types"."Committee Type";
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Appointment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Appointing Authority"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Tenure Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Tenure End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(10; "Primary Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Department),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Committee Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Standing Proc Committee  No.");
            // NoMgt.InitSeries(ProcurementSetup."Standing Proc Committee  No.", xRec."No. Series", 0D, "Document No.", "No. Series");
            "Document No." := NoMgt.GetNextNo(ProcurementSetup."Standing Proc Committee  No.", WorkDate(), true);
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
