#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70130 "Tender Security Types"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Security Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Bid/Tender Security,Performance/Contract Security,Advance Payment Security';
            OptionMembers = "Bid/Tender Security","Performance/Contract Security","Advance Payment Security";
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Nature of Security"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Monetary,Non-Monetary';
            OptionMembers = Monetary,"Non-Monetary";
        }
        field(5; "No. of Filed Securities"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Filed Securities Value (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Forfeited Securities"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Forfeited Securities Value LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Forfeited Securities Value (LCY)';
        }
        field(9; "No. of Released Securities"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Released Securities Value LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Released Securities Value (LCY)';
        }
        field(11; BLocked; Boolean)
        {
            DataClassification = ToBeClassified;
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
}
