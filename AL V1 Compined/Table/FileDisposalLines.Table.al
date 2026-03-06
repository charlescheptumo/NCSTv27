#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59079 "File Disposal Lines"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "File System No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Record Creation"."File No" where("File Type" = field("File Type"),
                                                               Disposed = const(false));

            trigger OnValidate()
            begin
                RegistryFileCreation.Reset;
                RegistryFileCreation.SetRange("File No", "File System No");
                if RegistryFileCreation.FindSet then begin
                    "File No" := RegistryFileCreation."File No";
                    "File Name" := RegistryFileCreation."File Name";
                    Description := RegistryFileCreation.Description;
                end;
            end;
        }
        field(3; "File No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "File Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "File Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "File Types SetUp";

            trigger OnValidate()
            begin
                Setup.Reset;
                Setup.SetRange(Code, "File Type");
                if Setup.Find('-') then begin
                    "File Type Description" := Setup.Description;
                end;
            end;
        }
        field(7; Reason; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "File Type Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RegistryFileCreation: Record "Record Creation";
        Setup: Record "File Types SetUp";
}
