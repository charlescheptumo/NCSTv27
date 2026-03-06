#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56245 "ICT Inventory Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Inventory Report.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("ICT Issuance Voucher"; "ICT Issuance Voucher")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(COMPANY; CompanyInfo.Name)
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(PostCode; CompanyInfo."Post Code")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Address; CompanyInfo.Address)
            {
            }
            column(Address2; CompanyInfo."Address 2")
            {
            }
        }
        dataitem("ICT Inventory"; "ICT Inventory")
        {
            RequestFilterFields = Status;
            column(ReportForNavId_2; 2)
            {
            }
            column(Code_ICTInventory; "ICT Inventory".Code)
            {
            }
            column(Description_ICTInventory; "ICT Inventory".Description)
            {
            }
            column(SubType_ICTInventory; "ICT Inventory"."Sub-Type")
            {
            }
            column(SubTypeNo_ICTInventory; "ICT Inventory"."Sub Type No.")
            {
            }
            column(LocationCode_ICTInventory; "ICT Inventory"."Location Code")
            {
            }
            column(ICTAssetCategory_ICTInventory; "ICT Inventory"."ICT Asset Category")
            {
            }
            column(SerialNo_ICTInventory; "ICT Inventory"."Serial No.")
            {
            }
            column(WarrantyDate_ICTInventory; "ICT Inventory"."Warranty Date")
            {
            }
            column(MaintenanceVendorNo_ICTInventory; "ICT Inventory"."Maintenance Vendor No.")
            {
            }
            column(UnderMaintenance_ICTInventory; "ICT Inventory"."Under Maintenance")
            {
            }
            column(SubTypeDescription_ICTInventory; "ICT Inventory"."Sub Type Description")
            {
            }
            column(FAClassCode_ICTInventory; "ICT Inventory"."FA Class Code")
            {
            }
            column(FASubclassCode_ICTInventory; "ICT Inventory"."FA Subclass Code")
            {
            }
            column(Insured_ICTInventory; "ICT Inventory".Insured)
            {
            }
            column(CurrentAssignedEmployee_ICTInventory; "ICT Inventory"."Current Assigned Employee")
            {
            }
            column(CurrentAssignedDivisionUnit_ICTInventory; "ICT Inventory"."Current Assigned Division/Unit")
            {
            }
            column(Blocked_ICTInventory; "ICT Inventory".Blocked)
            {
            }
            column(AcquisitionCost_ICTInventory; "ICT Inventory"."Acquisition Cost")
            {
            }
            column(NoSeries_ICTInventory; "ICT Inventory"."No Series")
            {
            }
            column(NoofIssuesRaised_ICTInventory; "ICT Inventory"."No. of Issues Raised")
            {
            }
            column(ExpiryDate_ICTInventory; "ICT Inventory"."Expiry Date")
            {
            }
            column(HasExpiryDate_ICTInventory; "ICT Inventory"."Has Expiry Date")
            {
            }
            column(RAMGB_ICTInventory; "ICT Inventory"."RAM (GB)")
            {
            }
            column(Processor_ICTInventory; "ICT Inventory".Processor)
            {
            }
            column(HardDiskGB_ICTInventory; "ICT Inventory"."Hard Disk (GB)")
            {
            }
            column(Status_ICTInventory; "ICT Inventory".Status)
            {
            }
            column(Category_ICTInventory; "ICT Inventory".Category)
            {
            }
            column(Model_ICTInventory; "ICT Inventory".Model)
            {
            }
            column(Manufacturer_ICTInventory; "ICT Inventory".Manufacturer)
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}
