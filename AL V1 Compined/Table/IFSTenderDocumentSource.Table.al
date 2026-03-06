#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70143 "IFS Tender Document Source"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Tender Source ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Tender Document Source table';
            TableRelation = "Tender Document Source".Code;
        }
        field(3; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Url Link"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Date Published"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Bid Charge Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Bid Charge Schedule to determine default charges for accessing/obtaining tender documents';
            TableRelation = "Bid Charges Schedule".Code;

            trigger OnValidate()
            begin
                BidCharge.Reset;
                BidCharge.SetRange(Code, "Bid Charge Code");
                if BidCharge.FindSet then
                    "IFS Application Fees (LCY)" := BidCharge.Amount
            end;
        }
        field(7; "IFS Application Fees (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Tender Source ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BidCharge: Record "Bid Charges Schedule";
}
