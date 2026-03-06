#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70017 "Tender Mandatory Requirements"
{

    fields
    {
        field(1;"Tender No";Code[50])
        {
        }
        field(2;Specification;Text[250])
        {
        }
        field(5;Type;Option)
        {
            OptionCaption = ' ,Non Stock Item,Item,,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,,"Fixed Asset";
        }
        field(6;No;Code[30])
        {
            TableRelation = if (Type=const("Non Stock Item")) "G/L Account"
                            else if (Type=const(Item)) Item
                            else if (Type=const("Fixed Asset")) "Fixed Asset";
        }
        field(7;Description;Text[100])
        {
        }
        field(8;Remarks;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Tender No",Specification)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
