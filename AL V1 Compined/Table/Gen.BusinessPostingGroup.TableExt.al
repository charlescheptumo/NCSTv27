#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 90007 tableextension90007 extends "Gen. Business Posting Group"
{
    fields
    {
        field(50000; "Auto Link Internal Requisition"; Boolean)
        {
            Description = 'Gen Bus PG Appearing on IR';
        }
    }
}
