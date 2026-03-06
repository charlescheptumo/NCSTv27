#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 89032 "Directors Payroll Run"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = sorting("No.") where("Vendor Type" = const(Director));
            RequestFilterFields = "No.", "Vendor Posting Group";
            column(ReportForNavId_7528; 7528)
            {
            }

            trigger OnAfterGetRecord()
            begin
                NETPAY3 := 0;
                CompRec.Get;
                Vendor.CalcFields(Vendor."Total Allowances", Vendor."Taxable Income", Vendor."Total Deductions");
                //NSSF 1 Deduction
                Deductions.Reset;
                Deductions.SetRange(Deductions.Code, CompRec."NSSF Tier I Code");
                if Deductions.Find('-') then begin
                    DirectorLedgerEntry.Reset;
                    DirectorLedgerEntry.SetRange(Code, Deductions.Code);
                    DirectorLedgerEntry.SetRange(Type, DirectorLedgerEntry.Type::Deduction);
                    DirectorLedgerEntry.SetRange("Director No", Vendor."No.");
                    DirectorLedgerEntry.SetRange("Payroll Period", Month);
                    DirectorLedgerEntry.SetRange(Closed, false);
                    if DirectorLedgerEntry.FindSet then begin
                        repeat
                            DirectorLedgerEntry.Validate(DirectorLedgerEntry.Code);
                            DirectorLedgerEntry.Modify;
                        until DirectorLedgerEntry.Next = 0;

                    end;
                    // end of deletion
                end;

                //NSSF 2 Deduction
                Deductions.Reset;
                Deductions.SetRange(Deductions.Code, CompRec."NSSF Tier II Code");
                if Deductions.Find('-') then begin
                    DirectorLedgerEntry.Reset;
                    DirectorLedgerEntry.SetRange(Code, Deductions.Code);
                    DirectorLedgerEntry.SetRange(Type, DirectorLedgerEntry.Type::Deduction);
                    DirectorLedgerEntry.SetRange("Director No", Vendor."No.");
                    DirectorLedgerEntry.SetRange("Payroll Period", Month);
                    DirectorLedgerEntry.SetRange(Closed, false);
                    if DirectorLedgerEntry.Find('-') then begin
                        repeat
                            DirectorLedgerEntry.Validate(DirectorLedgerEntry.Code);
                            DirectorLedgerEntry.Modify;
                        until DirectorLedgerEntry.Next = 0;

                    end else begin
                        DirectorLedgerEntry.Init;
                        DirectorLedgerEntry."Director No" := Vendor."No.";
                        DirectorLedgerEntry.Type := DirectorLedgerEntry.Type::Deduction;
                        DirectorLedgerEntry.Code := Deductions.Code;
                        DirectorLedgerEntry.Validate(Code);
                        DirectorLedgerEntry."Payroll Period" := Month;
                        DirectorLedgerEntry."Department Code" := Vendor."Global Dimension 1 Code";
                        DirectorLedgerEntry."Posting Group Filter" := Vendor."Vendor Posting Group";
                        DirectorLedgerEntry."Department Code" := Vendor."Global Dimension 1 Code";
                        DirectorLedgerEntry.Validate(Amount);
                        if DirectorLedgerEntry.Amount <> 0 then
                            DirectorLedgerEntry.Insert;
                    end;
                    // end of deletion
                end;


                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code", true);
                if Deductions.Find('-') then begin
                    // Delete all Previous PAYE
                    DirectorLedgerEntry.Reset;
                    DirectorLedgerEntry.SetRange(Code, Deductions.Code);
                    DirectorLedgerEntry.SetRange(Type, DirectorLedgerEntry.Type::Deduction);
                    DirectorLedgerEntry.SetRange("Director No", Vendor."No.");
                    DirectorLedgerEntry.SetRange("Payroll Period", Month);
                    DirectorLedgerEntry.SetRange(Closed, false);
                    DirectorLedgerEntry.DeleteAll;
                    // end of deletion
                end;

                // validate assigment matrix code incase basic salary change and update calculation based on basic salary
                DirectorLedgerEntry.Reset;
                DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Director No", Vendor."No.");
                DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Payroll Period", Month);
                if DirectorLedgerEntry.Find('-') then begin
                    repeat
                        if DirectorLedgerEntry.Type = DirectorLedgerEntry.Type::Payment then begin
                            if Earnings.Get(DirectorLedgerEntry.Code) then begin
                                if (Earnings."Calculation Method" = Earnings."calculation method"::"% of Basic pay") or
                                   (Earnings."Calculation Method" = Earnings."calculation method"::"% of Basic after tax") or
                                   (Earnings."Calculation Method" = Earnings."calculation method"::"Based on Hourly Rate") then begin

                                    DirectorLedgerEntry.Validate(Code);

                                    //DirectorLedgerEntry.Amount:=ROUND(DirectorLedgerEntry.Amount,1);

                                    DirectorLedgerEntry.Modify;
                                end;
                            end;
                        end;


                    until DirectorLedgerEntry.Next = 0;
                end;


                Deductions.Reset;
                Deductions.SetRange(Deductions."PAYE Code", true);
                if Deductions.Find('-') then begin
                    GetPaye.CalculateTaxableAmount(Vendor."No.", Month, IncomeTax, TaxableAmount, RetireCont, MeetingDate);
                    // Create PAYE
                    DirectorLedgerEntry.Init;
                    DirectorLedgerEntry."Director No" := Vendor."No.";
                    DirectorLedgerEntry.Type := DirectorLedgerEntry.Type::Deduction;
                    DirectorLedgerEntry.Code := Deductions.Code;
                    DirectorLedgerEntry.Validate(Code);
                    DirectorLedgerEntry."Payroll Period" := Month;
                    DirectorLedgerEntry."Department Code" := Vendor."Global Dimension 1 Code";
                    if IncomeTax > 0 then
                        IncomeTax := -IncomeTax;
                    DirectorLedgerEntry.Amount := IncomeTax;
                    //MESSAGE('Incometax=%1',IncomeTax);
                    DirectorLedgerEntry.Paye := true;
                    DirectorLedgerEntry."Taxable amount" := TaxableAmount;
                    DirectorLedgerEntry."Less Tax Exempt" := RetireCont;
                    DirectorLedgerEntry.Paye := true;
                    DirectorLedgerEntry."Posting Group Filter" := Vendor."Vendor Posting Group";
                    DirectorLedgerEntry."Department Code" := Vendor."Global Dimension 1 Code";
                    DirectorLedgerEntry.Validate(Amount);
                    if DirectorLedgerEntry.Amount <> 0 then
                        DirectorLedgerEntry.Insert;
                end else
                    Error('Must specify Paye Code under deductions');

                //Update Pay Mode
                DirectorLedgerEntry.Reset;
                DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Director No", Vendor."No.");
                DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Payroll Period", Month);
                if DirectorLedgerEntry.Find('-') then
                    repeat
                        if Vendor."Payroll Pay Mode" <> DirectorLedgerEntry."Pay Mode" then begin
                            DirectorLedgerEntry."Pay Mode" := Vendor."Payroll Pay Mode";
                            DirectorLedgerEntry.Modify;
                        end;
                    until DirectorLedgerEntry.Next = 0;
                //





                Window.Update(1, Vendor.Name);
            end;

            trigger OnPostDataItem()
            begin
                Window.Close;
            end;

            trigger OnPreDataItem()
            begin
                Window.Open('Calculating Payroll For ##############################1', EmployeeName);
                PayrollPeriod.SetRange(Closed, false);
                if PayrollPeriod.Find('-') then
                    Month := PayrollPeriod."Starting Date";
                LastMonth := CalcDate('-1M', Month);
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
        GetPayPeriod;
        //PayPeriodtext:="Employee PayrollX".GETFILTER("Pay Period Filter");
        // IF PayPeriodtext='' THEN
        // ERROR('Pay period must be specified for this report');

        //DateSpecified:="Employee PayrollX".GETRANGEMIN("Employee PayrollX"."Pay Period Filter");
        DateSpecified := BeginDate;
        if PayPeriod.Get(DateSpecified) then
            PayPeriodtext := PayPeriod.Name;
        EndDate := CalcDate('1M', DateSpecified - 1);
        CompRec.Get;
        TaxCode := CompRec."Tax Table";
        MeetingDate := Vendor.GetFilter("Date Filter");

        /*
        IF UserRole.GET(USERID,'PAYROLLVIEW',' ')=FALSE THEN
        ERROR('You do not have permissions to view this form');
        
        */

    end;

    var
        DirectorLedgerEntry: Record "Director Ledger Entry";
        BeginDate: Date;
        DateSpecified: Date;
        BasicSalary: Decimal;
        TaxableAmount: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        TaxCode: Code[10];
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        IncomeTax: Decimal;
        relief: Decimal;
        DirectorRec: Record Vendor;
        NetPay: Decimal;
        NetPay1: Decimal;
        Index: Integer;
        Intex: Integer;
        AmountRemaining: Decimal;
        PayPeriod: Record "Directorsl PeriodX";
        DenomArray: array[1, 12] of Text[50];
        NoOfUnitsArray: array[1, 12] of Integer;
        AmountArray: array[1, 60] of Decimal;
        PayMode: Text[30];
        PayPeriodtext: Text[30];
        EndDate: Date;
        DaysinAmonth: Decimal;
        HoursInamonth: Decimal;
        Earnings: Record "Directors Earnings";
        CfMpr: Decimal;
        Deductions: Record "Director Deductions";
        NormalOvertimeHours: Decimal;
        WeekendOvertime: Decimal;
        PayrollPeriod: Record "Directorsl PeriodX";
        Window: Dialog;
        EmployeeName: Text[230];
        NoOfDays: Integer;
        Month: Date;
        GetPaye: Codeunit "Director Payroll";
        GetGroup: Codeunit "Director Payroll";
        GroupCode: Code[20];
        CUser: Code[20];
        CurrentMonth: Integer;
        CurrentMonthtext: Text[30];
        Ded: Record "Director Deductions";
        InterestAmt: Decimal;
        RefNo: Code[20];
        LastMonth: Date;
        NextPointer: Code[10];
        UserRole: Record "Access Control";
        NETPAY3: Decimal;
        MeetingDate: Text;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        //AmountRemaining:=ROUND(AmountRemaining,0.01);
        EndTax := false;
        TaxTable.SetRange("Table Code", TaxCode);


        if TaxTable.Find('-') then begin
            repeat

                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    //IF ROUND((TaxableAmount),0.01)>TaxTable."Upper Limit" THEN
                    if TaxableAmount > TaxTable."Upper Limit" then
                        Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100

                    else begin
                        Tax := AmountRemaining * TaxTable.Percentage / 100;
                        TotalTax := TotalTax + Tax;
                        EndTax := true;
                    end;
                    if not EndTax then begin
                        AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;
        if not Vendor."Pays tax" then
            IncomeTax := 0;
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
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


    procedure DefaultAssignment(EmployeeRec: Record Employee)
    var
        ScaleBenefits: Record "Scale Benefits";
    begin
        /*
        GetPayPeriod;
         IF BeginDate<>0D THEN
         BEGIN
           Assmatrix.INIT;
           Assmatrix."Employee No":=EmployeeRec."No.";
           Assmatrix.Type:=Assmatrix.Type::Payment;
           Assmatrix."Payroll Period":=BeginDate;
           Assmatrix."Department Code":=EmployeeRec."Global Dimension 1 Code";
           ScaleBenefits.RESET;
           ScaleBenefits.SETRANGE("Salary Scale",EmployeeRec."Salary Scale");
           ScaleBenefits.SETRANGE("Salary Pointer",EmployeeRec.Present);
           IF ScaleBenefits.FIND('-') THEN
           BEGIN
            REPEAT
             Assmatrix.Code:=ScaleBenefits."ED Code";
             Assmatrix.VALIDATE(Code);
             Assmatrix.Amount:=ScaleBenefits.Amount;
             Assmatrix.VALIDATE(Amount);
             IF NOT Assmatrix.GET(Assmatrix."Employee No",Assmatrix.Type,Assmatrix.Code,Assmatrix."Payroll Period") THEN
              Assmatrix.INSERT
             ELSE BEGIN
             Assmatrix.Code:=ScaleBenefits."ED Code";
             Assmatrix.VALIDATE(Code);
             Assmatrix.Amount:=ScaleBenefits.Amount;
             Assmatrix.VALIDATE(Amount);
             Assmatrix.MODIFY;
             END;
            UNTIL ScaleBenefits.NEXT=0;
           END;
        
        
          // Insert Deductions assigned to every employee
         Ded.RESET;
         Ded.SETRANGE("Applies to All",TRUE);
         IF Ded.FIND('-') THEN
         BEGIN
          REPEAT
           Assmatrix.INIT;
           Assmatrix."Employee No":=EmployeeRec."No.";
           Assmatrix.Type:=Assmatrix.Type::Deduction;
           Assmatrix."Payroll Period":=BeginDate;
           Assmatrix."Department Code":=EmployeeRec."Global Dimension 1 Code";
           Assmatrix.Code:=Ded.Code;
           Assmatrix.VALIDATE(Code);
           IF NOT Assmatrix.GET(Assmatrix."Employee No",Assmatrix.Type,Assmatrix.Code,Assmatrix."Payroll Period") THEN
            Assmatrix.INSERT
           ELSE BEGIN
            Assmatrix.Code:=Ded.Code;
            Assmatrix.VALIDATE(Code);
           END;
          UNTIL Ded.NEXT=0;
          END;
        
        END;
        */

    end;
}
