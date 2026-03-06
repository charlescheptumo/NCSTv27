#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69103 "Company Activities"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[200])
        {
        }
        field(3; Day; Date)
        {
        }
        field(4; Venue; Text[200])
        {
        }
        field(5; Responsibility; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(6; Costs; Decimal)
        {
        }
        field(7; "G/L Account No"; Code[20])
        {
            NotBlank = true;
            TableRelation = "G/L Account"."No.";
        }
        field(8; "Bal. Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Bank';
            OptionMembers = "G/L Account",Bank;

            trigger OnValidate()
            begin
                //{
                //IF "Bal. Account Type" = "Bal. Account Type"::"G/L Account" THEN
                //GLAccts.GET(GLAccts."No.")
                //ELSE
                //Banks.GET(Banks."No.");
                //}
            end;
        }
        field(9; "Bal. Account No"; Code[20])
        {
            NotBlank = true;
            TableRelation = "G/L Account"."No.";
        }
        field(10; Post; Boolean)
        {
        }
        field(11; Posted; Boolean)
        {
            Editable = true;
        }
        field(12; "Attachment No."; Integer)
        {
        }
        field(13; "Language Code (Default)"; Code[10])
        {
            TableRelation = Language;
        }
        field(14; Attachement; Option)
        {
            OptionMembers = No,Yes;
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

    var
        GLAccts: Record "G/L Account";
        Banks: Record "Bank Account";
        Text000: label 'You have canceled the create process.';
        Text001: label 'Replace existing attachment?';
        Text002: label 'You have canceled the import process.';
}
