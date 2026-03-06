#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 99000 "Update S11 Type"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update S11 Type.rdlc';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if "Purchase Header"."Document Type" = "Purchase Header"."document type"::"Store Requisition" then
                    "Purchase Header"."Requisition Type" := "Purchase Header"."requisition type"::Project;
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
