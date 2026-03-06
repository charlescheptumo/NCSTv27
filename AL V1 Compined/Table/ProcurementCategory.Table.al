#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70081 "Procurement Category"
{
    DrillDownPageID = "Procurement Categories";
    LookupPageID = "Procurement Categories";

    fields
    {
        field(1; "Code"; Code[80])
        {
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(4; "Preferred Vendor Cluster"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'This is to generally guide the Procurement manager on the preferred vendor cluster for each category (NB: This field is teh same one used under the Vendor Category Table). Strict restriction of the vendor clusters for each prequalification category are defined on a case by case basis on the Invitation for Prequalification source document. NB: If this field is left blank, it means that all vendor cluasters can apply for a given category';
            OptionCaption = ' ,General,Special';
            OptionMembers = " ",General,Special;
        }
        field(5; "Applicable Location"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'This is an informational field that guides the potential vendors to know categories that can be applied across the different RCs or those that have to be dropped off at specific RCs e.g. Head Office';
        }
        field(6; "Specific Responsibility Center"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Used to restrict specific Categories, that can only be procured in a given Responsibility center. This is used in large organizations, where procurement of certain categories is only done at HQ, while the rest of the RCs are assigned other categories';
        }
        field(7; "Responsibility Center Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Operating Unit field in the Responsibility Center Table';
            OptionCaption = ' ,Directorate,Department/Center,Division/Section,Region,Constituency,Branch,Board,Company-Level';
            OptionMembers = " ",Directorate,"Department/Center","Division/Section",Region,Constituency,Branch,Board,"Company-Level";
            TableRelation = "Responsibility Center"."Operating Unit Type";
        }
        field(8; "Responsibility Center Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(9; "Category Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Classified';
            OptionMembers = Open,Classified;
        }
        field(10; Blocked; Boolean)
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
