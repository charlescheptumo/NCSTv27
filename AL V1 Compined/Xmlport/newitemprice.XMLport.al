#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50004 newitemprice
{
    Direction = Import;
    Format = FixedText;

    schema
    {
        textelement(Itemprices)
        {
            tableelement(Item; Item)
            {
                AutoUpdate = true;
                XmlName = 'Itemrecord';
                fieldelement(no; Item."No.")
                {
                    Width = 8;
                }
                fieldelement(price; Item."Unit Price")
                {
                    Width = 10;
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
