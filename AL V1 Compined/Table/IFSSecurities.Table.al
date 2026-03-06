#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70144 "IFS Securities"
{
    DrillDownPageID = "IFS Securities";
    LookupPageID = "IFS Securities";

    fields
    {
        field(1; "IFS Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Form of Security"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Security Types".Code;
        }
        field(3; "Security Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Bid/Tender Security,Performance/Contract Security,Advance Payment Security';
            OptionMembers = "Bid/Tender Security","Performance/Contract Security","Advance Payment Security";
        }
        field(4; "Required at Bid Submission"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Used to mark all Securities that the Vendor has to provide at the bid submission stage';
        }
        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Security Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Bid Security Validity Expiry"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = ToBeClassified;
            Description = 'Bid Security Validity Expiry Date';
        }
        field(8; "Nature of Security"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Monetary,Non-Monetary';
            OptionMembers = Monetary,"Non-Monetary";
        }
    }

    keys
    {
        key(Key1; "IFS Code", "Form of Security")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
