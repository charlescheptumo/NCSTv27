#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70082 "Procurement Category Product"
{

    fields
    {
        field(1; "Category ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                ItemCode.Reset;
                ItemCode.SetRange("No.", "Item No");
                if ItemCode.FindSet then begin
                    Description := ItemCode.Description;
                    "Unit of Measure" := ItemCode."Base Unit of Measure";
                end;
            end;
        }
        field(3; Description; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Unit of Measure";
        }
    }

    keys
    {
        key(Key1; "Category ID", "Item No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ItemCode: Record Item;
}
