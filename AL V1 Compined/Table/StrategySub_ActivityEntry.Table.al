#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80018 "Strategy Sub_Activity Entry"
{
    DrillDownPageID = "Strategy Activities Entries";
    LookupPageID = "Strategy Activities Entries";

    fields
    {
        field(1; "Strategic Plan ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Theme ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Theme"."Theme ID";
        }
        field(3; "Objective ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Objective".Code;
        }
        field(4; "Strategy ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Strategy.Code;
        }
        field(5; "Activity ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Initiative".Code;
        }
        field(6; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7; "Entry Description"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Entry Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planned,Actual';
            OptionMembers = Planned,Actual;
        }
        field(9; "Year Reporting Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(10; "Quarter Reporting Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Quarterly Reporting Periods" where("Year Code" = field("Year Reporting Code"));
        }
        field(11; "Planning Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Primary Directorate"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(" "));
        }
        field(13; "Primary Department"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(14; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Cost Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "External Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Source Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Strategic Plan,Perfomance Contract';
            OptionMembers = "Strategic Plan","Perfomance Contract";
        }
    }

    keys
    {
        key(Key1; "Strategic Plan ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
