#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70013 "Procurement IAC Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Procurement IAC Report.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Contract Management Header"; "Contract Management Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(Code_ContractManagementHeader; "Contract Management Header".Code)
            {
            }
            column(Date_ContractManagementHeader; "Contract Management Header".Date)
            {
            }
            column(UserId_ContractManagementHeader; "Contract Management Header"."User Id")
            {
            }
            column(ContractDescription_ContractManagementHeader; "Contract Management Header"."Contract Description")
            {
            }
            column(StartDate_ContractManagementHeader; "Contract Management Header"."Start Date")
            {
            }
            column(EndDate_ContractManagementHeader; "Contract Management Header"."End Date")
            {
            }
            column(NoSeries_ContractManagementHeader; "Contract Management Header"."No. Series")
            {
            }
            column(TenderNo_ContractManagementHeader; "Contract Management Header"."Tender No")
            {
            }
            column(ContractVolNo_ContractManagementHeader; "Contract Management Header"."Contract Vol No")
            {
            }
            column(SerialNo_ContractManagementHeader; "Contract Management Header"."Serial No")
            {
            }
            column(RequiresMilestone_ContractManagementHeader; "Contract Management Header"."Requires Milestone")
            {
            }
            column(Archived_ContractManagementHeader; "Contract Management Header".Archived)
            {
            }
            column(Supplier_ContractManagementHeader; "Contract Management Header".Supplier)
            {
            }
            column(SupplierName_ContractManagementHeader; "Contract Management Header"."Supplier Name")
            {
            }
            column(Duration_ContractManagementHeader; "Contract Management Header".Duration)
            {
            }
            column(ContractPriceAmtWords_ContractManagementHeader; "Contract Management Header"."Contract Price Amt(Words)")
            {
            }
            column(PerformanceSecurityWords_ContractManagementHeader; "Contract Management Header"."Performance Security(Words)")
            {
            }
            column(ContractAwardDate_ContractManagementHeader; "Contract Management Header"."Contract Award Date")
            {
            }
            column(ContractSigningDate_ContractManagementHeader; "Contract Management Header"."Contract Signing Date")
            {
            }
            column(LanguageCodeDefault_ContractManagementHeader; "Contract Management Header"."Language Code (Default)")
            {
            }
            column(InteractionGroupCode_ContractManagementHeader; "Contract Management Header"."Interaction Group Code")
            {
            }
            column(SubjectDefault_ContractManagementHeader; "Contract Management Header"."Subject (Default)")
            {
            }
            column(AttachmentNo_ContractManagementHeader; "Contract Management Header"."Attachment No.")
            {
            }
            column(InteractionTemplateCode_ContractManagementHeader; "Contract Management Header"."Interaction Template Code")
            {
            }
            column(Ordered_ContractManagementHeader; "Contract Management Header".Ordered)
            {
            }
            column(GLAccount_ContractManagementHeader; "Contract Management Header"."GL Account")
            {
            }
            column(ContractType_ContractManagementHeader; "Contract Management Header"."Contract Type")
            {
            }
            column(AssignedUserID_ContractManagementHeader; "Contract Management Header"."Assigned User ID")
            {
            }
            column(Select_ContractManagementHeader; "Contract Management Header".Select)
            {
            }
            column(DateofAssignment_ContractManagementHeader; "Contract Management Header"."Date of Assignment")
            {
            }
            column(Expired_ContractManagementHeader; "Contract Management Header".Expired)
            {
            }
            column(ExpireryNoticeDate_ContractManagementHeader; "Contract Management Header"."Expirery Notice Date")
            {
            }
            column(ContractAmount_ContractManagementHeader; "Contract Management Header"."Contract Amount")
            {
            }
            column(Status_ContractManagementHeader; "Contract Management Header".Status)
            {
            }
            column(GlobalDimension1Code_ContractManagementHeader; "Contract Management Header"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ContractManagementHeader; "Contract Management Header"."Global Dimension 2 Code")
            {
            }
            column(TotalSumLPOPosted_ContractManagementHeader; "Contract Management Header"."Total Sum LPO Posted")
            {
            }
            column(ContractStatus_ContractManagementHeader; "Contract Management Header"."Contract Status")
            {
            }
            column(AmountinLPO_ContractManagementHeader; "Contract Management Header"."Amount in LPO")
            {
            }
            column(AssignedUser_ContractManagementHeader; "Contract Management Header"."Assigned User")
            {
            }
            column(AttachedContract_ContractManagementHeader; "Contract Management Header"."Attached Contract")
            {
            }
            column(SignedContractFile_ContractManagementHeader; "Contract Management Header"."Signed Contract File")
            {
            }
            column(ContractCurrency_ContractManagementHeader; "Contract Management Header"."Contract Currency")
            {
            }
            column(ActivityType_ContractManagementHeader; "Contract Management Header"."Activity Type")
            {
            }
            column(CurrentBudget_ContractManagementHeader; "Contract Management Header"."Current Budget")
            {
            }
            column(AvailableAmount_ContractManagementHeader; "Contract Management Header"."Available Amount")
            {
            }
            column(PEAllowed_ContractManagementHeader; "Contract Management Header"."PE Allowed")
            {
            }
            column(Activity_ContractManagementHeader; "Contract Management Header".Activity_)
            {
            }
            column(AccountType_ContractManagementHeader; "Contract Management Header"."Account Type")
            {
            }
            column(Description_ContractManagementHeader; "Contract Management Header".Description)
            {
            }
            dataitem("Procurement Request Lines"; "Procurement Request Lines")
            {
                DataItemLink = "Requisition No" = field("Tender No");
                column(ReportForNavId_50; 50)
                {
                }
                column(RequisitionNo_ProcurementRequestLines; "Procurement Request Lines"."Requisition No")
                {
                }
                column(LineNo_ProcurementRequestLines; "Procurement Request Lines"."Line No")
                {
                }
                column(Type_ProcurementRequestLines; "Procurement Request Lines".Type)
                {
                }
                column(No_ProcurementRequestLines; "Procurement Request Lines".No)
                {
                }
                column(Description_ProcurementRequestLines; "Procurement Request Lines".Description)
                {
                }
                column(Quantity_ProcurementRequestLines; "Procurement Request Lines".Quantity)
                {
                }
                column(UnitofMeasure_ProcurementRequestLines; "Procurement Request Lines"."Unit of Measure")
                {
                }
                column(UnitPrice_ProcurementRequestLines; "Procurement Request Lines"."Unit Price")
                {
                }
                column(Amount_ProcurementRequestLines; "Procurement Request Lines".Amount)
                {
                }
                column(ProcurementPlan_ProcurementRequestLines; "Procurement Request Lines"."Procurement Plan")
                {
                }
                column(ProcurementPlanItem_ProcurementRequestLines; "Procurement Request Lines"."Procurement Plan Item")
                {
                }
                column(BudgetLine_ProcurementRequestLines; "Procurement Request Lines"."Budget Line")
                {
                }
                column(GlobalDimension1Code_ProcurementRequestLines; "Procurement Request Lines"."Global Dimension 1 Code")
                {
                }
                column(AmountLCY_ProcurementRequestLines; "Procurement Request Lines"."Amount LCY")
                {
                }
                column(Select_ProcurementRequestLines; "Procurement Request Lines".Select)
                {
                }
                column(RequestGenerated_ProcurementRequestLines; "Procurement Request Lines"."Request Generated")
                {
                }
                column(SupplierCategory_ProcurementRequestLines; "Procurement Request Lines"."Supplier Category")
                {
                }
                column(VendorNo_ProcurementRequestLines; "Procurement Request Lines"."Vendor No")
                {
                }
                column(Ordered_ProcurementRequestLines; "Procurement Request Lines".Ordered)
                {
                }
                column(OrderDate_ProcurementRequestLines; "Procurement Request Lines"."Order Date")
                {
                }
                column(ActivityType_ProcurementRequestLines; "Procurement Request Lines"."Activity Type")
                {
                }
                column(CurrentBudget_ProcurementRequestLines; "Procurement Request Lines"."Current Budget")
                {
                }
                column(Activity_ProcurementRequestLines; "Procurement Request Lines".Activity)
                {
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

    labels
    {
    }
}
