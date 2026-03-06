#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 90001 tableextension90001 extends "Resource Cost"
{
    fields
    {
        field(50001; "Consumption Rate"; Decimal)
        {
            Description = '//To assist in Fuel Consumption of the Machines';
        }
        field(50002; "Currency code"; Code[20])
        {
            TableRelation = Currency;
        }
    }
}
