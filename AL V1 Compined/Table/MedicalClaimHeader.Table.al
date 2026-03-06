#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69037 "Medical Claim Header"
{

    fields
    {
        field(1; "Claim No"; Code[20])
        {
        }
        field(2; "Claim Date"; Date)
        {
        }
        field(3; "Service Provider"; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if VendorRec.Get("Service Provider") then
                    "Service Provider Name" := VendorRec.Name;
            end;
        }
        field(4; "Service Provider Name"; Text[100])
        {
        }
        field(5; "No. Series"; Code[10])
        {
        }
        field(6; Claimant; Option)
        {
            OptionMembers = " ","Service Provider",Employee;
        }
        field(7; Amount; Decimal)
        {
            CalcFormula = sum("Claim Line".Amount where("Claim No" = field("Claim No")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Claim No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Claim No" = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField(HumanResSetup."Medical Claim Nos");
        //    NoSeriesMgt.InitSeries(HumanResSetup."Medical Claim Nos", xRec."No. Series", 0D, "Claim No", "No. Series");
            "Claim No" := NoSeriesMgt.GetNextNo(HumanResSetup."Medical Claim Nos", Today, true);
        end;

        "Claim Date" := Today;
    end;

    var
        VendorRec: Record Vendor;
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
