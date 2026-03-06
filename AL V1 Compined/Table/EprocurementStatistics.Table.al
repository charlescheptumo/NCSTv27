#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72028 "Eprocurement Statistics"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange("No.", Rec."Vendor No");
                if Vendor.FindFirst then begin
                    "Vendor Name" := Vendor.Name;
                    "Vendor Email" := Vendor."E-Mail";

                end;
            end;
        }
        field(6; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Vendor Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Procurement Process"; Option)
        {
            DataClassification = ToBeClassified;
            Enabled = true;
            OptionCaption = ',Registration,Vendor Registration,EOI Response,RFQ Response,ITT Response,Negotiations/Contract,Transactional,Portal Registration,Password Reset';
            OptionMembers = ,Registration,Prequalification,"EOI Response","RFQ Response","ITT Response","Negotiations/Contract",Transactional,"Portal Registration","Password Reset";
        }
        field(15; "Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Step; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Last Modified Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Sumitted Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Submitted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vendor: Record Vendor;
}
