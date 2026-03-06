#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50018 "DMS Document Lines"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Purchase Requisition,Imprest Memo,Imprest Surrender';
            OptionMembers = "Purchase Requisition","Imprest Memo","Imprest Surrender";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Column Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Default Value"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Document No,Document Name,Vendor No,Customer No,Employee No';
            OptionMembers = ,"Document No","Document Name","Vendor No","Customer No","Employee No";
        }
        field(6; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = County.Code;
        }
        field(7; "Constituency Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code where("County Code" = field("Region Code"));
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
