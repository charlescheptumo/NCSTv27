#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 99098 "Vendor Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Vendor Report.rdlc';
    Caption = 'Vendor Report';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            RequestFilterFields = "No.", "onboarded Year", "Supplier Category";
            column(ReportForNavId_1; 1)
            {
            }
            column(No_Vendor; Vendor."No.")
            {
            }
            column(Name_Vendor; Vendor.Name)
            {
            }
            column(Balance_Vendor; Vendor.Balance)
            {
            }
            column(BalanceLCY_Vendor; Vendor."Balance (LCY)")
            {
            }
            column(SupplierCategory_Vendor; Vendor."Supplier Category")
            {
            }
            column(onboardedYear_Vendor; Vendor."onboarded Year")
            {
            }
            column(Status_Vendor; Vendor.Status)
            {
            }
            column(SpecialCategory_Vendor; Vendor."Special Category")
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
