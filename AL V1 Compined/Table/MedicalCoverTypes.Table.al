#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69034 "Medical Cover Types"
{
    DrillDownPageID = "Approved Salary Voucher";
    LookupPageID = "Approved Salary Voucher";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Type; Option)
        {
            OptionMembers = "  ","In House",Outsourced;
        }
        field(4; Provider; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if vend.Get(Provider) then begin
                    "Name of Provider" := vend.Name;
                end;
            end;
        }
        field(5; "Name of Provider"; Text[50])
        {
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
        vend: Record Vendor;
}
