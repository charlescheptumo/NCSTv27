#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70151 "IFS Key Staff"
{
    Caption = 'IFS Key Staff';

    fields
    {
        field(1; "IFS Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Staff Role Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(3; "Title/Designation Description"; Text[100])
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
        field(6; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1; "IFS Code", "Staff Role Code")
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
