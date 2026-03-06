#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70062 "Business Types"
{
    DrillDownPageID = "Business Types";
    LookupPageID = "Business Types";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Ownership Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Sole Ownership,Partnership,Registered Company';
            OptionMembers = ,"Sole Ownership",Partnership,"Registered Company";
        }
        field(5; "No. of Active Vendors"; Integer)
        {
            CalcFormula = count(Vendor where("Business Type" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
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
