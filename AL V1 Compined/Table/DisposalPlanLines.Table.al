#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70044 "Disposal Plan Lines"
{
    DrillDownPageID = "Disposal Plan Lines";
    LookupPageID = "Disposal Plan Lines";

    fields
    {
        field(1; "Disposal header"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Fixed Asset,Item';
            OptionMembers = "Fixed Asset",Item;
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            begin
                Item.Reset;
                Item.SetRange("No.", "Item No.");
                if Item.FindSet then
                    "Description of Item" := Item.Description;

                FA.Reset;
                FA.SetRange("No.", "Item No.");
                if FA.FindSet then
                    "Description of Item" := FA.Description
            end;
        }
        field(5; "Description of Item"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Unit of Issue"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(7; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Date Of Purchase"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Purchase Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Total Purchase Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "General Condition"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Disposal committee Recommend"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Commitee Appointment1"."Committee Name";
        }
        field(13; "Estimated current value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Accounting Officer Decision"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Disposal Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disposal Types".Code where(Blocked = const(false));
        }
        field(16; "Disposal Methods"; Text[50])
        {
            CalcFormula = lookup("Disposal Types".Description where(Code = field("Disposal Type")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Disposal header", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Description of Item")
        {
        }
    }

    var
        Item: Record Item;
        FA: Record "Fixed Asset";
}
