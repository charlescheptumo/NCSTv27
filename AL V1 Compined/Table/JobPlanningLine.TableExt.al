#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50036 tableextension50036 extends "Job Planning Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Unit Cost (LCY)"(Field 12)".

        field(65001; "Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
            OptionCaption = 'Original,Revised,Suplementary';
            OptionMembers = Original,Revised,Suplementary;
        }
        field(65002; "Job Budget Templates"; Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
            TableRelation = "Job Budget Templates";
        }
    }
}
