#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69036 "Medical Scheme Lines"
{
    DrillDownPageID = "HR Leave Batches";
    LookupPageID = "HR Leave Batches";

    fields
    {
        field(1; "Medical Scheme No"; Code[10])
        {
        }
        field(2; "Employee Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(3; Relationship; Code[20])
        {
            NotBlank = true;
            TableRelation = Relative.Code;
        }
        field(4; SurName; Text[50])
        {
            NotBlank = true;
        }
        field(5; "Other Names"; Text[100])
        {
            NotBlank = true;
        }
        field(6; "ID No/Passport No"; Text[50])
        {
        }
        field(7; "Date Of Birth"; Date)
        {
        }
        field(8; Occupation; Text[100])
        {
        }
        field(9; Address; Text[250])
        {
        }
        field(10; "Office Tel No"; Text[100])
        {
        }
        field(11; "Home Tel No"; Text[50])
        {
        }
        field(12; Remarks; Text[250])
        {
        }
        field(13; "Service Provider"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(14; "Fiscal Year"; Code[10])
        {
        }
        field(15; "Line No."; Integer)
        {
        }
        field(16; Gender; Option)
        {
            OptionMembers = " Male",Female;
        }
        field(17; "In-Patient Entitlement"; Decimal)
        {
        }
        field(18; "Out-Patient Entitlment"; Decimal)
        {
        }
        field(19; "Amount Spend (In-Patient)"; Decimal)
        {
        }
        field(20; "Amout Spend (Out-Patient)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Medical Scheme No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
