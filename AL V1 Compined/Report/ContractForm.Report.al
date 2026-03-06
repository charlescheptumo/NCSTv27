#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70046 "Contract Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Contract Form.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(logo; corec.Picture)
            {
            }
            column(DocumentType_PurchaseHeader; "Purchase Header"."Document Type")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(PaytoVendorNo_PurchaseHeader; "Purchase Header"."Pay-to Vendor No.")
            {
            }
            column(PaytoName_PurchaseHeader; "Purchase Header"."Pay-to Name")
            {
            }
            column(PaytoName2_PurchaseHeader; "Purchase Header"."Pay-to Name 2")
            {
            }
            column(PaytoAddress_PurchaseHeader; "Purchase Header"."Pay-to Address")
            {
            }
            column(PaytoAddress2_PurchaseHeader; "Purchase Header"."Pay-to Address 2")
            {
            }
            column(PaytoCity_PurchaseHeader; "Purchase Header"."Pay-to City")
            {
            }
            column(PaytoContact_PurchaseHeader; "Purchase Header"."Pay-to Contact")
            {
            }
            column(YourReference_PurchaseHeader; "Purchase Header"."Your Reference")
            {
            }
            column(ShiptoCode_PurchaseHeader; "Purchase Header"."Ship-to Code")
            {
            }
            column(ShiptoName_PurchaseHeader; "Purchase Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_PurchaseHeader; "Purchase Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_PurchaseHeader; "Purchase Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_PurchaseHeader; "Purchase Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_PurchaseHeader; "Purchase Header"."Ship-to City")
            {
            }
            column(ShiptoContact_PurchaseHeader; "Purchase Header"."Ship-to Contact")
            {
            }
            column(OrderDate_PurchaseHeader; "Purchase Header"."Order Date")
            {
            }
            column(PostingDate_PurchaseHeader; "Purchase Header"."Posting Date")
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; "Purchase Header"."Expected Receipt Date")
            {
            }
            column(PostingDescription_PurchaseHeader; "Purchase Header"."Posting Description")
            {
            }
            column(PaymentTermsCode_PurchaseHeader; "Purchase Header"."Payment Terms Code")
            {
            }
            column(DueDate_PurchaseHeader; "Purchase Header"."Due Date")
            {
            }
            column(PaymentDiscount_PurchaseHeader; "Purchase Header"."Payment Discount %")
            {
            }
            column(PmtDiscountDate_PurchaseHeader; "Purchase Header"."Pmt. Discount Date")
            {
            }
            column(ShipmentMethodCode_PurchaseHeader; "Purchase Header"."Shipment Method Code")
            {
            }
            column(LocationCode_PurchaseHeader; "Purchase Header"."Location Code")
            {
            }
            column(ShortcutDimension1Code_PurchaseHeader; "Purchase Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PurchaseHeader; "Purchase Header"."Shortcut Dimension 2 Code")
            {
            }
            column(VendorPostingGroup_PurchaseHeader; "Purchase Header"."Vendor Posting Group")
            {
            }
            column(CurrencyCode_PurchaseHeader; "Purchase Header"."Currency Code")
            {
            }
            column(CurrencyFactor_PurchaseHeader; "Purchase Header"."Currency Factor")
            {
            }
            column(PricesIncludingVAT_PurchaseHeader; "Purchase Header"."Prices Including VAT")
            {
            }
            column(InvoiceDiscCode_PurchaseHeader; "Purchase Header"."Invoice Disc. Code")
            {
            }
            column(LanguageCode_PurchaseHeader; "Purchase Header"."Language Code")
            {
            }
            column(PurchaserCode_PurchaseHeader; "Purchase Header"."Purchaser Code")
            {
            }
            column(OrderClass_PurchaseHeader; "Purchase Header"."Order Class")
            {
            }
            column(Comment_PurchaseHeader; "Purchase Header".Comment)
            {
            }
            column(NoPrinted_PurchaseHeader; "Purchase Header"."No. Printed")
            {
            }
            column(OnHold_PurchaseHeader; "Purchase Header"."On Hold")
            {
            }
            column(AppliestoDocType_PurchaseHeader; "Purchase Header"."Applies-to Doc. Type")
            {
            }
            column(AppliestoDocNo_PurchaseHeader; "Purchase Header"."Applies-to Doc. No.")
            {
            }
            column(BalAccountNo_PurchaseHeader; "Purchase Header"."Bal. Account No.")
            {
            }
            column(RecalculateInvoiceDisc_PurchaseHeader; "Purchase Header"."Recalculate Invoice Disc.")
            {
            }
            column(Receive_PurchaseHeader; "Purchase Header".Receive)
            {
            }
            column(Invoice_PurchaseHeader; "Purchase Header".Invoice)
            {
            }
            column(PrintPostedDocuments_PurchaseHeader; "Purchase Header"."Print Posted Documents")
            {
            }
            column(Amount_PurchaseHeader; "Purchase Header".Amount)
            {
            }
            column(AmountIncludingVAT_PurchaseHeader; "Purchase Header"."Amount Including VAT")
            {
            }
            column(ReceivingNo_PurchaseHeader; "Purchase Header"."Receiving No.")
            {
            }
            column(PostingNo_PurchaseHeader; "Purchase Header"."Posting No.")
            {
            }
            column(LastReceivingNo_PurchaseHeader; "Purchase Header"."Last Receiving No.")
            {
            }
            column(LastPostingNo_PurchaseHeader; "Purchase Header"."Last Posting No.")
            {
            }
            column(VendorOrderNo_PurchaseHeader; "Purchase Header"."Vendor Order No.")
            {
            }
            column(VendorShipmentNo_PurchaseHeader; "Purchase Header"."Vendor Shipment No.")
            {
            }
            column(VendorInvoiceNo_PurchaseHeader; "Purchase Header"."Vendor Invoice No.")
            {
            }
            column(VendorCrMemoNo_PurchaseHeader; "Purchase Header"."Vendor Cr. Memo No.")
            {
            }
            column(VATRegistrationNo_PurchaseHeader; "Purchase Header"."VAT Registration No.")
            {
            }
            column(SelltoCustomerNo_PurchaseHeader; "Purchase Header"."Sell-to Customer No.")
            {
            }
            column(ReasonCode_PurchaseHeader; "Purchase Header"."Reason Code")
            {
            }
            column(GenBusPostingGroup_PurchaseHeader; "Purchase Header"."Gen. Bus. Posting Group")
            {
            }
            column(TransactionType_PurchaseHeader; "Purchase Header"."Transaction Type")
            {
            }
            column(TransportMethod_PurchaseHeader; "Purchase Header"."Transport Method")
            {
            }
            column(VATCountryRegionCode_PurchaseHeader; "Purchase Header"."VAT Country/Region Code")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Purchase Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader; "Purchase Header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchaseHeader; "Purchase Header"."Buy-from City")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Purchase Header"."Buy-from Contact")
            {
            }
            column(PaytoPostCode_PurchaseHeader; "Purchase Header"."Pay-to Post Code")
            {
            }
            column(PaytoCounty_PurchaseHeader; "Purchase Header"."Pay-to County")
            {
            }
            column(PaytoCountryRegionCode_PurchaseHeader; "Purchase Header"."Pay-to Country/Region Code")
            {
            }
            column(BuyfromPostCode_PurchaseHeader; "Purchase Header"."Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchaseHeader; "Purchase Header"."Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchaseHeader; "Purchase Header"."Buy-from Country/Region Code")
            {
            }
            column(ShiptoPostCode_PurchaseHeader; "Purchase Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_PurchaseHeader; "Purchase Header"."Ship-to County")
            {
            }
            column(ShiptoCountryRegionCode_PurchaseHeader; "Purchase Header"."Ship-to Country/Region Code")
            {
            }
            column(BalAccountType_PurchaseHeader; "Purchase Header"."Bal. Account Type")
            {
            }
            column(OrderAddressCode_PurchaseHeader; "Purchase Header"."Order Address Code")
            {
            }
            column(EntryPoint_PurchaseHeader; "Purchase Header"."Entry Point")
            {
            }
            column(Correction_PurchaseHeader; "Purchase Header".Correction)
            {
            }
            column(DocumentDate_PurchaseHeader; "Purchase Header"."Document Date")
            {
            }
            column(Area_PurchaseHeader; "Purchase Header".Area)
            {
            }
            column(TransactionSpecification_PurchaseHeader; "Purchase Header"."Transaction Specification")
            {
            }
            column(PaymentMethodCode_PurchaseHeader; "Purchase Header"."Payment Method Code")
            {
            }
            column(NoSeries_PurchaseHeader; "Purchase Header"."No. Series")
            {
            }
            column(PostingNoSeries_PurchaseHeader; "Purchase Header"."Posting No. Series")
            {
            }
            column(ReceivingNoSeries_PurchaseHeader; "Purchase Header"."Receiving No. Series")
            {
            }
            column(TaxAreaCode_PurchaseHeader; "Purchase Header"."Tax Area Code")
            {
            }
            column(TaxLiable_PurchaseHeader; "Purchase Header"."Tax Liable")
            {
            }
            column(VATBusPostingGroup_PurchaseHeader; "Purchase Header"."VAT Bus. Posting Group")
            {
            }
            column(AppliestoID_PurchaseHeader; "Purchase Header"."Applies-to ID")
            {
            }
            column(VATBaseDiscount_PurchaseHeader; "Purchase Header"."VAT Base Discount %")
            {
            }
            column(Status_PurchaseHeader; "Purchase Header".Status)
            {
            }
            column(InvoiceDiscountCalculation_PurchaseHeader; "Purchase Header"."Invoice Discount Calculation")
            {
            }
            column(InvoiceDiscountValue_PurchaseHeader; "Purchase Header"."Invoice Discount Value")
            {
            }
            column(SendICDocument_PurchaseHeader; "Purchase Header"."Send IC Document")
            {
            }
            column(ICStatus_PurchaseHeader; "Purchase Header"."IC Status")
            {
            }
            column(BuyfromICPartnerCode_PurchaseHeader; "Purchase Header"."Buy-from IC Partner Code")
            {
            }
            column(PaytoICPartnerCode_PurchaseHeader; "Purchase Header"."Pay-to IC Partner Code")
            {
            }
            column(ICDirection_PurchaseHeader; "Purchase Header"."IC Direction")
            {
            }
            column(PrepaymentNo_PurchaseHeader; "Purchase Header"."Prepayment No.")
            {
            }
            column(LastPrepaymentNo_PurchaseHeader; "Purchase Header"."Last Prepayment No.")
            {
            }
            column(PrepmtCrMemoNo_PurchaseHeader; "Purchase Header"."Prepmt. Cr. Memo No.")
            {
            }
            column(LastPrepmtCrMemoNo_PurchaseHeader; "Purchase Header"."Last Prepmt. Cr. Memo No.")
            {
            }
            column(Prepayment_PurchaseHeader; "Purchase Header"."Prepayment %")
            {
            }
            column(PrepaymentNoSeries_PurchaseHeader; "Purchase Header"."Prepayment No. Series")
            {
            }
            column(CompressPrepayment_PurchaseHeader; "Purchase Header"."Compress Prepayment")
            {
            }
            column(PrepaymentDueDate_PurchaseHeader; "Purchase Header"."Prepayment Due Date")
            {
            }
            column(PrepmtCrMemoNoSeries_PurchaseHeader; "Purchase Header"."Prepmt. Cr. Memo No. Series")
            {
            }
            column(PrepmtPostingDescription_PurchaseHeader; "Purchase Header"."Prepmt. Posting Description")
            {
            }
            column(PrepmtPmtDiscountDate_PurchaseHeader; "Purchase Header"."Prepmt. Pmt. Discount Date")
            {
            }
            column(PrepmtPaymentTermsCode_PurchaseHeader; "Purchase Header"."Prepmt. Payment Terms Code")
            {
            }
            column(PrepmtPaymentDiscount_PurchaseHeader; "Purchase Header"."Prepmt. Payment Discount %")
            {
            }
            column(QuoteNo_PurchaseHeader; "Purchase Header"."Quote No.")
            {
            }
            column(JobQueueStatus_PurchaseHeader; "Purchase Header"."Job Queue Status")
            {
            }
            column(JobQueueEntryID_PurchaseHeader; "Purchase Header"."Job Queue Entry ID")
            {
            }
            column(IncomingDocumentEntryNo_PurchaseHeader; "Purchase Header"."Incoming Document Entry No.")
            {
            }
            column(CreditorNo_PurchaseHeader; "Purchase Header"."Creditor No.")
            {
            }
            column(PaymentReference_PurchaseHeader; "Purchase Header"."Payment Reference")
            {
            }
            column(ARcdNotInvExVATLCY_PurchaseHeader; "Purchase Header"."A. Rcd. Not Inv. Ex. VAT (LCY)")
            {
            }
            column(AmtRcdNotInvoicedLCY_PurchaseHeader; "Purchase Header"."Amt. Rcd. Not Invoiced (LCY)")
            {
            }
            column(DimensionSetID_PurchaseHeader; "Purchase Header"."Dimension Set ID")
            {
            }
            column(InvoiceDiscountAmount_PurchaseHeader; "Purchase Header"."Invoice Discount Amount")
            {
            }
            column(NoofArchivedVersions_PurchaseHeader; "Purchase Header"."No. of Archived Versions")
            {
            }
            column(DocNoOccurrence_PurchaseHeader; "Purchase Header"."Doc. No. Occurrence")
            {
            }
            column(CampaignNo_PurchaseHeader; "Purchase Header"."Campaign No.")
            {
            }
            column(BuyfromContactNo_PurchaseHeader; "Purchase Header"."Buy-from Contact No.")
            {
            }
            column(PaytoContactNo_PurchaseHeader; "Purchase Header"."Pay-to Contact No.")
            {
            }
            column(ResponsibilityCenter_PurchaseHeader; "Purchase Header"."Responsibility Center")
            {
            }
            column(PartiallyInvoiced_PurchaseHeader; "Purchase Header"."Partially Invoiced")
            {
            }
            column(CompletelyReceived_PurchaseHeader; "Purchase Header"."Completely Received")
            {
            }
            column(PostingfromWhseRef_PurchaseHeader; "Purchase Header"."Posting from Whse. Ref.")
            {
            }
            column(LocationFilter_PurchaseHeader; "Purchase Header"."Location Filter")
            {
            }
            column(RequestedReceiptDate_PurchaseHeader; "Purchase Header"."Requested Receipt Date")
            {
            }
            column(PromisedReceiptDate_PurchaseHeader; "Purchase Header"."Promised Receipt Date")
            {
            }
            column(LeadTimeCalculation_PurchaseHeader; "Purchase Header"."Lead Time Calculation")
            {
            }
            column(InboundWhseHandlingTime_PurchaseHeader; "Purchase Header"."Inbound Whse. Handling Time")
            {
            }
            column(DateFilter_PurchaseHeader; "Purchase Header"."Date Filter")
            {
            }
            column(VendorAuthorizationNo_PurchaseHeader; "Purchase Header"."Vendor Authorization No.")
            {
            }
            column(ReturnShipmentNo_PurchaseHeader; "Purchase Header"."Return Shipment No.")
            {
            }
            column(ReturnShipmentNoSeries_PurchaseHeader; "Purchase Header"."Return Shipment No. Series")
            {
            }
            column(Ship_PurchaseHeader; "Purchase Header".Ship)
            {
            }
            column(LastReturnShipmentNo_PurchaseHeader; "Purchase Header"."Last Return Shipment No.")
            {
            }
            column(Id_PurchaseHeader; "Purchase Header".SystemId)
            {
            }
            column(AssignedUserID_PurchaseHeader; "Purchase Header"."Assigned User ID")
            {
            }
            column(PendingApprovals_PurchaseHeader; "Purchase Header"."Pending Approvals")
            {
            }
            column(Copied_PurchaseHeader; "Purchase Header".Copied)
            {
            }
            column(DebitNote_PurchaseHeader; "Purchase Header"."Debit Note")
            {
            }
            column(FullyIssued_PurchaseHeader; "Purchase Header"."Fully Issued")
            {
            }
            column(PartiallyIssued_PurchaseHeader; "Purchase Header"."Partially Issued")
            {
            }
            column(Cancelled_PurchaseHeader; "Purchase Header"."Cancelled?")
            {
            }
            column(Project_PurchaseHeader; "Purchase Header"."Project?")
            {
            }
            column(SendToPM_PurchaseHeader; "Purchase Header"."Send To PM")
            {
            }
            column(SentBy_PurchaseHeader; "Purchase Header"."Sent By")
            {
            }
            column(SendingDate_PurchaseHeader; "Purchase Header"."Sending Date")
            {
            }
            column(StoreNo_PurchaseHeader; "Purchase Header"."Store No")
            {
            }
            column(Replenishment_PurchaseHeader; "Purchase Header".Replenishment)
            {
            }
            column(Description_PurchaseHeader; "Purchase Header".Description)
            {
            }
            column(RequisitionType_PurchaseHeader; "Purchase Header"."Requisition Type")
            {
            }
            column(TakenBy_PurchaseHeader; "Purchase Header"."Taken By")
            {
            }
            column(DepartmentName_PurchaseHeader; "Purchase Header"."Department Name")
            {
            }
            column(ProjectName_PurchaseHeader; "Purchase Header"."Project Name")
            {
            }
            column(ValidtoDate_PurchaseHeader; "Purchase Header"."Valid to Date")
            {
            }
            column(RequestByNo_PurchaseHeader; "Purchase Header"."Request-By No.")
            {
            }
            column(RequestByName_PurchaseHeader; "Purchase Header"."Request-By Name")
            {
            }
            column(RequesterID_PurchaseHeader; "Purchase Header"."Requester ID")
            {
            }
            column(PurchaseRequisitionNo_PurchaseHeader; "Purchase Header"."Purchase Requisition No.")
            {
            }
            column(CreatedQuotes_PurchaseHeader; "Purchase Header"."Created Quotes")
            {
            }
            column(StoreRequisitionNo_PurchaseHeader; "Purchase Header"."Store Requisition No.")
            {
            }
            column(BudgetedName_PurchaseHeader; "Purchase Header"."Budgeted  Name")
            {
            }
            column(RequisitionExpenseGroup_PurchaseHeader; "Purchase Header"."Requisition Expense Group")
            {
            }
            column(ChargeToWork_PurchaseHeader; "Purchase Header"."ChargeToWork?")
            {
            }
            column(BeneficiaryName_PurchaseHeader; "Purchase Header"."Beneficiary Name")
            {
            }
            column(BeneficiaryAddress_PurchaseHeader; "Purchase Header"."Beneficiary Address")
            {
            }
            column(BeneficiaryAddress2_PurchaseHeader; "Purchase Header"."Beneficiary Address 2")
            {
            }
            column(BeneficiaryCity_PurchaseHeader; "Purchase Header"."Beneficiary City")
            {
            }
            column(IRExternalDocumentNo_PurchaseHeader; "Purchase Header"."IR External Document No")
            {
            }
            column(POType_PurchaseHeader; "Purchase Header"."PO Type")
            {
            }
            column(VoteItem_PurchaseHeader; "Purchase Header"."Vote Item")
            {
            }
            column(VoteAmount_PurchaseHeader; "Purchase Header"."Vote Amount")
            {
            }
            column(BudgetCommitments_PurchaseHeader; "Purchase Header"."Budget Commitments")
            {
            }
            column(InspectionTeamSetup_PurchaseHeader; "Purchase Header"."Inspection Team Setup?")
            {
            }
            column(InspectionCompleted_PurchaseHeader; "Purchase Header"."Inspection Completed?")
            {
            }
            column(ContractNo_PurchaseHeader; "Purchase Header"."Contract No.")
            {
            }
            column(ContractName_PurchaseHeader; "Purchase Header"."Contract Name")
            {
            }
            column(SendingTime_PurchaseHeader; "Purchase Header"."Sending Time")
            {
            }
            column(JobTaskNo_PurchaseHeader; "Purchase Header"."Job Task No.")
            {
            }
            column(BudgetItem_PurchaseHeader; "Purchase Header"."Budget Item")
            {
            }
            column(BugetDesc_PurchaseHeader; "Purchase Header"."Buget Desc")
            {
            }
            column(BudgetedAmount_PurchaseHeader; "Purchase Header"."Budgeted Amount")
            {
            }
            column(ActualBudgetCosts_PurchaseHeader; "Purchase Header"."Actual Budget Costs")
            {
            }
            column(AvailableFunds_PurchaseHeader; "Purchase Header"."Available Funds")
            {
            }
            column(RequisitionAmount_PurchaseHeader; "Purchase Header"."Requisition Amount")
            {
            }
            column(RemainingBudget_PurchaseHeader; "Purchase Header"."Remaining Budget")
            {
            }
            column(RequiredDate_PurchaseHeader; "Purchase Header"."Required Date")
            {
            }
            column(FunctionName_PurchaseHeader; "Purchase Header"."Function Name")
            {
            }
            column(BudgetCenterName_PurchaseHeader; "Purchase Header"."Budget Center Name")
            {
            }
            column(StoreRequisitionType_PurchaseHeader; "Purchase Header"."Store Requisition Type")
            {
            }
            column(ShortcutDimension3Code_PurchaseHeader; "Purchase Header"."Shortcut Dimension 3 Code")
            {
            }
            column(UnitName_PurchaseHeader; "Purchase Header"."Unit  Name")
            {
            }
            column(TotalProjectCost_PurchaseHeader; "Purchase Header"."Total Project Cost")
            {
            }
            column(Harvest_PurchaseHeader; "Purchase Header".Harvest)
            {
            }
            column(ProcurementType_PurchaseHeader; "Purchase Header"."Procurement Type")
            {
            }
            column(ContractNumber_PurchaseHeader; "Purchase Header"."Contract Number")
            {
            }
            column(Datereceived_PurchaseHeader; "Purchase Header"."Date received")
            {
            }
            column(ApprovedRequisitionAmount_PurchaseHeader; "Purchase Header"."Approved Requisition Amount")
            {
            }
            column(Ordertypes_PurchaseHeader; "Purchase Header"."Order types")
            {
            }
            column(Reasontoreopen_PurchaseHeader; "Purchase Header"."Reason to reopen")
            {
            }
            column(ReasontoCancel_PurchaseHeader; "Purchase Header"."Reason to Cancel")
            {
            }
            column(OrderNumber_PurchaseHeader; "Purchase Header"."Order Number")
            {
            }
            column(Committed_PurchaseHeader; "Purchase Header".Committed)
            {
            }
            column(CommittedBy_PurchaseHeader; "Purchase Header".CommittedBy)
            {
            }
            column(ProcurementPlan_PurchaseHeader; "Purchase Header"."Procurement Plan")
            {
            }
            column(ProcurementPlanItem_PurchaseHeader; "Purchase Header"."Procurement Plan Item")
            {
            }
            column(RequestRefNo_PurchaseHeader; "Purchase Header"."Request Ref No")
            {
            }
            column(SupplierType_PurchaseHeader; "Purchase Header"."Supplier Type")
            {
            }
            column(ProcessType_PurchaseHeader; "Purchase Header"."Process Type")
            {
            }
            column(PurchaseType_PurchaseHeader; "Purchase Header"."Purchase Type")
            {
            }
            column(RequisitionNo_PurchaseHeader; "Purchase Header"."Requisition No")
            {
            }
            column(Ordered_PurchaseHeader; "Purchase Header".Ordered)
            {
            }
            column(HOD_PurchaseHeader; "Purchase Header".HOD)
            {
            }
            column(DepartmentCode_PurchaseHeader; "Purchase Header"."Department Code")
            {
            }
            column(DirectorateCode_PurchaseHeader; "Purchase Header"."Directorate Code")
            {
            }
            column(Division_PurchaseHeader; "Purchase Header".Division)
            {
            }
            column(Job_PurchaseHeader; "Purchase Header".Job)
            {
            }
            column(JobName_PurchaseHeader; "Purchase Header"."Job Name")
            {
            }
            column(Approver_PurchaseHeader; "Purchase Header".Approver)
            {
            }
            column(SupplierCode_PurchaseHeader; "Purchase Header"."Supplier Code")
            {
            }
            column(Supplier_PurchaseHeader; "Purchase Header".Supplier)
            {
            }
            column(Specifications_PurchaseHeader; "Purchase Header".Specifications)
            {
            }
            column(ItemCategory_PurchaseHeader; "Purchase Header"."Item Category")
            {
            }
            column(GeneralItemCategory_PurchaseHeader; "Purchase Header"."General Item Category")
            {
            }
            column(ArchiveRequisitions_PurchaseHeader; "Purchase Header"."Archive Requisitions")
            {
            }
            column(Consitituency_PurchaseHeader; "Purchase Header"."Commitments.")
            {
            }
            column(PriorityLevel_PurchaseHeader; "Purchase Header"."Job Task Budget")
            {
            }
            column(PlannedCommencementDate_PurchaseHeader; "Purchase Header"."Job Task Remaining Amount")
            {
            }
            column(RoadCode_PurchaseHeader; "Purchase Header"."Planned Commencement Date")
            {
            }
            column(LinkName_PurchaseHeader; "Purchase Header"."Priority Level")
            {
            }
            column(WorksLengthKm_PurchaseHeader; "Purchase Header"."Works Length (Km)")
            {
            }
            column(Region_PurchaseHeader; "Purchase Header".Region)
            {
            }
            column(FundingAgency_PurchaseHeader; "Purchase Header"."Funding Agency")
            {
            }
            column(FundingSource_PurchaseHeader; "Purchase Header"."Funding Source")
            {
            }
            column(SolicitationType_PurchaseHeader; "Purchase Header"."Solicitation Type")
            {
            }
            column(RequisitionProductGroup_PurchaseHeader; "Purchase Header"."Requisition Product Group")
            {
            }
            column(IFSLinked_PurchaseHeader; "Purchase Header"."IFS Linked")
            {
            }
            column(RequisitionTemplateID_PurchaseHeader; "Purchase Header"."Requisition Template ID")
            {
            }
            column(PRNType_PurchaseHeader; "Purchase Header"."PRN Type")
            {
            }
            column(ProjectStaffingTemplateID_PurchaseHeader; "Purchase Header"."Project Staffing Template ID")
            {
            }
            column(WorksEquipmentTemplateID_PurchaseHeader; "Purchase Header"."Works Equipment Template ID")
            {
            }
            column(ProcurementPlanID_PurchaseHeader; "Purchase Header"."Procurement Plan ID")
            {
            }
            column(ProcurementPlanEntryNo_PurchaseHeader; "Purchase Header"."Procurement Plan Entry No")
            {
            }
            column(PPPlanningCategory_PurchaseHeader; "Purchase Header"."PP Planning Category")
            {
            }
            column(PPFundingSourceID_PurchaseHeader; "Purchase Header"."PP Funding Source ID")
            {
            }
            column(PPTotalBudget_PurchaseHeader; "Purchase Header"."PP Total Budget")
            {
            }
            column(PPTotalActualCosts_PurchaseHeader; "Purchase Header"."PP Total Actual Costs")
            {
            }
            column(PPTotalCommitments_PurchaseHeader; "Purchase Header"."PP Total Commitments")
            {
            }
            column(PPTotalAvailableBudget_PurchaseHeader; "Purchase Header"."PP Total Available Budget")
            {
            }
            column(PPSolicitationType_PurchaseHeader; "Purchase Header"."PP Solicitation Type")
            {
            }
            column(PPProcurementMethod_PurchaseHeader; "Purchase Header"."PP Procurement Method")
            {
            }
            column(PPPreferenceReservationCode_PurchaseHeader; "Purchase Header"."PP Preference/Reservation Code")
            {
            }
            column(PRNConversionProcedure_PurchaseHeader; "Purchase Header"."PRN Conversion Procedure")
            {
            }
            column(OrderedPRN_PurchaseHeader; "Purchase Header"."Ordered PRN")
            {
            }
            column(LinkedIFSNo_PurchaseHeader; "Purchase Header"."Linked IFS No.")
            {
            }
            column(LinkedLPONo_PurchaseHeader; "Purchase Header"."Linked LPO No.")
            {
            }
            column(WorksCategory_PurchaseHeader; "Purchase Header"."Works Category")
            {
            }
            column(WorksDescription_PurchaseHeader; "Purchase Header"."Works Description")
            {
            }
            column(TotalPRNAmount_PurchaseHeader; "Purchase Header"."Total PRN Amount")
            {
            }
            column(TotalPRNAmountLCY_PurchaseHeader; "Purchase Header"."Total PRN Amount (LCY)")
            {
            }
            column(PPInvitationNoticeType_PurchaseHeader; "Purchase Header"."PP  Invitation Notice Type")
            {
            }
            column(PPBidSelectionMethod_PurchaseHeader; "Purchase Header"."PP Bid Selection Method")
            {
            }
            column(PRNOrderDateTime_PurchaseHeader; "Purchase Header"."PRN Order Date/Time")
            {
            }
            column(DocumentStatus_PurchaseHeader; "Purchase Header"."Document Status")
            {
            }
            column(BidderType_PurchaseHeader; "Purchase Header"."Bidder Type")
            {
            }
            column(JointVenturePartner_PurchaseHeader; "Purchase Header"."Joint Venture Partner")
            {
            }
            column(InvitationForSupplyNo_PurchaseHeader; "Purchase Header"."Invitation For Supply No")
            {
            }
            column(InvitationNoticeType_PurchaseHeader; "Purchase Header"."Invitation Notice Type")
            {
            }
            column(BidEnvelopeType_PurchaseHeader; "Purchase Header"."Bid Envelope Type")
            {
            }
            column(BidSealType_PurchaseHeader; "Purchase Header"."Bid Seal Type")
            {
            }
            column(TenderDescription_PurchaseHeader; "Purchase Header"."Tender Description")
            {
            }
            column(BidderRepresentativeName_PurchaseHeader; "Purchase Header"."Bidder Representative Name")
            {
            }
            column(BidderRepresentativeDesgn_PurchaseHeader; "Purchase Header"."Bidder Representative Desgn")
            {
            }
            column(BidderRepresentativeAddress_PurchaseHeader; "Purchase Header"."Bidder Representative Address")
            {
            }
            column(BidderWitnessName_PurchaseHeader; "Purchase Header"."Bidder Witness Name")
            {
            }
            column(BidderWitnessDesignation_PurchaseHeader; "Purchase Header"."Bidder Witness Designation")
            {
            }
            column(BidderWitnessAddress_PurchaseHeader; "Purchase Header"."Bidder Witness Address")
            {
            }
            column(TenderDocumentSource_PurchaseHeader; "Purchase Header"."Tender Document Source")
            {
            }
            column(BidChargeCode_PurchaseHeader; "Purchase Header"."Bid Charge Code")
            {
            }
            column(BidChargeLCY_PurchaseHeader; "Purchase Header"."Bid Charge (LCY)")
            {
            }
            column(PaymentReferenceNo_PurchaseHeader; "Purchase Header"."Payment Reference No.")
            {
            }
            column(PostedDirectIncomeVoucher_PurchaseHeader; "Purchase Header"."Posted Direct Income Voucher")
            {
            }
            column(PrimaryRegion_PurchaseHeader; "Purchase Header"."Primary Region")
            {
            }
            column(PrimaryDirectorate_PurchaseHeader; "Purchase Header"."Primary Directorate")
            {
            }
            column(PrimaryDepartment_PurchaseHeader; "Purchase Header"."Primary Department")
            {
            }
            column(PrimaryBranchCentre_PurchaseHeader; "Purchase Header"."Primary Branch/Centre")
            {
            }
            column(BuildingHouseNo_PurchaseHeader; "Purchase Header"."Building/House No")
            {
            }
            column(PlotNo_PurchaseHeader; "Purchase Header"."Plot No")
            {
            }
            column(Street_PurchaseHeader; "Purchase Header".Street)
            {
            }
            column(NatureofBusiness_PurchaseHeader; "Purchase Header"."Nature of Business")
            {
            }
            column(CurrentTradeLicenceNo_PurchaseHeader; "Purchase Header"."Current Trade Licence No")
            {
            }
            column(TradeLicenceExpiryDate_PurchaseHeader; "Purchase Header"."Trade Licence Expiry Date")
            {
            }
            column(MaxValueofBusiness_PurchaseHeader; "Purchase Header"."Max Value of Business")
            {
            }
            column(PreferredBankAccountCode_PurchaseHeader; "Purchase Header"."Preferred Bank Account Code")
            {
            }
            column(BankersName_PurchaseHeader; "Purchase Header"."Bankers Name")
            {
            }
            column(BankersBranch_PurchaseHeader; "Purchase Header"."Bankers Branch")
            {
            }
            column(KNTCAgent_PurchaseHeader; "Purchase Header"."KNTC Agent")
            {
            }
            column(BusinessType_PurchaseHeader; "Purchase Header"."Business Type")
            {
            }
            column(NominalCapitalLCY_PurchaseHeader; "Purchase Header"."Nominal Capital LCY")
            {
            }
            column(IssuedCapitalLCY_PurchaseHeader; "Purchase Header"."Issued Capital LCY")
            {
            }
            column(Responseisrestricted_PurchaseHeader; "Purchase Header"."Response is restricted")
            {
            }
            column(Suppliertorespond_PurchaseHeader; "Purchase Header"."Supplier to respond")
            {
            }
            column(ProcuringEntitycanextend_PurchaseHeader; "Purchase Header"."Procuring Entity can extend")
            {
            }
            column(ProcuringEntitycanCancel_PurchaseHeader; "Purchase Header"."Procuring Entity can Cancel")
            {
            }
            column(NoofAddendumNoticesissued_PurchaseHeader; "Purchase Header"."No. of Addendum Notices issued")
            {
            }
            column(LastAddendumNoticeNo_PurchaseHeader; "Purchase Header"."Last Addendum Notice No.")
            {
            }
            column(ReadoutBidPriceA_PurchaseHeader; "Purchase Header"."Read-out Bid Price (A)")
            {
            }
            column(ArithmeticCorrectionsB_PurchaseHeader; "Purchase Header"."Arithmetic Corrections (B)")
            {
            }
            column(CorrectedBidPriceCAB_PurchaseHeader; "Purchase Header"."Corrected Bid Price (C=A+B)")
            {
            }
            column(UnconditionalDiscountD_PurchaseHeader; "Purchase Header"."Unconditional Discount % (D)")
            {
            }
            column(UnconditionalDiscAmountE_PurchaseHeader; "Purchase Header"."Unconditional Disc Amount (E)")
            {
            }
            column(CorrectedDiscBidPrice_PurchaseHeader; "Purchase Header"."Corrected & Disc Bid Price")
            {
            }
            column(AnyAdditionalAdjustmentsG_PurchaseHeader; "Purchase Header"."Any Additional Adjustments (G)")
            {
            }
            column(AnyPricedDeviationsH_PurchaseHeader; "Purchase Header"."Any Priced Deviations (H))")
            {
            }
            column(FinalEvaluatedBidPrice_PurchaseHeader; "Purchase Header"."Final Evaluated Bid Price")
            {
            }
            column(FinancialEvaluationDate_PurchaseHeader; "Purchase Header"."Financial Evaluation Date")
            {
            }
            column(WeightedFinancialScore_PurchaseHeader; "Purchase Header"."Weighted Financial Score %")
            {
            }
            column(FinancialEvaluationRanking_PurchaseHeader; "Purchase Header"."Financial Evaluation Ranking")
            {
            }
            column(PrebidRegisterNo_PurchaseHeader; "Purchase Header"."Pre-bid Register No.")
            {
            }
            column(AttendedPrebidConference_PurchaseHeader; "Purchase Header"."Attended Pre-bid Conference")
            {
            }
            column(PrebidConferenceDate_PurchaseHeader; "Purchase Header"."Prebid Conference Date")
            {
            }
            column(BidOpeningRegisterNo_PurchaseHeader; "Purchase Header"."Bid Opening Register No.")
            {
            }
            column(BidOpeningDate_PurchaseHeader; "Purchase Header"."Bid Opening Date")
            {
            }
            column(LateBidOpeningStage_PurchaseHeader; "Purchase Header"."Late Bid (Opening Stage)")
            {
            }
            column(WithdrawnBidOpeningStage_PurchaseHeader; "Purchase Header"."Withdrawn Bid (Opening Stage)")
            {
            }
            column(WithdrawalNoticeNo_PurchaseHeader; "Purchase Header"."Withdrawal Notice No")
            {
            }
            column(ModifiedBidOpeningStage_PurchaseHeader; "Purchase Header"."Modified Bid (Opening Stage)")
            {
            }
            column(SuccesfulBidOpeningStage_PurchaseHeader; "Purchase Header"."Succesful Bid (Opening Stage)")
            {
            }
            column(PreliminaryEvaluationDate_PurchaseHeader; "Purchase Header"."Preliminary Evaluation Date")
            {
            }
            column(ResponsiveBidEvaluation_PurchaseHeader; "Purchase Header"."Responsive Bid (Evaluation)")
            {
            }
            column(TechnicalEvaluationDate_PurchaseHeader; "Purchase Header"."Technical Evaluation Date")
            {
            }
            column(WeightedTechScore_PurchaseHeader; "Purchase Header"."Weighted Tech Score %")
            {
            }
            column(PassedTechEvaluation_PurchaseHeader; "Purchase Header"."Passed Tech Evaluation")
            {
            }
            column(TechEvaluationRanking_PurchaseHeader; "Purchase Header"."Tech Evaluation Ranking")
            {
            }
            column(AggregateWeightedScore_PurchaseHeader; "Purchase Header"."Aggregate Weighted Score %")
            {
            }
            column(AggregateRanking_PurchaseHeader; "Purchase Header"."Aggregate Ranking")
            {
            }
            column(FinalTenderOutcome_PurchaseHeader; "Purchase Header"."Final Tender Outcome")
            {
            }
            column(EngineerEstimateLCY_PurchaseHeader; "Purchase Header"."Engineer Estimate (LCY)")
            {
            }
            column(MaxWorksKickoffDuration_PurchaseHeader; "Purchase Header"."Max Works Kickoff Duration")
            {
            }
            column(MaxWorksCharterDuration_PurchaseHeader; "Purchase Header"."Max Works Charter Duration")
            {
            }
            column(MaxWorksCompletionDuration_PurchaseHeader; "Purchase Header"."Max Works Completion Duration")
            {
            }
            column(DefectsLiabilityPeriod_PurchaseHeader; "Purchase Header"."Defects Liability Period")
            {
            }
            column(DailyLiquidatedDamUnitCost_PurchaseHeader; "Purchase Header"."Daily Liquidated Dam Unit Cost")
            {
            }
            column(LiquidatedDamagesLimit_PurchaseHeader; "Purchase Header"."Liquidated Damages Limit %")
            {
            }
            column(PaymentRetention_PurchaseHeader; "Purchase Header"."Payment Retention %")
            {
            }
            column(RetentionAmountLimit_PurchaseHeader; "Purchase Header"."Retention Amount Limit %")
            {
            }
            column(MinInterimCertificateAmount_PurchaseHeader; "Purchase Header"."Min Interim Certificate Amount")
            {
            }
            column(VendorNo_PurchaseHeader; "Purchase Header"."Vendor No.")
            {
            }
            column(SealedBidsTechnical_PurchaseHeader; "Purchase Header"."Sealed Bids (Technical)")
            {
            }
            column(SealedBidsFinancial_PurchaseHeader; "Purchase Header"."Sealed Bids (Financial)")
            {
            }
            column(ContractDescription_PurchaseHeader; "Purchase Header"."Contract Description")
            {
            }
            column(ContractStartDate_PurchaseHeader; "Purchase Header"."Contract Start Date")
            {
            }
            column(ContractEndDate_PurchaseHeader; "Purchase Header"."Contract End Date")
            {
            }
            column(NoticeofAwardNo_PurchaseHeader; "Purchase Header"."Notice of Award No.")
            {
            }
            column(AwardedBidNo_PurchaseHeader; "Purchase Header"."Awarded Bid No")
            {
            }
            column(AwardTenderSumIncTaxes_PurchaseHeader; "Purchase Header"."Award Tender Sum Inc Taxes")
            {
            }
            column(IFSCode_PurchaseHeader; "Purchase Header"."IFS Code")
            {
            }
            column(TenderName_PurchaseHeader; "Purchase Header"."Tender Name")
            {
            }
            column(ContractType_PurchaseHeader; "Purchase Header"."Contract Type")
            {
            }
            column(ParentContractID_PurchaseHeader; "Purchase Header"."Parent Contract ID")
            {
            }
            column(GoverningLaws_PurchaseHeader; "Purchase Header"."Governing Laws")
            {
            }
            column(ContractStatus_PurchaseHeader; "Purchase Header"."Contract Status")
            {
            }
            column(ProcuringEntityPEName_PurchaseHeader; "Purchase Header"."Procuring Entity (PE) Name")
            {
            }
            column(PERepresentative_PurchaseHeader; "Purchase Header"."PE Representative")
            {
            }
            column(FinalEvaluationReport_PurchaseHeader; "Purchase Header"."Final Evaluation Report")
            {
            }
            column(FinalEvaluationReportDate_PurchaseHeader; "Purchase Header"."Final Evaluation Report Date")
            {
            }
            column(ProffesionOpinionNo_PurchaseHeader; "Purchase Header"."Proffesion Opinion No")
            {
            }
            column(ProffesionOpinionDate_PurchaseHeader; "Purchase Header"."Proffesion Opinion Date")
            {
            }
            column(Test_PurchaseHeader; "Purchase Header".Test)
            {
            }
            column(ProcurementPlanItemDescript_PurchaseHeader; "Purchase Header"."Procurement Plan Item Descript")
            {
            }
            column(ItemCategoryDescription_PurchaseHeader; "Purchase Header"."Item Category Description")
            {
            }
            column(WorkPlanNo_PurchaseHeader; "Purchase Header".Job)
            {
            }

            trigger OnPreDataItem()
            begin
                corec.CalcFields(corec.Picture);
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

    var
        corec: Record "Company Information";
}
