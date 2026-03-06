#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 90004 tableextension90004 extends "Work Type"
{
    fields
    {
        field(57000; Rate; Decimal)
        {
        }
        field(57001; Category; Option)
        {
            Description = '//Work Type Category';
            OptionCaption = ' ,Project Team,Machines,Labour';
            OptionMembers = " ","Project Team",Machines,Labour;
        }
        field(57002; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
    }

}

