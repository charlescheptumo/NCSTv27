#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70042 "Asset Disposal"
{

    fields
    {
        field(1; "Disposal No"; Code[10])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Asset Code"; Code[10])
        {
            TableRelation = if ("Item/Fixed Asset" = const("Fixed Asset")) "Fixed Asset"
            else if ("Item/Fixed Asset" = const("Store Item")) Item;

            trigger OnValidate()
            begin
                FARec.Reset;
                if FARec.Get("Asset Code") then begin
                    "Asset Name" := FARec.Description;
                    //"Valuation Amount":= FARec."Valuation Amount";
                end;
            end;
        }
        field(4; "Language Code (Default)"; Code[10])
        {
        }
        field(5; Attachement; Option)
        {
            OptionMembers = No,Yes;
        }
        field(6; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(7; "Committee Code"; Code[10])
        {
            TableRelation = "Tender Commitee Appointment1";
        }
        field(8; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected,Payment Processing';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected,"Payment Processing";
        }
        field(9; "Asset Name"; Text[100])
        {
        }
        field(10; "Valuation Amount"; Decimal)
        {
        }
        field(11; "Committee Recommendations"; Text[250])
        {
        }
        field(12; "Item/Fixed Asset"; Option)
        {
            OptionCaption = ' ,Store Item,Fixed Asset';
            OptionMembers = " ","Store Item","Fixed Asset";
        }
    }

    keys
    {
        key(Key1; "Disposal No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Disposal No" = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField("Asset Disposal Nos");
        //    NoSeriesMgt.InitSeries(PurchSetup."Asset Disposal Nos", xRec."No. Series", 0D, "Disposal No", "No. Series");
            "Disposal No" := NoSeriesMgt.GetNextNo(PurchSetup."Asset Disposal Nos", Today, true);
        end;
    end;

    var
        FARec: Record "Fixed Asset";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
