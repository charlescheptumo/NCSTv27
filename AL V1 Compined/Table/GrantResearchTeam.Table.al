#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65019 "Grant Research Team"
{
    Caption = 'Grant Research Team';
    DrillDownPageID = "Grant Research Team list";
    LookupPageID = "Grant Research Team list";

    fields
    {
        field(1; "Grant Opportunity ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'to be linked with Grant Opportunity table';
            TableRelation = "Grant Funding Application";
        }
        field(2; "Researcher ID"; Code[45])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource where("Researcher?" = filter(true));

            trigger OnValidate()
            begin
                if Researcher.Get("Researcher ID") then begin
                    Name := Researcher.Name;
                end;
            end;
        }
        field(3; Name; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Primary Role"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Team Roles";

            trigger OnValidate()
            begin
                if RTMRoles.Get("Primary Role") then begin
                    "Role Description" := RTMRoles.Description;
                end;

                GrantsSetup.Reset;
                GrantsSetup.SetRange("Primary Role", "Primary Role");
                if GrantsSetup.Find('-') then begin
                    "Lead Role" := true;
                end;
            end;
        }
        field(5; "Role Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Grant Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Grantor; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Funding Decision"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Won,Lost';
            OptionMembers = Won,Lost;
        }
        field(9; "Requested Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Awarded Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Lead Role"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Grant Opportunity ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Researcher: Record Resource;
        RTMRoles: Record "Research Team Roles";
        GrantsSetup: Record "Grants Setup";
}
