#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56019 "Copyright Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Applicant Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(3; "Complains Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4; "Case Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5; "Court Attendance Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(6; "Case File Movement Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7; "Document Registration Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(8; "Copyright Registration Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(9; "APSD Minimum Quantity"; Decimal)
        {
        }
        field(10; "APSD Default Unit Price"; Decimal)
        {
        }
        field(11; "Default APSD Item"; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(12; "Authentication Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(13; "CMO Registration Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(14; "CMO Renewal Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(15; "Visitor Pass Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(16; "Internal Memo Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; "Customer FeedBack Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(18; "Copyright Amount"; Decimal)
        {
        }
        field(19; "Gen. Bus Posting Group"; Code[100])
        {
            TableRelation = "Gen. Business Posting Group".Code;
        }
        field(20; "Customer Posting Group"; Code[100])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(21; Resource; Code[100])
        {
            TableRelation = Resource."No.";
        }
        field(22; "user id"; Code[20])
        {
            TableRelation = "User Setup"."User ID";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
