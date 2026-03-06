#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70133 "Procurement Committee Types"
{
    DrillDownPageID = "Procurement Committee Types";
    LookupPageID = "Procurement Committee Types";

    fields
    {
        field(1; "Committee Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Title of Appointing Officer"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Non-Staff Allowed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Min. No. of Members"; Decimal)
        {
            CalcFormula = sum("Procurement Comm Composition"."Minimum No. of Members" where("Committee Type" = field("Committee Type"),
                                                                                             Role = filter(<> Secretary)));
            Description = 'Un-editable SUM calcfield field that links to the Procurement Comm Composition Table and sums the min. number of members required based on the composition';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Mandate Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Tender Opening,Tender Evaluation,Inspection & Acceptance,Asset Disposal,Tender Committee,Procurement Committee,Other';
            OptionMembers = "Tender Opening","Tender Evaluation","Inspection & Acceptance","Asset Disposal","Tender Committee","Procurement Committee",Other;
        }
        field(7; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No. of Appointments Made"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Committee Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
