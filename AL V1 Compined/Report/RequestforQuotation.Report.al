#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70002 "Request for Quotation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Request for Quotation.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Supplier Selection1"; "Supplier Selection1")
        {
            DataItemTableView = sorting("Reference No.", "Supplier Name");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Reference No.", "Supplier Name";
            column(ReportForNavId_1000000039; 1000000039)
            {
            }
            column(Supplier_Selection1_Reference_No_; "Reference No.")
            {
            }
            column(Supplier_Selection1_Supplier_Name; "Supplier Name")
            {
            }
            column(SupplierSelection1PhysicalAddress; "Supplier Selection1"."Physical Address")
            {
            }
            column(SupplierAdd; SupplierAdd)
            {
            }
            column(title; title)
            {
            }
            column(ilesikuitaisha; CalcDate('7D', Today))
            {
            }
            column(DocNumberCaption; DocNumber)
            {
            }
            column(CONDITIONSCaption; CONDITIONSCaptionLbl)
            {
            }
            column(ConditionOneCaption; ConditionOneLbl)
            {
            }
            column(ConditionTwoCaption; ConditionTwoLbl)
            {
            }
            column(ConditionThreeCaption; ConditionThreeLbl)
            {
            }
            column(ConditionFourCaption; ConditionFourLbl)
            {
            }
            column(ConditionFiveCaption; ConditionFiveLbl)
            {
            }
            column(ConditionSixCaption; ConditionSixLbl)
            {
            }
            column(ConditionSevenCaption; ConditionSevenLbl)
            {
            }
            column(ConditionEightCaption; ConditionEightLbl)
            {
            }
            column(ConditionNineCaption; ConditionNineLbl)
            {
            }
            column(WitnessTextLbl; WitnessText)
            {
            }
            column(TODAY; Today)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Fax_No_; CompInfo."Fax No.")
            {
            }
            column(CompInfo_Post_Code; CompInfo."Post Code")
            {
            }
            column(CompInfo_Name_Control1000000095; CompInfo.Name)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_City; CompInfo.City)
            {
            }
            column(CompInfo_Phone_No; CompInfo."Phone No.")
            {
            }
            column(Invitation; StrSubstNo(InvitationLbl, ReturnTime, Format(ReturnDate)))
            {
            }
            column(RefCaption; Ref)
            {
            }
            column(Tel; Tel)
            {
            }
            column(FaxNo; Fax)
            {
            }
            column(PBox; StrSubstNo(Address, CompInfo."Address 2", CompInfo."Post Code"))
            {
            }
            column(bdlbl1; bdlbl1)
            {
            }
            column(bdlbl2; bdlbl2)
            {
            }
            column(bdlbl3; bdlbl3)
            {
            }
            column(bdlbl31; bdlbl31)
            {
            }
            column(bdlbl4; bdlbl4)
            {
            }
            column(bdlbl41; bdlbl41)
            {
            }
            column(bdlbl5; bdlbl5)
            {
            }
            column(bdlbl6; bdlbl6)
            {
            }
            column(bdlbl7; bdlbl7)
            {
            }
            column(bdlbl8; bdlbl8)
            {
            }
            column(cond1; cond1)
            {
            }
            column(cond2; cond2)
            {
            }
            column(cond3; cond3)
            {
            }
            column(cond4; cond4)
            {
            }
            column(ReturnDate; ReturnDate)
            {
            }
            column(ReturnTime; ReturnTime)
            {
            }
            dataitem("Procurement Request Lines"; "Procurement Request Lines")
            {
                DataItemLink = "Requisition No" = field("Reference No.");
                DataItemTableView = sorting("Requisition No", "Line No");
                PrintOnlyIfDetail = false;
                column(ReportForNavId_5775; 5775)
                {
                }
                column(Procurement_Request_Lines1__Procurement_Request_Lines1__No; "Procurement Request Lines".No)
                {
                }
                column(Procurement_Request_Lines1_Requisition_No; "Requisition No")
                {
                }
                column(Procurement_Request_Lines1_Description; Description)
                {
                }
                column(Procurement_Request_Lines1_Quantity; Quantity)
                {
                }
                column(Procurement_Request_Lines1__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(UnitPrice_ProcurementRequestLines1; "Procurement Request Lines"."Unit Price")
                {
                }
                column(AmountLcy; "Procurement Request Lines".Amount)
                {
                }
                column(RequisitionNo_ProcurementRequestLines1; "Procurement Request Lines"."Requisition No")
                {
                }
                column(To_Caption; To_CaptionLbl)
                {
                }
                column(Seller_s_Name_and_AddressCaption; Seller_s_Name_and_AddressCaptionLbl)
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(DAYS_TO_DELIVERYCaption; DAYS_TO_DELIVERYCaptionLbl)
                {
                }
                column(Notes_Caption; Notes_CaptionLbl)
                {
                }
                column(UNITCaption; UNITCaptionLbl)
                {
                }
                column(QUANTITY_REQUIREDCaption; QUANTITY_REQUIREDCaptionLbl)
                {
                }
                column(TOTAL_AMOUNTCaption; TOTAL_AMOUNTCaptionLbl)
                {
                }
                column(REMARKSCaption; REMARKSCaptionLbl)
                {
                }
                column(a__THIS_IS_NOT_AN_ORDER_Read_the_conditions_and_instructions_on_reverse_before_quoting_Caption; a__THIS_IS_NOT_AN_ORDER_Read_the_conditions_and_instructions_on_reverse_before_quoting_CaptionLbl)
                {
                }
                column(UNIT_PRICECaption; UNIT_PRICECaptionLbl)
                {
                }
                column(Date_________________________________________________________________________Caption; Date_________________________________________________________________________CaptionLbl)
                {
                }
                column(EmptyStringCaption_Control1000000003; EmptyStringCaption_Control1000000003Lbl)
                {
                }
                column(EmptyStringCaption_Control1000000019; EmptyStringCaption_Control1000000019Lbl)
                {
                }
                column(BRANDCaption; BRANDCaptionLbl)
                {
                }
                column(CODE_No_Caption; CODE_No_CaptionLbl)
                {
                }
                column(ITEM_DESCRIPTIONCaption; ITEM_DESCRIPTIONCaptionLbl)
                {
                }
                column(Quotation_No___________________________________________________________________Caption; Quotation_No___________________________________________________________________CaptionLbl)
                {
                }
                column(From_Caption; From_CaptionLbl)
                {
                }
                column(To_be_endorsed_on_the_envelope_Caption; To_be_endorsed_on_the_envelope_CaptionLbl)
                {
                }
                column(REQUEST_FOR_QUOTATIONCaption; REQUEST_FOR_QUOTATIONCaptionLbl)
                {
                }
                column(COUNTRY_OF_ORIGINCaption; COUNTRY_OF_ORIGINCaptionLbl)
                {
                }
                column(Seller_s_Signature________________________________________________________________Caption; Seller_s_Signature________________________________________________________________CaptionLbl)
                {
                }
                column(Date__________________________________________________________Caption; Date__________________________________________________________CaptionLbl)
                {
                }
                column(Sign_over_Rubber_Stamp_Caption; Sign_over_Rubber_Stamp_CaptionLbl)
                {
                }
                column(Opened_By_Caption; Opened_By_CaptionLbl)
                {
                }
                column(FOR_OFFICIAL_USE_ONLYCaption; FOR_OFFICIAL_USE_ONLYCaptionLbl)
                {
                }
                column(V1__________________________________________________________________________________________Caption; V1__________________________________________________________________________________________CaptionLbl)
                {
                }
                column(Designation_________________________________________________________________________________________Caption; Designation_________________________________________________________________________________________CaptionLbl)
                {
                }
                column(Date_________________________________________________________________________________________Caption; Date_________________________________________________________________________________________CaptionLbl)
                {
                }
                column(V3__________________________________________________________________________________________Caption; V3__________________________________________________________________________________________CaptionLbl)
                {
                }
                column(V2__________________________________________________________________________________________Caption; V2__________________________________________________________________________________________CaptionLbl)
                {
                }
                column(Signature_________________________________________________________________________________________Caption; Signature_________________________________________________________________________________________CaptionLbl)
                {
                }
                // column(DataItem1000000066; Signature_________________________________________________________________________________________Caption_Control1000000066Lbl)
                // {
                // }
                // column(DataItem1000000067; Signature_________________________________________________________________________________________Caption_Control1000000067Lbl)
                // {
                // }
                column(Time_________________________________________________________________________________________Caption; Time_________________________________________________________________________________________CaptionLbl)
                {
                }
                // column(DataItem1000000069; Designation_____Caption_Control1000000069Lbl)
                // {
                // }
                // column(DataItem1000000070; Designation__Caption_Control1000000070Lbl)
                // {
                // }
                column(Procurement_Request_Lines1_Line_No; "Line No")
                {
                }
                column(LeadTimeCaption; LeadTime)
                {
                }
                column(V4Caption; V4)
                {
                }
                column(LineNo_ProcurementRequestLines; "Procurement Request Lines"."Line No")
                {
                }
                column(Specifications_ProcurementRequestLines; "Procurement Request Lines".Specifications)
                {
                }

                trigger OnAfterGetRecord()
                begin


                    ThisLNAmt := ThisLNAmt + "Procurement Request Lines".Amount;
                    RecSeq := RecSeq + 1;
                end;

                trigger OnPreDataItem()
                begin
                    RecSeq := 0;
                end;
            }

            trigger OnAfterGetRecord()
            var
                reqheader: Record "Procurement Request";
            begin
                CompInfo.CalcFields(Picture);

                // MESSAGE('%1',"Supplier Selection1"."Supplier Name");

                ProcurementRequest.Reset;
                ProcurementRequest.SetRange(ProcurementRequest.No, "Supplier Selection1"."Reference No.");
                if ProcurementRequest.Find('-') then begin
                    DocNumber := ProcurementRequest."Document No";
                    ReturnDate := ProcurementRequest."Return Date";
                    ReturnTime := ProcurementRequest."Return Time";
                end;
                //******Hunainaa 28.11.2019 Supplier Physical Address from Vendors
                //IF Vendors.GET("Supplier Selection1"."Supplier Name") THEN
                // SupplierAdd:=Vendors.Address;


                //================================================================
                reqheader.Reset;
                if reqheader.Get("Supplier Selection1"."Reference No.") then begin
                    title := reqheader.Title;
                end;
                //================================================================
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

    trigger OnInitReport()
    begin
        CompInfo.Get;
    end;

    var
        Department: Text[30];
        Dimvalues: Record "Dimension Value";
        Vendors: Record Vendor;
        PrevMonthBud: Decimal;
        CurrMonthBud: Decimal;
        TotAvailableBud: Decimal;
        GLAccount: Record "G/L Account";
        GenLedSetup: Record "General Ledger Setup";
        QtyStore: Record Item;
        GenPostGroup: Record "General Posting Setup";
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "Purchase Header";
        BudgetDate: Date;
        YrBudget: Decimal;
        "BudgetB/F": Decimal;
        RequisitionLine: Record "Purchase Line";
        BudgetGL: Code[30];
        ThisLNAmt: Decimal;
        MonthReqHdr: Record "Purchase Header";
        PeriodTo: Date;
        MonthReq: Record "Purchase Line";
        TotalMonthReq: Decimal;
        RecSeq: Integer;
        DateRequired: Date;
        CompInfo: Record "Company Information";
        CONDITIONSCaptionLbl: label 'NOTE:';
        ConditionOneLbl: label '1. Delivery lead-time and validity period of your quotation MUST be indicated';
        ConditionTwoLbl: label '2. The quotation should be enclosed in plain sealed envelope and the quotation reference number MUST be indicated on the envelope';
        ConditionThreeLbl: label '3. Prices quoted MUST be inclusive of VAT and all other costs where applicable.';
        ConditionFourLbl: label '4. The quotation MUST be stamped and signed.';
        ConditionFiveLbl: label '5. The quotation MUST be placed in the quotation box at NEMA Hqs in South C off Popo Road, Nairobi Kenya.';
        ConditionSixLbl: label '6. The supplier shall retain a COPY of the quotation on the quotation submission date.';
        ConditionSevenLbl: label '7. Attach copies of certificate of registration/Incorporation ';
        ConditionEightLbl: label '8. Failure to observe the above conditions shall lead to automatic disqualification of the bidder';
        ConditionNineLbl: label '9. NEMA reserves the right to accept or reject any bid wholly or in part and does not bind itself to accept any bid.';
        To_CaptionLbl: label 'To:';
        Seller_s_Name_and_AddressCaptionLbl: label 'Seller''s Name and Address';
        EmptyStringCaptionLbl: label '.....................................................................................................................';
        DAYS_TO_DELIVERYCaptionLbl: label 'DAYS TO DELIVERY';
        Notes_CaptionLbl: label 'Notes:';
        UNITCaptionLbl: label 'UNIT';
        QUANTITY_REQUIREDCaptionLbl: label 'QTY';
        TOTAL_AMOUNTCaptionLbl: label 'TOTAL COST';
        REMARKSCaptionLbl: label 'REMARKS';
        a__THIS_IS_NOT_AN_ORDER_Read_the_conditions_and_instructions_on_reverse_before_quoting_CaptionLbl: label '(a) THIS IS NOT AN ORDER.Read the conditions and instructions on reverse before quoting.';
        V10_00_a_m__on_______________________________________________________Lbl: label '10.00 a.m. on.................................................................................................................';
        UNIT_PRICECaptionLbl: label 'UNITCOST';
        InvitationLbl: label 'We invite you to quote for the following listed item(s)/services/Works.Your quote should be received on or before %1 on %2';
        Date_________________________________________________________________________CaptionLbl: label 'Date.........................................................................';
        EmptyStringCaption_Control1000000003Lbl: label '.....................................................................................................................';
        EmptyStringCaption_Control1000000019Lbl: label '.....................................................................................................................';
        BRANDCaptionLbl: label 'BRAND';
        d___Return_the_original_copy_and_retain_the_duplicate_for_your_recordCaptionLbl: label '(d ) Return the original copy and retain the duplicate for your record';
        c__Your_quotation_should_indicate_final_unit_price_which_includes_alll_costs_for_delivery_discount_duty_CaptionLbl: label '(c) Your quotation should indicate final unit price which includes alll costs for delivery,discount,duty ';
        b__This_quotation_should_be_submitted_in_palin_wax_sealed_envelope_marked___Quotation_No__________CLbl: label '(b) This quotation should be submitted in palin wax sealed envelope marked  "Quotation No....................................';
        CODE_No_CaptionLbl: label 'ITEM';
        ITEM_DESCRIPTIONCaptionLbl: label 'DESCRIPTION';
        Quotation_No___________________________________________________________________CaptionLbl: label 'Quotation No. .................................................................';
        From_CaptionLbl: label 'From:';
        The_Director_GeneralCaptionLbl: label 'The Director General';
        To_be_endorsed_on_the_envelope_CaptionLbl: label '(To be endorsed on the envelope)';
        REQUEST_FOR_QUOTATIONCaptionLbl: label 'REQUEST FOR QUOTATION';
        and_sales_tax_CaptionLbl: label 'and sales tax.';
        COUNTRY_OF_ORIGINCaptionLbl: label 'COUNTRY OF ORIGIN';
        Seller_s_Signature________________________________________________________________CaptionLbl: label 'SUPPLIER''S SIGNATURE & STAMP................................................................';
        Date__________________________________________________________CaptionLbl: label 'Date..........................................................';
        Sign_over_Rubber_Stamp_CaptionLbl: label '(Sign over Rubber Stamp)';
        Opened_By_CaptionLbl: label 'Opened By:';
        FOR_OFFICIAL_USE_ONLYCaptionLbl: label 'FOR OFFICIAL USE ONLY';
        V1__________________________________________________________________________________________CaptionLbl: label '(1).........................................................................................';
        Designation_________________________________________________________________________________________CaptionLbl: label 'Designation.........................................................................................';
        Date_________________________________________________________________________________________CaptionLbl: label 'Date.........................................................................................';
        V3__________________________________________________________________________________________CaptionLbl: label '(3).........................................................................................';
        V2__________________________________________________________________________________________CaptionLbl: label '(2).........................................................................................';
        Signature_________________________________________________________________________________________CaptionLbl: label 'Signature.........................................................................................';
        Signature_______________________________________________Caption_Control1000000066Lbl: label 'Signature.........................................................................................';
        Signature__________________________________________________________Caption_Control1000000067Lbl: label 'Signature.........................................................................................';
        Time_________________________________________________________________________________________CaptionLbl: label 'Time.........................................................................................';
        Designation_____________________________________________________Caption_Control1000000069Lbl: label 'Designation.........................................................................................';
        Designation_______________________________________________________Caption_Control1000000070Lbl: label 'Designation.........................................................................................';
        LeadTime: label 'DELIVERY LEADTIME';
        Remarks: label 'REMARKS';
        V4: label '(4).........................................................................................';
        Tel: label 'Tel:';
        Fax: label 'Fax No:';
        Address: label '%1 - %2';
        DocNumber: Code[30];
        WitnessText: label 'OPENED IN THE PRESENCE OF (NAME & SIGN)';
        Ref: label 'REF:';
        ProcurementRequest: Record "Procurement Request";
        ReturnDate: Date;
        ReturnTime: Time;
        bdlbl1: label 'You are Invited to Submit Quotation on materials below:';
        bdlbl2: label 'Notes:';
        bdlbl3: label '                  (a)   THIS IS NOT AN ORDER.';
        bdlbl31: label 'Read the Conditions and Instructions below before quoting.';
        bdlbl4: label '                 (b)  This quotation should be submitted in a plain wax sealed Envelope marked "Quotation No:';
        bdlbl41: label '                        to reach the Buyer or be placed in the Quotation/Tender Box not later than';
        bdlbl5: label '                 (c)   Your Quotation should Include All Costs for Delivery of the Goods/services including Duty, VAT and Delivery Charges etc.';
        bdlbl6: label '                 (d)   Return the Original Copy and Retain the Duplicate for your Record.';
        title: Text;
        bdlbl7: label '                 (e)   Attach the following documents: Certificate of Registration, Valid Tax Compliance Certificate, Dully Filled and Signed Confidential Business Questionnaire and PIN Certificate.';
        bdlbl8: label '                 (f)   You Must indicate the Country of Origin of the goods.';
        cond1: label '1. The General conditions of contract with the Government of Kenya apply to this transaction. This form properly submitted constitutes the entire agreement';
        cond2: label '2. The offer shall remain firm for 30 days from the closing date unless otherwise stipulated by the seller.';
        cond3: label '3. The buyer shall not be bound to accept the lowest or any other offer,and reserves the right to accept any offer  in part unmless the contrary is stipulated by the seller.';
        cond4: label '4. Samples of offers when required will be provided free,and if not destroyed during tests will,upon request ,be returned at the sellers request.';
        SupplierAdd: Text[300];


    procedure GetMonthlyTot(var Periodfrom: Date; var Dept: Code[40]) TotMonthReq: Decimal
    begin
    end;
}

