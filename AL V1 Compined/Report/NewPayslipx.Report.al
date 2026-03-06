#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69027 "New Payslipx"
{
    // ArrEarnings[1,1]
    // ArrEarningsAmt[1,1]
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/New Payslipx.rdlc';

    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = sorting("Dimension Code", Code) order(ascending) where("Dimension Code" = const('DEPARTMENT'));
            column(ReportForNavId_1000000083; 1000000083)
            {
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = Department = field(Code);
                DataItemTableView = sorting("Global Dimension 1 Code") order(ascending);
                RequestFilterFields = "Pay Period Filter", "No.", "Posting Group", Paypoint;
                column(ReportForNavId_7528; 7528)
                {
                }
                column(PayPointArr_1_1_; PayPointArr[1, 1])
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
                    //cc//      DecimalPlaces = 2 : 2;
                }
                column(ArrEarningsAmt_1_2_; ArrEarningsAmt[1, 2])
                {
                    //cc//    DecimalPlaces = 2 : 2;
                }
                column(ArrEarningsAmt_1_3_; ArrEarningsAmt[1, 3])
                {
                    //cc//     DecimalPlaces = 2 : 2;
                }
                column(ArrEarnings_1_4_; ArrEarnings[1, 4])
                {
                }
                column(ArrEarningsAmt_1_4_; ArrEarningsAmt[1, 4])
                {
                    //cc//   DecimalPlaces = 2 : 2;
                }
                column(ArrEarnings_1_5_; ArrEarnings[1, 5])
                {
                }
                column(ArrEarningsAmt_1_5_; ArrEarningsAmt[1, 5])
                {
                    //cc//    DecimalPlaces = 2 : 2;
                }
                column(ArrEarnings_1_6_; ArrEarnings[1, 6])
                {
                }
                column(ArrEarningsAmt_1_6_; ArrEarningsAmt[1, 6])
                {
                }
                column(ArrEarnings_1_7_; ArrEarnings[1, 7])
                {
                }
                column(ArrEarningsAmt_1_7_; ArrEarningsAmt[1, 7])
                {
                }
                column(ArrEarnings_1_8_; ArrEarnings[1, 8])
                {
                }
                column(ArrEarningsAmt_1_8_; ArrEarningsAmt[1, 8])
                {
                }
                column(ArrEarningsAmt_1_9_; ArrEarningsAmt[1, 9])
                {
                }
                column(ArrEarningsAmt_1_10_; ArrEarningsAmt[1, 10])
                {
                }
                column(ArrEarningsAmt_1_11_; ArrEarningsAmt[1, 11])
                {
                }
                column(ArrEarningsAmt_1_12_; ArrEarningsAmt[1, 12])
                {
                }
                column(ArrEarningsAmt_1_13_; ArrEarningsAmt[1, 13])
                {
                }
                column(ArrEarningsAmt_1_14_; ArrEarningsAmt[1, 14])
                {
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
                column(Addr_1__6_; Addr[1] [6])
                {
                }
                column(Addr_1__5_; Addr[1] [5])
                {
                }
                column(Addr_1__4_; Addr[1] [4])
                {
                }
                column(Addr_1__3_; Addr[1] [3])
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
                column(BranchArr_1_1_; BranchArr[1, 1])
                {
                }
                column(DeptArr_1_1_; DeptArr[1, 1])
                {
                }
                column(MessageArr_1_1_; MessageArr[1, 1])
                {
                }
                column(EMPLOYEE_NO_Caption; EMPLOYEE_NO_CaptionLbl)
                {
                }
                column(N_S_S_F_NO_Caption; N_S_S_F_NO_CaptionLbl)
                {
                }
                column(PAY_SLIPCaption; PAY_SLIPCaptionLbl)
                {
                }
                column(P_I_N_NO_Caption; P_I_N_NO_CaptionLbl)
                {
                }
                column(N_H_I_F_NO_Caption; N_H_I_F_NO_CaptionLbl)
                {
                }
                column(NAME_Caption; NAME_CaptionLbl)
                {
                }
                column(I_D_NO_Caption; I_D_NO_CaptionLbl)
                {
                }
                column(EARNINGSCaption; EARNINGSCaptionLbl)
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(AMOUNTCaption; AMOUNTCaptionLbl)
                {
                }
                column(DEPARTMENT_Caption; DEPARTMENT_CaptionLbl)
                {
                }
                column(BRANCH_Caption; BRANCH_CaptionLbl)
                {
                }
                column(PAYPOINT_Caption; PAYPOINT_CaptionLbl)
                {
                }
                column(Employee_No_; Employee."No.")
                {
                }
                column(Overtime15_Employee; Employee."Overtime1.5")
                {
                }
                column(Overtime20_Employee; Employee."Overtime2.0")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Clear(Addr);
                    Clear(DeptArr);
                    Clear(BasicPay);
                    Clear(EmpArray);
                    Clear(ArrEarnings);
                    Clear(ArrEarningsAmt);
                    Clear(BalanceArray);
                    Clear(BranchArr);
                    Clear(PayPointArr);
                    Clear(MessageArr);
                    GrossPay := 0;
                    TotalDeduction := 0;
                    Totalcoopshares := 0;
                    Totalnssf := 0;
                    NetPay := 0;
                    Addr[1] [1] := Employee."No.";
                    Addr[1] [2] := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    Addr[1] [3] := Employee."ID Number";
                    Addr[1] [4] := Employee."P.I.N";
                    Addr[1] [5] := Employee."Social Security No.";
                    Addr[1] [6] := Employee."N.H.I.F No";

                    Employee.CalcFields(Employee.Department, Employee.Branch, Employee.Paypoint);

                    DeptArr[1, 1] := Employee.Department;
                    BranchArr[1, 1] := Employee.Branch;
                    PayPointArr[1, 1] := Employee.Paypoint;

                    if PostinGrp.Get(Employee."Posting Group") then begin
                        // IF PostinGrp."Payslip Message"<>'' THEN
                        MessageArr[1, 1] := PostinGrp."Payslip Message";
                    end;
                    //MESSAGE('%1',MessageArr[1,1]);
                    // get Department Name
                    /* DimVal.RESET;
                     DimVal.SETRANGE(DimVal.Code,'G');
                     DimVal.SETRANGE("Global Dimension No.",1);
                     IF DimVal.FIND('-') THEN
                    
                    */
                    //DeptArr[1,1]:=DimVal.Name;

                    // Get Basic Salary
                    Earn.Reset;
                    Earn.SetRange(Earn."Basic Salary Code", true);
                    if Earn.Find('-') then begin
                        AssignMatrix.Reset;
                        AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                        AssignMatrix.SetRange(Type, AssignMatrix.Type::Payment);
                        AssignMatrix.SetRange(AssignMatrix.Code, Earn.Code);
                        AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                        /*IF AssignMatrix.FIND('-') THEN BEGIN
                         BasicPay[1,1]:=Earn.Description;
                         EmpArray[1,1]:=AssignMatrix.Amount;
                         GrossPay:=GrossPay+AssignMatrix.Amount;
                        END;*/
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
                            // AssignMatrix.SETRANGE(AssignMatrix."Basic Salary Code",FALSE);
                            AssignMatrix.SetRange(Code, Earn.Code);
                            if AssignMatrix.Find('-') then begin
                                repeat
                                    ArrEarnings[1, i] := AssignMatrix.Description;
                                    Evaluate(ArrEarningsAmt[1, i], Format(AssignMatrix.Amount));
                                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                                    GrossPay := GrossPay + AssignMatrix.Amount;
                                    i := i + 1;
                                until AssignMatrix.Next = 0;
                            end;
                        until Earn.Next = 0;
                    end;

                    ArrEarnings[1, i] := 'GROSS PAY';
                    Evaluate(ArrEarningsAmt[1, i], Format(GrossPay));
                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                    i := i + 1;

                    ArrEarnings[1, i] := '*************************************************************';
                    ArrEarningsAmt[1, i] := '*********************************************************************************';

                    i := i + 1;
                    // Deductions
                    ArrEarnings[1, i] := 'DEDUCTIONS';

                    i := i + 1;

                    ArrEarnings[1, i] := '***************************************************************';
                    ArrEarningsAmt[1, i] := '***********************************************************';

                    i := i + 1;

                    AssignMatrix.Reset;
                    AssignMatrix.SetRange(AssignMatrix."Payroll Period", DateSpecified);
                    AssignMatrix.SetRange(Type, AssignMatrix.Type::Deduction);
                    AssignMatrix.SetRange(AssignMatrix."Employee No", Employee."No.");
                    AssignMatrix.SetRange(AssignMatrix.Paye, true);
                    if AssignMatrix.Find('-') then begin
                        ArrEarnings[1, i] := AssignMatrix.Description;
                        Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix.Amount)));
                        ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

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
                            ArrEarnings[1, i] := AssignMatrix.Description;
                            if AssignMatrix.Amount < 0 then begin
                                Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix.Amount)));
                                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                                TotalDeduction := TotalDeduction + Abs(AssignMatrix.Amount);
                            end else begin
                                Evaluate(ArrEarningsAmt[1, i], Format(-AssignMatrix.Amount));
                                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
                                TotalDeduction := TotalDeduction - (AssignMatrix.Amount);

                            end;




                            if Deduct.Get(AssignMatrix.Code) then begin
                                if Deduct."Show Balance" then begin
                                    LoanBalances.Reset;
                                    LoanBalances.SetRange(LoanBalances."Loan No", AssignMatrix."Reference No");
                                    LoanBalances.SetRange(LoanBalances."Deduction Code", AssignMatrix.Code);
                                    if LoanBalances.Find('-') then begin

                                        LoanBalances.SetRange(LoanBalances."Date filter", 0D, DateSpecified);
                                        LoanBalances.CalcFields(LoanBalances."Total Repayment");
                                        // MESSAGE('%1 Loan amount=%2',LoanBalances."Total Repayment",LoanBalances."Approved Amount");
                                        BalanceArray[1, i] := (LoanBalances."Approved Amount" + LoanBalances."Total Repayment");
                                    end
                                    else begin
                                        Deduct.SetRange(Deduct."Employee Filter", Employee."No.");
                                        Deduct.CalcFields(Deduct."Total Amount");
                                        BalanceArray[1, i] := Abs(Deduct."Total Amount");
                                        // MESSAGE('Balance=%1',Deduct."Total Amount");
                                    end;
                                end;
                            end;


                            i := i + 1;
                        until AssignMatrix.Next = 0;
                    end;
                    //i:=i+1;
                    /*AssignMatrix.RESET;
                    AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                    AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                    AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                    AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                    AssignMatrix.SETRANGE(AssignMatrix."Insurance Code",TRUE);
                    AssignMatrix.SETRANGE(AssignMatrix."Main Deduction Code",'842');

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

                       ArrEarnings[1,i]:='INSURANCES';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Totalcoopshares)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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

                       ArrEarnings[1,i]:='COOP. SOCIETY SHARES';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Totalcoopshares)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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
                      ArrEarnings[1,i]:='COOP. SOCIETY INVESTMENTS';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Totalcoopshares)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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
                      ArrEarnings[1,i]:='SACCO BBF/SINKING FUND';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Totalcoopshares)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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
                      Totalcoopshares:=Totalcoopshares+ABS(AssignMatrix.Amount);

                      TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);

                     UNTIL AssignMatrix.NEXT=0;
                     END;

                 // i:=i+1;
                 IF   Totalcoopshares>0 THEN BEGIN
                      ArrEarnings[1,i]:='COOP. INTEREST';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Totalcoopshares)));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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

                 // i:=i+1; BKK*/

                    if Totalcoopshares > 0 then begin
                        ArrEarnings[1, i] := 'SPORTS/SOCIAL WELFARE';
                        Evaluate(ArrEarningsAmt[1, i], Format(Abs(Totalcoopshares)));
                        ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                        Totalcoopshares := 0;
                        i := i + 1;
                    end;




                    ArrEarnings[1, i] := 'TOTAL DEDUCTIONS';
                    Evaluate(ArrEarningsAmt[1, i], Format(TotalDeduction));
                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                    i := i + 1;

                    ArrEarnings[1, i] := '************************************************';
                    ArrEarningsAmt[1, i] := '***********************************************';

                    i := i + 1;
                    // Net Pay
                    ArrEarnings[1, i] := 'NET PAY';
                    if GrossPay > 0 then
                        NetPay := GrossPay - TotalDeduction
                    else
                        NetPay := GrossPay + TotalDeduction;
                    //MESSAGE('%1',GrossPay);
                    //ushindi......skip slip if net pay is zero
                    //IF NetPay=0 THEN
                    //CurrReport.SKIP;
                    Evaluate(ArrEarningsAmt[1, i], Format(NetPay));
                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                    i := i + 1;

                    ArrEarnings[1, i] := '************************************************';
                    ArrEarningsAmt[1, i] := '***********************************************';

                    i := i + 1;
                    // taxation
                    ArrEarnings[1, i] := 'TAXATIONS';

                    i := i + 1;

                    ArrEarnings[1, i] := '************************************************';
                    ArrEarningsAmt[1, i] := '***********************************************';

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
                                    ArrEarnings[1, i] := AssignMatrix.Description;
                                    Evaluate(ArrEarningsAmt[1, i], Format(AssignMatrix.Amount));
                                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

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
                        ArrEarnings[1, i] := 'Defined contribution';
                        Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix."Less Pension Contribution")));
                        ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);


                        TaxableAmt := 0;
                        Employee.PAYE := 0;

                        TaxableAmt := AssignMatrix."Taxable amount";
                        Employee.PAYE := AssignMatrix.Amount;

                    end;

                    i := i + 1;
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
                                    ArrEarnings[1, i] := AssignMatrix.Description;
                                    Evaluate(ArrEarningsAmt[1, i], Format(AssignMatrix.Amount));
                                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                                    i := i + 1;
                                until AssignMatrix.Next = 0;
                            end;
                        until Earn.Next = 0;
                    end;

                    // Taxable amount
                    ArrEarnings[1, i] := 'Taxable Amount';
                    Evaluate(ArrEarningsAmt[1, i], Format(Abs(TaxableAmt)));
                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                    i := i + 1;

                    ArrEarnings[1, i] := 'Tax Charged';
                    Evaluate(ArrEarningsAmt[1, i], Format(Abs(Employee.PAYE)));
                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

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
                                    ArrEarnings[1, i] := AssignMatrix.Description;
                                    Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix.Amount)));
                                    ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);

                                    i := i + 1;
                                until AssignMatrix.Next = 0;
                            end;
                        until Earn.Next = 0;
                    end;

                    ArrEarnings[1, i] := '************************************************';
                    ArrEarningsAmt[1, i] := '***********************************************';


                    i := i + 1;
                    //Information
                    ArrEarnings[1, i] := 'INFORMATION';

                    i := i + 1;

                    ArrEarnings[1, i] := '************************************************';
                    ArrEarningsAmt[1, i] := '***********************************************';

                    i := i + 1;


                    /*
                    Ded.RESET;
                    Ded.SETRANGE(Ded."Tax deductible",TRUE);
                    Ded.SETRANGE(Ded."Pay Period Filter",DateSpecified);
                    Ded.SETRANGE(Ded."Employee Filter",Employee."No.");
                    Ded.SETRANGE(Ded."Show on Payslip Information",TRUE);
                    IF Ded.FIND('-') THEN
                    REPEAT
                    //MESSAGE('fOUND');
                    Ded.CALCFIELDS(Ded."Total Amount",Ded."Total Amount Employer");
                      ArrEarnings[1,i]:=Ded.Description+'(Employer)';
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Ded."Total Amount Employer")));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                      i:=i+1;
                    
                     { ArrEarnings[1,i]:=Ded.Description;
                      EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(Ded."Total Amount")));
                      ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                      i:=i+1;}
                    
                    
                    
                    UNTIL Ded.NEXT=0;
                    */


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
                                ArrEarnings[1, i] := AssignMatrix.Description + '(Company)';
                                Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix."Employer Amount")));
                                ArrEarningsAmt[1, i] := ChckRound(ArrEarningsAmt[1, i]);
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
                                        ArrEarnings[1, i] := AssignMatrix.Description;
                                        Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix."Closing Balance")));
                                        i := i + 1
                                    end;

                                end;
                            end;
                        until AssignMatrix.Next = 0;

                    end;

                    //end

                    /*

                   //show closing balance

                       AssignMatrix.RESET;
                       AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                       AssignMatrix.SETFILTER(Type,'%1|%2',AssignMatrix.Type::Deduction,AssignMatrix.Type::Loan);
                       AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                       AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                      // AssignMatrix.SETRANGE(AssignMatrix.Shares,FALSE);
                      // AssignMatrix.SETRANGE(AssignMatrix."Insurance Code",FALSE);

                       IF AssignMatrix.FIND('-') THEN BEGIN
                        REPEAT

                   IF Ded.GET(AssignMatrix.Code) THEN BEGIN
                   IF Ded."Show on Payslip Information"=TRUE THEN BEGIN
                         IF AssignMatrix."Closing Balance">0 THEN BEGIN
                         ArrEarnings[1,i]:=AssignMatrix.Description;
                         EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix."Closing Balance")));
                         i:=i+1
                         END;

                   END;
                   END;
                   UNTIL AssignMatrix.NEXT=0;

                   END;

                   //end

                    */

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

                                        ArrEarnings[1, i] := AssignMatrix.Description + '-(DAYS)';
                                        Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix."Days Worked/Lost")));
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


                                        ArrEarnings[1, i] := AssignMatrix.Description + '-(HRS)';
                                        Evaluate(ArrEarningsAmt[1, i], Format(Abs(AssignMatrix."No. Of Hours")));
                                        i := i + 1
                                    end;

                                end;
                            end;
                        until AssignMatrix.Next = 0;
                    end;


                    /*
                      AssignMatrix.RESET;
                       AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                       AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Deduction);
                       AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                       AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                       AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                       IF AssignMatrix.FIND('-') THEN BEGIN
                       REPEAT
                             ArrEarnings[1,i]:=AssignMatrix.Description;
                             //+'  (Authority)';
                         EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(AssignMatrix."Employer Amount")));
                       ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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
                        ArrEarnings[1,i]:='NSSF (YTD)';
                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(Totalnssf));
                       ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                       i:=i+1;
                       Totalnssf:=0;
                   END;


                       AssignMatrix.RESET;
                      // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                       AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Deduction);
                       AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                       AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                       AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                       IF AssignMatrix.FIND('-') THEN BEGIN
                        REPEAT
                        IF AssignMatrix.Description <> 'NSSF' THEN BEGIN

                          Totalpension:=Totalpension+ABS(AssignMatrix."Opening Balance")+ABS(AssignMatrix.Amount);

                         END;
                        UNTIL AssignMatrix.NEXT=0;
                        END;
                      IF  Totalpension>0 THEN BEGIN
                        ArrEarnings[1,i]:='PENSIONS (YTD)';
                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(Totalpension));
                       ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                       i:=i+1;
                       Totalpension:=0;
                   END;



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
                        ArrEarnings[1,i]:='NSSF (YTD);
                        // AUTHORITY';
                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(Totalnssf));
                       ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                       i:=i+1;
                       Totalnssf:=0;
                      END;

                       //  MESSAGE ('HAPO POA');

                       AssignMatrix.RESET;
                      // AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                       AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Deduction);
                       AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                       AssignMatrix.SETRANGE(AssignMatrix.Retirement,TRUE);
                       AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                       IF AssignMatrix.FIND('-') THEN BEGIN
                        REPEAT
                        IF AssignMatrix.Description <> 'PENSION' THEN BEGIN
                         Totalpension:=Totalpension+ABS(AssignMatrix."Opening Balance Company")+ABS(AssignMatrix."Employer Amount");
                           END;
                        UNTIL AssignMatrix.NEXT=0;
                        END;
                      IF  Totalpension>0 THEN BEGIN
                        ArrEarnings[1,i]:='PENSIONS (YTD);
                        // AUTHORITY';
                        EVALUATE(ArrEarningsAmt[1,i],FORMAT(Totalpension));
                       ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);
                       i:=i+1;
                       Totalpension:=0;
                      END;

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
                       // MESSAGE('%1',LoanBal);
                        UNTIL AssignMatrix.NEXT=0;
                        END;
                    IF   LoanBal>0 THEN BEGIN
                         ArrEarnings[1,i]:='COOP. SOCIETY SHARES';
                         EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(LoanBal)));
                         ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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
                       // MESSAGE('%1',LoanBal);
                        UNTIL AssignMatrix.NEXT=0;
                        END;
                    IF   LoanBal>0 THEN BEGIN
                         ArrEarnings[1,i]:='SACCO BBF/SINKING FUND';
                         EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(LoanBal)));
                         ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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
                         ArrEarnings[1,i]:='COOP. SOCIETY INVESTMENTS';
                         EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(LoanBal)));
                         ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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
                         ArrEarnings[1,i]:='COOP. INTEREST';
                         EVALUATE(ArrEarningsAmt[1,i],FORMAT(ABS(LoanBal)));
                         ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

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
                      ArrEarnings[1,i]:=LoanBalances.Description;
                        LoanBal:=LoanBalances."Approved Amount";//+ABS(AssignMatrix.Amount);


                       AssignMatrix.RESET;
                       //AssignMatrix.SETRANGE(AssignMatrix."Payroll Period",DateSpecified);
                       AssignMatrix.SETFILTER(Type,'%1',AssignMatrix.Type::Loan);
                       AssignMatrix.SETFILTER(AssignMatrix.Description,LoanBalances.Description);

                       AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                       AssignMatrix.SETRANGE(AssignMatrix.Paye,FALSE);
                       IF AssignMatrix.FIND('-') THEN BEGIN
                        REPEAT
                         TotalRepayment:=TotalRepayment+ABS(AssignMatrix.Amount);
                         //i:=i+1;
                        UNTIL AssignMatrix.NEXT=0;
                         END;
                    EVALUATE(ArrEarningsAmt[1,i],FORMAT(LoanBal-TotalRepayment));
                       ArrEarningsAmt[1,i]:=ChckRound(ArrEarningsAmt[1,i]);

                        // TotalDeduction:=TotalDeduction+ABS(AssignMatrix.Amount);
                         i:=i+1;
                         LoanBal:=0;
                         TotalRepayment:=0;

                      UNTIL LoanBalances.NEXT=0;
                        END;

                   */
                    // i:=i+1;

                    ArrEarnings[1, i] := '************************************************';
                    ArrEarningsAmt[1, i] := '***********************************************';






                    i := i + 1;
                    ArrEarnings[1, i] := 'BANK DETAILS';
                    // Employee details
                    i := i + 1;

                    ArrEarnings[1, i] := '************************************************';
                    ArrEarningsAmt[1, i] := '***********************************************';
                    i := i + 1;

                    //i:=i+1;
                    if EmpBank.Get(Employee."Employee's Bank", Employee."Bank Branch") then begin
                        BankName := EmpBank."Bank Name";
                        BankBranch2 := EmpBank."Branch Name";
                    end else begin
                        BankName := '';
                        BankBranch2 := '';
                    end;


                    ArrEarnings[1, i] := 'EMPLOYEE BANK::';
                    ArrEarningsAmt[1, i] := BankName;

                    i := i + 1;
                    ArrEarnings[1, i] := 'BRANCH::';
                    ArrEarningsAmt[1, i] := BankBranch2;

                    i := i + 1;
                    ArrEarnings[1, i] := 'ACCOUNT NO::';
                    ArrEarningsAmt[1, i] := Employee."Bank Account Number";

                    /*
                    ArrEarnings[1,i]:='P.I.N';
                    ArrEarningsAmt[1,i]:=Employee."P.I.N";

                    i:=i+1;
                    IF EmpBank.GET("Staffing Group","Bank Branch") THEN
                     BankName:=EmpBank."Bank Name";

                    ArrEarnings[1,i]:='Employee Bank';
                    ArrEarningsAmt[1,i]:=BankName;

                    i:=i+1;
                    ArrEarnings[1,i]:='Bank Branch';
                    ArrEarningsAmt[1,i]:=EmpBank."Branch Name";

                    i:=i+1;
                    ArrEarnings[1,i]:='NSSF No';
                    ArrEarningsAmt[1,i]:=Employee."Social Security No.";
                    i:=i+1;
                    ArrEarnings[1,i]:='NHIF No';
                    ArrEarningsAmt[1,i]:=Employee."N.H.I.F No";
                    */
                    i := i + 1;
                    ArrEarnings[1, i] := '*******End of Payslip********';
                    // i:=i+2;
                    //ArrEarnings[1,i]:=MessageArr[1,1];

                end;

                trigger OnPreDataItem()
                begin
                    CompRec.Get;
                    Message2[1, 1] := CompRec."General Payslip Message";

                    CoRec.CalcFields(Picture);
                    /*
                   CUser:=USERID;
                   GetGroup.GetUserGroup(CUser,GroupCode);
                   SETRANGE(Employee."Posting Group",GroupCode);
                    */

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
        Addr: array[10, 100] of Text[250];
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
        BankName: Text[250];
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
        ArrEarningsAmt: array[3, 100] of Text[250];
        ArrDeductionsAmt: array[3, 100] of Decimal;
        Year: Integer;
        EmpArray: array[10, 15] of Decimal;
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
        CoName: Text[100];
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
        PayrollCodeunit: Codeunit Payroll3;
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
        GetPaye: Codeunit Payroll3;
        PayeeTest: Decimal;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        Totalcoopshares: Decimal;
        LoanBal: Decimal;
        LoanBalances: Record "Loan Application";
        TotalRepayment: Decimal;
        Totalnssf: Decimal;
        Totalpension: Decimal;
        Totalprovid: Decimal;
        BalanceArray: array[3, 100] of Decimal;
        UserRole: Record "Access Control";
        BranchArr: array[3, 1] of Text[60];
        PayPointArr: array[3, 1] of Text[60];
        BankBranch2: Text[100];
        PostinGrp: Record "Employee Posting GroupX";
        MessageArr: array[3, 1] of Text[250];
        EMPLOYEE_NO_CaptionLbl: label 'EMPLOYEE NO:';
        N_S_S_F_NO_CaptionLbl: label 'N.S.S.F NO:';
        PAY_SLIPCaptionLbl: label 'PAY SLIP';
        P_I_N_NO_CaptionLbl: label 'P.I.N NO:';
        N_H_I_F_NO_CaptionLbl: label 'N.H.I.F NO:';
        NAME_CaptionLbl: label 'NAME:';
        I_D_NO_CaptionLbl: label 'I.D NO:';
        EARNINGSCaptionLbl: label 'EARNINGS';
        EmptyStringCaptionLbl: label '*********************************************************';
        AMOUNTCaptionLbl: label 'AMOUNT';
        DEPARTMENT_CaptionLbl: label 'DEPARTMENT:';
        BRANCH_CaptionLbl: label 'BRANCH:';
        PAYPOINT_CaptionLbl: label 'PAYPOINT:';
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
