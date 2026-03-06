#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69018 "Update Inv"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Inv.rdlc';

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
            column(ReportForNavId_1; 1)
            {
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

    labels
    {
    }
}
