#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 56010 "FA Import"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Fixed Asset"; "Fixed Asset")
            {
                XmlName = 'FA';
                fieldelement(no; "Fixed Asset"."No.")
                {
                }
                fieldelement(Barcode; "Fixed Asset".Barcode)
                {
                }
                fieldelement(Desc; "Fixed Asset".Description)
                {
                }
                fieldelement(SerialNo; "Fixed Asset"."Serial No.")
                {
                }
                fieldelement(MainLoc; "Fixed Asset"."Main Location")
                {
                }
                fieldelement(SubLoc; "Fixed Asset"."Sub Location")
                {
                }
                fieldelement(Dep; "Fixed Asset".Dep)
                {
                }
                fieldelement(Room; "Fixed Asset".Room)
                {
                }
                fieldelement(User; "Fixed Asset".user)
                {
                }
                fieldelement(Category; "Fixed Asset"."FA Class Code")
                {
                }
                fieldelement(SubCat; "Fixed Asset"."FA Subclass Code")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}
