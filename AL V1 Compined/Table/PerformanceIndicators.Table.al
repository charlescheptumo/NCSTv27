#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56214 "Performance Indicators"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Year; Code[30])
        {
            TableRelation = "Appraisal  Period";
        }
        field(3; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(4; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Line No", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        description: Record "Performance Indicators";
}
