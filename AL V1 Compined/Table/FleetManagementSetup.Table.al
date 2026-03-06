#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59006 "Fleet Management Setup"
{

    fields
    {
        field(1; "Transport Req No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(2; "Daily Work Ticket"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(3; "Fuel Register"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4; "Maintenance Request"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(11; "Driver Rotation"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12; "Rotation Interval"; DateFormula)
        {
        }
        field(14; "Fuel Payment Batch No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(15; "Contract  No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(16; "Fuel Card No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17; No; Code[20])
        {
            TableRelation = "No. Series";
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
