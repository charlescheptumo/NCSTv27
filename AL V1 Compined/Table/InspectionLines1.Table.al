#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70037 "Inspection Lines1"
{

    fields
    {
        field(1; "Inspection No"; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Unit of Measure"; Code[10])
        {
        }
        field(5; "Quantity Ordered"; Decimal)
        {
        }
        field(6; "Quantity Received"; Decimal)
        {
        }
        field(7; "Inspection Decision"; Option)
        {
            OptionMembers = " ",Accept,Reject;
        }
        field(8; "Reasons for Rejection"; Text[250])
        {
        }
        field(9; "Return Reasons"; Code[10])
        {
            TableRelation = "Return Reason";
        }
        field(10; "Item No"; Code[20])
        {
        }
        field(11; "Rejected Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Inspection No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
