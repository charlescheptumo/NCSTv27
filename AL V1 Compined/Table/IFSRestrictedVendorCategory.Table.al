#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70146 "IFS Restricted Vendor Category"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Restricted Vendor Category ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
        field(3; Description; Text[100])
        {
            CalcFormula = lookup("Special Vendor Category".Description where(Code = field("Restricted Vendor Category ID")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document No", "Restricted Vendor Category ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
