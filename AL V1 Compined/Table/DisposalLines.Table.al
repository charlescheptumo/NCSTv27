#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70048 "Disposal Lines"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Fixed Asset/Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(4; "FA Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Location; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(8; "Disposal Plan"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Disposal Item No"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disposal Plan Lines"."Line No." where("Disposal header" = field("Disposal Plan"));

            trigger OnValidate()
            begin
                DisposalPlan.Reset;
                DisposalPlan.SetRange(DisposalPlan."Line No.", "Disposal Item No");
                if DisposalPlan.Find('-') then begin
                    if DisposalPlan.Type = DisposalPlan.Type::Item then begin
                        Type := Type::Item;
                        "Fixed Asset/Item No." := DisposalPlan."Item No.";
                    end;
                    if DisposalPlan.Type = DisposalPlan.Type::"Fixed Asset" then begin
                        Type := Type::"Fixed Asset";
                        "Fixed Asset/Item No." := DisposalPlan."Item No.";
                        FixedAsset.Get("Fixed Asset/Item No.");
                        "FA Name" := FixedAsset.Description;
                        Location := FixedAsset."Location Code";
                    end;

                    "Description of Item" := DisposalPlan."Description of Item";
                    "Unit of Issue" := DisposalPlan."Unit of Issue";
                    "Estimated current value" := DisposalPlan."Estimated current value";
                    Quantity := DisposalPlan.Quantity;
                    "Disposal Type" := DisposalPlan."Disposal Type";
                end;
            end;
        }
        field(10; Type; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Fixed Asset,Item';
            OptionMembers = "Fixed Asset",Item;
        }
        field(11; "Unit of Issue"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Unit of Measure";
        }
        field(12; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Estimated current value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Description of Item"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Disposal Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disposal Types".Code where(Blocked = const(false));
        }
        field(16; "Disposal Methods"; Text[50])
        {
            CalcFormula = lookup("Disposal Types".Description where(Code = field("Disposal Type")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Fixed Asset/Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        DisposalHeader.Get("Document No.");
        "Global Dimension 1 Code" := DisposalHeader."Global Dimension 1 Code";
        "Global Dimension 2 Code" := DisposalHeader."Global Dimension 2 Code";
        Validate("Global Dimension 1 Code");
        Validate("Global Dimension 2 Code");
        "Disposal Plan" := DisposalHeader."Disposal Plan";
    end;

    var
        DisposalHeader: Record "Disposal Header";
        FixedAsset: Record "Fixed Asset";
        DisposalPlan: Record "Disposal Plan Lines";
}
