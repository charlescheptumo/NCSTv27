#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72011 Constituency
{
    // DrillDownPageID = UnknownPage72009;
    //LookupPageID = UnknownPage72009;

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "County Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Road Links"; Integer)
        {
            CalcFormula = count("Road Inventory" where("Primary Region ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Total Road Network Length (Km)"; Decimal)
        {
            CalcFormula = sum("Road Inventory"."Gazetted Road Length (KMs)" where("Primary Region ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Paved Road Length (Km)"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(8; "Paved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Unpaved Road Length %"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 10 : 10;
            Editable = false;
        }
        field(10; "No. of Planned Road Projects"; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(11; "No. of Ongoing Road Projects"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "No. of Completed Road Projects"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Budget (Total Cost)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Actual (Total Cost)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
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
}
