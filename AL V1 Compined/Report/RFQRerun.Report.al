#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70004 "RFQ Rerun"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/RFQ Rerun.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Supplier Selection1"; "Supplier Selection1")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Supplier_Selection1_Reference_No; "Supplier Selection1"."Reference No.")
            {
            }
            column(Supplier_Selection1_Supplier_Name; "Supplier Selection1"."Supplier Name")
            {
            }
            dataitem("Procurement Request"; "Procurement Request")
            {
                DataItemLink = No = field("Reference No.");
                column(ReportForNavId_1000000076; 1000000076)
                {
                }
                column(Procurement_Request1_Document_No; "Procurement Request"."Document No")
                {
                }
                column(Procurement_Request1_Process_Type; "Procurement Request"."Process Type")
                {
                }
                column(Procurement_Request_Requisition_No; "Procurement Request"."Requisition No")
                {
                }
                column(Procurement_Request1_No; "Procurement Request".No)
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
                column(Invitation; InvitationLbl)
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
                dataitem("Procurement Request Lines"; "Procurement Request Lines")
                {
                    DataItemLink = "Requisition No" = field(No);
                    column(ReportForNavId_1000000001; 1000000001)
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
                    // column(DataItem1000000037; Signature Caption_Control1000000066Lbl)
                    // {
                    // }
                    // column(DataItem1000000036; Signature_________________________________________________________________________________________Caption_Control1000000067Lbl)
                    // {
                    // }
                    // column(Time_________________________________________________________________________________________Caption; Time_________________________________________________________________________________________CaptionLbl)
                    // {
                    // }
                    // column(DataItem1000000034; Designation_________________________________________________________________________________________Caption_Control1000000069Lbl)
                    // {
                    // }
                    // column(DataItem1000000033; Designation_________________________________________________________________________________________Caption_Control1000000070Lbl)
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
                }

                trigger OnAfterGetRecord()
                begin
                    CompInfo.CalcFields(CompInfo.Picture);
                end;
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
        BudgetGL: Code[20];
        ThisLNAmt: Decimal;
        MonthReqHdr: Record "Purchase Header";
        PeriodTo: Date;
        MonthReq: Record "Purchase Line";
        TotalMonthReq: Decimal;
        RecSeq: Integer;
        DateRequired: Date;
        CompInfo: Record "Company Information";
        DocNumber: Code[30];
        ProcurementRequest: Record "Procurement Request";
        CONDITIONSCaptionLbl: label 'NOTE:';
        ConditionOneLbl: label '1. Delivery lead-time and validity period of your quotation MUST be indicated';
        ConditionTwoLbl: label '2. The quotation should be enclosed in plain sealed envelope and the quotation reference number MUST be indicated on the envelope';
        ConditionThreeLbl: label '3. Prices quoted MUST be inclusive of VAT and all other costs where applicable.';
        ConditionFourLbl: label '4. The quotation MUST be stamped and signed.';
        ConditionFiveLbl: label '5. The quotation MUST be placed in the quotation box at CMA Hqs. Embankment Plaza Building 3rd  Floor on 22/02/2012 at 2.00pm.';
        ConditionSixLbl: label '6. The supplier shall return the original copy of the quotation on the quotation submission date.';
        ConditionSevenLbl: label '7. Attach copies of certificate of registration/Incorporation ';
        ConditionEightLbl: label '8. Failure to observe the above conditions shall lead to automatic disqualification of the bidder';
        ConditionNineLbl: label '9. CMA reserves the right to accept or reject any bid wholly or in part and does not bind itself to accept any bid.';
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
        V10_00_a_m__on__________________________________________________________________Lbl: label '10.00 a.m. on.................................................................................................................';
        UNIT_PRICECaptionLbl: label 'UNITCOST';
        InvitationLbl: label 'We invite you to quote for the following listed item(s)/services/Works.Your quote should be received on or before 2.00 P.M on________________________';
        Date_________________________________________________________________________CaptionLbl: label 'Date.........................................................................';
        EmptyStringCaption_Control1000000003Lbl: label '.....................................................................................................................';
        EmptyStringCaption_Control1000000019Lbl: label '.....................................................................................................................';
        BRANDCaptionLbl: label 'BRAND';
        d___Return_the_original_copy_and_retain_the_duplicate_for_your_recordCaptionLbl: label '(d ) Return the original copy and retain the duplicate for your record';
        c__Your_quotation_should_indicate_final_unit_price_which_includes_alll_costs_for_delivery_discount_duty_CaptionLbl: label '(c) Your quotation should indicate final unit price which includes alll costs for delivery,discount,duty ';
        b__This_quotation_should_be_submitted_in_palin_wax_sealed_envelope_marked___Quotation_No___CLbl: label '(b) This quotation should be submitted in palin wax sealed envelope marked  "Quotation No....................................';
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
        Signature__________________________________Caption_Control1000000066Lbl: label 'Signature.........................................................................................';
        Signature______________________________________Caption_Control1000000067Lbl: label 'Signature.........................................................................................';
        Time_________________________________________________________________________________________CaptionLbl: label 'Time.........................................................................................';
        Designation______________________________________________Caption_Control1000000069Lbl: label 'Designation.........................................................................................';
        Designation____________________________________________Caption_Control1000000070Lbl: label 'Designation.........................................................................................';
        LeadTime: label 'DELIVERY LEADTIME';
        Remarks: label 'REMARKS';
        V4: label '(4).........................................................................................';
        Tel: label 'Tel:';
        Fax: label 'Fax No:';
        Address: label '%1 - %2';
        WitnessText: label 'OPENED IN THE PRESENCE OF (NAME & SIGN)';
        Ref: label 'REF:';


    procedure GetMonthlyTot(var Periodfrom: Date; var Dept: Code[20]) TotMonthReq: Decimal
    begin
    end;
}

