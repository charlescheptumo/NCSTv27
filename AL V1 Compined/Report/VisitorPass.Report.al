#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56236 "Visitor Pass"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Visitor Pass.rdlc';

    dataset
    {
        dataitem("Visitors Pass"; "Visitors Pass")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(No_VisitorsPass; "Visitors Pass".No)
            {
            }
            column(DocumentDate_VisitorsPass; "Visitors Pass"."Document Date")
            {
            }
            column(CreatedBy_VisitorsPass; "Visitors Pass"."Created By")
            {
            }
            column(DateCreated_VisitorsPass; "Visitors Pass"."Date Created")
            {
            }
            column(TimeCreated_VisitorsPass; "Visitors Pass"."Time Created")
            {
            }
            column(Dateofvisit_VisitorsPass; "Visitors Pass"."Date of visit")
            {
            }
            column(Timeofvisit_VisitorsPass; "Visitors Pass"."Time of visit")
            {
            }
            column(VisitorName_VisitorsPass; "Visitors Pass"."Visitor Name")
            {
            }
            column(IDNo_VisitorsPass; "Visitors Pass"."ID No")
            {
            }
            column(MobileNo_VisitorsPass; "Visitors Pass"."Mobile No.")
            {
            }
            column(From_VisitorsPass; "Visitors Pass".From)
            {
            }
            column(OfficertoseeNo_VisitorsPass; "Visitors Pass"."Officer to see No")
            {
            }
            column(OfficertoseeName_VisitorsPass; "Visitors Pass"."Officer to see Name")
            {
            }
            column(Reason_VisitorsPass; "Visitors Pass".Reason)
            {
            }
            column(NoSeries_VisitorsPass; "Visitors Pass"."No. Series")
            {
            }
            column(Status_VisitorsPass; "Visitors Pass".Status)
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
