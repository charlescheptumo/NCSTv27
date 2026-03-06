#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50027 tableextension50027 extends "Vendor Bank Account"
{
    fields
    {
        field(70000; "Available Credit Line Valu"; Decimal)
        {
            Caption = 'Available Credit Line Value (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Customized field used to track the available credit line value for each bank (e.g. OD value). It is vital during bid assessment for Work IFSs where financiing is a factor to consider when evaluating the vendor''s financial capacity';
        }
    }
}
