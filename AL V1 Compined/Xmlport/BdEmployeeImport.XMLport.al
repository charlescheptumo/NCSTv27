#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 60010 "Bd Employee Import"
{
    FieldSeparator = '<,>';
    Format = VariableText;

    schema
    {
        // textelement(Root)
        // {
        //     tableelement(UnknownTable77777;UnknownTable77777)
        //     {
        //         XmlName = 'Employee';
        //         fieldelement("No.";"Very Temporary".Field10)
        //         {
        //         }
        //         fieldelement(FirstName;"Very Temporary".Field20)
        //         {
        //         }
        //     }
        // }
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
