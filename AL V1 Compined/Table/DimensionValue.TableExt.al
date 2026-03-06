#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50031 tableextension50031 extends "Dimension Value"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Name(Field 3)".

        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
    }
}
