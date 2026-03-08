#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69634 "Committee Type"
{
    //LookupPageId = "Recruitment Committee Type";
    //DrillDownPageId = "Recruitment Committee Type";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Functional Classification"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Core Mandate,Finance,Procurement,Human Resource,ICT,Legal,Risk & Audit,Other';
            OptionMembers = ,"Core Mandate",Finance,Procurement,"Human Resource",ICT,Legal,"Risk & Audit",Other;
        }
        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Title of Appointing Officer"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(5; "Non-Staff Allowed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Minimim No. of Members"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Appointments Made"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Blocked; Boolean)
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

