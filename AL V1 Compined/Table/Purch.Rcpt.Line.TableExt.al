#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50016 tableextension50016 extends "Purch. Rcpt. Line"
{
    fields
    {
        field(5001; Specifications; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50000; "Quantity Received"; Integer)
        {
        }
    }

    var
        purchline: Record "Purchase Line";
}
