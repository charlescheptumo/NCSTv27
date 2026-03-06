#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 57090 "Update Paymemts Dimensions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Paymemts Dimensions.rdlc';

    dataset
    {
        dataitem(Payments; Payments)
        {
            DataItemTableView = where("Payment Type" = const(Imprest));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Payments.Validate(Payments."Shortcut Dimension 1 Code");
                Payments.Validate(Payments."Shortcut Dimension 2 Code");
                Payments.Validate(Payments."Shortcut Dimension 3 Code");
                //,Payments."Shortcut Dimension 2 Code",Payments."Shortcut Dimension 3 Code");
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
