#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 89035 "Transfer Director Allowances1"
{
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem("Director Ledger Entry"; "Director Ledger Entry")
        {
            RequestFilterFields = "Payroll Period";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnPostDataItem()
            begin
                "Director Ledger Entry".SetRange("Director Ledger Entry"."Payroll Period", "Director Ledger Entry"."Payroll Period");
                "Director Ledger Entry".SetRange("Director Ledger Entry".Type, DirLedg.Type::Payment);
                "Director Ledger Entry".SetRange("Director Ledger Entry".Closed, false);
                "Director Ledger Entry".CalcSums("Director Ledger Entry".Amount);
                TotalPayments := "Director Ledger Entry".Amount;

                //Get total deductions
                DirLedg.Reset;
                DirLedg.SetRange("Payroll Period", "Director Ledger Entry"."Payroll Period");
                DirLedg.SetRange(Type, DirLedg.Type::Deduction);
                DirLedg.SetRange(Closed, false);
                DirLedg.CalcSums(Amount);
                TotalDeductions := DirLedg.Amount;
                NetAmount := TotalPayments - TotalDeductions;
                GenJnLine.Init;
                GenJnLine."Journal Template Name" := HRSetup."Director Journal Template";
                GenJnLine."Journal Batch Name" := HRSetup."Director Journal Batch Name";
                GenJnLine."Line No." := GenJnLine."Line No." + 10000;
                GenJnLine."Account Type" := GenJnLine."account type"::Vendor;
                GenJnLine."Account No." := HRSetup."Director Net Salary Account";
                GenJnLine.Validate("Account No.");
                GenJnLine."Posting Date" := Today;
                GenJnLine.Description := "Director Ledger Entry".Description + ' ' + Format("Director Ledger Entry"."Payroll Period", 0, '<month text> <year4>');
                GenJnLine."Document No." := Format("Director Ledger Entry"."Payroll Period", 0, '<month text> <year4>');
                GenJnLine."External Document No." := Format("Director Ledger Entry"."Payroll Period", 0, '<month text> <year4>');
                GenJnLine.Amount := -NetAmount;
                GenJnLine.Validate(Amount);
                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;
                //






                HRSetup.Get;
                EarnRec.SetRange("Pay Period Filter", "Director Ledger Entry"."Payroll Period");
                EarnRec.SetRange("Non-Cash Benefit", false);
                if EarnRec.Find('-') then begin
                    repeat
                        DirLedg1.Reset;
                        DirLedg1.SetRange(DirLedg1."Payroll Period", "Director Ledger Entry"."Payroll Period");
                        DirLedg1.SetRange(DirLedg1.Code, EarnRec.Code);
                        DirLedg1.SetRange(Closed, false);
                        //IF DirLedg1.FINDSET THEN BEGIN
                        DirLedg1.CalcSums(Amount);
                        //sEND;
                        EarnRec.CalcFields("Total Amount");
                        GenJnLine.Init;
                        GenJnLine."Journal Template Name" := HRSetup."Director Journal Template";
                        GenJnLine."Journal Batch Name" := HRSetup."Director Journal Batch Name";
                        GenJnLine."Line No." := GenJnLine."Line No." + 20000;
                        GenJnLine."Account Type" := EarnRec."Account Type";
                        GenJnLine."Account No." := EarnRec."Account No.";
                        //GenJnLine."Document Type":=GenJnLine."Document Type"::Invoice;
                        GenJnLine."Posting Date" := Today;
                        GenJnLine.Description := EarnRec.Description;
                        GenJnLine."Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."External Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine.Amount := DirLedg1.Amount;
                        GenJnLine.Validate(Amount);


                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    until EarnRec.Next = 0;
                end;
                DedRec.Reset;
                DedRec.SetRange("Pay Period Filter", "Director Ledger Entry"."Payroll Period");
                if DedRec.Find('-') then begin
                    repeat
                        DedRec.CalcFields("Total Amount");
                        DirLedg1.Reset;
                        DirLedg1.SetRange("Payroll Period", "Director Ledger Entry"."Payroll Period");
                        DirLedg1.SetRange(Code, DedRec.Code);
                        DirLedg1.SetRange(Closed, false);
                        DirLedg1.CalcSums(Amount);

                        GenJnLine.Init;
                        GenJnLine."Journal Template Name" := HRSetup."Director Journal Template";
                        GenJnLine."Journal Batch Name" := HRSetup."Director Journal Batch Name";
                        GenJnLine."Line No." := GenJnLine."Line No." + 10000;
                        GenJnLine."Account Type" := DedRec."account type"::Vendor;
                        GenJnLine."Account No." := DedRec."Account No.";
                        GenJnLine."Posting Date" := Today;
                        GenJnLine.Description := DedRec.Description;
                        GenJnLine."Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."External Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');

                        //GenJnLine.Amount:=DedRec."Total Amount";
                        GenJnLine.Amount := -DirLedg1.Amount;
                        GenJnLine.Validate(Amount);
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    until DedRec.Next = 0;

                end;
                /*
                DirLedg1.RESET;
                DirLedg1.SETRANGE(Closed,FALSE);
                IF DirLedg1.FINDFIRST THEN
                  BEGIN
                    DirLedg2.SETRANGE("Date of Meeting",DirLedg1."Date of Meeting");
                    IF DirLedg2.FINDSET THEN BEGIN
                      REPEAT
                          DirLedg2.Closed:=TRUE;
                          DirLedg2.MODIFY();
                      UNTIL DirLedg2.NEXT=0;
                      END
                  END
                  */

            end;

            trigger OnPreDataItem()
            begin

                //Delete Journal Entries
                HRSetup.Get;
                HRSetup.TestField("Director Journal Template");
                HRSetup.TestField("Director Journal Batch Name");
                if not JnlTemp.Get(HRSetup."Director Journal Template", HRSetup."Director Journal Batch Name") then begin
                    JnlTemp.Init;
                    JnlTemp."Journal Template Name" := HRSetup."Director Journal Template";
                    JnlTemp.Name := HRSetup."Director Journal Batch Name";
                    JnlTemp.Insert;
                end;

                GenJnLine.Reset;
                GenJnLine.SetRange("Journal Template Name", HRSetup."Director Journal Template");
                GenJnLine.SetRange("Journal Batch Name", HRSetup."Director Journal Batch Name");
                GenJnLine.DeleteAll;

                if not PPSetup.Get then
                    Error(Text000);
                TotalDeductions := 0;
                TotalPayments := 0;
                NetAmount := 0;
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
        Text000: label 'Purchases & Payables Setup doesn''t exist';
        EarnRec: Record "Directors Earnings";
        HRSetup: Record "Cash Management Setup";
        JnlTemp: Record "Gen. Journal Batch";
        GenJnLine: Record "Gen. Journal Line";
        DateSpecified: Date;
        DedRec: Record "Director Deductions";
        PPSetup: Record "Purchases & Payables Setup";
        DirLedg: Record "Director Ledger Entry";
        Payperiod: Record "Payroll PeriodX";
        Jobtask: Record "Job Task";
        job: Record Job;
        DirLedg1: Record "Director Ledger Entry";
        DirLedg2: Record "Director Ledger Entry";
        NetAmount: Decimal;
        TotalPayments: Decimal;
        TotalDeductions: Decimal;
        VendorPostingGroup: Record "Vendor Posting Group";
}
