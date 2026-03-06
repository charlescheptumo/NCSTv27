#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50011 NavXtenderAddLink
{
    // ************************
    // Copyright Notice
    // This objects content is copyright of Insight Works 2016. All rights reserved.
    // 
    // Any redistribution or reproduction of part or all of the contents in any form
    //  without this copyright notice is prohibited.
    // ************************
    // 
    //  <REVISION author="W.Schock" date="11/16/17" version="IW17.11" issue="N/A">
    //    Add support for 'Deposit'.
    //    Add support for 'Posted Deposit'.
    //    Revise grammer in webservice creation message.
    //    Revise grammer in unsupported page message.
    //  </REVISION>


    trigger OnRun()
    var
        ltxtServiceURL: Text;
        ltcServiceName: label 'NavXtender';
        ltcSoapURL: label 'Soap Url: %1';
        ltcServiceInstalledMessage: label 'Web service created. Copy with Ctrl+C. Paste this link into the web service section of the NavXtender Configuration:\\%1';
     //cc//   lrecWebService: Record "Web Service";
        ltcServiceInstalledMessage2013: label 'Web service installed. Please obtain SOAP URL and update the NavXtender configuration with it.';
    begin
        //<IW >
        //  Creates the web service. Used when codeunit is first imported.
        //</IW>

        // lrecWebService.Validate("Object Type", lrecWebService."object type"::Codeunit);
        // lrecWebService."Service Name" := ltcServiceName;
        // lrecWebService."Object ID" := Codeunit::NavXtenderAddLink;
        // lrecWebService.Validate(Published, true);
        // lrecWebService.Insert(true);

        // uncomment this for NAV2013R2 and up:
        //ltxtServiceURL := GETURL(CLIENTTYPE::SOAP,COMPANYNAME,OBJECTTYPE::Codeunit,CODEUNIT::NavXtenderAddLink);

        if GuiAllowed then
            if ltxtServiceURL = '' then
                Message(ltcServiceInstalledMessage2013)
            else
                Message(ltcServiceInstalledMessage, ltxtServiceURL);
    end;

    var
        ltcGLAccountCard: label 'G/L Account Card';
        ltcCustomerCard: label 'Customer Card';
        ltcVendorCard: label 'Vendor Card';
        ltcItemCard: label 'Item Card';
        ltcSalesQuote: label 'Sales Quote';
        ltcSalesOrder: label 'Sales Order';
        ltcSalesInvoice: label 'Sales Invoice';
        ltcPurchaseQuote: label 'Purchase Quote';
        ltcPurchaseOrder: label 'Purchase Order';
        ltcPurchaseInvoice: label 'Purchase Invoice';
        ltcResourceCard: label 'Resource Card';
        ltcJobCard: label 'Job Card';
        ltcPostedSalesInvoice: label 'Posted Sales Invoice';
        ltcPostedPurchaseInvoice: label 'Posted Purchase Invoice';
        ltcBankAccountCard: label 'Bank Account Card';
        ltcCustomerBankAccountCard: label 'Customer Bank Account Card';
        ltcVendorBankAccountCard: label 'Vendor Bank Account Card';
        ltcFinanceChargeTermsCard: label 'Finance Charge Terms Card';
        ltcCurrencyCard: label 'Currency Card';
        ltcBlanketSalesOrder: label 'Blanket Sales Order';
        ltcBlanketPurchaseOrder: label 'Blanket Purchase Order';
        ltcICGLAccountCard: label 'IC G/L Account Card';
        ltcICPartnerCard: label 'IC Partner Card';
        ltcJobQueueEntryCard: label 'Job Queue Entry Card';
        ltcCashFlowForecastCard: label 'Cash Flow Forecast Card';
        ltcCashFlowAccountCard: label 'Cash Flow Account Card';
        ltcAssemblyOrder: label 'Assembly Order';
        ltcPostedAssemblyOrder: label 'Posted Assembly Order';
        ltcAssemblyQuote: label 'Assembly Quote';
        ltcBlanketAssemblyOrder: label 'Blanket Assembly Order';
        ltcJobTaskCard: label 'Job Task Card';
        ltcCostTypeCard: label 'Cost Type Card';
        ltcCostAllocationTargetCard: label 'Cost Allocation Target Card';
        ltcCostCenterCard: label 'Cost Center Card';
        ltcCostObjectCard: label 'Cost Object Card';
        ltcDataExchDefCard: label 'Data Exchange Definition';
        ltcDataExchLineDefCard: label 'Line Definitions';
        ltcDataExchMappingCard: label 'Field Mapping';
        ltcTransformationRuleCard: label 'Transformation Rule Card';
        ltcPaymentBankAccountCard: label 'Payment Bank Account Card';
        ltcCustTemplateCard: label 'Customer Template';
        ltcItemTemplateCard: label 'Item Template';
        ltcVendorTemplateCard: label 'Vendor Template';
        ltcCurrExchRateServiceCard: label 'Currency Exch. Rate Service';
        ltcDeferralTemplateCard: label 'Deferral Template Card';
        ltcSetupandHelpResourceCard: label 'Setup and Help Resources';
        ltcO365ItemCard: label 'Item';
        ltcO365SalesCustomerCard: label 'Customer';
        ltcO365SalesInvoice: label 'Draft Invoice';
        ltcO365PostedSalesInvoice: label 'Sent Invoice';
        ltcContactCard: label 'Contact Card';
        ltcContactAltAddressCard: label 'Contact Alt. Address Card';
        ltcCampaignCard: label 'Campaign Card';
        ltcTodoCard: label 'To-do Card';
        ltcSalespersonPurchaserCard: label 'Salesperson/Purchaser Card';
        ltcOpportunityCard: label 'Opportunity Card';
        ltcSavedSegmentCriteriaCard: label 'Saved Segment Criteria Card';
        ltcCustomerTemplateCard: label 'Customer Template Card';
        ltcEmployeeCard: label 'Employee Card';
        ltcAlternativeAddressCard: label 'Alternative Address Card';
        ltcCRMSalesOrder: label 'Microsoft Dynamics CRM Sales Order';
        ltcFixedAssetCard: label 'Fixed Asset Card';
        ltcDepreciationBookCard: label 'Depreciation Book Card';
        ltcFAPostingGroupCard: label 'FA Posting Group Card';
        ltcInsuranceCard: label 'Insurance Card';
        ltcDepreciationTableCard: label 'Depreciation Table Card';
        ltcStockkeepingUnitCard: label 'Stockkeeping Unit Card';
        ltcLocationCard: label 'Location Card';
        ltcResponsibilityCenterCard: label 'Responsibility Center Card';
        ltcNonstockItemCard: label 'Nonstock Item Card';
        ltcItemCategoryCard: label 'Item Category Card';
        ltcTransferOrder: label 'Transfer Order';
        ltcSourceDocumentFilterCard: label 'Source Document Filter Card';
        ltcServiceOrder: label 'Service Order';
        ltcLoanerCard: label 'Loaner Card';
        ltcServiceInvoice: label 'Service Invoice';
        ltcStandardServiceCodeCard: label 'Standard Service Code Card';
        ltcServiceQuote: label 'Service Quote';
        ltcPostedServiceInvoice: label 'Posted Service Invoice';
        ltcServiceItemCard: label 'Service Item Card';
        ltcServiceContractQuote: label 'Service Contract Quote';
        ltcSerialNoInformationCard: label 'Serial No. Information Card';
        ltcLotNoInformationCard: label 'Lot No. Information Card';
        ltcItemTrackingCodeCard: label 'Item Tracking Code Card';
        ltcSalesReturnOrder: label 'Sales Return Order';
        ltcPurchaseReturnOrder: label 'Purchase Return Order';
        ltcInvtAnalysisViewCard: label 'Invt. Analysis View Card';
        ltcSalesAnalysisViewCard: label 'Sales Analysis View Card';
        ltcPurchaseAnalysisViewCard: label 'Purch. Analysis View Card';
        ltcBaseCalendarCard: label 'Base Calendar Card';
        ltcConfigPackageCard: label 'Config. Package Card';
        ltcProfileCard: label 'Profile Card';
        ltcUserPersonalizationCard: label 'User Personalization Card';
        ltcUserCard: label 'User Card';
        ltcDeviceCard: label 'Device Card';
        ltcSalesOrderInvoice: label 'Sales Order Invoice';
        ltcInventoryCountCard: label 'Inventory Count Card';
        ltcWMDMPDAConfigCard: label 'WMDM PDA Config Card';
        ltcWMDMApplicationCard: label 'WMDM Application Card';
        ltcDynamicShipCustomsCard: label 'DynamicShip Customs Card';
        ltcDShipShipmentOptionCard: label 'DShip Shipment Option Card';
        ltcWorkCenterCard: label 'Work Center Card';
        ltcMachineCenterCard: label 'Machine Center Card';
        ltcPlannedProductionOrder: label 'Planned Production Order';
        ltcFirmPlannedProdOrder: label 'Firm Planned Prod. Order';
        ltcReleasedProductionOrder: label 'Released Production Order';
        ltcFinishedProductionOrder: label 'Finished Production Order';
        ltcSimulatedProductionOrder: label 'Simulated Production Order';
        ltcRouting: label 'Routing';
        ltcProductionBOM: label 'Production BOM';
        ltcUnsupportedCardError: label 'Drag n'' Drop not supported on %1';
        ltcDeposit: label 'Deposit';
        ltcPostedDeposit: label 'Posted Deposit';
        ImprestMemo: label 'Imprest Memo';
        ImprestSurrender: label 'Imprest Surrender';
        PettyCashVoucher: label 'Petty Cash Voucher';
        StaffClaim: label 'Staff Claim';
        PettyCashSurrender: label 'Petty Cash Surrender';
        ApprovedImprestSurrender: label 'Approved Imprest Surrender';

    procedure AddLinkToRecord(ptxtPageName: Text; ptxtRecordText: Text; ptxtURL: Text; ptxtDescription: Text)
    var
        lrrRecRef: RecordRef;
        lriRecordID: RecordID;
        ltxtPrimaryKey: Text;
        liTableID: Integer;
        ltcUnsupportedCardError: label 'Record Links are not supported on %1';
    begin
        //<IW >
        //  Converts a Page Name to the corelated Table ID and builds the primary key.
        //  Then calls method to add the link to the record.
        //</IW>

        //assume default key is ptxtRecordText, handle special cards by case
        ltxtPrimaryKey := ptxtRecordText;

        case ptxtPageName of
            ltcCurrencyCard:
                liTableID := Database::Currency; //4
            ltcFinanceChargeTermsCard:
                liTableID := Database::"Finance Charge Terms"; //5
            ltcSalespersonPurchaserCard:
                liTableID := Database::"Salesperson/Purchaser"; //13
            ltcLocationCard:
                liTableID := Database::Location; //14
            ltcGLAccountCard:
                liTableID := Database::"G/L Account"; //15
            ltcCustomerCard:
                liTableID := Database::Customer; //18
            ltcO365SalesCustomerCard:
                liTableID := Database::Customer; //18
            ltcVendorCard:
                liTableID := Database::Vendor; //23
            ltcItemCard:
                liTableID := Database::Item;//27
            ltcO365ItemCard:
                liTableID := Database::Item; //27
            ImprestMemo:
                liTableID := Database::"Imprest Memo";//imprest memo
            ImprestSurrender:
                liTableID := Database::Payments;//imprest surrender
            PettyCashVoucher:
                liTableID := Database::Payments;//petty cash voucher
            StaffClaim:
                liTableID := Database::Payments;//staff claim
            PettyCashSurrender:
                liTableID := Database::Payments;
            ApprovedImprestSurrender:
                liTableID := Database::Payments;

            ltcSalesQuote:
                begin
                    liTableID := Database::"Sales Header"; //36
                    ltxtPrimaryKey := '0,' + ptxtRecordText; //0 = Quote
                end;
            ltcSalesOrder:
                begin
                    liTableID := Database::"Sales Header"; //36
                    ltxtPrimaryKey := '1,' + ptxtRecordText; //1 = Order
                end;
            ltcSalesInvoice:
                begin
                    liTableID := Database::"Sales Header"; //36
                    ltxtPrimaryKey := '2,' + ptxtRecordText; //2 = Invoice
                end;
            ltcBlanketSalesOrder:
                begin
                    liTableID := Database::"Sales Header"; //36
                    ltxtPrimaryKey := '4,' + ptxtRecordText; //4 = Blanket Order
                end;
            ltcO365SalesInvoice:
                begin
                    liTableID := Database::"Sales Header"; //36
                    ltxtPrimaryKey := '2,' + ptxtRecordText; //2 = Invoice
                end;
            ltcSalesReturnOrder:
                begin
                    liTableID := Database::"Sales Header"; //36
                    ltxtPrimaryKey := '5,' + ptxtRecordText; //5 = Return Order
                end;
            ltcSalesOrderInvoice:
                begin
                    liTableID := Database::"Sales Header"; //36
                    ltxtPrimaryKey := '1,' + ptxtRecordText; //1 = Order
                end;
            ltcPurchaseQuote:
                begin
                    liTableID := Database::"Purchase Header"; //38
                    ltxtPrimaryKey := '0,' + ptxtRecordText; //0 = Quote
                end;
            ltcPurchaseOrder:
                begin
                    liTableID := Database::"Purchase Header"; //38
                    ltxtPrimaryKey := '1,' + ptxtRecordText; //1 = Order
                end;
            ltcPurchaseInvoice:
                begin
                    liTableID := Database::"Purchase Header"; //38
                    ltxtPrimaryKey := '2,' + ptxtRecordText; //2 = Invoice
                end;
            ltcBlanketPurchaseOrder:
                begin
                    liTableID := Database::"Purchase Header"; //38
                    ltxtPrimaryKey := '4,' + ptxtRecordText; //4 = Blanket Order
                end;
            ltcPurchaseReturnOrder:
                begin
                    liTableID := Database::"Purchase Header"; //38
                    ltxtPrimaryKey := '5,' + ptxtRecordText; //5 = Return Order
                end;
            ltcPostedSalesInvoice:
                liTableID := Database::"Sales Invoice Header"; //112
            ltcO365PostedSalesInvoice:
                liTableID := Database::"Sales Invoice Header"; //112
            ltcPostedPurchaseInvoice:
                liTableID := Database::"Purch. Inv. Header"; //122
            ltcResourceCard:
                liTableID := Database::Resource; //156
            ltcJobCard:
                begin
                    liTableID := Database::Job; //167
                    ltxtPrimaryKey := '"' + ptxtRecordText + '"';
                end;
            ltcBankAccountCard:
                liTableID := Database::"Bank Account"; //270
            ltcPaymentBankAccountCard:
                liTableID := Database::"Bank Account"; //270
            ltcICGLAccountCard:
                liTableID := Database::"IC G/L Account"; //410
            ltcICPartnerCard:
                liTableID := Database::"IC Partner"; //413
            ltcCashFlowForecastCard:
                liTableID := Database::"Cash Flow Forecast"; //840
            ltcCashFlowAccountCard:
                liTableID := Database::"Cash Flow Account"; //841
            ltcAssemblyOrder:
                begin
                    liTableID := Database::"Assembly Header"; //900
                    ltxtPrimaryKey := '1,' + ptxtRecordText;//1 = Order
                end;
            ltcAssemblyQuote:
                begin
                    liTableID := Database::"Assembly Header"; //900
                    ltxtPrimaryKey := '0,' + ptxtRecordText; //0 = Quote
                end;
            ltcBlanketAssemblyOrder:
                begin
                    liTableID := Database::"Assembly Header"; //900
                    ltxtPrimaryKey := '4,' + ptxtRecordText; //4 = Blanket Order
                end;
            ltcPostedAssemblyOrder:
                liTableID := Database::"Posted Assembly Header"; //910
            ltcCostTypeCard:
                liTableID := Database::"Cost Type"; //1103
            ltcCostCenterCard:
                liTableID := Database::"Cost Center"; //1112
            ltcCostObjectCard:
                liTableID := Database::"Cost Object"; //1113
                                                      //  ltcDataExchDefCard: liTableID := DATABASE::"Data Exch. Def"; //1222
                                                      //  ltcTransformationRuleCard: liTableID := DATABASE::"Transformation Rule"; //1237
                                                      //  ltcCurrExchRateServiceCard: liTableID := DATABASE::"Curr. Exch. Rate Update Setup"; //1650
                                                      //  ltcDeferralTemplateCard: liTableID := DATABASE::"Deferral Template"; //1700
            ltcContactCard:
                liTableID := Database::Contact; //5050
            ltcCampaignCard:
                liTableID := Database::Campaign; //5071
            ltcTodoCard:
                liTableID := Database::"To-do"; //5080
            ltcOpportunityCard:
                liTableID := Database::Opportunity; //5092
            ltcSavedSegmentCriteriaCard:
                liTableID := Database::"Saved Segment Criteria"; //5098 //UNTESTED
        //cc//    ltcCustomerTemplateCard:
               //cc// liTableID := Database::"Customer Template"; //5105
            ltcEmployeeCard:
                liTableID := Database::Employee; //5200
            ltcPlannedProductionOrder:
                begin
                    liTableID := Database::"Production Order"; //5405
                    ltxtPrimaryKey := '1,' + ptxtRecordText; //1 = Planned
                end;
            ltcFirmPlannedProdOrder:
                begin
                    liTableID := Database::"Production Order"; //5405
                    ltxtPrimaryKey := '2,' + ptxtRecordText; //2 = Firm Planned
                end;
            ltcReleasedProductionOrder:
                begin
                    liTableID := Database::"Production Order"; //5405
                    ltxtPrimaryKey := '3,' + ptxtRecordText; //3 = Released
                end;
            ltcFinishedProductionOrder:
                begin
                    liTableID := Database::"Production Order"; //5405
                    ltxtPrimaryKey := '4,' + ptxtRecordText; //4 = Finished
                end;
            ltcSimulatedProductionOrder:
                begin
                    liTableID := Database::"Production Order"; //5405
                    ltxtPrimaryKey := '0,' + ptxtRecordText; //0 = Simulated
                end;
            ltcFixedAssetCard:
                liTableID := Database::"Fixed Asset"; //5600
            ltcFAPostingGroupCard:
                liTableID := Database::"FA Posting Group"; //5606
            ltcDepreciationBookCard:
                liTableID := Database::"Depreciation Book"; //5611
            ltcInsuranceCard:
                liTableID := Database::Insurance; //5628
            ltcDepreciationTableCard:
                liTableID := Database::"Depreciation Table Header"; //5642
            ltcNonstockItemCard:
                liTableID := Database::"Nonstock Item"; //5718
            ltcResponsibilityCenterCard:
                liTableID := Database::"Responsibility Center"; //5714
            ltcItemCategoryCard:
                liTableID := Database::"Item Category"; //5722
            ltcTransferOrder:
                liTableID := Database::"Transfer Header"; //5740
            ltcServiceOrder:
                begin
                    liTableID := Database::"Service Header"; //5900
                    ltxtPrimaryKey := '1,' + ptxtRecordText; //1 = Order
                end;
            ltcServiceInvoice:
                begin
                    liTableID := Database::"Service Header"; //5900
                    ltxtPrimaryKey := '2,' + ptxtRecordText; //2 = Invoice
                end;
            ltcServiceQuote:
                begin
                    liTableID := Database::"Service Header"; //5900
                    ltxtPrimaryKey := '0,' + ptxtRecordText; //0 = Quote
                end;
            ltcLoanerCard:
                liTableID := Database::Loaner; //5913
            ltcServiceItemCard:
                liTableID := Database::"Service Item"; //5940
            ltcPostedServiceInvoice:
                liTableID := Database::"Service Invoice Header"; //5992
            ltcStandardServiceCodeCard:
                liTableID := Database::"Standard Service Code"; //5996
            ltcItemTrackingCodeCard:
                liTableID := Database::"Item Tracking Code"; //6502
            ltcSerialNoInformationCard:
                liTableID := Database::"Serial No. Information"; //6504
            ltcLotNoInformationCard:
                liTableID := Database::"Lot No. Information"; //6505
            ltcInvtAnalysisViewCard:
                begin
                    liTableID := Database::"Item Analysis View"; //7152
                    ltxtPrimaryKey := '2,' + ptxtRecordText; //2 = Inventory
                end;
            ltcSalesAnalysisViewCard:
                begin
                    liTableID := Database::"Item Analysis View"; //7152
                    ltxtPrimaryKey := '0,' + ptxtRecordText; //0 = Sales
                end;
            ltcPurchaseAnalysisViewCard:
                begin
                    liTableID := Database::"Item Analysis View"; //7152
                    ltxtPrimaryKey := '1,' + ptxtRecordText; //1 = Purchase
                end;
            ltcBaseCalendarCard:
                liTableID := Database::"Base Calendar"; //7600
            ltcConfigPackageCard:
                liTableID := Database::"Config. Package"; //8623
            // ltcDeposit:
            //     liTableID := Database::Table10140; //10140
            // ltcPostedDeposit:
            //     liTableID := Database::Table10143; //10143
            ltcWorkCenterCard:
                liTableID := Database::"Work Center"; //99000754
            ltcMachineCenterCard:
                liTableID := Database::"Machine Center"; //99000758
            ltcRouting:
                liTableID := Database::"Routing Header"; //99000763
            ltcProductionBOM:
                liTableID := Database::"Production BOM Header"; //99000771
            ltcDeviceCard:
                liTableID := Database::Device; //2000000130

            //ID instead of table name in case table doesn't exist (will not compile)
            ltcInventoryCountCard:
                liTableID := 23044304; //Inventory Count Header //UNTESTED
            ltcWMDMPDAConfigCard:
                liTableID := 23044504; //WMDM PDA Configuration
            ltcWMDMApplicationCard:
                liTableID := 23044527; //WMDM Application
            ltcDynamicShipCustomsCard:
                liTableID := 23044605; //DynamicShip Customs Header //UNTESTED
            ltcDShipShipmentOptionCard:
                liTableID := 23044608; //DynamicShip Shipment Option
            else
                Error(ltcUnsupportedCardError, ptxtPageName);
        end;//case

        LinkToRecord(liTableID, ltxtPrimaryKey, ptxtURL, ptxtDescription);
    end;


    procedure LinkToRecord(piTableID: Integer; ptxtPrimaryKey: Text; ptxtURL: Text; ptxtDescription: Text)
    var
        lrrRecRef: RecordRef;
        lriRecordID: RecordID;
    begin
        //<IW  >
        //  Adds a link to a record associated with Table ID and primary key.
        //</IW>
        lrrRecRef.Open(piTableID, false);
        ptxtPrimaryKey := lrrRecRef.Name + ': ' + ptxtPrimaryKey;
        Evaluate(lriRecordID, ptxtPrimaryKey);
        lrrRecRef.Get(lriRecordID);
        lrrRecRef.AddLink(ptxtURL, ptxtDescription);
    end;
}
