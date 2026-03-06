#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56065 "Computer Specifications"
{

    fields
    {
        field(1; "Specs type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,RAM,Processor,HardDisk,Manufacturer,Model,Operating System';
            OptionMembers = " ",RAM,Processor,HardDisk,Manufacturer,Model,"Operating System";
        }
        field(2; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[50])
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
