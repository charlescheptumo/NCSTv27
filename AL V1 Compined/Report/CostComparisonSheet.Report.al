#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70003 "Cost Comparison Sheet"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Cost Comparison Sheet.rdlc';

    dataset
    {
        dataitem("Tender Bids"; "Tender Bids")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Request_No; "Tender Bids"."Requisition No")
            {
            }
            column(Bidder_Name; "Tender Bids"."Bidder Name")
            {
            }
            column(Item_No; "Tender Bids".No)
            {
            }
            column(Description; "Tender Bids".Description)
            {
            }
            column(Quantity; "Tender Bids".Quantity)
            {
            }
            column(Unit_of_Measure; "Tender Bids"."Unit of Measure")
            {
            }
            column(Unit_Price; "Tender Bids"."Unit Price")
            {
            }
            column(Amount; "Tender Bids".Amount)
            {
            }
            column(Amount_LCY; "Tender Bids"."Amount LCY")
            {
            }
            column(Discount; "Tender Bids".Discount)
            {
            }
            column(Remarks; "Tender Bids".Remarks)
            {
            }
            column(Title; Title)
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

    var
        Title: label 'Cost Comparison Sheet';
}
