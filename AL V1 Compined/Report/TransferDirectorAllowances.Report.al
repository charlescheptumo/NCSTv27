#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 89034 "Transfer Director Allowances"
{
    ProcessingOnly = true;
    UsageCategory = Tasks;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = where("Vendor Type" = const(Director));
            RequestFilterFields = "No.", "Pay Period Filter", "Date Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DirLedg.Reset;
                DirLedg.SetRange(DirLedg."Payroll Period", DateSpecified);
                DirLedg.SetRange(DirLedg."Director No", Vendor."No.");
                DirLedg.SetRange(DirLedg.Type, DirLedg.Type::Payment);
                DirLedg.SetRange(Closed, false);
                if DirLedg.Find('-') then
                    repeat
                        GenJnLine.Init;
                        GenJnLine."Journal Template Name" := HRSetup."Director Journal Template";
                        GenJnLine."Journal Batch Name" := HRSetup."Director Journal Batch Name";
                        GenJnLine."Line No." := GenJnLine."Line No." + 10000;
                        GenJnLine."Account Type" := GenJnLine."account type"::Vendor;
                        GenJnLine."Account No." := Vendor."No.";
                        //GenJnLine."Document Type":=GenJnLine."Document Type"::Invoice;
                        GenJnLine."Posting Date" := Today;
                        GenJnLine.Description := DirLedg.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                        GenJnLine."Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."External Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');

                        GenJnLine."Shortcut Dimension 1 Code" := Vendor."Global Dimension 1 Code";
                        GenJnLine.Amount := -DirLedg.Amount;
                        GenJnLine.Validate(Amount);
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    until DirLedg.Next = 0;

                //END;

                DirLedg.Reset;
                DirLedg.SetRange(DirLedg."Payroll Period", DateSpecified);
                DirLedg.SetRange(DirLedg."Director No", Vendor."No.");
                DirLedg.SetRange(DirLedg.Type, DirLedg.Type::Deduction);
                DirLedg.SetRange(Closed, false);
                if DirLedg.Find('-') then
                    repeat
                        GenJnLine.Init;
                        GenJnLine."Journal Template Name" := HRSetup."Director Journal Template";
                        GenJnLine."Journal Batch Name" := HRSetup."Director Journal Batch Name";
                        GenJnLine."Line No." := GenJnLine."Line No." + 10000;
                        GenJnLine."Account Type" := GenJnLine."account type"::Vendor;
                        GenJnLine."Account No." := Vendor."No.";
                        GenJnLine."Posting Date" := Today;
                        GenJnLine.Description := DirLedg.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                        GenJnLine."Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."External Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."Shortcut Dimension 1 Code" := Vendor."Global Dimension 1 Code";
                        GenJnLine.Amount := -DirLedg.Amount;
                        GenJnLine.Validate(Amount);
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert
                      until DirLedg.Next = 0;

            end;

            trigger OnPostDataItem()
            begin
                HRSetup.Get;
                EarnRec.SetRange("Pay Period Filter", DateSpecified);
                EarnRec.SetRange("Non-Cash Benefit", false);
                if EarnRec.Find('-') then begin
                    repeat
                        DirLedg1.Reset;
                        DirLedg1.SetRange(DirLedg1."Payroll Period", DateSpecified);
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
                        GenJnLine.Description := EarnRec.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                        GenJnLine."Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."External Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."Shortcut Dimension 1 Code" := Vendor."Global Dimension 1 Code";

                        GenJnLine.Amount := DirLedg1.Amount;
                        GenJnLine.Validate(Amount);


                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    until EarnRec.Next = 0;
                end;
                DedRec.Reset;
                DedRec.SetRange("Pay Period Filter", DateSpecified);
                if DedRec.Find('-') then begin
                    repeat
                        DedRec.CalcFields("Total Amount");
                        DirLedg1.Reset;
                        DirLedg1.SetRange(DirLedg1."Payroll Period", DateSpecified);
                        DirLedg1.SetRange(DirLedg1.Code, DedRec.Code);
                        DirLedg1.SetRange(Closed, false);
                        if DirLedg1.FindSet then begin
                            DirLedg1.CalcSums(Amount);
                        end;
                        GenJnLine.Init;
                        GenJnLine."Journal Template Name" := HRSetup."Director Journal Template";
                        GenJnLine."Journal Batch Name" := HRSetup."Director Journal Batch Name";
                        GenJnLine."Line No." := GenJnLine."Line No." + 10000;
                        GenJnLine."Account Type" := DedRec."Account Type";
                        GenJnLine."Account No." := DedRec."Account No.";
                        Payperiod.Reset;
                        GenJnLine."Posting Date" := Today;
                        GenJnLine.Description := DedRec.Description + ' ' + Format(DateSpecified, 0, '<month text> <year4>');
                        GenJnLine."Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."External Document No." := Format(DirLedg."Date of Meeting", 0, '<month text> <year4>');
                        GenJnLine."Shortcut Dimension 1 Code" := Vendor."Global Dimension 1 Code";
                        //GenJnLine.Amount:=DedRec."Total Amount";
                        GenJnLine.Amount := DirLedg1.Amount;
                        GenJnLine.Validate(Amount);
                        if GenJnLine.Amount <> 0 then
                            GenJnLine.Insert;
                    until DedRec.Next = 0;

                end;
                DirLedg1.Reset;
                DirLedg1.SetRange(Closed, false);
                if DirLedg1.FindFirst then begin
                    DirLedg2.SetRange("Date of Meeting", DirLedg1."Date of Meeting");
                    if DirLedg2.FindSet then begin
                        repeat
                            DirLedg2.Closed := true;
                            DirLedg2.Modify();
                        until DirLedg2.Next = 0;
                    end
                end
            end;

            trigger OnPreDataItem()
            begin

                DateSpecified := Vendor.GetRangeMin("Pay Period Filter");

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
}
