#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70194 "IFP Response Line RC"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFP Response,EOI Response';
            OptionMembers = "IFP Response","EOI Response";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Response"."Document No.";
        }
        field(3; "Procurement Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Prequalification Category"."Prequalification Category ID";
        }
        field(4; "Responsibility Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(5; Description; Text[30])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Responsibility Center Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
