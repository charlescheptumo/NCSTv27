#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56049 "Memo Lines"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3; Description; Text[250])
        {
            NotBlank = true;
        }
        field(4; Quantity; Decimal)
        {

            trigger OnValidate()
            begin
                //"Total amount":=Quantity*Rate;
            end;
        }
        field(5; Rate; Decimal)
        {

            trigger OnValidate()
            begin
                //"Total amount":=Quantity*Rate;
            end;
        }
        field(6; "Total amount"; Decimal)
        {
        }
        field(7; Vote; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(8; Budget; Decimal)
        {
        }
        field(9; Balance; Decimal)
        {
        }
        field(10; Commitment; Decimal)
        {
        }
        field(11; "Vote Name"; Text[250])
        {
        }
        field(12; "Balance After Commitment"; Decimal)
        {
        }
        field(13; Expenses; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
