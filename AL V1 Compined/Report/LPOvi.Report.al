#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70032 LPOvi
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/LPOvi.rdlc';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = where("Document Type" = const(Order));
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
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
            column(Test_PurchaseHeader; "Purchase Header".Test)
            {
            }
            column(ProcurementPlanItemDescript_PurchaseHeader; "Purchase Header"."Procurement Plan Item Descript")
            {
            }
            column(ItemCategoryDescription_PurchaseHeader; "Purchase Header"."Item Category Description")
            {
            }
            column(CompName; CompName)
            {
            }
            column(CompAdd; CompAdd)
            {
            }
            column(Dept; Dept)
            {
            }
            column(Approver1; UserSetup."Employee Name")
            {
            }
            column(DateApprover1; ApproverDate[1])
            {
            }
            column(Approver1_Signature; UserSetup.Picture)
            {
            }
            column(Approver2; UserSetup1."Employee Name")
            {
            }
            column(DateApprover2; ApproverDate[2])
            {
            }
            column(Approver2_Signature; UserSetup1.Picture)
            {
            }
            column(Approver3; UserSetup2."Employee Name")
            {
            }
            column(DateApprover3; ApproverDate[3])
            {
            }
            column(Approver3_Signature; UserSetup2.Picture)
            {
            }
            column(AuthorizedBy; UserSetup4."Employee Name")
            {
            }
            column(DateAuthorizedBy; ApproverDate[4])
            {
            }
            column(AuthorizedBy_Signature; UserSetup4.Picture)
            {
            }
            column(DesignationApprover1; Designation)
            {
            }
            column(DesignationApprover2; Designation1)
            {
            }
            column(DesignationApprover3; Designation2)
            {
            }
            column(ConditionsCaption; ConditionsCaption)
            {
            }
            column(Conditionslblone; Conditionslblone)
            {
            }
            column(Conditionslbltwo; Conditionslbltwo)
            {
            }
            column(Conditionslblthree; Conditionslblthree)
            {
            }
            column(Conditionslblfour; Conditionslblfour)
            {
            }
            column(Conditionslblfive; Conditionslblfive)
            {
            }
            column(Conditionslblsix; Conditionslblsix)
            {
            }
            column(Conditionslblseven; Conditionslblseven)
            {
            }
            column(Conditionslbleight; Conditionslbleight)
            {
            }
            column(Conditionslblnine; Conditionslblnine)
            {
            }
            column(Conditionslblten; Conditionslblten)
            {
            }
            column(Conditionslbleleven; Conditionslbleleven)
            {
            }
            column(Conditionslbltwelve; Conditionslbltwelve)
            {
            }
            column(Conditionslblthirteen; Conditionslblthirteen)
            {
            }
            column(Conditionslblfourteen; Conditionslblfourteen)
            {
            }
            column(Conditionslblfifteen; Conditionslblfifteen)
            {
            }
            column(Conditionslblsixteen; Conditionslblsixteen)
            {
            }
            column(Conditionslblseventeen; Conditionslblseventeen)
            {
            }
            column(Conditionslbleighteen; Conditionslbleighteen)
            {
            }
            column(Conditionslblninteen; Conditionslblninteen)
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                column(ReportForNavId_242; 242)
                {
                }
                column(DocumentType_PurchaseLine; "Purchase Line"."Document Type")
                {
                }
                column(BuyfromVendorNo_PurchaseLine; "Purchase Line"."Buy-from Vendor No.")
                {
                }
                column(DocumentNo_PurchaseLine; "Purchase Line"."Document No.")
                {
                }
                column(LineNo_PurchaseLine; "Purchase Line"."Line No.")
                {
                }
                column(Type_PurchaseLine; "Purchase Line".Type)
                {
                }
                column(No_PurchaseLine; "Purchase Line"."No.")
                {
                }
                column(LocationCode_PurchaseLine; "Purchase Line"."Location Code")
                {
                }
                column(PostingGroup_PurchaseLine; "Purchase Line"."Posting Group")
                {
                }
                column(ExpectedReceiptDate_PurchaseLine; "Purchase Line"."Expected Receipt Date")
                {
                }
                column(Description_PurchaseLine; "Purchase Line".Description)
                {
                }
                column(Description2_PurchaseLine; "Purchase Line"."Description 2")
                {
                }
                column(UnitofMeasure_PurchaseLine; "Purchase Line"."Unit of Measure")
                {
                }
                column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                {
                }
                column(OutstandingQuantity_PurchaseLine; "Purchase Line"."Outstanding Quantity")
                {
                }
                column(QtytoInvoice_PurchaseLine; "Purchase Line"."Qty. to Invoice")
                {
                }
                column(QtytoReceive_PurchaseLine; "Purchase Line"."Qty. to Receive")
                {
                }
                column(DirectUnitCost_PurchaseLine; "Purchase Line"."Direct Unit Cost")
                {
                }
                column(UnitCostLCY_PurchaseLine; "Purchase Line"."Unit Cost (LCY)")
                {
                }
                column(VAT_PurchaseLine; "Purchase Line"."VAT %")
                {
                }
                column(LineDiscount_PurchaseLine; "Purchase Line"."Line Discount %")
                {
                }
                column(LineDiscountAmount_PurchaseLine; "Purchase Line"."Line Discount Amount")
                {
                }
                column(Amount_PurchaseLine; "Purchase Line".Amount)
                {
                }
                column(AmountIncludingVAT_PurchaseLine; "Purchase Line"."Amount Including VAT")
                {
                }
                column(UnitPriceLCY_PurchaseLine; "Purchase Line"."Unit Price (LCY)")
                {
                }
                column(AllowInvoiceDisc_PurchaseLine; "Purchase Line"."Allow Invoice Disc.")
                {
                }
                column(GrossWeight_PurchaseLine; "Purchase Line"."Gross Weight")
                {
                }
                column(NetWeight_PurchaseLine; "Purchase Line"."Net Weight")
                {
                }
                column(UnitsperParcel_PurchaseLine; "Purchase Line"."Units per Parcel")
                {
                }
                column(UnitVolume_PurchaseLine; "Purchase Line"."Unit Volume")
                {
                }
                column(AppltoItemEntry_PurchaseLine; "Purchase Line"."Appl.-to Item Entry")
                {
                }
                column(ShortcutDimension1Code_PurchaseLine; "Purchase Line"."Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_PurchaseLine; "Purchase Line"."Shortcut Dimension 2 Code")
                {
                }
                column(JobNo_PurchaseLine; "Purchase Line"."Job No.")
                {
                }
                column(IndirectCost_PurchaseLine; "Purchase Line"."Indirect Cost %")
                {
                }
                column(RecalculateInvoiceDisc_PurchaseLine; "Purchase Line"."Recalculate Invoice Disc.")
                {
                }
                column(OutstandingAmount_PurchaseLine; "Purchase Line"."Outstanding Amount")
                {
                }
                column(QtyRcdNotInvoiced_PurchaseLine; "Purchase Line"."Qty. Rcd. Not Invoiced")
                {
                }
                column(AmtRcdNotInvoiced_PurchaseLine; "Purchase Line"."Amt. Rcd. Not Invoiced")
                {
                }
                column(QuantityReceived_PurchaseLine; "Purchase Line"."Quantity Received")
                {
                }
                column(QuantityInvoiced_PurchaseLine; "Purchase Line"."Quantity Invoiced")
                {
                }
                column(ReceiptNo_PurchaseLine; "Purchase Line"."Receipt No.")
                {
                }
                column(ReceiptLineNo_PurchaseLine; "Purchase Line"."Receipt Line No.")
                {
                }
                column(OrderNo_PurchaseLine; "Purchase Line"."Order No.")
                {
                }
                column(OrderLineNo_PurchaseLine; "Purchase Line"."Order Line No.")
                {
                }
                column(Profit_PurchaseLine; "Purchase Line"."Profit %")
                {
                }
                column(PaytoVendorNo_PurchaseLine; "Purchase Line"."Pay-to Vendor No.")
                {
                }
                column(InvDiscountAmount_PurchaseLine; "Purchase Line"."Inv. Discount Amount")
                {
                }
                column(VendorItemNo_PurchaseLine; "Purchase Line"."Vendor Item No.")
                {
                }
                column(SalesOrderNo_PurchaseLine; "Purchase Line"."Sales Order No.")
                {
                }
                column(SalesOrderLineNo_PurchaseLine; "Purchase Line"."Sales Order Line No.")
                {
                }
                column(DropShipment_PurchaseLine; "Purchase Line"."Drop Shipment")
                {
                }
                column(GenBusPostingGroup_PurchaseLine; "Purchase Line"."Gen. Bus. Posting Group")
                {
                }
                column(GenProdPostingGroup_PurchaseLine; "Purchase Line"."Gen. Prod. Posting Group")
                {
                }
                column(VATCalculationType_PurchaseLine; "Purchase Line"."VAT Calculation Type")
                {
                }
                column(TransactionType_PurchaseLine; "Purchase Line"."Transaction Type")
                {
                }
                column(TransportMethod_PurchaseLine; "Purchase Line"."Transport Method")
                {
                }
                column(AttachedtoLineNo_PurchaseLine; "Purchase Line"."Attached to Line No.")
                {
                }
                column(EntryPoint_PurchaseLine; "Purchase Line"."Entry Point")
                {
                }
                column(Area_PurchaseLine; "Purchase Line".Area)
                {
                }
                column(TransactionSpecification_PurchaseLine; "Purchase Line"."Transaction Specification")
                {
                }
                column(TaxAreaCode_PurchaseLine; "Purchase Line"."Tax Area Code")
                {
                }
                column(TaxLiable_PurchaseLine; "Purchase Line"."Tax Liable")
                {
                }
                column(TaxGroupCode_PurchaseLine; "Purchase Line"."Tax Group Code")
                {
                }
                column(UseTax_PurchaseLine; "Purchase Line"."Use Tax")
                {
                }
                column(VATBusPostingGroup_PurchaseLine; "Purchase Line"."VAT Bus. Posting Group")
                {
                }
                column(VATProdPostingGroup_PurchaseLine; "Purchase Line"."VAT Prod. Posting Group")
                {
                }
                column(CurrencyCode_PurchaseLine; "Purchase Line"."Currency Code")
                {
                }
                column(OutstandingAmountLCY_PurchaseLine; "Purchase Line"."Outstanding Amount (LCY)")
                {
                }
                column(AmtRcdNotInvoicedLCY_PurchaseLine; "Purchase Line"."Amt. Rcd. Not Invoiced (LCY)")
                {
                }
                column(ReservedQuantity_PurchaseLine; "Purchase Line"."Reserved Quantity")
                {
                }
                column(BlanketOrderNo_PurchaseLine; "Purchase Line"."Blanket Order No.")
                {
                }
                column(BlanketOrderLineNo_PurchaseLine; "Purchase Line"."Blanket Order Line No.")
                {
                }
                column(VATBaseAmount_PurchaseLine; "Purchase Line"."VAT Base Amount")
                {
                }
                column(UnitCost_PurchaseLine; "Purchase Line"."Unit Cost")
                {
                }
                column(SystemCreatedEntry_PurchaseLine; "Purchase Line"."System-Created Entry")
                {
                }
                column(LineAmount_PurchaseLine; "Purchase Line"."Line Amount")
                {
                }
                column(VATDifference_PurchaseLine; "Purchase Line"."VAT Difference")
                {
                }
                column(InvDiscAmounttoInvoice_PurchaseLine; "Purchase Line"."Inv. Disc. Amount to Invoice")
                {
                }
                column(VATIdentifier_PurchaseLine; "Purchase Line"."VAT Identifier")
                {
                }
                column(ICPartnerRefType_PurchaseLine; "Purchase Line"."IC Partner Ref. Type")
                {
                }
                column(ICPartnerReference_PurchaseLine; "Purchase Line"."IC Partner Reference")
                {
                }
                column(Prepayment_PurchaseLine; "Purchase Line"."Prepayment %")
                {
                }
                column(PrepmtLineAmount_PurchaseLine; "Purchase Line"."Prepmt. Line Amount")
                {
                }
                column(PrepmtAmtInv_PurchaseLine; "Purchase Line"."Prepmt. Amt. Inv.")
                {
                }
                column(PrepmtAmtInclVAT_PurchaseLine; "Purchase Line"."Prepmt. Amt. Incl. VAT")
                {
                }
                column(PrepaymentAmount_PurchaseLine; "Purchase Line"."Prepayment Amount")
                {
                }
                column(PrepmtVATBaseAmt_PurchaseLine; "Purchase Line"."Prepmt. VAT Base Amt.")
                {
                }
                column(PrepaymentVAT_PurchaseLine; "Purchase Line"."Prepayment VAT %")
                {
                }
                column(PrepmtVATCalcType_PurchaseLine; "Purchase Line"."Prepmt. VAT Calc. Type")
                {
                }
                column(PrepaymentVATIdentifier_PurchaseLine; "Purchase Line"."Prepayment VAT Identifier")
                {
                }
                column(PrepaymentTaxAreaCode_PurchaseLine; "Purchase Line"."Prepayment Tax Area Code")
                {
                }
                column(PrepaymentTaxLiable_PurchaseLine; "Purchase Line"."Prepayment Tax Liable")
                {
                }
                column(PrepaymentTaxGroupCode_PurchaseLine; "Purchase Line"."Prepayment Tax Group Code")
                {
                }
                column(PrepmtAmttoDeduct_PurchaseLine; "Purchase Line"."Prepmt Amt to Deduct")
                {
                }
                column(PrepmtAmtDeducted_PurchaseLine; "Purchase Line"."Prepmt Amt Deducted")
                {
                }
                column(PrepaymentLine_PurchaseLine; "Purchase Line"."Prepayment Line")
                {
                }
                column(PrepmtAmountInvInclVAT_PurchaseLine; "Purchase Line"."Prepmt. Amount Inv. Incl. VAT")
                {
                }
                column(PrepmtAmountInvLCY_PurchaseLine; "Purchase Line"."Prepmt. Amount Inv. (LCY)")
                {
                }
                column(ICPartnerCode_PurchaseLine; "Purchase Line"."IC Partner Code")
                {
                }
                column(PrepmtVATAmountInvLCY_PurchaseLine; "Purchase Line"."Prepmt. VAT Amount Inv. (LCY)")
                {
                }
                column(PrepaymentVATDifference_PurchaseLine; "Purchase Line"."Prepayment VAT Difference")
                {
                }
                column(PrepmtVATDifftoDeduct_PurchaseLine; "Purchase Line"."Prepmt VAT Diff. to Deduct")
                {
                }
                column(PrepmtVATDiffDeducted_PurchaseLine; "Purchase Line"."Prepmt VAT Diff. Deducted")
                {
                }
                column(OutstandingAmtExVATLCY_PurchaseLine; "Purchase Line"."Outstanding Amt. Ex. VAT (LCY)")
                {
                }
                column(ARcdNotInvExVATLCY_PurchaseLine; "Purchase Line"."A. Rcd. Not Inv. Ex. VAT (LCY)")
                {
                }
                column(PmtDiscountAmount_PurchaseLine; "Purchase Line"."Pmt. Discount Amount")
                {
                }
                column(DimensionSetID_PurchaseLine; "Purchase Line"."Dimension Set ID")
                {
                }
                column(JobTaskNo_PurchaseLine; "Purchase Line"."Job Task No.")
                {
                }
                column(JobLineType_PurchaseLine; "Purchase Line"."Job Line Type")
                {
                }
                column(JobUnitPrice_PurchaseLine; "Purchase Line"."Job Unit Price")
                {
                }
                column(JobTotalPrice_PurchaseLine; "Purchase Line"."Job Total Price")
                {
                }
                column(JobLineAmount_PurchaseLine; "Purchase Line"."Job Line Amount")
                {
                }
                column(JobLineDiscountAmount_PurchaseLine; "Purchase Line"."Job Line Discount Amount")
                {
                }
                column(JobLineDiscount_PurchaseLine; "Purchase Line"."Job Line Discount %")
                {
                }
                column(JobUnitPriceLCY_PurchaseLine; "Purchase Line"."Job Unit Price (LCY)")
                {
                }
                column(JobTotalPriceLCY_PurchaseLine; "Purchase Line"."Job Total Price (LCY)")
                {
                }
                column(JobLineAmountLCY_PurchaseLine; "Purchase Line"."Job Line Amount (LCY)")
                {
                }
                column(JobLineDiscAmountLCY_PurchaseLine; "Purchase Line"."Job Line Disc. Amount (LCY)")
                {
                }
                column(JobCurrencyFactor_PurchaseLine; "Purchase Line"."Job Currency Factor")
                {
                }
                column(JobCurrencyCode_PurchaseLine; "Purchase Line"."Job Currency Code")
                {
                }
                column(JobPlanningLineNo_PurchaseLine; "Purchase Line"."Job Planning Line No.")
                {
                }
                column(JobRemainingQty_PurchaseLine; "Purchase Line"."Job Remaining Qty.")
                {
                }
                column(JobRemainingQtyBase_PurchaseLine; "Purchase Line"."Job Remaining Qty. (Base)")
                {
                }
                column(DeferralCode_PurchaseLine; "Purchase Line"."Deferral Code")
                {
                }
                column(ReturnsDeferralStartDate_PurchaseLine; "Purchase Line"."Returns Deferral Start Date")
                {
                }
                column(ProdOrderNo_PurchaseLine; "Purchase Line"."Prod. Order No.")
                {
                }
                column(VariantCode_PurchaseLine; "Purchase Line"."Variant Code")
                {
                }
                column(BinCode_PurchaseLine; "Purchase Line"."Bin Code")
                {
                }
                column(QtyperUnitofMeasure_PurchaseLine; "Purchase Line"."Qty. per Unit of Measure")
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Purchase Line"."Unit of Measure Code")
                {
                }
                column(QuantityBase_PurchaseLine; "Purchase Line"."Quantity (Base)")
                {
                }
                column(OutstandingQtyBase_PurchaseLine; "Purchase Line"."Outstanding Qty. (Base)")
                {
                }
                column(QtytoInvoiceBase_PurchaseLine; "Purchase Line"."Qty. to Invoice (Base)")
                {
                }
                column(QtytoReceiveBase_PurchaseLine; "Purchase Line"."Qty. to Receive (Base)")
                {
                }
                column(QtyRcdNotInvoicedBase_PurchaseLine; "Purchase Line"."Qty. Rcd. Not Invoiced (Base)")
                {
                }
                column(QtyReceivedBase_PurchaseLine; "Purchase Line"."Qty. Received (Base)")
                {
                }
                column(QtyInvoicedBase_PurchaseLine; "Purchase Line"."Qty. Invoiced (Base)")
                {
                }
                column(ReservedQtyBase_PurchaseLine; "Purchase Line"."Reserved Qty. (Base)")
                {
                }
                column(FAPostingDate_PurchaseLine; "Purchase Line"."FA Posting Date")
                {
                }
                column(FAPostingType_PurchaseLine; "Purchase Line"."FA Posting Type")
                {
                }
                column(DepreciationBookCode_PurchaseLine; "Purchase Line"."Depreciation Book Code")
                {
                }
                column(SalvageValue_PurchaseLine; "Purchase Line"."Salvage Value")
                {
                }
                column(DepruntilFAPostingDate_PurchaseLine; "Purchase Line"."Depr. until FA Posting Date")
                {
                }
                column(DeprAcquisitionCost_PurchaseLine; "Purchase Line"."Depr. Acquisition Cost")
                {
                }
                column(MaintenanceCode_PurchaseLine; "Purchase Line"."Maintenance Code")
                {
                }
                column(InsuranceNo_PurchaseLine; "Purchase Line"."Insurance No.")
                {
                }
                column(BudgetedFANo_PurchaseLine; "Purchase Line"."Budgeted FA No.")
                {
                }
                column(DuplicateinDepreciationBook_PurchaseLine; "Purchase Line"."Duplicate in Depreciation Book")
                {
                }
                column(UseDuplicationList_PurchaseLine; "Purchase Line"."Use Duplication List")
                {
                }
                column(ResponsibilityCenter_PurchaseLine; "Purchase Line"."Responsibility Center")
                {
                }
                // column(CrossReferenceNo_PurchaseLine; "Purchase Line"."Cross-Reference No.")
                // {
                // }
                // column(UnitofMeasureCrossRef_PurchaseLine; "Purchase Line"."Unit of Measure (Cross Ref.)")
                // {
                // }
                // column(CrossReferenceType_PurchaseLine; "Purchase Line"."Cross-Reference Type")
                // {
                // }
                // column(CrossReferenceTypeNo_PurchaseLine; "Purchase Line"."Cross-Reference Type No.")
                // {
                // }
                column(ItemCategoryCode_PurchaseLine; "Purchase Line"."Item Category Code")
                {
                }
                column(Nonstock_PurchaseLine; "Purchase Line".Nonstock)
                {
                }
                column(PurchasingCode_PurchaseLine; "Purchase Line"."Purchasing Code")
                {
                }
                column(SpecialOrder_PurchaseLine; "Purchase Line"."Special Order")
                {
                }
                column(SpecialOrderSalesNo_PurchaseLine; "Purchase Line"."Special Order Sales No.")
                {
                }
                column(SpecialOrderSalesLineNo_PurchaseLine; "Purchase Line"."Special Order Sales Line No.")
                {
                }
                column(WhseOutstandingQtyBase_PurchaseLine; "Purchase Line"."Whse. Outstanding Qty. (Base)")
                {
                }
                column(CompletelyReceived_PurchaseLine; "Purchase Line"."Completely Received")
                {
                }
                column(RequestedReceiptDate_PurchaseLine; "Purchase Line"."Requested Receipt Date")
                {
                }
                column(PromisedReceiptDate_PurchaseLine; "Purchase Line"."Promised Receipt Date")
                {
                }
                column(LeadTimeCalculation_PurchaseLine; "Purchase Line"."Lead Time Calculation")
                {
                }
                column(InboundWhseHandlingTime_PurchaseLine; "Purchase Line"."Inbound Whse. Handling Time")
                {
                }
                column(PlannedReceiptDate_PurchaseLine; "Purchase Line"."Planned Receipt Date")
                {
                }
                column(OrderDate_PurchaseLine; "Purchase Line"."Order Date")
                {
                }
                column(AllowItemChargeAssignment_PurchaseLine; "Purchase Line"."Allow Item Charge Assignment")
                {
                }
                column(QtytoAssign_PurchaseLine; "Purchase Line"."Qty. to Assign")
                {
                }
                column(QtyAssigned_PurchaseLine; "Purchase Line"."Qty. Assigned")
                {
                }
                column(ReturnQtytoShip_PurchaseLine; "Purchase Line"."Return Qty. to Ship")
                {
                }
                column(ReturnQtytoShipBase_PurchaseLine; "Purchase Line"."Return Qty. to Ship (Base)")
                {
                }
                column(ReturnQtyShippedNotInvd_PurchaseLine; "Purchase Line"."Return Qty. Shipped Not Invd.")
                {
                }
                column(RetQtyShpdNotInvdBase_PurchaseLine; "Purchase Line"."Ret. Qty. Shpd Not Invd.(Base)")
                {
                }
                column(ReturnShpdNotInvd_PurchaseLine; "Purchase Line"."Return Shpd. Not Invd.")
                {
                }
                column(ReturnShpdNotInvdLCY_PurchaseLine; "Purchase Line"."Return Shpd. Not Invd. (LCY)")
                {
                }
                column(ReturnQtyShipped_PurchaseLine; "Purchase Line"."Return Qty. Shipped")
                {
                }
                column(ReturnQtyShippedBase_PurchaseLine; "Purchase Line"."Return Qty. Shipped (Base)")
                {
                }
                column(ReturnShipmentNo_PurchaseLine; "Purchase Line"."Return Shipment No.")
                {
                }
                column(ReturnShipmentLineNo_PurchaseLine; "Purchase Line"."Return Shipment Line No.")
                {
                }
                column(ReturnReasonCode_PurchaseLine; "Purchase Line"."Return Reason Code")
                {
                }
                column(Subtype_PurchaseLine; "Purchase Line".Subtype)
                {
                }
                column(CopiedFromPostedDoc_PurchaseLine; "Purchase Line"."Copied From Posted Doc.")
                {
                }
                column(AttachedDocCount_PurchaseLine; "Purchase Line"."Attached Doc Count")
                {
                }
                column(PurchaseRequisitionNo_PurchaseLine; "Purchase Line"."Purchase Requisition No.")
                {
                }
                column(PurchaseRequisitionLineNo_PurchaseLine; "Purchase Line"."Purchase Requisition Line No.")
                {
                }
                column(Status_PurchaseLine; "Purchase Line".Status)
                {
                }
                column(Select_PurchaseLine; "Purchase Line".Select)
                {
                }
                column(QuantityToIssue_PurchaseLine; "Purchase Line"."Quantity To  Issue")
                {
                }
                column(Category_PurchaseLine; "Purchase Line".Category)
                {
                }
                column(ServiceItemCode_PurchaseLine; "Purchase Line"."Service/Item Code")
                {
                }
                column(PartiallyIssued_PurchaseLine; "Purchase Line"."Partially Issued")
                {
                }
                column(FullyIssued_PurchaseLine; "Purchase Line"."Fully Issued")
                {
                }
                column(Quantityissued_PurchaseLine; "Purchase Line"."Quantity  issued")
                {
                }
                column(QuantityInStore_PurchaseLine; "Purchase Line"."Quantity In Store")
                {
                }
                column(QtyonPurchOrder_PurchaseLine; "Purchase Line"."Qty. on Purch. Order")
                {
                }
                column(QtyonRequisition_PurchaseLine; "Purchase Line"."Qty on Requisition")
                {
                }
                column(PONumber_PurchaseLine; "Purchase Line"."PO Number")
                {
                }
                column(Select2_PurchaseLine; "Purchase Line".Select2)
                {
                }
                column(Ordered_PurchaseLine; "Purchase Line".Ordered)
                {
                }
                column(PreferredSupplier_PurchaseLine; "Purchase Line"."Preferred Supplier")
                {
                }
                column(Orderedby_PurchaseLine; "Purchase Line"."Ordered by")
                {
                }
                column(OrderCreationdate_PurchaseLine; "Purchase Line"."Order Creation date")
                {
                }
                column(OrderCreationTime_PurchaseLine; "Purchase Line"."Order Creation Time")
                {
                }
                column(LastIssuedBy_PurchaseLine; "Purchase Line"."Last Issued By")
                {
                }
                column(LastIssuedate_PurchaseLine; "Purchase Line"."Last Issue date")
                {
                }
                column(LastIssueTime_PurchaseLine; "Purchase Line"."Last Issue Time")
                {
                }
                column(BudgetAmount_PurchaseLine; "Purchase Line"."Budget Amount")
                {
                }
                column(ActualToDate_PurchaseLine; "Purchase Line"."Actual To Date")
                {
                }
                column(RequisitionType_PurchaseLine; "Purchase Line"."Requisition Type")
                {
                }
                column(CustomerNo_PurchaseLine; "Purchase Line"."Customer No.")
                {
                }
                column(RequisitionNo_PurchaseLine; "Purchase Line"."Requisition No.")
                {
                }
                column(EmployeeNo_PurchaseLine; "Purchase Line"."Employee No")
                {
                }
                column(EmployeeName_PurchaseLine; "Purchase Line"."Employee Name")
                {
                }
                column(ItemCategory_PurchaseLine; "Purchase Line"."Item Category")
                {
                }
                column(VendorName_PurchaseLine; "Purchase Line".VendorName)
                {
                }
                column(Branch_PurchaseLine; "Purchase Line".Branch)
                {
                }
                column(Department_PurchaseLine; "Purchase Line".Department)
                {
                }
                column(GLName_PurchaseLine; "Purchase Line"."G/L Name")
                {
                }
                column(IRApprovalHistory_PurchaseLine; "Purchase Line"."IR Approval History")
                {
                }
                column(SelectedBy_PurchaseLine; "Purchase Line"."Selected By")
                {
                }
                column(QtyRequested_PurchaseLine; "Purchase Line"."Qty. Requested")
                {
                }
                column(IncludeinPurchOrder_PurchaseLine; "Purchase Line"."Include in Purch. Order")
                {
                }
                column(RequestByNo_PurchaseLine; "Purchase Line"."Request-By No.")
                {
                }
                column(RequestByName_PurchaseLine; "Purchase Line"."Request-By Name")
                {
                }
                column(QuantityRejected_PurchaseLine; "Purchase Line"."Quantity Rejected")
                {
                }
                column(QuantityReturned_PurchaseLine; "Purchase Line"."Quantity Returned")
                {
                }
                column(RequestorID_PurchaseLine; "Purchase Line"."Requestor ID")
                {
                }
                column(IRLineReference_PurchaseLine; "Purchase Line"."IR Line Reference")
                {
                }
                column(RequisitionHeaderType_PurchaseLine; "Purchase Line"."Requisition Header Type")
                {
                }
                column(ProjectDescription_PurchaseLine; "Purchase Line"."Project Description")
                {
                }
                column(RemainingQuantity_PurchaseLine; "Purchase Line"."Remaining Quantity")
                {
                }
                column(POType_PurchaseLine; "Purchase Line"."PO Type")
                {
                }
                column(Decision_PurchaseLine; "Purchase Line".Decision)
                {
                }
                column(TRFUnitofmeasue_PurchaseLine; "Purchase Line"."TRF Unit of measue")
                {
                }
                column(TypeofVehicle_PurchaseLine; "Purchase Line"."Type of Vehicle")
                {
                }
                column(VehicleDescription_PurchaseLine; "Purchase Line"."Vehicle Description")
                {
                }
                column(DateFrom_PurchaseLine; "Purchase Line"."Date From")
                {
                }
                column(ToDate_PurchaseLine; "Purchase Line"."To Date")
                {
                }
                column(ExternalDocNo_PurchaseLine; "Purchase Line"."External Doc No")
                {
                }
                column(VoteItem_PurchaseLine; "Purchase Line"."Vote Item")
                {
                }
                column(VoteAmount_PurchaseLine; "Purchase Line"."Vote Amount")
                {
                }
                column(AvailableFunds_PurchaseLine; "Purchase Line"."Available Funds")
                {
                }
                column(BudgetCommitments_PurchaseLine; "Purchase Line"."Budget Commitments")
                {
                }
                column(ApprovedRequisitionAmount_PurchaseLine; "Purchase Line"."Approved Requisition Amount")
                {
                }
                column(ApprovedUnitCost_PurchaseLine; "Purchase Line"."Approved Unit Cost")
                {
                }
                column(ProcurementPlan_PurchaseLine; "Purchase Line"."Procurement Plan")
                {
                }
                column(ProcurementPlanItem_PurchaseLine; "Purchase Line"."Procurement Plan Item")
                {
                }
                column(RequisitionStatus_PurchaseLine; "Purchase Line"."Requisition Status")
                {
                }
                column(RequisitionDate_PurchaseLine; "Purchase Line"."Requisition Date")
                {
                }
                column(RequisitionType1_PurchaseLine; "Purchase Line"."Requisition Type1")
                {
                }
                column(Committed_PurchaseLine; "Purchase Line".Committed)
                {
                }
                column(RequestGenerated_PurchaseLine; "Purchase Line"."Request Generated")
                {
                }
                column(ProcessType_PurchaseLine; "Purchase Line"."Process Type")
                {
                }
                column(ContractNo_PurchaseLine; "Purchase Line"."Contract No")
                {
                }
                column(ActivityType_PurchaseLine; "Purchase Line"."Activity Type")
                {
                }
                column(Activity_PurchaseLine; "Purchase Line".Activity)
                {
                }
                column(CurrentBudget_PurchaseLine; "Purchase Line"."Current Budget")
                {
                }
                column(BDAmount_PurchaseLine; "Purchase Line"."BD Amount")
                {
                }
                column(PurchaseType_PurchaseLine; "Purchase Line"."Purchase Type")
                {
                }
                column(DepartmentCode_PurchaseLine; "Purchase Line"."Department Code")
                {
                }
                column(DirectorateCode_PurchaseLine; "Purchase Line"."Directorate Code")
                {
                }
                column(Division_PurchaseLine; "Purchase Line".Division)
                {
                }
                column(GeneralItemCategory_PurchaseLine; "Purchase Line"."General Item Category")
                {
                }
                column(ItemDescription_PurchaseLine; "Purchase Line"."Item Description")
                {
                }
                column(Specifications_PurchaseLine; "Purchase Line".Specifications)
                {
                }
                column(DirectUnitCostIncVAT_PurchaseLine; "Purchase Line"."Direct Unit Cost Inc. VAT")
                {
                }
                column(EntryNo_PurchaseLine; "Purchase Line"."Entry No")
                {
                }
                column(Test_PurchaseLine; "Purchase Line".Test)
                {
                }
                column(RoutingNo_PurchaseLine; "Purchase Line"."Routing No.")
                {
                }
                column(OperationNo_PurchaseLine; "Purchase Line"."Operation No.")
                {
                }
                column(WorkCenterNo_PurchaseLine; "Purchase Line"."Work Center No.")
                {
                }
                column(Finished_PurchaseLine; "Purchase Line".Finished)
                {
                }
                column(ProdOrderLineNo_PurchaseLine; "Purchase Line"."Prod. Order Line No.")
                {
                }
                column(OverheadRate_PurchaseLine; "Purchase Line"."Overhead Rate")
                {
                }
                column(MPSOrder_PurchaseLine; "Purchase Line"."MPS Order")
                {
                }
                column(PlanningFlexibility_PurchaseLine; "Purchase Line"."Planning Flexibility")
                {
                }
                column(SafetyLeadTime_PurchaseLine; "Purchase Line"."Safety Lead Time")
                {
                }
                column(RoutingReferenceNo_PurchaseLine; "Purchase Line"."Routing Reference No.")
                {
                }
                dataitem("Company Information"; "Company Information")
                {
                    column(ReportForNavId_505; 505)
                    {
                    }
                    column(Name_CompanyInformation; "Company Information".Name)
                    {
                    }
                    column(Name2_CompanyInformation; "Company Information"."Name 2")
                    {
                    }
                    column(Address_CompanyInformation; "Company Information".Address)
                    {
                    }
                    column(Address2_CompanyInformation; "Company Information"."Address 2")
                    {
                    }
                    column(City_CompanyInformation; "Company Information".City)
                    {
                    }
                    column(PhoneNo_CompanyInformation; "Company Information"."Phone No.")
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                CompInfo.Get;
                CompName := CompInfo.Name;
                CompAdd := CompInfo.Address;

                DimValues.Reset;
                DimValues.SetRange(Code, "Purchase Header"."Shortcut Dimension 1 Code");
                if DimValues.FindSet then begin
                    Dept := DimValues.Name;
                end;



                //Approvals Signatures
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 38);
                ApprovalEntries.SetRange("Document No.", "Purchase Header"."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver1[1] := ApprovalEntries."Approver ID";
                            ApproverDate[1] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup.Get(Approver1[1]) then
                                UserSetup.CalcFields(Picture);
                            ENo := UserSetup."Employee No.";
                            if Emp.Get(ENo) then
                                DesignationID := Emp."Job ID";
                            if JOBID.Get(DesignationID) then
                                Designation := JOBID."Job Description";
                        end;
                        if i = 2 then begin
                            Approver1[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver1[2]) then
                                UserSetup1.CalcFields(Picture);
                            ENo := UserSetup1."Employee No.";
                            if Emp.Get(ENo) then
                                DesignationID := Emp."Job ID";
                            if JOBID.Get(DesignationID) then
                                Designation1 := JOBID."Job Description";
                            //MESSAGE('%1|%2|%3|%4', ENo, UserSetup1."Employee Name", DesignationID, Designation1);
                        end;
                        if i = 3 then begin
                            Approver1[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver1[3]) then
                                UserSetup2.CalcFields(Picture);

                            ENo := UserSetup2."Employee No.";
                            if Emp.Get(ENo) then
                                DesignationID := Emp."Job ID";
                            if JOBID.Get(DesignationID) then
                                Designation2 := JOBID."Job Description";
                            //MESSAGE('%1|%2|%3|%4', ENo, UserSetup2."Employee Name", DesignationID, Designation2);
                        end;
                        if i = 4 then begin
                            Approver1[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver1[4]) then
                                UserSetup3.CalcFields(Picture);
                            //MESSAGE('Test C %1',UserSetup1.Picture);
                            ENo := UserSetup3."Employee No.";
                            if Emp.Get(ENo) then
                                DesignationID := Emp."Job ID";
                            if JOBID.Get(DesignationID) then
                                Designation := JOBID."Job Description";
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
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
        ConditionsCaption: label 'CONDITIONS';
        Conditionslblone: label '     The execution of all or part of this order is subject to the following conditions unless otherwise stated in writing. A supplier who renders services contrary to these conditions does so at his own risk.';
        Conditionslbltwo: label 'in writing. A supplier who renders services contrary to these conditions does so at his own risk.';
        Conditionslblthree: label '     1. Tender/Quotation or Contract reference Number and the date must be clearly shown on this form for purchase exceeding Ksh. 1,000.00 on any item. Failure to do this may delay the settlement of this order.';
        Conditionslblfour: label '          for purchase exceeding Ksh. 1,000.00 on any item. Failure to do this may delay the settlement of';
        Conditionslblfive: label '          this order.';
        Conditionslblsix: label '      2. All services are to be carried out strictly in accordance with specifications given No departure is allowed without our prior agreement and in writing.';
        Conditionslblseven: label '          without our prior agreement and in writing.';
        Conditionslbleight: label '      3. Orders must be executed within the period tendered unless instructions are given to the contrary. If the service is not effected as agreed, this order is liable for cancellation and/or payment of penalty ';
        Conditionslblnine: label '          If the service is not effected as agreed, this order is liable for cancellation and/or payment of penalty ';
        Conditionslblten: label '      4. We reserve the right to inspect the service on this order, but such inspection does not relieve the supplier of his responsibility for defects in material and or/workmanship.';
        Conditionslbleleven: label '          of his responsibility for defects in material and or/workmanship.';
        Conditionslbltwelve: label '      5. Receipt of this order should be acknowledged on the duplicate copy which should be sent back within 7 days. ';
        Conditionslblthirteen: label '          7 days.   All communications to be addressed to the originator of this order.';
        Conditionslblfourteen: label '          All communications to be addressed to the originator of this order.';
        Conditionslblfifteen: label '       Distribution of copies';
        Conditionslblsixteen: label '       Original :                  To be retained by supplier.';
        Conditionslblseventeen: label '       Duplicate:                To be signed by supplier and returned for attachment to contract documents.';
        Conditionslbleighteen: label '       Triplicate:                 To be attached to PV. and invoice for payment purchases.';
        Conditionslblninteen: label '       Quadruplicate:         To remain in the pad.';
        ApprovalEntries: Record "Approval Entry";
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        Emp: Record Employee;
        DesignationID: Code[50];
        USetup: Record "User Setup";
        ENo: Code[10];
        Designation: Code[50];
        JOBID: Record "Company Jobs";
        Approver1: array[10] of Code[50];
        Designation1: Code[50];
        Designation2: Code[50];
        CompInfo: Record "Company Information";
        CompName: Text[100];
        CompAdd: Text[100];
        DimValues: Record "Dimension Value";
        Dept: Text[100];
}
