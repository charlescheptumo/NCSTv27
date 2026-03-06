#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80019 "Annual Strategy Workplan"
{

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."Work Plan Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Strategy Plan ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(4; "Year Reporting Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(5; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
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
        if No = '' then begin
            SPMSetup.Get;
            SPMSetup.TestField("Work Plan Nos");
          //  NoSeriesMgt.InitSeries(SPMSetup."Work Plan Nos", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(SPMSetup."Work Plan Nos", Today, true);
        end;
    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
