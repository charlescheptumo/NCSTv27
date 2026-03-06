#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 69006 "Director Payroll"
{

    trigger OnRun()
    begin
    end;

    var
        AmountRemaining: Decimal;
        TaxableAmount: Decimal;
        TaxCode: Code[20];
        IncomeTax: Decimal;
        GrossTaxCharged: Decimal;
        relief: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        BeginDate: Date;
        BasicSalary: Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        Director: Record Vendor;
        retirecontribution: Decimal;
        ExcessRetirement: Decimal;
        PAYE: Decimal;
        TaxablePay: Decimal;
        DirectorRec: Record Vendor;
        BfMpr: Decimal;
        CfMpr: Decimal;
        GrossPay: Decimal;
        TotalBenefits: Decimal;
        RetireCont: Decimal;
        TotalQuarters: Decimal;
        LowInterestBenefits: Decimal;
        Netpay: Decimal;
        Earnings: Record "Directors Earnings";
        TerminalDues: Decimal;
        Earn: Record "Directors Earnings";
        TaxTable: Record BracketsX;
        Ded: Record "Director Deductions";
        i: Integer;
        Text000: label 'Preview is not allowed.';
        Text001: label 'Last Check No. must be filled in.';
        Text002: label 'Filters on %1 and %2 are not allowed.';
        Text003: label 'XXXXXXXXXXXXXXXX';
        Text004: label 'must be entered.';
        Text005: label 'The Bank Account and the General Journal Line must have the same currency.';
        Text006: label 'Salesperson';
        Text007: label 'Purchaser';
        Text008: label 'Both Bank Accounts must have the same currency.';
        Text009: label 'Our Contact';
        Text010: label 'XXXXXXXXXX';
        Text011: label 'XXXX';
        Text012: label 'XX.XXXXXXXXXX.XXXX';
        Text013: label '%1 already exists.';
        Text014: label 'Check for %1 %2';
        Text015: label 'Payment';
        Text016: label 'In the Check report, One Check per Vendor and Document No.\';
        Text017: label 'must not be activated when Applies-to ID is specified in the journal lines.';
        Text018: label 'XXX';
        Text019: label 'Total';
        Text020: label 'The total amount of check %1 is %2. The amount must be positive.';
        Text021: label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        Text022: label 'NON-NEGOTIABLE';
        Text023: label 'Test print';
        Text024: label 'XXXX.XX';
        Text025: label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        Text026: label 'ZERO';
        Text027: label 'HUNDRED';
        Text028: label 'AND';
        Text029: label '%1 results in a written number that is too long.';
        Text030: label ' is already applied to %1 %2 for customer %3.';
        Text031: label ' is already applied to %1 %2 for vendor %3.';
        Text032: label 'ONE';
        Text033: label 'TWO';
        Text034: label 'THREE';
        Text035: label 'FOUR';
        Text036: label 'FIVE';
        Text037: label 'SIX';
        Text038: label 'SEVEN';
        Text039: label 'EIGHT';
        Text040: label 'NINE';
        Text041: label 'TEN';
        Text042: label 'ELEVEN';
        Text043: label 'TWELVE';
        Text044: label 'THIRTEEN';
        Text045: label 'FOURTEEN';
        Text046: label 'FIFTEEN';
        Text047: label 'SIXTEEN';
        Text048: label 'SEVENTEEN';
        Text049: label 'EIGHTEEN';
        Text050: label 'NINETEEN';
        Text051: label 'TWENTY';
        Text052: label 'THIRTY';
        Text053: label 'FORTY';
        Text054: label 'FIFTY';
        Text055: label 'SIXTY';
        Text056: label 'SEVENTY';
        Text057: label 'EIGHTY';
        Text058: label 'NINETY';
        Text059: label 'THOUSAND';
        Text060: label 'MILLION';
        Text061: label 'BILLION';
        Text062: label 'G/L Account,Customer,Vendor,Bank Account';
        Text063: label 'Net Amount %1';
        Text064: label '%1 must not be %2 for %3 %4.';
        Text065: label 'AND // text0028 removed the AND';
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        mine: Text[30];
        EmployerContrib: Decimal;
        Text066: label 'No PAYE Deduction has been defined';


    procedure GetTaxBracket(var TaxableAmount: Decimal) GetTaxBracket: Decimal
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        CompRec.Get;
        TaxCode := GetTaxCode;
        //MESSAGE('%1',TaxCode);

        AmountRemaining := TaxableAmount;
        // AmountRemaining:=ROUND(AmountRemaining,0.01);
        EndTax := false;
        TaxTable.Reset;
        TaxTable.SetRange("Table Code", TaxCode);


        if TaxTable.Find('-') then begin
            repeat


                if AmountRemaining <= 0 then
                    EndTax := true


                else begin

                    // IF ROUND((TaxableAmount),1)>=TaxTable."Upper Limit" THEN
                    if TaxableAmount >= TaxTable."Upper Limit" then begin

                        Tax := (TaxTable."Taxable Amount" * TaxTable.Percentage / 100);
                        //  MESSAGE('%1',Tax);
                        //Tax:=ROUND((TaxTable."Taxable Amount"*TaxTable.Percentage/100),1);
                        // MESSAGE('Percent %1 %2',TaxTable.Percentage,Tax);
                        TotalTax := TotalTax + Tax;
                        //
                    end
                    else begin
                        //Deducted 1 here and got the xact figures just chek incase this may have issues
                        //Only the amount in the last Tax band had issues.
                        AmountRemaining := AmountRemaining - TaxTable."Lower Limit";
                        // MESSAGE('last bracket =%1 and Tax amt=%2',AmountRemaining,Tax);
                        Tax := AmountRemaining * (TaxTable.Percentage / 100);
                        // MESSAGE('%1',Tax);
                        //Tax:=AmountRemaining*TaxTable.Percentage/100;
                        //MESSAGE('last bracket =%1 and Tax amt=%2',AmountRemaining,Tax);
                        EndTax := true;
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        // MESSAGE('%1',TotalTax);
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;

        //GetTaxBracket:=ROUND(TotalTax,1,'<');
        GetTaxBracket := TotalTax;
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
    end;


    procedure CalculateTaxableAmount(var DirectorNo: Code[20]; var DateSpecified: Date; var FinalTax: Decimal; var TaxableAmountNew: Decimal; var RetirementCont: Decimal; var DateOfMeeting: Text)
    var
        DirectorLedgerEntry: Record "Director Ledger Entry";
        DirectorRec: Record Vendor;
        EarnRec: Record "Directors Earnings";
        InsuranceRelief: Decimal;
        PersonalRelief: Decimal;
        HRSetup: Record "Human Resources Setup";
        PPSetup: Record "Purchases & Payables Setup";
    begin
        CfMpr := 0;
        FinalTax := 0;
        i := 0;
        TaxableAmount := 0;
        RetirementCont := 0;
        InsuranceRelief := 0;
        PersonalRelief := 0;
        EmployerContrib := 0;
        //Get payroll period
        GetPayPeriod;
        if DateSpecified = 0D then
            Error('Pay period must be specified for this report');

        // Taxable Amount
        DirectorRec.Reset;
        DirectorRec.SetRange("No.", DirectorNo);
        DirectorRec.SetRange("Pay Period Filter", DateSpecified);
        DirectorRec.SetFilter("Date Filter", DateOfMeeting);
        if DirectorRec.Find('-') then begin
            if DirectorRec."Pays tax" = true then begin

                DirectorRec.CalcFields(DirectorRec."Taxable Income");
                TaxableAmount := DirectorRec."Taxable Income";


                //Per Diem Tax Deduction
                PPSetup.Get;
                EarnRec.Reset;
                EarnRec.SetRange("Per Diem", true);
                if EarnRec.Find('-') then begin
                    repeat
                        DirectorLedgerEntry.Reset;
                        DirectorLedgerEntry.SetRange("Payroll Period", DateSpecified);
                        DirectorLedgerEntry.SetRange(Type, DirectorLedgerEntry.Type::Payment);
                        DirectorLedgerEntry.SetRange(Code, EarnRec.Code);
                        DirectorLedgerEntry.SetRange("Director No", DirectorNo);
                        if DirectorLedgerEntry.Find('-') then begin
                            if DirectorLedgerEntry."No of Days" > 0 then begin
                                TaxableAmount := TaxableAmount;//-(DirectorLedgerEntry."No of Days"*PPSetup."Order Conditions");
                                RetirementCont := RetirementCont;//+DirectorLedgerEntry."No of Days"*PPSetup."Order Conditions";
                            end
                            else if DirectorLedgerEntry."No of Days" = 0 then begin
                                TaxableAmount := TaxableAmount;
                            end;
                        end;
                    until EarnRec.Next = 0;
                end;
                //

                TaxableAmountNew := TaxableAmount;

                // Get PAYE
                FinalTax := GetTaxBracket(TaxableAmount);

                // Get Reliefs
                InsuranceRelief := 0;
                // Calculate insurance relief;
                EarnRec.Reset;
                EarnRec.SetCurrentkey(EarnRec."Earning Type");
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Insurance Relief");
                if EarnRec.Find('-') then begin
                    repeat
                        DirectorLedgerEntry.Reset;
                        DirectorLedgerEntry.SetRange("Payroll Period", DateSpecified);
                        DirectorLedgerEntry.SetRange(Type, DirectorLedgerEntry.Type::Payment);
                        DirectorLedgerEntry.SetRange(Code, EarnRec.Code);
                        DirectorLedgerEntry.SetRange("Director No", DirectorNo);
                        if DirectorLedgerEntry.Find('-') then
                            InsuranceRelief := InsuranceRelief + DirectorLedgerEntry.Amount;
                    until EarnRec.Next = 0;
                end;


                // Personal Relief
                PersonalRelief := 0;
                EarnRec.Reset;
                EarnRec.SetCurrentkey(EarnRec."Earning Type");
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Tax Relief");
                if EarnRec.Find('-') then begin
                    repeat
                        DirectorLedgerEntry.Reset;
                        DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Payroll Period", DateSpecified);
                        DirectorLedgerEntry.SetRange(Type, DirectorLedgerEntry.Type::Payment);
                        DirectorLedgerEntry.SetRange(DirectorLedgerEntry.Code, EarnRec.Code);
                        DirectorLedgerEntry.SetRange(DirectorLedgerEntry."Director No", DirectorNo);
                        if DirectorLedgerEntry.Find('-') then
                            PersonalRelief := PersonalRelief + DirectorLedgerEntry.Amount;
                    until EarnRec.Next = 0;
                end;


                FinalTax := FinalTax - (PersonalRelief + InsuranceRelief);

                if FinalTax < 0 then begin


                    //Make final tax zero.
                    FinalTax := 0;

                end;

            end else
                FinalTax := 0;

        end;
        // MESSAGE('Runs this code');
    end;


    procedure GetUserGroup(var UserIDs: Code[10]; var PGroup: Code[20])
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserIDs) then begin
            // PGroup:=UserSetup."Payroll Group";
            if PGroup = '' then
                Error('Dont have payroll permission');
        end;
    end;


    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '****';


        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                Ones := No DIV Power(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;
        end;

        AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
        AddToNoText(NoText, NoTextIndex, PrintExponent, '');
        //FORMAT(No * 100) + '/100');

        if CurrencyCode <> '' then
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(Text029, AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;


    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
        amt: Decimal;
        DecPosistion: Integer;
        Decvalue: Text[30];
        amttext: Text[30];
        Wholeamt: Text[30];
        Stringlen: Integer;
        Decplace: Integer;
        holdamt: Text[30];
        FirstNoText: Text[30];
        SecNoText: Text[30];
        FirstNo: Integer;
        SecNo: Integer;
        Amttoround: Decimal;
    begin
        Evaluate(amttext, Format(Amount));
        DecPosistion := StrPos(amttext, '.');
        Stringlen := StrLen(amttext);

        if DecPosistion > 0 then begin
            Wholeamt := CopyStr(amttext, 1, DecPosistion - 1);

            Decplace := Stringlen - DecPosistion;
            Decvalue := CopyStr(amttext, DecPosistion + 1, 2);
            if StrLen(Decvalue) = 1 then
                holdamt := Decvalue + '0';
            if StrLen(Decvalue) > 1 then begin
                FirstNoText := CopyStr(Decvalue, 1, 1);
                SecNoText := CopyStr(Decvalue, 2, 1);
                Evaluate(SecNo, Format(SecNoText));
                if SecNo >= 5 then
                    holdamt := FirstNoText + '5'
                else
                    holdamt := FirstNoText + '0'

            end;
            amttext := Wholeamt + '.' + holdamt;
            Evaluate(Amttoround, Format(amttext));
        end else begin
            Evaluate(amttext, Format(Amount));
            Evaluate(Amttoround, Format(amttext));
        end;


        Amount := Amttoround;
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

    local procedure GetTaxCode() TaxCode: Code[20]
    begin

        Ded.Reset;
        Ded.SetRange("PAYE Code", true);
        Ded.SetFilter("Deduction Table", '<>%1', ' ');
        if Ded.FindFirst then
            exit(Ded."Deduction Table")
        else
            Error(Text066);

    end;
}
