#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69052 "New 2 page Payslip"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/New 2 page Payslip.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") order(ascending) where(Status = const(Active));
            RequestFilterFields = "Pay Period Filter", "No.", "Posting Group";
            column(ReportForNavId_7528; 7528)
            {
            }
            column(ArrEarnings_1_1_; ArrEarnings[1, 1])
            {
            }
            column(ArrEarnings_1_2_; ArrEarnings[1, 2])
            {
            }
            column(ArrEarnings_1_3_; ArrEarnings[1, 3])
            {
            }
            column(ArrEarningsAmt_1_1_; ArrEarningsAmt[1, 1])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_2_; ArrEarningsAmt[1, 2])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_3_; ArrEarningsAmt[1, 3])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_1_4_; ArrEarnings[1, 4])
            {
            }
            column(ArrEarningsAmt_1_4_; ArrEarningsAmt[1, 4])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_1_5_; ArrEarnings[1, 5])
            {
            }
            column(ArrEarningsAmt_1_5_; ArrEarningsAmt[1, 5])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_1_6_; ArrEarnings[1, 6])
            {
            }
            column(ArrEarningsAmt_1_6_; ArrEarningsAmt[1, 6])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_1_7_; ArrEarnings[1, 7])
            {
            }
            column(ArrEarningsAmt_1_7_; ArrEarningsAmt[1, 7])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_1_8_; ArrEarnings[1, 8])
            {
            }
            column(ArrEarningsAmt_1_8_; ArrEarningsAmt[1, 8])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_9_; ArrEarningsAmt[1, 9])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_10_; ArrEarningsAmt[1, 10])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_11_; ArrEarningsAmt[1, 11])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_12_; ArrEarningsAmt[1, 12])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_13_; ArrEarningsAmt[1, 13])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_14_; ArrEarningsAmt[1, 14])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_1_15_; ArrEarningsAmt[1, 15])
            {
            }
            column(ArrEarningsAmt_1_16_; ArrEarningsAmt[1, 16])
            {
            }
            column(ArrEarnings_1_9_; ArrEarnings[1, 9])
            {
            }
            column(ArrEarnings_1_10_; ArrEarnings[1, 10])
            {
            }
            column(ArrEarnings_1_11_; ArrEarnings[1, 11])
            {
            }
            column(ArrEarnings_1_12_; ArrEarnings[1, 12])
            {
            }
            column(ArrEarnings_1_13_; ArrEarnings[1, 13])
            {
            }
            column(ArrEarnings_1_14_; ArrEarnings[1, 14])
            {
            }
            column(ArrEarnings_1_15_; ArrEarnings[1, 15])
            {
            }
            column(ArrEarnings_1_16_; ArrEarnings[1, 16])
            {
            }
            column(ArrEarningsAmt_1_17_; ArrEarningsAmt[1, 17])
            {
            }
            column(ArrEarnings_1_17_; ArrEarnings[1, 17])
            {
            }
            column(ArrEarnings_1_18_; ArrEarnings[1, 18])
            {
            }
            column(ArrEarnings_1_19_; ArrEarnings[1, 19])
            {
            }
            column(ArrEarnings_1_20_; ArrEarnings[1, 20])
            {
            }
            column(ArrEarnings_1_21_; ArrEarnings[1, 21])
            {
            }
            column(ArrEarnings_1_22_; ArrEarnings[1, 22])
            {
            }
            column(ArrEarnings_1_23_; ArrEarnings[1, 23])
            {
            }
            column(ArrEarnings_1_25_; ArrEarnings[1, 25])
            {
            }
            column(ArrEarnings_1_26_; ArrEarnings[1, 26])
            {
            }
            column(ArrEarnings_1_34_; ArrEarnings[1, 34])
            {
            }
            column(ArrEarnings_1_33_; ArrEarnings[1, 33])
            {
            }
            column(ArrEarnings_1_32_; ArrEarnings[1, 32])
            {
            }
            column(ArrEarnings_1_31_; ArrEarnings[1, 31])
            {
            }
            column(ArrEarnings_1_30_; ArrEarnings[1, 30])
            {
            }
            column(ArrEarnings_1_29_; ArrEarnings[1, 29])
            {
            }
            column(ArrEarnings_1_28_; ArrEarnings[1, 28])
            {
            }
            column(ArrEarnings_1_27_; ArrEarnings[1, 27])
            {
            }
            column(ArrEarnings_1_41_; ArrEarnings[1, 41])
            {
            }
            column(ArrEarnings_1_40_; ArrEarnings[1, 40])
            {
            }
            column(ArrEarnings_1_39_; ArrEarnings[1, 39])
            {
            }
            column(ArrEarnings_1_38_; ArrEarnings[1, 38])
            {
            }
            column(ArrEarnings_1_37_; ArrEarnings[1, 37])
            {
            }
            column(ArrEarnings_1_36_; ArrEarnings[1, 36])
            {
            }
            column(ArrEarnings_1_35_; ArrEarnings[1, 35])
            {
            }
            column(ArrEarningsAmt_1_33_; ArrEarningsAmt[1, 33])
            {
            }
            column(ArrEarningsAmt_1_32_; ArrEarningsAmt[1, 32])
            {
            }
            column(ArrEarningsAmt_1_31_; ArrEarningsAmt[1, 31])
            {
            }
            column(ArrEarningsAmt_1_30_; ArrEarningsAmt[1, 30])
            {
            }
            column(ArrEarningsAmt_1_29_; ArrEarningsAmt[1, 29])
            {
            }
            column(ArrEarningsAmt_1_28_; ArrEarningsAmt[1, 28])
            {
            }
            column(ArrEarningsAmt_1_27_; ArrEarningsAmt[1, 27])
            {
            }
            column(ArrEarningsAmt_1_26_; ArrEarningsAmt[1, 26])
            {
            }
            column(ArrEarningsAmt_1_25_; ArrEarningsAmt[1, 25])
            {
            }
            column(ArrEarningsAmt_1_24_; ArrEarningsAmt[1, 24])
            {
            }
            column(ArrEarningsAmt_1_23_; ArrEarningsAmt[1, 23])
            {
            }
            column(ArrEarningsAmt_1_22_; ArrEarningsAmt[1, 22])
            {
            }
            column(ArrEarningsAmt_1_21_; ArrEarningsAmt[1, 21])
            {
            }
            column(ArrEarningsAmt_1_20_; ArrEarningsAmt[1, 20])
            {
            }
            column(ArrEarningsAmt_1_19_; ArrEarningsAmt[1, 19])
            {
            }
            column(ArrEarningsAmt_1_18_; ArrEarningsAmt[1, 18])
            {
            }
            column(ArrEarnings_1_24_; ArrEarnings[1, 24])
            {
            }
            column(ArrEarningsAmt_1_39_; ArrEarningsAmt[1, 39])
            {
            }
            column(ArrEarningsAmt_1_38_; ArrEarningsAmt[1, 38])
            {
            }
            column(ArrEarningsAmt_1_37_; ArrEarningsAmt[1, 37])
            {
            }
            column(ArrEarningsAmt_1_36_; ArrEarningsAmt[1, 36])
            {
            }
            column(ArrEarningsAmt_1_35_; ArrEarningsAmt[1, 35])
            {
            }
            column(ArrEarningsAmt_1_34_; ArrEarningsAmt[1, 34])
            {
            }
            column(ArrEarningsAmt_1_41_; ArrEarningsAmt[1, 41])
            {
            }
            column(ArrEarningsAmt_1_40_; ArrEarningsAmt[1, 40])
            {
            }
            column(ArrEarningsAmt_1_43_; ArrEarningsAmt[1, 43])
            {
            }
            column(ArrEarningsAmt_1_42_; ArrEarningsAmt[1, 42])
            {
            }
            column(ArrEarningsAmt_1_45_; ArrEarningsAmt[1, 45])
            {
            }
            column(ArrEarningsAmt_1_44_; ArrEarningsAmt[1, 44])
            {
            }
            column(ArrEarnings_1_45_; ArrEarnings[1, 45])
            {
            }
            column(ArrEarnings_1_44_; ArrEarnings[1, 44])
            {
            }
            column(ArrEarnings_1_43_; ArrEarnings[1, 43])
            {
            }
            column(ArrEarnings_1_42_; ArrEarnings[1, 42])
            {
            }
            column(ArrEarnings_2_1_; ArrEarnings[2, 1])
            {
            }
            column(ArrEarnings_2_2_; ArrEarnings[2, 2])
            {
            }
            column(ArrEarnings_2_3_; ArrEarnings[2, 3])
            {
            }
            column(ArrEarnings_2_4_; ArrEarnings[2, 4])
            {
            }
            column(ArrEarnings_2_5_; ArrEarnings[2, 5])
            {
            }
            column(ArrEarnings_2_6_; ArrEarnings[2, 6])
            {
            }
            column(ArrEarnings_2_7_; ArrEarnings[2, 7])
            {
            }
            column(ArrEarningsAmt_2_1_; ArrEarningsAmt[2, 1])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_2_2_; ArrEarningsAmt[2, 2])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_2_3_; ArrEarningsAmt[2, 3])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_2_4_; ArrEarningsAmt[2, 4])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_2_5_; ArrEarningsAmt[2, 5])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_2_6_; ArrEarningsAmt[2, 6])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_2_7_; ArrEarningsAmt[2, 7])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_2_8_; ArrEarnings[2, 8])
            {
            }
            column(ArrEarningsAmt_2_8_; ArrEarningsAmt[2, 8])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarningsAmt_2_9_; ArrEarningsAmt[2, 9])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_2_9_; ArrEarnings[2, 9])
            {
            }
            column(ArrEarningsAmt_2_10_; ArrEarningsAmt[2, 10])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_2_10_; ArrEarnings[2, 10])
            {
            }
            column(ArrEarningsAmt_2_11_; ArrEarningsAmt[2, 11])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_2_11_; ArrEarnings[2, 11])
            {
            }
            column(ArrEarningsAmt_2_12_; ArrEarningsAmt[2, 12])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_2_12_; ArrEarnings[2, 12])
            {
            }
            column(ArrEarningsAmt_2_13_; ArrEarningsAmt[2, 13])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_2_13_; ArrEarnings[2, 13])
            {
            }
            column(ArrEarningsAmt_2_14_; ArrEarningsAmt[2, 14])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ArrEarnings_2_14_; ArrEarnings[2, 14])
            {
            }
            column(ArrEarningsAmt_2_15_; ArrEarningsAmt[2, 15])
            {
            }
            column(ArrEarnings_2_15_; ArrEarnings[2, 15])
            {
            }
            column(ArrEarningsAmt_2_16_; ArrEarningsAmt[2, 16])
            {
            }
            column(ArrEarnings_2_16_; ArrEarnings[2, 16])
            {
            }
            column(ArrEarningsAmt_2_17_; ArrEarningsAmt[2, 17])
            {
            }
            column(ArrEarnings_2_17_; ArrEarnings[2, 17])
            {
            }
            column(ArrEarnings_2_18_; ArrEarnings[2, 18])
            {
            }
            column(ArrEarningsAmt_2_18_; ArrEarningsAmt[2, 18])
            {
            }
            column(ArrEarnings_2_19_; ArrEarnings[2, 19])
            {
            }
            column(ArrEarningsAmt_2_19_; ArrEarningsAmt[2, 19])
            {
            }
            column(ArrEarnings_2_20_; ArrEarnings[2, 20])
            {
            }
            column(ArrEarningsAmt_2_20_; ArrEarningsAmt[2, 20])
            {
            }
            column(ArrEarnings_2_21_; ArrEarnings[2, 21])
            {
            }
            column(ArrEarningsAmt_2_21_; ArrEarningsAmt[2, 21])
            {
            }
            column(ArrEarnings_2_22_; ArrEarnings[2, 22])
            {
            }
            column(ArrEarningsAmt_2_22_; ArrEarningsAmt[2, 22])
            {
            }
            column(ArrEarnings_2_23_; ArrEarnings[2, 23])
            {
            }
            column(ArrEarningsAmt_2_23_; ArrEarningsAmt[2, 23])
            {
            }
            column(ArrEarningsAmt_2_24_; ArrEarningsAmt[2, 24])
            {
            }
            column(ArrEarnings_2_24_; ArrEarnings[2, 24])
            {
            }
            column(ArrEarnings_2_25_; ArrEarnings[2, 25])
            {
            }
            column(ArrEarningsAmt_2_25_; ArrEarningsAmt[2, 25])
            {
            }
            column(ArrEarnings_2_26_; ArrEarnings[2, 26])
            {
            }
            column(ArrEarningsAmt_2_26_; ArrEarningsAmt[2, 26])
            {
            }
            column(ArrEarnings_2_27_; ArrEarnings[2, 27])
            {
            }
            column(ArrEarningsAmt_2_27_; ArrEarningsAmt[2, 27])
            {
            }
            column(ArrEarnings_2_28_; ArrEarnings[2, 28])
            {
            }
            column(ArrEarningsAmt_2_28_; ArrEarningsAmt[2, 28])
            {
            }
            column(ArrEarnings_2_30_; ArrEarnings[2, 30])
            {
            }
            column(ArrEarnings_2_29_; ArrEarnings[2, 29])
            {
            }
            column(ArrEarningsAmt_2_30_; ArrEarningsAmt[2, 30])
            {
            }
            column(ArrEarningsAmt_2_29_; ArrEarningsAmt[2, 29])
            {
            }
            column(ArrEarnings_2_32_; ArrEarnings[2, 32])
            {
            }
            column(ArrEarnings_2_31_; ArrEarnings[2, 31])
            {
            }
            column(ArrEarningsAmt_2_32_; ArrEarningsAmt[2, 32])
            {
            }
            column(ArrEarningsAmt_2_31_; ArrEarningsAmt[2, 31])
            {
            }
            column(ArrEarnings_2_34_; ArrEarnings[2, 34])
            {
            }
            column(ArrEarnings_2_33_; ArrEarnings[2, 33])
            {
            }
            column(ArrEarningsAmt_2_33_; ArrEarningsAmt[2, 33])
            {
            }
            column(ArrEarningsAmt_2_34_; ArrEarningsAmt[2, 34])
            {
            }
            column(ArrEarnings_2_36_; ArrEarnings[2, 36])
            {
            }
            column(ArrEarnings_2_35_; ArrEarnings[2, 35])
            {
            }
            column(ArrEarningsAmt_2_36_; ArrEarningsAmt[2, 36])
            {
            }
            column(ArrEarningsAmt_2_35_; ArrEarningsAmt[2, 35])
            {
            }
            column(ArrEarnings_2_38_; ArrEarnings[2, 38])
            {
            }
            column(ArrEarnings_2_37_; ArrEarnings[2, 37])
            {
            }
            column(ArrEarningsAmt_2_38_; ArrEarningsAmt[2, 38])
            {
            }
            column(ArrEarningsAmt_2_37_; ArrEarningsAmt[2, 37])
            {
            }
            column(ArrEarnings_2_40_; ArrEarnings[2, 40])
            {
            }
            column(ArrEarnings_2_39_; ArrEarnings[2, 39])
            {
            }
            column(ArrEarningsAmt_2_39_; ArrEarningsAmt[2, 39])
            {
            }
            column(ArrEarningsAmt_2_40_; ArrEarningsAmt[2, 40])
            {
            }
            column(ArrEarnings_2_41_; ArrEarnings[2, 41])
            {
            }
            column(ArrEarningsAmt_2_41_; ArrEarningsAmt[2, 41])
            {
            }
            column(ArrEarningsAmt_2_42_; ArrEarningsAmt[2, 42])
            {
            }
            column(ArrEarnings_2_42_; ArrEarnings[2, 42])
            {
            }
            column(ArrEarningsAmt_2_43_; ArrEarningsAmt[2, 43])
            {
            }
            column(ArrEarningsAmt_2_44_; ArrEarningsAmt[2, 44])
            {
            }
            column(ArrEarnings_2_44_; ArrEarnings[2, 44])
            {
            }
            column(ArrEarnings_2_43_; ArrEarnings[2, 43])
            {
            }
            column(ArrEarningsAmt_2_45_; ArrEarningsAmt[2, 45])
            {
            }
            column(ArrEarnings_2_45_; ArrEarnings[2, 45])
            {
            }
            column(DeptArr_1_1_; DeptArr[1, 1])
            {
            }
            column(Addr_1__2_; Addr[1] [2])
            {
            }
            column(Addr_1__1_; Addr[1] [1])
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____; UpperCase(Format(DateSpecified, 0, '<month text> <year4>')))
            {
            }
            column(CoName; CoName)
            {
            }
            column(CoRec_Picture; CoRec.Picture)
            {
            }
            column(Addr_1__3_; Addr[1] [3])
            {
            }
            column(Addr_2__3_; Addr[2] [3])
            {
            }
            column(Addr_2__2_; Addr[2] [2])
            {
            }
            column(Addr_2__1_; Addr[2] [1])
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4_____Control1000000283; UpperCase(Format(DateSpecified, 0, '<month text> <year4>')))
            {
            }
            column(CoName_Control1000000284; CoName)
            {
            }
            column(CoRec_Picture_Control1000000285; CoRec.Picture)
            {
            }
            column(Addr_1__4_; Addr[1] [4])
            {
            }
            column(Addr_1__5_; Addr[1] [5])
            {
            }
            column(Addr_1__6_; Addr[1] [6])
            {
            }
            column(Addr_2__6_; Addr[2] [6])
            {
            }
            column(Addr_2__5_; Addr[2] [5])
            {
            }
            column(Addr_2__4_; Addr[2] [4])
            {
            }
            column(BranchArr_1_1_; BranchArr[1, 1])
            {
            }
            column(PayPointArr_1_1_; PayPointArr[1, 1])
            {
            }
            column(PayPointArr_2_1_; PayPointArr[2, 1])
            {
            }
            column(BranchArr_2_1_; BranchArr[2, 1])
            {
            }
            column(DeptArr_2_1_; DeptArr[2, 1])
            {
            }
            column(MessageArr_1_1_; MessageArr[1, 1])
            {
            }
            column(MessageArr_2_1_; MessageArr[2, 1])
            {
            }
            column(EARNINGSCaption; EARNINGSCaptionLbl)
            {
            }
            column(AMOUNTCaption; AMOUNTCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(EARNINGSCaption_Control1000000054; EARNINGSCaption_Control1000000054Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000055; EmptyStringCaption_Control1000000055Lbl)
            {
            }
            column(AMOUNTCaption_Control1000000083; AMOUNTCaption_Control1000000083Lbl)
            {
            }
            column(PAY_SLIPCaption; PAY_SLIPCaptionLbl)
            {
            }
            column(EMPLOYEE_NO_Caption; EMPLOYEE_NO_CaptionLbl)
            {
            }
            column(NAME_Caption; NAME_CaptionLbl)
            {
            }
            column(DEPARTMENT_Caption; DEPARTMENT_CaptionLbl)
            {
            }
            column(I_D_NO_Caption; I_D_NO_CaptionLbl)
            {
            }
            column(PAY_SLIPCaption_Control1000000282; PAY_SLIPCaption_Control1000000282Lbl)
            {
            }
            column(EMPLOYEE_NO_Caption_Control1000000291; EMPLOYEE_NO_Caption_Control1000000291Lbl)
            {
            }
            column(I_D_NO_Caption_Control1000000293; I_D_NO_Caption_Control1000000293Lbl)
            {
            }
            column(NAME_Caption_Control1000000294; NAME_Caption_Control1000000294Lbl)
            {
            }
            column(P_I_N_NO_Caption; P_I_N_NO_CaptionLbl)
            {
            }
            column(N_S_S_F_NO_Caption; N_S_S_F_NO_CaptionLbl)
            {
            }
            column(N_H_I_F_NO_Caption; N_H_I_F_NO_CaptionLbl)
            {
            }
            column(N_S_S_F_NO_Caption_Control1000000311; N_S_S_F_NO_Caption_Control1000000311Lbl)
            {
            }
            column(N_H_I_F_NO_Caption_Control1000000312; N_H_I_F_NO_Caption_Control1000000312Lbl)
            {
            }
            column(P_I_N_NO_Caption_Control1000000314; P_I_N_NO_Caption_Control1000000314Lbl)
            {
            }
            column(BRANCH_Caption; BRANCH_CaptionLbl)
            {
            }
            column(PAYPOINT_Caption; PAYPOINT_CaptionLbl)
            {
            }
            column(DEPARTMENT_Caption_Control1000000163; DEPARTMENT_Caption_Control1000000163Lbl)
            {
            }
            column(BRANCH_Caption_Control1000000164; BRANCH_Caption_Control1000000164Lbl)
            {
            }
            column(PAYPOINT_Caption_Control1000000165; PAYPOINT_Caption_Control1000000165Lbl)
            {
            }
            column(Employee_No_; Employee."No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                RecordNo := RecordNo + 1;
                ColumnNo := ColumnNo + 1;

                /*
                 CLEAR(Addr);
                 CLEAR(DeptArr);
                 CLEAR(BasicPay);
                 CLEAR(EmpArray);
                 CLEAR(ArrEarnings);
                 CLEAR(ArrEarningsAmt);
                
                 */
                /*
                 CLEAR(Addr);
                 CLEAR(DeptArr);
                 CLEAR(BasicPay);
                 CLEAR(EmpArray);
                 CLEAR(ArrEarnings);
                 CLEAR(ArrEarningsAmt);
                 CLEAR(BalanceArray);
                 CLEAR(BranchArr);
                 CLEAR(PayPointArr);
                  CLEAR(MessageArr);
                  */

                for j := 1 to 60 do begin
                    ArrEarnings[ColumnNo, j] := '';
                    ArrEarningsAmt[ColumnNo, j] := '';
                    BalanceArray[ColumnNo, j] := 0;
                end;

                GrossPay := 0;
                TotalDeduction := 0;
                LoanBal := 0;
                NetPay := 0;
                Addr[ColumnNo] [1] := Employee."No.";
                Addr[ColumnNo] [2] := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                Addr[ColumnNo] [3] := Employee."ID Number";
                Addr[ColumnNo] [4] := Employee."P.I.N";
                Addr[ColumnNo] [5] := Employee."Social Security No.";
                Addr[ColumnNo] [6] := Employee."N.H.I.F No";

                Employee.CalcFields(Employee.Department, Employee.Branch, Employee.Paypoint);

                DeptArr[ColumnNo, 1] := Employee.Department;
                BranchArr[ColumnNo, 1] := Employee.Branch;
                PayPointArr[ColumnNo, 1] := Employee.Paypoint;


                if PostinGrp.Get(Employee."Posting Group") then begin
                    if PostinGrp."Payslip Message" <> '' then
                        MessageArr[ColumnNo, 1] := PostinGrp."Payslip Message"
                    else
                        MessageArr[ColumnNo, 1] := '';
                end;

                // get Department Name
                DimVal.Reset;
                DimVal.SetRange(DimVal.Code, Employee."Global Dimension 1 Code");
                DimVal.SetRange("Global Dimension No.", 1);
                if DimVal.Find('-') then
                    // DeptArr[ColumnNo,1]:=DimVal.Name;

                    // Get Basic Salary
                    Earn.Reset;
                Earn.SetRange(Earn."Basic Salary Code", true);
                if Earn.Find('-') then begin
                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                    AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                    AssignMatrix.SetRange(AssignMatrix.Code, Earn.Code);
                    AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                    /*
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     BasicPay[ColumnNo,1]:=Earn.Description;
                    // EmpArray[ColumnNo,1]:=AssignMatrix.Amount;
                     EVALUATE( EmpArray[ColumnNo,1],FORMAT(AssignMatrix.Amount));
                      EmpArray[ColumnNo,1]:=ChckRound(EmpArray[ColumnNo,1]);

                     GrossPay:=GrossPay+AssignMatrix.Amount;
                    END;
                    */
                end;
                i := 1;
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit", false);
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                        AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                        AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                        //AssignMatrix.SETRANGE(AssignMatrix."Basic Salary Code",FALSE);
                        AssignMatrix.SetRange(Code, Earn.Code);
                        if AssignMatrix.Find('-') then begin
                            repeat
                                ArrEarnings[ColumnNo, i] := AssignMatrix.Description;
                                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(AssignMatrix.Amount));
                                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                                GrossPay := GrossPay + AssignMatrix.Amount;
                                i := i + 1;
                            until AssignMatrix.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                ArrEarnings[ColumnNo, i] := 'GROSS PAY';
                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(ROUND(GrossPay, 1)));
                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                i := i + 1;

                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';


                //ArrEarnings[ColumnNo,i]:='_______________________________________________';
                //ArrEarningsAmt[ColumnNo,i]:='_______________________________________________';

                i := i + 1;

                // taxation
                ArrEarnings[ColumnNo, i] := 'TAXATIONS';

                i := i + 1;
                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';


                i := i + 1;

                // Non Cash Benefits
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit", true);
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                        AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                        AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                        AssignMatrix.SetRange(AssignMatrix."Basic Salary Code", false);
                        AssignMatrix.SetRange(Code, Earn.Code);
                        if AssignMatrix.Find('-') then begin
                            repeat
                                ArrEarnings[ColumnNo, i] := AssignMatrix.Description;
                                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(ROUND(AssignMatrix.Amount, 1)));
                                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                                i := i + 1;
                            until AssignMatrix.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                // end of non cash

                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetRange(Type, AssignMatrix.Type::Deduction);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");

                AssignMatrix.SetRange(AssignMatrix.Paye, true);
                if AssignMatrix.Find('-') then begin
                    /*  ArrEarnings[ColumnNo,i]:='Less Pension contribution benefit';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(AssignMatrix."Less Pension Contribution")));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);*/

                    TaxableAmt := 0;
                    Employee.PAYE := 0;

                    TaxableAmt := AssignMatrix."Taxable amount";
                    Employee.PAYE := AssignMatrix.Amount;

                end;

                // i:=i+1;
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Owner Occupier");
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                        AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                        AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                        AssignMatrix.SetRange(AssignMatrix."Basic Salary Code", false);
                        AssignMatrix.SetRange(Code, Earn.Code);
                        if AssignMatrix.Find('-') then begin
                            repeat
                                ArrEarnings[ColumnNo, i] := AssignMatrix.Description;
                                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(AssignMatrix.Amount));
                                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                                i := i + 1;
                            until AssignMatrix.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                // Taxable amount
                ArrEarnings[ColumnNo, i] := 'Taxable Amount';
                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(TaxableAmt)));
                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                i := i + 1;


                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetRange(Type, AssignMatrix.Type::Deduction);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");

                AssignMatrix.SetRange(AssignMatrix.Paye, true);
                if AssignMatrix.Find('-') then begin
                    ArrEarnings[ColumnNo, i] := 'Defined Contribution';
                    Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(AssignMatrix."Less Pension Contribution")));
                    ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                    TaxableAmt := 0;
                    Employee.PAYE := 0;

                    TaxableAmt := AssignMatrix."Taxable amount";
                    Employee.PAYE := AssignMatrix.Amount;

                end;


                i := i + 1;


                ArrEarnings[ColumnNo, i] := 'Tax Charged';
                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(ROUND(Employee.PAYE, 1))));
                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                i := i + 1;

                // Relief
                Earn.Reset;
                Earn.SetFilter(Earn."Earning Type", '%1|%2', Earn."earning type"::"Tax Relief",
                Earn."earning type"::"Insurance Relief");
                if Earn.Find('-') then begin
                    repeat
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                        AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                        AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                        AssignMatrix.SetRange(AssignMatrix."Basic Salary Code", false);
                        AssignMatrix.SetRange(Code, Earn.Code);
                        if AssignMatrix.Find('-') then begin
                            repeat
                                ArrEarnings[ColumnNo, i] := AssignMatrix.Description;
                                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(AssignMatrix.Amount)));
                                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                                i := i + 1;
                            until AssignMatrix.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;
                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';


                i := i + 1;


                // Deductions
                ArrEarnings[ColumnNo, i] := 'DEDUCTIONS';
                ArrEarningsAmt[ColumnNo, i] := ''; //
                i := i + 1;

                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';


                i := i + 1;

                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetRange(Type, AssignMatrix.Type::Deduction);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                AssignMatrix.SetRange(AssignMatrix.Paye, true);
                if AssignMatrix.Find('-') then begin
                    ArrEarnings[ColumnNo, i] := AssignMatrix.Description;
                    Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(AssignMatrix.Amount)));
                    ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                    TotalDeduction := TotalDeduction + Abs(AssignMatrix.Amount);
                end;

                i := i + 1;

                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetFilter(Type, '%1|%2', AssignMatrix.Type::Deduction, AssignMatrix.Type::Loan);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                AssignMatrix.SetRange(AssignMatrix.Paye, false);
                // AssignMatrix.SETRANGE(AssignMatrix.Shares,FALSE);
                // AssignMatrix.SETRANGE(AssignMatrix."Insurance Code",FALSE);

                if AssignMatrix.Find('-') then begin
                    repeat

                        ArrEarnings[ColumnNo, i] := AssignMatrix.Description;
                        Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(AssignMatrix.Amount)));


                        ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                        TotalDeduction := TotalDeduction + Abs(AssignMatrix.Amount);


                        //Get balances+Contributions summary

                        if Deduct.Get(AssignMatrix.Code) then begin
                            if Deduct."Show Balance" then begin
                                if LoanBalances.Get(AssignMatrix."Reference No", AssignMatrix.Code) then begin

                                    LoanBalances.SetRange(LoanBalances."Date filter", DateSpecified);
                                    LoanBalances.CalcFields(LoanBalances."Total Repayment");
                                    // MESSAGE('%1 Loan amount=%2',LoanBalances."Total Repayment",LoanBalances."Approved Amount");
                                    BalanceArray[ColumnNo, i] := (LoanBalances."Approved Amount" + LoanBalances."Total Repayment");
                                end
                                else begin
                                    Deduct.SetRange(Deduct."Employee Filter", Employee."No.");
                                    Deduct.CalcFields(Deduct."Total Amount");
                                    BalanceArray[ColumnNo, i] := Abs(Deduct."Total Amount");
                                end;
                            end;
                        end;
                        i := i + 1;
                    until AssignMatrix.Next = 0;
                end;
                /*//i:=i+1;
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix."Insurance Code",TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'842');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                      Totalcoopshares:=Totalcoopshares+ABS(AssignMatrix.Amount);
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                
                 // i:=i+1;
                IF   Totalcoopshares>0 THEN BEGIN
                
                      ArrEarnings[ColumnNo,i]:='INSURANCES';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(Totalcoopshares)));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                      Totalcoopshares:=0;
                        i:=i+1;
                END;
                
                
                //i:=i+1;
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'853');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                      Totalcoopshares:=Totalcoopshares+ABS(AssignMatrix.Amount);
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                
                 // i:=i+1;
                IF   Totalcoopshares>0 THEN BEGIN
                
                      ArrEarnings[ColumnNo,i]:='COOP. SOCIETY SHARES';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(Totalcoopshares)));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                      Totalcoopshares:=0;
                        i:=i+1;
                END;
                
                
                //i:=i+1;
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'832');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                      Totalcoopshares:=Totalcoopshares+ABS(AssignMatrix.Amount);
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                
                 // i:=i+1;
                IF   Totalcoopshares>0 THEN BEGIN
                
                      ArrEarnings[ColumnNo,i]:='SPORTS/SOCIAL WELFARE';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(Totalcoopshares)));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                      Totalcoopshares:=0;
                        i:=i+1;
                END;
                
                
                
                //i:=i+1;
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'866');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                      Totalcoopshares:=Totalcoopshares+ABS(AssignMatrix.Amount);
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                
                 // i:=i+1;
                IF   Totalcoopshares>0 THEN BEGIN
                
                      ArrEarnings[ColumnNo,i]:='SACCO BBF/SINKING FUND';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(Totalcoopshares)));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                      Totalcoopshares:=0;
                        i:=i+1;
                END;
                
                
                
                //i:=i+1;
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'854');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                      Totalcoopshares:=Totalcoopshares+ABS(AssignMatrix.Amount);
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                
                
                 IF   Totalcoopshares>0 THEN BEGIN
                      ArrEarnings[ColumnNo,i]:='COOP. SOCIETY INVESTMENTS';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(Totalcoopshares)));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                      Totalcoopshares:=0;
                      i:=i+1;
                  END;
                
                //i:=i+1;
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'869');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                    // MESSAGE('HAPO');
                    //  ArrEarnings[1,i]:=AssignMatrix.Description;
                     // EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                      Totalcoopshares:=Totalcoopshares+ABS(AssignMatrix.Amount);
                     // MESSAGE('%1',Totalcoopshares);
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                     // i:=i+1;
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                
                 // i:=i+1;
                 IF   Totalcoopshares>0 THEN BEGIN
                      ArrEarnings[ColumnNo,i]:='COOP. INTEREST';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(Totalcoopshares)));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                      Totalcoopshares:=0;
                i:=i+1;
                END;
                
                
                
                    AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'832');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                    // MESSAGE('HAPO');
                    //  ArrEarnings[1,i]:=AssignMatrix.Description;
                     // EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                      Totalcoopshares:=Totalcoopshares+ABS(AssignMatrix.Amount);
                     // MESSAGE('%1',Totalcoopshares);
                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                     // i:=i+1;
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                
                 // i:=i+1;
                 IF   Totalcoopshares>0 THEN BEGIN
                      ArrEarnings[ColumnNo,i]:='SPORTS/SOCIAL WELFARE';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(Totalcoopshares)));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                      Totalcoopshares:=0;
                i:=i+1;
                END; */




                ArrEarnings[ColumnNo, i] := 'TOTAL DEDUCTIONS';
                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(ROUND(TotalDeduction, 1)));
                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);
                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                i := i + 1;

                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';

                i := i + 1;
                // Net Pay
                ArrEarnings[ColumnNo, i] := 'NET PAY';
                if GrossPay > 0 then
                    NetPay := GrossPay - TotalDeduction
                else
                    NetPay := GrossPay + TotalDeduction;

                Evaluate(ArrEarningsAmt[ColumnNo, i], Format(ROUND(NetPay, 1)));
                ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);

                i := i + 1;

                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';

                i := i + 1;

                //Information
                ArrEarnings[ColumnNo, i] := 'INFORMATION';

                i := i + 1;

                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';

                i := i + 1;

                Ded.Reset;
                Ded.SetRange(Ded."Tax deductible", true);
                Ded.SetRange(Ded."Date Filter", DateSpecified, DateSpecified);
                Ded.SetRange(Ded."Employee Filter", Employee."No.");
                Ded.SetRange(Ded.Description, 'NSSF');
                if Ded.Find('-') then
                    repeat
                        Ded.CalcFields(Ded."Total Amount", Ded."Total Amount Employer");
                        ArrEarnings[ColumnNo, i] := Ded.Description + '  (Company)';
                        Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(Ded."Total Amount Employer")));
                        ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);
                        i := i + 1;

                        ArrEarnings[ColumnNo, i] := Ded.Description + ' (Self YTD)';
                        Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(Ded."Total Amount")));
                        ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);
                        i := i + 1;



                    until Ded.Next = 0;


                ///Retirement benefits-Company
                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetFilter(Type, '%1', AssignMatrix.Type::Deduction);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                AssignMatrix.SetRange(AssignMatrix.Retirement, true);
                AssignMatrix.SetRange(AssignMatrix.Paye, false);
                if AssignMatrix.Find('-') then begin
                    repeat

                        if AssignMatrix."Employer Amount" > 0 then begin
                            ArrEarnings[ColumnNo, i] := AssignMatrix.Description + '  (Company)';
                            Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(AssignMatrix."Employer Amount")));
                            ArrEarningsAmt[ColumnNo, i] := ChckRound(ArrEarningsAmt[ColumnNo, i]);
                            i := i + 1;

                        end;
                    until AssignMatrix.Next = 0;
                end;
                //End Retirement benefits-Company

                //show closing balance

                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetFilter(Type, '%1|%2', AssignMatrix.Type::Deduction, AssignMatrix.Type::Loan);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                AssignMatrix.SetRange(AssignMatrix.Paye, false);
                // AssignMatrix.SETRANGE(AssignMatrix.Shares,FALSE);
                // AssignMatrix.SETRANGE(AssignMatrix."Insurance Code",FALSE);

                if AssignMatrix.Find('-') then begin
                    repeat

                        if Ded.Get(AssignMatrix.Code) then begin
                            if Ded."Show on Payslip Information" = true then begin

                                if AssignMatrix."Closing Balance" > 0 then begin
                                    ArrEarnings[ColumnNo, i] := AssignMatrix.Description;
                                    Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(AssignMatrix."Closing Balance")));
                                    i := i + 1
                                end;

                            end;
                        end;

                    until AssignMatrix.Next = 0;

                end;

                //end




                //Days Worked/Hours worked
                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetFilter(Type, '%1', AssignMatrix.Type::Payment);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                // AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                // AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                if AssignMatrix.Find('-') then begin
                    repeat

                        if Earn.Get(AssignMatrix.Code) then begin

                            if Earn."Show No.of Days" = true then begin
                                if AssignMatrix."Days Worked/Lost" > 0 then begin

                                    ArrEarnings[ColumnNo, i] := AssignMatrix.Description + '-(DAYS)';
                                    Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(AssignMatrix."Days Worked/Lost")));
                                    i := i + 1
                                end;

                            end;
                        end;
                    until AssignMatrix.Next = 0;
                end;

                //Hours Worked
                AssignMatrix.Reset;
                AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                AssignMatrix.SetFilter(Type, '%1', AssignMatrix.Type::Payment);
                AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                // AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                // AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                if AssignMatrix.Find('-') then begin
                    repeat

                        if Earn.Get(AssignMatrix.Code) then begin

                            if Earn."Show No.of Hours" = true then begin
                                //IF ((AssignMatrix."No. Of Hours">0) AND (AssignMatrix."Days Worked/Lost"=0)) THEN BEGIN
                                if (AssignMatrix."No. Of Hours" > 0) then begin

                                    ArrEarnings[ColumnNo, i] := AssignMatrix.Description + '-(HRS)';
                                    Evaluate(ArrEarningsAmt[ColumnNo, i], Format(Abs(AssignMatrix."No. Of Hours")));
                                    i := i + 1
                                end;

                            end;
                        end;
                    until AssignMatrix.Next = 0;
                end;









                /*   AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Deduction);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    IF AssignMatrix.FIND('-') THEN BEGIN
                    REPEAT
                      ArrEarnings[ColumnNo,i]:=AssignMatrix.Description+'  (Authority)';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(AssignMatrix."Employer Amount")));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                     i:=i+1;
                     UNTIL AssignMatrix.NEXT=0;
                    END;
                
                    //i:=i+1;
                
                    AssignMatrix.RESET;
                   // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Deduction);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix.Description,'NSSF');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                       Totalnssf:=Totalnssf+ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                   IF  Totalnssf>0 THEN BEGIN
                     ArrEarnings[ColumnNo,i]:='NSSF (YTD)';
                     EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(Totalnssf));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                    i:=i+1;
                    Totalnssf:=0;
                END;
                
                    {
                    AssignMatrix.RESET;
                   // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Deduction);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                     IF AssignMatrix.Description <> 'NSSF' THEN BEGIN
                
                    // ArrEarnings[1,i]:=AssignMatrix.Description+' (YTD)';
                    // LoanBal:=ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount);
                    // EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount)));
                    //ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                       Totalpension:=Totalpension+ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount);
                      // i:=i+1;
                      END;
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                   IF  Totalpension>0 THEN BEGIN
                     ArrEarnings[ColumnNo,i]:='PENSIONS (YTD)';
                   // ArrEarningsAmt[ColumnNo,i]:=Totalpension;
                     EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(Totalpension));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                    i:=i+1;
                    Totalpension:=0;
                END;
                }
                
                
                    AssignMatrix.RESET;
                   // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Deduction);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                      Totalnssf:=Totalnssf+ABS(AssignMatrix."Opening Balance Company")+ABS(AssignMatrix."Employer Amount");
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                   IF  Totalnssf>0 THEN BEGIN
                     ArrEarnings[ColumnNo,i]:='NSSF (YTD) AUTHORITY';
                     EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(Totalnssf));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                    i:=i+1;
                    Totalnssf:=0;
                   END;
                
                  {
                
                    AssignMatrix.RESET;
                   // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Deduction);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                     IF AssignMatrix.Description <> 'NSSF' THEN BEGIN
                      Totalpension:=Totalpension+ABS(AssignMatrix."Opening Balance Company")+ABS(AssignMatrix."Employer Amount");
                        END;
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                   IF  Totalpension>0 THEN BEGIN
                     ArrEarnings[ColumnNo,i]:='PENSIONS (YTD) AUTHORITY';
                     EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(Totalpension));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                    i:=i+1;
                    Totalpension:=0;
                   END;
                   }
                    AssignMatrix.RESET;
                   // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'853');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                     LoanBal:=LoanBal+ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                 IF   LoanBal>0 THEN BEGIN
                      ArrEarnings[ColumnNo,i]:='COOP. SOCIETY SHARES';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(LoanBal)));
                      ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                     LoanBal:=0;
                      i:=i+1;
                  END;
                
                
                    AssignMatrix.RESET;
                   // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'866');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                     LoanBal:=LoanBal+ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                 IF   LoanBal>0 THEN BEGIN
                      ArrEarnings[ColumnNo,i]:='SACCO BBF/SINKING FUND';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(LoanBal)));
                      ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                     LoanBal:=0;
                      i:=i+1;
                  END;
                
                
                    AssignMatrix.RESET;
                   // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'854');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                     LoanBal:=LoanBal+ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                 IF   LoanBal>0 THEN BEGIN
                      ArrEarnings[ColumnNo,i]:='COOP. SOCIETY INVESTMENTS';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(LoanBal)));
                      ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                     LoanBal:=0;
                      i:=i+1;
                  END;
                
                    AssignMatrix.RESET;
                   // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Shares,TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'869');
                
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                     LoanBal:=LoanBal+ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount);
                     UNTIL AssignMatrix.NEXT=0;
                     END;
                 IF   LoanBal>0 THEN BEGIN
                      ArrEarnings[ColumnNo,i]:='COOP. INTEREST';
                      EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(ABS(LoanBal)));
                      ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                     LoanBal:=0;
                      i:=i+1;
                  END;
                
                
                   // i:=i+1;
                
                   LoanBalances.RESET;
                   LoanBalances.SETRANGE(LoanBalances."Employee No",Employee."No.");
                  // AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                   // AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                   IF LoanBalances.FIND('-') THEN BEGIN
                    REPEAT
                   ArrEarnings[ColumnNo,i]:=LoanBalances.Description;
                
                     // EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix."Opening Balance")));
                     // EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                     LoanBal:=LoanBalances."Approved Amount";//+ABS(AssignMatrix.Amount);
                
                
                    AssignMatrix.RESET;
                    //AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Loan);
                    AssignMatrix.SETFILTER(AssignMatrix.Description,LoanBalances.Description);
                
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    IF AssignMatrix.FIND('-') THEN BEGIN
                     REPEAT
                     // ArrEarnings[1,i]:=AssignMatrix.Description;
                     // EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix.Amount)));
                      TotalRepayment:=TotalRepayment+ABS(AssignMatrix.Amount);
                      //i:=i+1;
                     UNTIL AssignMatrix.NEXT=0;
                      END;
                 EVALUATE(ArrEarningsAmt[ColumnNo,i],FORMAT(LoanBal-TotalRepayment));
                    ArrEarningsAmt[ColumnNo,i]:=ChckRound(ArrEarningsAmt[ColumnNo,i]);
                
                     // TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                      i:=i+1;
                      LoanBal:=0;
                      TotalRepayment:=0;
                
                   UNTIL LoanBalances.NEXT=0;
                     END;
                
                */
                // i:=i+1;

                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';







                i := i + 1;
                ArrEarnings[ColumnNo, i] := 'BANK DETAILS';
                // Employee details
                i := i + 1;

                ArrEarnings[ColumnNo, i] := '************************************************';
                ArrEarningsAmt[ColumnNo, i] := '***********************************************';

                /* i:=i+1;

                ArrEarnings[ColumnNo,i]:='P.I.N';
                ArrEarningsAmt[ColumnNo,i]:=Employee."P.I.N";
                 */

                i := i + 1;
                if EmpBank.Get(Employee."Employee's Bank", Employee."Bank Branch") then begin
                    BankName := EmpBank."Bank Name";
                    BankBranch2 := EmpBank."Branch Name";
                end else begin
                    BankName := '';
                    BankBranch2 := '';
                end;


                ArrEarnings[ColumnNo, i] := 'EMPLOYEE BANK::';
                ArrEarningsAmt[ColumnNo, i] := BankName;

                i := i + 1;
                ArrEarnings[ColumnNo, i] := 'BRANCH::';
                ArrEarningsAmt[ColumnNo, i] := BankBranch2;

                i := i + 1;
                ArrEarnings[ColumnNo, i] := 'ACCOUNT NO::';
                ArrEarningsAmt[ColumnNo, i] := Employee."Bank Account Number";

                /*
                 i:=i+1;
                 ArrEarnings[ColumnNo,i]:='NSSF No';
                 ArrEarningsAmt[ColumnNo,i]:=Employee."Social Security No.";
                 i:=i+1;
                 ArrEarnings[ColumnNo,i]:='NHIF No';
                 ArrEarningsAmt[ColumnNo,i]:=Employee."N.H.I.F No";

             */
                // removed for kawacom
                i := i + 1;
                ArrEarnings[ColumnNo, i] := '';


                i := i + 1;
                // ArrEarnings[ColumnNo,i]:='MAY GOD BLESS YOU';


                i := i + 1;
                ArrEarnings[ColumnNo, i] := '*******End of Payslip********';


                //COMPRESSARRAY(ArrEarnings[ColumnNo]);
                //COMPRESSARRAY(ArrEarningsAmt[ColumnNo]);

                if (RecordNo = NoOfRecords) and (ColumnNo < 2) then begin
                    for x := ColumnNo + 1 to NoOfColumns do begin
                        Clear(ArrEarnings[x]);
                        Clear(ArrEarningsAmt[x]);
                    end;

                    ColumnNo := 0;
                end else begin
                    if ColumnNo = NoOfColumns then
                        ColumnNo := 0;
                end;

            end;

            trigger OnPreDataItem()
            begin
                CoRec.CalcFields(Picture);

                NoOfRecords := Employee.Count;
                NoOfColumns := 2;
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

    trigger OnPreReport()
    begin
        PayPeriodtext := Employee.GetFilter("Pay Period Filter");
        Evaluate(PayrollMonth, Format(PayPeriodtext));
        PayrollMonthText := Format(PayrollMonth, 1, 4);

        if PayPeriodtext = '' then
            Error('Pay period must be specified for this report');
        CoRec.Get;
        CoName := CoRec.Name;
        Evaluate(DateSpecified, Format(PayPeriodtext));


        UserSetup.Get(UserId);

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        Addr: array[10, 30] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        i: Integer;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        DateSpecified: Date;
        EndDate: Date;
        EmpBank: Record "Employee Bank AccountX";
        BankName: Text[30];
        BasicSalary: Decimal;
        TaxableAmt: Decimal;
        RightBracket: Boolean;
        NetPay: Decimal;
        PayPeriodRec: Record "Payroll PeriodX";
        PayDeduct: Record "Assignment Matrix-X";
        EmpRec: Record Employee;
        EmpNo: Code[10];
        TaxableAmount: Decimal;
        PAYE: Decimal;
        ArrEarnings: array[3, 100] of Text[250];
        ArrDeductions: array[3, 100] of Text[250];
        Index: Integer;
        Index1: Integer;
        j: Integer;
        ArrEarningsAmt: array[3, 100] of Text[60];
        ArrDeductionsAmt: array[3, 100] of Decimal;
        BalanceArray: array[3, 100] of Decimal;
        Year: Integer;
        EmpArray: array[10, 15] of Text[30];
        HoldDate: Date;
        DenomArray: array[3, 12] of Text[50];
        NoOfUnitsArray: array[3, 12] of Integer;
        AmountArray: array[3, 12] of Decimal;
        PayModeArray: array[3] of Text[30];
        HoursArray: array[3, 60] of Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        TaxCode: Code[10];
        HoursBal: Decimal;
        Pay: Record EarningsX;
        Ded: Record DeductionsX;
        HoursArrayD: array[3, 60] of Decimal;
        BankBranch: Text[30];
        CoName: Text[230];
        retirecontribution: Decimal;
        EarngingCount: Integer;
        DeductionCount: Integer;
        EarnAmount: Decimal;
        GrossTaxCharged: Decimal;
        DimVal: Record "Dimension Value";
        Department: Text[60];
        LowInterestBenefits: Decimal;
        SpacePos: Integer;
        NetPayLength: Integer;
        AmountText: Text[30];
        DecimalText: Text[30];
        DecimalAMT: Decimal;
        InsuranceRelief: Decimal;
        InsuranceReliefText: Text[30];
        PayrollCodeunit: Codeunit Payroll1;
        IncometaxNew: Decimal;
        NewRelief: Decimal;
        TaxablePayNew: Decimal;
        InsuranceReliefNew: Decimal;
        TaxChargedNew: Decimal;
        finalTax: Decimal;
        TotalBenefits: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        "Employee Payroll": Record Employee;
        PayMode: Text[30];
        Intex: Integer;
        NetPay1: Decimal;
        Principal: Decimal;
        Interest: Decimal;
        Desc: Text[50];
        dedrec: Record DeductionsX;
        RoundedNetPay: Decimal;
        diff: Decimal;
        CFWD: Decimal;
        Nssfcomptext: Text[30];
        Nssfcomp: Decimal;
        LoanDesc: Text[60];
        LoanDesc1: Text[60];
        Deduct: Record DeductionsX;
        OriginalLoan: Decimal;
        LoanBalance: Decimal;
        Message1: Text[250];
        Message2: array[3, 1] of Text[250];
        DeptArr: array[3, 1] of Text[60];
        BankBranch2: Text[100];
        BasicPay: array[3, 1] of Text[250];
        InsurEARN: Decimal;
        HasInsurance: Boolean;
        RoundedAmt: Decimal;
        TerminalDues: Decimal;
        Earn: Record EarningsX;
        AssignMatrix: Record "Assignment Matrix-X";
        RoundingDesc: Text[60];
        BasicChecker: Decimal;
        CoRec: Record "Company Information";
        GrossPay: Decimal;
        TotalDeduction: Decimal;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        GetPaye: Codeunit Payroll1;
        PayeeTest: Decimal;
        GetGroup: Codeunit Payroll1;
        GroupCode: Code[20];
        CUser: Code[20];
        x: Integer;
        LoanBal: Decimal;
        SharesBalance: Decimal;
        LoanBalances: Record "Loan Application";
        TotalRepayment: Decimal;
        Totalnssf: Decimal;
        Totalpension: Decimal;
        Totalcoopshares: Decimal;
        BranchArr: array[3, 1] of Text[60];
        PayPointArr: array[3, 1] of Text[60];
        PostinGrp: Record "Employee Posting GroupX";
        MessageArr: array[3, 1] of Text[250];
        EARNINGSCaptionLbl: label 'EARNINGS';
        AMOUNTCaptionLbl: label 'AMOUNT';
        EmptyStringCaptionLbl: label '*********************************************************';
        EARNINGSCaption_Control1000000054Lbl: label 'EARNINGS';
        EmptyStringCaption_Control1000000055Lbl: label '***************************************************************';
        AMOUNTCaption_Control1000000083Lbl: label 'AMOUNT';
        PAY_SLIPCaptionLbl: label 'PAY SLIP';
        EMPLOYEE_NO_CaptionLbl: label 'EMPLOYEE NO:';
        NAME_CaptionLbl: label 'NAME:';
        DEPARTMENT_CaptionLbl: label 'DEPARTMENT:';
        I_D_NO_CaptionLbl: label 'I.D NO:';
        PAY_SLIPCaption_Control1000000282Lbl: label 'PAY SLIP';
        EMPLOYEE_NO_Caption_Control1000000291Lbl: label 'EMPLOYEE NO:';
        I_D_NO_Caption_Control1000000293Lbl: label 'I.D NO:';
        NAME_Caption_Control1000000294Lbl: label 'NAME:';
        P_I_N_NO_CaptionLbl: label 'P.I.N NO:';
        N_S_S_F_NO_CaptionLbl: label 'N.S.S.F NO:';
        N_H_I_F_NO_CaptionLbl: label 'N.H.I.F NO:';
        N_S_S_F_NO_Caption_Control1000000311Lbl: label 'N.S.S.F NO:';
        N_H_I_F_NO_Caption_Control1000000312Lbl: label 'N.H.I.F NO:';
        P_I_N_NO_Caption_Control1000000314Lbl: label 'P.I.N NO:';
        BRANCH_CaptionLbl: label 'BRANCH:';
        PAYPOINT_CaptionLbl: label 'PAYPOINT:';
        DEPARTMENT_Caption_Control1000000163Lbl: label 'DEPARTMENT:';
        BRANCH_Caption_Control1000000164Lbl: label 'BRANCH:';
        PAYPOINT_Caption_Control1000000165Lbl: label 'PAYPOINT:';
        UserSetup: Record "User Setup";


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
    end;


    procedure GetPayPeriod()
    begin
    end;


    procedure GetTaxBracket1(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
    end;


    procedure CoinageAnalysis(var NetPay: Decimal; var ColNo: Integer)
    var
        Index: Integer;
        Intex: Integer;
    begin
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;


    procedure ChckRound(var AmtText: Text[30]) ChckRound: Text[30]
    var
        LenthOfText: Integer;
        DecimalPos: Integer;
        AmtWithoutDec: Text[30];
        DecimalAmt: Text[30];
        Decimalstrlen: Integer;
    begin
        LenthOfText := StrLen(AmtText);
        DecimalPos := StrPos(AmtText, '.');
        if DecimalPos = 0 then begin
            AmtWithoutDec := AmtText;
            DecimalAmt := '.00';
        end else begin
            AmtWithoutDec := CopyStr(AmtText, 1, DecimalPos - 1);
            DecimalAmt := CopyStr(AmtText, DecimalPos + 1, 2);
            Decimalstrlen := StrLen(DecimalAmt);
            if Decimalstrlen < 2 then begin
                DecimalAmt := '.' + DecimalAmt + '0';
            end else
                DecimalAmt := '.' + DecimalAmt
        end;
        ChckRound := AmtWithoutDec + DecimalAmt;
    end;
}
