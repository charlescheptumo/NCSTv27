#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70024 "Agpo Tenders"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Agpo Tenders.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Procurement Request"; "Procurement Request")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(No_ProcurementRequest; "Procurement Request".No)
            {
            }
            column(Title_ProcurementRequest; "Procurement Request".Title)
            {
            }
            column(RequisitionNo_ProcurementRequest; "Procurement Request"."Requisition No")
            {
            }
            column(ProcurementPlanNo_ProcurementRequest; "Procurement Request"."Procurement Plan No")
            {
            }
            column(CreationDate_ProcurementRequest; "Procurement Request"."Creation Date")
            {
            }
            column(UserID_ProcurementRequest; "Procurement Request"."User ID")
            {
            }
            column(ProcurementMethod_ProcurementRequest; "Procurement Request"."Procurement Method")
            {
            }
            column(NoSeries_ProcurementRequest; "Procurement Request"."No.Series")
            {
            }
            column(ProcessType_ProcurementRequest; "Procurement Request"."Process Type")
            {
            }
            column(ProcurementPlanItem_ProcurementRequest; "Procurement Request"."Procurement Plan Item")
            {
            }
            column(SupplierCategory_ProcurementRequest; "Procurement Request"."Supplier Category")
            {
            }
            column(GlobalDimension1Code_ProcurementRequest; "Procurement Request"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ProcurementRequest; "Procurement Request"."Global Dimension 2 Code")
            {
            }
            column(TenderOpeningDate_ProcurementRequest; "Procurement Request"."Tender Opening Date")
            {
            }
            column(TenderStatus_ProcurementRequest; "Procurement Request"."Tender Status")
            {
            }
            column(TenderClosingDate_ProcurementRequest; "Procurement Request"."Tender Closing Date")
            {
            }
            column(Addedum_ProcurementRequest; "Procurement Request".Addedum)
            {
            }
            column(SiteView_ProcurementRequest; "Procurement Request".SiteView)
            {
            }
            column(Status_ProcurementRequest; "Procurement Request".Status)
            {
            }
            column(ReturnDate_ProcurementRequest; "Procurement Request"."Return Date")
            {
            }
            column(ReturnTime_ProcurementRequest; "Procurement Request"."Return Time")
            {
            }
            column(TenderType_ProcurementRequest; "Procurement Request"."Tender Type")
            {
            }
            column(DocumentNo_ProcurementRequest; "Procurement Request"."Document No")
            {
            }
            column(NoofTenderDocuments_ProcurementRequest; "Procurement Request"."No of Tender Documents")
            {
            }
            column(ExtendedDate_ProcurementRequest; "Procurement Request"."Extended Date")
            {
            }
            column(CurrencyCode_ProcurementRequest; "Procurement Request"."Currency Code")
            {
            }
            column(TenderAmount_ProcurementRequest; "Procurement Request"."Tender Amount")
            {
            }
            column(ValidityPeriod_ProcurementRequest; "Procurement Request"."Validity Period")
            {
            }
            column(IssuedDate_ProcurementRequest; "Procurement Request"."Issued Date")
            {
            }
            column(Closed_ProcurementRequest; "Procurement Request".Closed)
            {
            }
            column(RFQSent_ProcurementRequest; "Procurement Request"."RFQ Sent")
            {
            }
            column(VendorNo_ProcurementRequest; "Procurement Request"."Vendor No")
            {
            }
            column(ProcurementAmount_ProcurementRequest; "Procurement Request"."Procurement Amount")
            {
            }
            column(GenerateMultipleLPO_ProcurementRequest; "Procurement Request"."Generate Multiple LPO")
            {
            }
            column(ApprovalStatus_ProcurementRequest; "Procurement Request"."Approval Status")
            {
            }
            column(TenderCommittee_ProcurementRequest; "Procurement Request"."Tender Committee")
            {
            }
            column(MinutesPath_ProcurementRequest; "Procurement Request"."Minutes Path")
            {
            }
            column(EvaluationStarted_ProcurementRequest; "Procurement Request"."Evaluation Started?")
            {
            }
            column(Technicalstarted_ProcurementRequest; "Procurement Request"."Technical started?")
            {
            }
            column(FinancialStarted_ProcurementRequest; "Procurement Request"."Financial Started?")
            {
            }
            column(TechnicalScore_ProcurementRequest; "Procurement Request"."Technical Score")
            {
            }
            column(FinancialScore_ProcurementRequest; "Procurement Request"."Financial Score")
            {
            }
            column(AwardStarted_ProcurementRequest; "Procurement Request"."Award Started")
            {
            }
            column(minutesbeforeproceedtoaward_ProcurementRequest; "Procurement Request".minutesbeforeproceedtoaward)
            {
            }
            column(minutesafterproceedtoaward_ProcurementRequest; "Procurement Request".minutesafterproceedtoaward)
            {
            }
            column(Awarded_ProcurementRequest; "Procurement Request"."Awarded?")
            {
            }
            column(SuccessfulBidder_ProcurementRequest; "Procurement Request"."Successful Bidder")
            {
            }
            column(SelectBidderVendorNo_ProcurementRequest; "Procurement Request"."Select Bidder Vendor No")
            {
            }
            column(SelectedBidderName_ProcurementRequest; "Procurement Request"."Selected Bidder Name")
            {
            }
            column(EvaluationAdmin_ProcurementRequest; "Procurement Request"."Evaluation Admin")
            {
            }
            column(Mandatorystarted_ProcurementRequest; "Procurement Request"."Mandatory started?")
            {
            }
            column(Mandatoryinprogress_ProcurementRequest; "Procurement Request"."Mandatory in progress?")
            {
            }
            column(TechnicalinProgress_ProcurementRequest; "Procurement Request"."Technical in Progress?")
            {
            }
            column(FinancialinProgress_ProcurementRequest; "Procurement Request"."Financial in Progress?")
            {
            }
            column(AwardinginProgress_ProcurementRequest; "Procurement Request"."Awarding in Progress?")
            {
            }
            column(LPOGenerated_ProcurementRequest; "Procurement Request"."LPO Generated")
            {
            }
            column(CurrentBudget_ProcurementRequest; "Procurement Request"."Current Budget")
            {
            }
            column(TORAttached_ProcurementRequest; "Procurement Request"."TOR Attached")
            {
            }
            column(ApprovalPath_ProcurementRequest; "Procurement Request"."Approval Path")
            {
            }
            column(TORFileName_ProcurementRequest; "Procurement Request"."TOR File Name")
            {
            }
            column(QuotationPendingOpening_ProcurementRequest; "Procurement Request"."Quotation Pending Opening")
            {
            }
            column(OpeningPerson1_ProcurementRequest; "Procurement Request"."Opening Person 1")
            {
            }
            column(OpeningPerson2_ProcurementRequest; "Procurement Request"."Opening Person 2")
            {
            }
            column(OpeningPerson3_ProcurementRequest; "Procurement Request"."Opening Person 3")
            {
            }
            column(AsignedUser_ProcurementRequest; "Procurement Request"."Asigned User")
            {
            }
            column(QuotationEvaluation_ProcurementRequest; "Procurement Request"."Quotation Evaluation")
            {
            }
            column(InFinancial_ProcurementRequest; "Procurement Request"."In Financial?")
            {
            }
            column(InTechnical_ProcurementRequest; "Procurement Request"."In Technical?")
            {
            }
            column(InAward_ProcurementRequest; "Procurement Request"."In Award?")
            {
            }
            column(PendingLPO_ProcurementRequest; "Procurement Request"."Pending LPO?")
            {
            }
            column(MinutesFile_ProcurementRequest; "Procurement Request"."Minutes File")
            {
            }
            column(QuotationFinished_ProcurementRequest; "Procurement Request"."Quotation Finished?")
            {
            }
            column(TechnicalMinutes_ProcurementRequest; "Procurement Request"."Technical Minutes")
            {
            }
            column(DoesNotRequireTOR_ProcurementRequest; "Procurement Request"."Does Not Require TOR")
            {
            }
            column(JustificationMemo_ProcurementRequest; "Procurement Request"."Justification Memo")
            {
            }
            column(Direct_ProcurementRequest; "Procurement Request"."Direct?")
            {
            }
            column(POType_ProcurementRequest; "Procurement Request"."PO Type")
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
