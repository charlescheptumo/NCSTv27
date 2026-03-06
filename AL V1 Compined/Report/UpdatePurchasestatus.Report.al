#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 75000 "Update Purchase status"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Purchase status.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "Document Type", "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnPreDataItem()
            begin
                "Purchase Header".Status := "Purchase Header".Status::Open;
                "Purchase Header".Modify;
            end;
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
