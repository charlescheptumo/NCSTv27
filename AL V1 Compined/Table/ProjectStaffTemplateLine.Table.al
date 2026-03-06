#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70127 "Project Staff Template Line"
{
    DrillDownPageID = "Project Staff Template Line";

    fields
    {
        field(1; "Key Staff Template ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Key Staff Template";
        }
        field(2; "Project Role Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Staff Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = ,"Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(5; "Min No. of Recomm Staff"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Minimum No. of Recommended Staff';
        }
    }

    keys
    {
        key(Key1; "Key Staff Template ID", "Project Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
