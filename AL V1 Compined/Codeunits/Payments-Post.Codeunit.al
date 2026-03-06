#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57000 "Payments-Post"
{

    trigger OnRun()
    begin
    end;

    var
        Batch: Record "Gen. Journal Batch";
        CMSetup: Record "Cash Management Setup";
        Text000: label 'There is a remaining amount of %1 are you sure you want to create a receipt for this amount?';
        Text001: label '&Post and Create &Receipt,&Post';
        Text002: label 'Are you sure you want to post Imprest No %1 ?';
        Text102: label 'Are you sure you want to Send Imprest No %1?';
        Text003: label 'The Imprest No %1  has not been fully approved';
        Text004: label 'The Imprest Lines are empty';
        Text005: label 'Amount cannot be zero';
        Text006: label 'Imprest %1 has been posted';
        Text007: label 'Are u sure u want to post Imprest Surrender No. %1 ?';
        Text008: label 'The Imprest Surrender No. %1 has not been fully approved';
        Text009: label 'The Imprest Surrender Lines are empty';
        Text010: label 'Imprest %1 has been surrendered';
        Text011: label 'Are you sure tou want to post Imprest Memo %1 ?';
        Text012: label 'The Imprest Memo amount is zero';
        Text013: label 'The Imprest Memo has already been posted';
        Tariffs: Record "Tariff Codes1";
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        NumberText: array[2] of Text[80];
        CurrencyCodeText: Code[10];
        Text014: label 'Are you sure you want to post petty cash surrender No %1 ?';
        Text015: label 'Petty Cash %1 has been surrendered';
        Text016: label 'Actual amount spent cannot be zero';
        Text017: label 'Are you sure you want to post receipt no. %1 ?';
        Text018: label 'The receipt is already posted';
        WText001: label 'Last Check No. must be filled in.';
        WText002: label 'Filters on %1 and %2 are not allowed.';
        WText003: label 'XXXXXXXXXXXXXXXX';
        WText004: label 'must be entered.';
        WText005: label 'The Bank Account and the General Journal Line must have the same currency.';
        WText006: label 'Salesperson';
        WText007: label 'Purchaser';
        WText008: label 'Both Bank Accounts must have the same currency.';
        WText009: label 'Our Contact';
        WText010: label 'XXXXXXXXXX';
        WText011: label 'XXXX';
        WText012: label 'XX.XXXXXXXXXX.XXXX';
        WText013: label '%1 already exists.';
        WText014: label 'Check for %1 %2';
        WText015: label 'Payment';
        WText016: label 'In the Check report, One Check per Vendor and Document No.\';
        WText017: label 'must not be activated when Applies-to ID is specified in the journal lines.';
        WText018: label 'XXX';
        WText019: label 'Total';
        WText020: label 'The total amount of check %1 is %2. The amount must be positive.';
        WText021: label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        WText022: label 'NON-NEGOTIABLE';
        WText023: label 'Test print';
        WText024: label 'XXXX.XX';
        WText025: label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        WText026: label 'ZERO';
        WText027: label 'HUNDRED';
        WText028: label 'AND';
        WText029: label '%1 results in a written number that is too long.';
        WText030: label ' is already applied to %1 %2 for customer %3.';
        WText031: label ' is already applied to %1 %2 for vendor %3.';
        WText032: label 'ONE';
        WText033: label 'TWO';
        WText034: label 'THREE';
        WText035: label 'FOUR';
        WText036: label 'FIVE';
        WText037: label 'SIX';
        WText038: label 'SEVEN';
        WText039: label 'EIGHT';
        WText040: label 'NINE';
        WText041: label 'TEN';
        WText042: label 'ELEVEN';
        WText043: label 'TWELVE';
        WText044: label 'THIRTEEN';
        WText045: label 'FOURTEEN';
        WText046: label 'FIFTEEN';
        WText047: label 'SIXTEEN';
        WText048: label 'SEVENTEEN';
        WText049: label 'EIGHTEEN';
        WText050: label 'NINETEEN';
        WText051: label 'TWENTY';
        WText052: label 'THIRTY';
        WText053: label 'FORTY';
        WText054: label 'FIFTY';
        WText055: label 'SIXTY';
        WText056: label 'SEVENTY';
        WText057: label 'EIGHTY';
        WText058: label 'NINETY';
        WText059: label 'THOUSAND';
        WText060: label 'MILLION';
        WText061: label 'BILLION';
        Acct: Record "G/L Account";
        Imprest1: Record Payments;
        Text019: label 'Are you sure tou want to post Imprest Memo Surrender %1 ?';
        Text020: label 'The Imprest Memo has already been surrendered';
        Text021: label 'Are you sure you want to post Staff Claim %1?';
        text022: label 'Staff claim amount cannot be 0. Please confirm the amount and try again.';
        Text023: label 'Staff claim must be fully approved before posting';
        text024: label 'Are you sure you want to post staff claim No. %1?';
        NoSeries: Code[30];
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        NetAmount: Decimal;
        i: Integer;


    procedure "Post Payment Voucher"(PV: Record Payments)
    var
        PVLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        BudgetCommitment: Record "Budget Commitment";
        GLEntryrec: Record "Vendor Ledger Entry";
    begin
        if Confirm('Are you sure you want to post the Payment Voucher No. ' + PV."No." + ' ?') = true then begin
            if PV.Status <> PV.Status::Released then
                Error('The Payment Voucher No %1 has not been fully approved', PV."No.");
            if PV.Posted then
                Error('Payment Voucher %1 has been posted', PV."No.");
            PV.TestField(Date);
            PV.TestField("Paying Bank Account");
            PV.TestField(PV.Payee);
            PV.TestField(PV."Pay Mode");
            PV.TestField(PV."Posting Date");
            if PV."Pay Mode" = 'CHEQUE' then begin
                PV.TestField(PV."Cheque No");
                PV.TestField(PV."Cheque Date");
            end;

            PV.CalcFields(PV."Total Retention Amount");
            //Check Lines
            PV.CalcFields("Total Amount");
            if PV."Total Amount" = 0 then
                Error('Amount is cannot be zero');
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if not PVLines.FindLast then
                Error('Payment voucher Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PV Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PV Journal Batch Name");
            GenJnLine.DeleteAll;

            /*
              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Payment Voucher Template";
              Batch.Name:=PV."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
            */
            //Bank Entries

            LineNo := LineNo + 10000;
            PV.CalcFields(PV."Total Amount");
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            PVLines.Validate(PVLines.Amount);
            PVLines.CalcSums(PVLines.Amount);
            PVLines.CalcSums(PVLines."W/Tax Amount");
            PVLines.CalcSums(PVLines."VAT Amount");
            PVLines.CalcSums(PVLines."Retention  Amount");
            PVLines.CalcSums(PVLines."Net Amount");
            PVLines.CalcSums(PVLines."Amount Paid");
            if PVLines."Amount Paid" = PVLines."Net Amount" then
                Message('', PVLines."Amount Paid");
            ///get exact amounts from pv lines
            NetAmount := PVLines."Net Amount";

            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Document Type" := PV."Document Type";
            GenJnLine."Account No." := PV."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PV.Date = 0D then
                Error('You must specify the PV date');
            GenJnLine."Posting Date" := PV."Posting Date";
            GenJnLine."Document No." := PV."No.";
            GenJnLine."External Document No." := PV."Cheque No";
            GenJnLine."Payment Method Code" := PV."Pay Mode";
            GenJnLine.Description := 'Pay :' + PV."Payment Narration";
            //GenJnLine.Amount:=-PV."Total Net Amount";
            PVLines.CalcSums(PVLines."Net Amount");
            //GenJnLine.Amount:=-ROUND(PVLines."Net Amount",0.01,'<');
            GenJnLine.Amount := -FundRounding(PVLines."Net Amount");
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            //GenJnLine."Pay Mode":=PV."Pay Mode";
            //IF PV."Pay Mode"='CHEQUE' THEN
            //GenJnLine."Cheque Date":=PV."Cheque Date";




            GenJnLine."Shortcut Dimension 1 Code" := PV."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PV."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

            GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //PV Lines Entries
            PVLines.Reset;
            PVLines.SetRange(PVLines.No, PV."No.");
            if PVLines.FindFirst then begin
                repeat
                    //PVLines.VALIDATE(PVLines.Amount);
                    //PVLines.VALIDATE(PVLines."Retention  Amount");
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'Pay To:' + PV."Payment Narration";
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=ROUND(PVLines."Net Amount",0.01,'>');
                    GenJnLine.Amount := FundRounding(PVLines."Net Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);


                    //Payment Vouchers With Part Payment David.




                    //add jobs if g/l account and income statement account

                    if GenJnLine."Account Type" = GenJnLine."account type"::"G/L Account" then begin
                        if Acct.Get(GenJnLine."Account No.") then begin
                            if Acct."Income/Balance" = Acct."income/balance"::"Income Statement" then begin
                                GenJnLine."Job No." := PV.Project;
                                GenJnLine."Job Task No." := PV."Job Task No.";
                                GenJnLine."Job Quantity" := 1;

                                GenJnLine.Validate(GenJnLine."Job No.");
                                GenJnLine.Validate(GenJnLine."Job Task No.");
                                GenJnLine.Validate(GenJnLine."Job Quantity");
                            end;
                        end;
                    end;
                    //end jobs

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //application only to type Vendor
                    if GenJnLine."Account Type" = GenJnLine."account type"::Vendor then begin
                        GLEntryrec.Reset;
                        GLEntryrec.SetRange("Document No.", PVLines."Applies to Doc. No");
                        GLEntryrec.SetRange(Open, true);
                        if GLEntryrec.FindSet then begin
                            GenJnLine."Applies-to Doc. Type" := GLEntryrec."Applies-to Doc. Type";
                        end else
                            GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;
                    /*
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
                    */
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    // VAT withheld

                    if PVLines."VAT Withheld Amount" > 0 then
                        Tariffs.Get(PVLines."VAT Withheld Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Payment;
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PV.Payee + '-VAT Withheld';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=-ROUND(PVLines."VAT Withheld Amount",0.01,'>');
                    GenJnLine.Amount := -FundRounding(PVLines."VAT Withheld Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'VAT WITHHELD:';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    //GenJnLine.Amount:=ROUND(PVLines."VAT Withheld Amount",0.01,'>');
                    GenJnLine.Amount := FundRounding(PVLines."VAT Withheld Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                    GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");


                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                    //Posting of Advance Recovery David & Spencer

                    if PV."Advance Recovery" <> 0 then
                        LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PV."Account Type";
                    GenJnLine."Account No." := PV."Account No.";

                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV posting date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PV.Payee + '-AdA';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //MESSAGE('%1',PV."Advance Recovery");
                    //GenJnLine.Amount:=-ROUND(PV."Advance Recovery",0.01,'>');
                    GenJnLine.Amount := -FundRounding(PV."Advance Recovery");
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the Posting PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'Advance Recovery Amount:';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    //GenJnLine.Amount:=PVLines."Retention  Amount";
                    //GenJnLine.Amount:=ROUND(PV."Advance Recovery",1.01,'>');
                    GenJnLine.Amount := FundRounding(PV."Advance Recovery");
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                    GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");


                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //end of Posting of Advance Recovery David & Spencer




                    //Withholding Tax

                    if PVLines."W/Tax Amount" > 0 then
                        Tariffs.Get(PVLines."W/Tax Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PV.Payee + '-WholdingTax';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=-ROUND(PVLines."W/Tax Amount",0.01,'>');
                    GenJnLine.Amount := -FundRounding(PVLines."W/Tax Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");


                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'WITHHOLDING TAX:';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    //GenJnLine.Amount:=ROUND(PVLines."W/Tax Amount",0.01,'>');
                    GenJnLine.Amount := FundRounding(PVLines."W/Tax Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                    GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");


                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;


                    //Retention

                    if PVLines."Retention  Amount" > 0 then
                        Tariffs.Get(PVLines."Retention Code");

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := Tariffs."Account Type";
                    GenJnLine."Account No." := Tariffs."Account No.";

                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := PV.Payee + '-AmRetained';
                    //GenJnLine."Description 2":=PV."On behalf of";

                    //GenJnLine.Amount:=-ROUND(PV."Total Retention Amount",0.01,'>');
                    GenJnLine.Amount := -FundRounding(PV."Total Retention Amount");
                    //GenJnLine.Amount:=-PVLines."Retention  Amount";
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PVLines."Account Type";
                    GenJnLine."Account No." := PVLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PV."Posting Date" = 0D then
                        Error('You must specify the PV date');
                    GenJnLine."Posting Date" := PV."Posting Date";
                    GenJnLine."Document No." := PV."No.";
                    GenJnLine."External Document No." := PV."Cheque No";
                    GenJnLine."Payment Method Code" := PV."Pay Mode";
                    GenJnLine.Description := 'AMOUNT RETAINED:';
                    //GenJnLine."Description 2":=PV."On behalf of";
                    //GenJnLine.Amount:=PVLines.Amount;
                    //GenJnLine.Amount:=PVLines."Retention  Amount";
                    //GenJnLine.Amount:=ROUND(PV."Total Retention Amount",0.01,'>');
                    GenJnLine.Amount := FundRounding(PV."Total Retention Amount");
                    if PV."Pay Mode" = 'CHEQUE' then
                        //GenJnLine."Pay Mode":=PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    GenJnLine."Shortcut Dimension 1 Code" := PVLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PVLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PV."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    GenJnLine."Applies-to Doc. No." := PVLines."Applies to Doc. No";
                    GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");


                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                    //decommit entry
                    BudgetCommitment.Reset;
                    BudgetCommitment.SetRange("Account No.", PVLines."Vote Item");
                    BudgetCommitment.SetRange("Committment Amount", PVLines.Amount);
                    if BudgetCommitment.FindFirst then begin
                        BudgetCommitment.Decommit := true;
                        BudgetCommitment.Modify(true);
                    end;
                //end decommit
                until PVLines.Next = 0;
            end;
            //End of Posting Withholding Tax
            //END;
            /*
            GenJnLine.VALIDATE(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
            GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
            GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
            IF GenJnLine.Amount<>0 THEN
             GenJnLine.INSERT;

            LineNo:=LineNo+10000;
            GenJnLine.INIT;
            IF CMSetup.GET THEN
            GenJnLine."Journal Template Name":=CMSetup."Payment Voucher Template";
            GenJnLine."Journal Batch Name":=PV."No.";
            GenJnLine."Line No.":=LineNo;
            GenJnLine."Account Type":=GenJnLine."Account Type"::"G/L Account";
            CASE PVLines."Account Type" OF
            PVLines."Account Type"::"G/L Account":
            BEGIN
            GLAccount.GET(PVLines."Account No");
            GLAccount.TESTFIELD("VAT Bus. Posting Group");
            IF VATSetup.GET(GLAccount."VAT Bus. Posting Group",PVLines."W/T VAT Code") THEN
            GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
            END;
            PVLines."Account Type"::Vendor:
            BEGIN
            Vendor.GET(PVLines."Account No");
            Vendor.TESTFIELD("VAT Bus. Posting Group");
            IF VATSetup.GET(Vendor."VAT Bus. Posting Group",PVLines."W/T VAT Code") THEN
            GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
            END;
            PVLines."Account Type"::Customer:
            BEGIN
            Customer.GET(PVLines."Account No");
            Customer.TESTFIELD("VAT Bus. Posting Group");
            IF VATSetup.GET(Customer."VAT Bus. Posting Group",PVLines."W/T VAT Code") THEN
            GenJnLine."Account No.":=VATSetup."Purchase VAT Account";
            GenJnLine.VALIDATE(GenJnLine."Account No.");
            END;
            END;
             IF PV.Date=0D THEN
              ERROR('You must specify the PV date');
            GenJnLine."Posting Date":=PV.Date;
            GenJnLine."Document No.":=PV."No.";
            GenJnLine."External Document No.":=PV."Cheque No";
            GenJnLine.Description:=PVLines.Description;
            GenJnLine.Amount:=-PVLines."W/T VAT Amount";
            //Set these fields to blanks
            GenJnLine."Gen. Posting Type":=GenJnLine."Gen. Posting Type"::" ";
            GenJnLine.VALIDATE("Gen. Posting Type");
            GenJnLine."Gen. Bus. Posting Group":='';
            GenJnLine.VALIDATE("Gen. Bus. Posting Group");
            GenJnLine."Gen. Prod. Posting Group":='';
            GenJnLine.VALIDATE("Gen. Prod. Posting Group");
            GenJnLine."VAT Bus. Posting Group":='';
            GenJnLine.VALIDATE("VAT Bus. Posting Group");
            GenJnLine."VAT Prod. Posting Group":='';
            GenJnLine.VALIDATE("VAT Prod. Posting Group");
            //
            //IF PV."Pay Mode"='CHEQUE' THEN
            //GenJnLine."Pay Mode":=PV."Pay Mode";
            GenJnLine."Currency Code":=PV.Currency;
            GenJnLine.VALIDATE("Currency Code");
            GenJnLine.VALIDATE(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code":=PVLines."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=PVLines."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
            //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::"";
            //GenJnLine."Applies-to Doc. No.":=PVLines."Applies to Doc. No";
            //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");
            IF GenJnLine.Amount<>0 THEN
             GenJnLine.INSERT;
            END;
            //End of Posting Withholding VAT

            UNTIL PVLines.NEXT=0;
            END;
            */


            //David
            if Confirm('Do you want to post the Journal lines for the PV: ' + PV."No." + ' ?') = true then begin
                Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
                /*GLEntry.RESET;
                GLEntry.SETRANGE(GLEntry."Document No.",PV."No.");
                GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
                IF GLEntry.FINDFIRST THEN BEGIN*/
                PV.Posted := true;
                PV."Posted By" := UserId;
                PV."Posted Date" := Today;
                PV."Time Posted" := Time;
                PV.Modify;
                PVLines."No. Posted" := PVLines."No. Posted" + 1;

                //Create Imprest Surrender in the event the document originated from an imprest.
                /*
                IF PV."Original Document"=PV."Original Document"::Imprest THEN BEGIN
                   PV."Payment Type":=PV."Payment Type"::"10";
                   PV.Status:=PV.Status::Open;
                   PV.MODIFY;
                END;
                */
                //END;
            end;
        end; //end of if No. Posted statement David

    end;


    procedure "Post Imprest"(var Imprest: Record Payments)
    var
        ImprestLines: Record Payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImpLine: Record "Imprest Lines";
    begin

        if Confirm(Text002, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");

            CMSetup.Get;

            Imprest.TestField("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Pay Mode");
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            //Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            Imprest.TestField("Posting Date");


            if Imprest."Pay Mode" = 'CHEQUE' then begin
                Imprest.TestField("Cheque No");
                Imprest.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
            if not ImprestLines.FindLast then
                Error(Text004);

            Imprest.CalcFields("Imprest Amount");
            if Imprest."Imprest Amount" = 0 then
                Error(Text005);

            if Imprest.Posted then
                Error(Text006, Imprest."No.");

            CMSetup.Get();
            CMSetup.TestField("Imprest Due Date");
            CMSetup.TestField("IMPREST Journal Batch Name");
            CMSetup.TestField("Imprest Journal Template");

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST Journal Batch Name");
            GenJnLine.DeleteAll;

            /*
              // Delete Lines Present on the General Journal Line
              GenJnLine.RESET;
              GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Imprest Template");
              GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",Imprest."No.");
              GenJnLine.DELETEALL;
            d
              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Imprest Template";
              Batch.Name:=Imprest."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
              */
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."IMPREST Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Imprest."Paying Bank Account";
            GenJnLine."Posting Date" := Imprest."Posting Date";
            GenJnLine."Document No." := Imprest."No.";
            GenJnLine."External Document No." := Imprest."Cheque No";
            GenJnLine.Description := 'Imprest issued to ' + Imprest.Payee;
            // GenJnLine."Currency Code":=Imprest.Currency;
            // GenJnLine.VALIDATE("Currency Code");
            GenJnLine.Amount := -Imprest."Imprest Amount";
            GenJnLine."Posting Group" := CMSetup."Imprest Posting Group";
            GenJnLine.Validate(Amount);

            GenJnLine."Shortcut Dimension 1 Code" := Imprest."Shortcut Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Imprest."Shortcut Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            GenJnLine."Bal. Account Type" := GenJnLine."bal. account type"::Employee;
            GenJnLine."Bal. Account No." := Imprest."Account No.";
            GenJnLine.Validate("Bal. Account No.");

            GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", Imprest."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            //GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
            if GLEntry.FindFirst then begin

                Imprest.Posted := true;
                Imprest."Posted By" := UserId;
                Imprest."Posted Date" := Today;
                Imprest."Time Posted" := Time;
                /// Imprest.Status:=Imprest.Status::Open;
                //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
                //Update the Imprest Deadline
                //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);
                Imprest.Modify;
            end;
            //pending

        end;

        /*
         IF Imprest1.GET(ImprestLines."No.") THEN BEGIN
         Imprest1."Payment Type":=Imprest1."Payment Type"::"Imprest Surrender";
         Imprest1."Document Type":=Imprest1."Document Type"::"Imprest Surrender";
         Imprest1.Status:=Imprest1.Status::Open;
         Imprest1."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",GenJnLine."Posting Date");
         Imprest1.MODIFY;
         END;
         */

    end;


    procedure "Post ImprestSurrenderBCK"(var ImprestSurrender: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        LineNo: Integer;
        GenJnLine: Record "Gen. Journal Line";
        Committment: Codeunit Committment;
        GLEntry: Record "G/L Entry";
        NoSeriesMgt: Codeunit "No. Series";
        GLSetup: Record "General Ledger Setup";
        Window: Dialog;
        Selection: Integer;
    begin

        if Confirm(Text007, false, ImprestSurrender."No.") = true then begin

            ImprestSurrender.TestField("Surrender Date");
            //Check if amount surrendered is less than amount advanced
            ImprestSurrender.CalcFields("Remaining Amount");
            if ImprestSurrender."Remaining Amount" > 0 then
                Selection := StrMenu(Text001, 1);
            if ImprestSurrender.Status <> ImprestSurrender.Status::Released then
                Error(Text008, ImprestSurrender."No.");

            ImprestSurrender.TestField("Account No.");
            ImprestSurrender.TestField("Paying Bank Account");
            ImprestSurrender.TestField(Date);
            ImprestSurrender.TestField(Payee);
            ImprestSurrender.TestField("Pay Mode");
            if ImprestSurrender."Pay Mode" = 'CHEQUE' then begin
                ImprestSurrender.TestField("Cheque No");
                ImprestSurrender.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if not ImprestLines.FindLast then
                Error(Text009);

            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            /*IF ImprestLines."Actual Spent"=0 THEN
             ERROR('Actual Spent Amount cannot be zero');*/

            if ImprestSurrender.Surrendered then
                Error(Text010, ImprestSurrender."No.");
            //MESSAGE('Tuko hapa!');
            GLSetup.Get;

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", ImprestSurrender."No.");
            GenJnLine.DeleteAll;

            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Imprest Surrender Template";
            Batch.Name := ImprestSurrender."No.";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            //Staff entries
            LineNo := 10000;
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            ImprestLines.CalcSums("Actual Spent");
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Customer;
            GenJnLine."Account No." := ImprestSurrender."Account No.";
            GenJnLine."Posting Date" := ImprestSurrender."Surrender Date";
            GenJnLine."Document No." := ImprestSurrender."No.";
            GenJnLine."External Document No." := ImprestSurrender."Cheque No";
            GenJnLine.Description := ImprestSurrender.Payee;
            GenJnLine.Amount := -ImprestLines."Actual Spent";
            //GenJnLine.VALIDATE(Amount);
            GenJnLine."Applies-to Doc. No." := ImprestSurrender."No.";
            GenJnLine.Validate("Applies-to Doc. No.");
            GenJnLine."Shortcut Dimension 1 Code" := ImprestSurrender."Shortcut Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ImprestSurrender."Shortcut Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");
            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;
            //Create Receipt IF Chosen
            if Selection = 1 then begin
                //Insert Header
                ImprestSurrender.CalcFields("Remaining Amount");
                if ImprestSurrender."Remaining Amount" > 0 then begin
                    if ImprestSurrender."Receipt Created" = false then begin
                        /*
                        ReceiptHeader.INIT;
                        ReceiptHeader."No.":=NoSeriesMgt.GetNextNo(GLSetup."Receipt Nos",TODAY,TRUE);
                        ReceiptHeader.Date:=ImprestSurrender."Imprest Surrender Date";
                        ReceiptHeader."Received From":=ImprestSurrender.Payee;
                        ReceiptHeader."On Behalf Of":=ImprestSurrender."On behalf of";
                        ReceiptHeader."Global Dimension 1 Code":=ImprestSurrender."Global Dimension 1 Code";
                        ReceiptHeader."Global Dimension 2 Code":=ImprestSurrender."Global Dimension 2 Code";
                        IF NOT ReceiptHeader.GET(ReceiptHeader."No.") THEN
                        ReceiptHeader.INSERT;
                        */
                    end;
                end;
            end;

            //Expenses
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, ImprestSurrender."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := ImprestSurrender."No.";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    if GenJnLine."Account Type" = ImprestLines."account type"::"Fixed Asset" then
                        GenJnLine."FA Posting Type" := GenJnLine."fa posting type"::"Acquisition Cost";
                    GenJnLine."Account No." := ImprestLines."Account No.";
                    GenJnLine.Validate("Account No.");
                    GenJnLine."Posting Date" := ImprestSurrender."Surrender Date";
                    GenJnLine."Document No." := ImprestSurrender."No.";
                    GenJnLine.Description := ImprestLines.Description;
                    GenJnLine.Amount := ImprestLines."Actual Spent";
                    GenJnLine.Validate(Amount);
                    //Set these fields to blanks
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    GenJnLine.Validate("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");
                    //
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestLines."Global Dimension 1 Code";
                    GenJnLine.Validate("Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestLines."Global Dimension 2 Code";
                    GenJnLine.Validate("Shortcut Dimension 2 Code");
                    //Ushindi...Insert Job Nos
                    GenJnLine."Job No." := ImprestSurrender.Job;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine."Job Task No." := ImprestSurrender."Job Task No.";
                    //MESSAGE('Tuko hapa!');
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine."Job Quantity" := ImprestLines."Job Quantity";
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //End Of Ushindi changes
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                    //Insert Receipt Lines
                    if Selection = 1 then begin
                        if ImprestLines."Remaining Amount" > 0 then begin
                            if ImprestSurrender."Receipt Created" = false then begin
                                /*
                                ReceiptLine.INIT;
                                ReceiptLine."Line No":=LineNo;
                                ReceiptLine."Receipt No.":=ReceiptHeader."No.";
                                ReceiptLine."Account Type":=ImprestSurrender."Account Type";
                                ReceiptLine."Account No.":=ImprestSurrender."Account No.";
                                ReceiptLine."Account Name":=ImprestSurrender."Account Name";
                                ReceiptLine.Description:=ImprestLines.Description;
                                ReceiptLine.Amount:=ImprestLines."Remaining Amount";
                                ReceiptLine."Global Dimension 1 Code":=ImprestLines."Global Dimension 1 Code";
                                ReceiptLine."Global Dimension 2 Code":=ImprestLines."Global Dimension 2 Code";
                                IF NOT ReceiptLine.GET(ReceiptLine."Line No",ReceiptLine."Receipt No.") THEN
                                 ReceiptLine.INSERT;
                                */
                            end;
                        end;
                    end;
                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /* GLEntry.RESET;
             GLEntry.SETRANGE(GLEntry."Document No.",ImprestSurrender."No.");
             GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
             GLEntry.SETRANGE("Posting Date",ImprestSurrender."Surrender Date");
             IF GLEntry.FINDFIRST THEN BEGIN*/
            ImprestSurrender.Surrendered := true;
            if Selection = 1 then
                ImprestSurrender."Receipt Created" := true;
            ImprestSurrender.Modify;
            //Uncommit Entries made to the varoius expenses accounts
            Committment.UncommitImprest(ImprestSurrender);
            //END;
        end;

    end;


    procedure PostImprestMemo(var ImprestMemo: Record "Imprest Memo")
    var
        JobPlanningLines: Record "Job Planning Line";
        LineNo: Integer;
        ProjectMembers: Record "Project Members";
        WorkType: Record "Work Type";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
    begin
        if not Confirm(Text011, false, ImprestMemo."No.") then
            exit;

        begin
            //Check if Posted
            if ImprestMemo.Posted then
                Error(Text013);

            //
            //Check totals
            ImprestMemo.CalcFields("Total Subsistence Allowance");
            //  IF ImprestMemo."Total Subsistence Allowance"=0 THEN
            //    ERROR(Text012);
            // {
            //  //Post Entries into the Job Task Lines
            //   JobPlanningLines.RESET;
            //   JobPlanningLines.SETRANGE("Job No.",Project);
            //   JobPlanningLines.SETRANGE("Job Task No.","Project Task");
            //    IF JobPlanningLines.FINDLAST THEN
            //     LineNo:=JobPlanningLines."Line No."+1
            //    ELSE
            //     LineNo:=1000;
            // }
            //Loop through Project Members
            ProjectMembers.Reset;
            ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            ProjectMembers.SetRange(Posted, false);
            if ProjectMembers.Find('-') then
                repeat
                    /*
                     LineNo:=LineNo+1000;
                     JobPlanningLines.INIT;
                     JobPlanningLines."Job No.":=ImprestMemo.Project;
                     JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                     JobPlanningLines."Line No.":=LineNo;
                     JobPlanningLines.Type:=JobPlanningLines.Type::Resource;
                     JobPlanningLines."No.":=ProjectMembers."No.";
                     JobPlanningLines.VALIDATE("No.");
                     JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                     JobPlanningLines."Planning Date":=Date;
                     JobPlanningLines."Planned Delivery Date":=CALCDATE(FORMAT(ProjectMembers.Delivery)+'D',Date);
                     JobPlanningLines.Description:=ProjectMembers."Tasks to Carry Out";
                     JobPlanningLines."Work Type Code":=ProjectMembers."Work Type";
                     JobPlanningLines.VALIDATE("Work Type Code");
                     JobPlanningLines.Quantity:=ProjectMembers."Time Period";
                     IF ProjectMembers.Entitlement<>0 THEN //Cases of Personell
                     BEGIN
                       IF ProjectMembers."Time Period"<>0 THEN BEGIN
                       JobPlanningLines."Unit Cost":=ProjectMembers.Entitlement/ProjectMembers."Time Period";
                       JobPlanningLines."Unit Cost (LCY)":=ProjectMembers.Entitlement/ProjectMembers."Time Period";
                       END
                       ELSE BEGIN
                         IF WorkType.GET(ProjectMembers."Work Type") THEN;
                       JobPlanningLines."Unit Cost":=WorkType.Rate;
                       JobPlanningLines."Unit Cost (LCY)":=WorkType.Rate;
                       END;
                       JobPlanningLines."Line Amount":=ProjectMembers.Entitlement;
                       JobPlanningLines."Line Amount (LCY)":=ProjectMembers.Entitlement;
                    END ELSE
                    BEGIN//Cases of Machinery
                       IF ProjectMembers."Time Period"<>0 THEN BEGIN
                       JobPlanningLines."Unit Cost":=ProjectMembers."Expected Maintenance Cost"/ProjectMembers."Time Period";
                       JobPlanningLines."Unit Cost (LCY)":=ProjectMembers."Expected Maintenance Cost"/ProjectMembers."Time Period";
                       END
                       ELSE BEGIN
                         IF WorkType.GET(ProjectMembers."Work Type") THEN;
                       JobPlanningLines."Unit Cost":=WorkType.Rate;
                       JobPlanningLines."Unit Cost (LCY)":=WorkType.Rate;
                       END;
                       JobPlanningLines."Line Amount":=ProjectMembers."Expected Maintenance Cost";
                        JobPlanningLines."Line Amount (LCY)":=ProjectMembers."Expected Maintenance Cost";
                    END;
                    IF JobPlanningLines."Line Amount"<>0 THEN
                      BEGIN
                       JobPlanningLines.INSERT(TRUE);
                       */
                    ProjectMembers.Posted := true;
                    ProjectMembers.Modify;
                //END;
                until ProjectMembers.Next = 0;
            //

            //Loop Through the casuals
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", ImprestMemo."No.");
            Casuals.SetRange(Posted, false);
            if Casuals.Find('-') then
                repeat
                    Casuals.TestField("Resource No.");
                    /*
                    LineNo:=LineNo+1000;
                    JobPlanningLines.INIT;
                    JobPlanningLines."Job No.":=ImprestMemo.Project;
                    JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                    JobPlanningLines."Line No.":=LineNo;
                    JobPlanningLines.Type:=JobPlanningLines.Type::Resource;
                    JobPlanningLines."No.":=Casuals."Resource No.";
                    JobPlanningLines.VALIDATE("No.");
                    JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                    JobPlanningLines."Planning Date":=Date;
                    JobPlanningLines."Planned Delivery Date":=CALCDATE(FORMAT(Casuals."No. of Days")+'D',Date);
                    JobPlanningLines.Description:=Casuals.Activity;
                    JobPlanningLines."Work Type Code":=Casuals."Work Type";
                    JobPlanningLines.VALIDATE("Work Type Code");
                    JobPlanningLines.Quantity:=Casuals."No. of Days"*Casuals."No. Required";
                    JobPlanningLines."Unit Cost":=Casuals.Rate;
                    JobPlanningLines."Unit Cost (LCY)":=Casuals.Rate;
                    JobPlanningLines."Line Amount":=Casuals.Amount;
                    JobPlanningLines."Line Amount (LCY)":=Casuals.Amount;
                    IF JobPlanningLines."Line Amount"<>0 THEN
                     BEGIN
                      JobPlanningLines.INSERT(TRUE);
                      */
                    Casuals.Posted := true;
                    Casuals.Modify;

                //END;
                until Casuals.Next = 0;
            //

            //Loop Through the Miscelleneous Costs

            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", ImprestMemo."No.");
            OtherCosts.SetRange(Posted, false);
            if OtherCosts.Find('-') then
                repeat
                    OtherCosts.TestField("No.");
                    /*
                    LineNo:=LineNo+1000;
                    JobPlanningLines.INIT;
                    JobPlanningLines."Job No.":=ImprestMemo.Project;
                    JobPlanningLines."Job Task No.":=ImprestMemo."Project Task";
                    JobPlanningLines."Line No.":=LineNo;
                    JobPlanningLines.Type:=JobPlanningLines.Type::"G/L Account";
                    JobPlanningLines."No.":=OtherCosts."No.";
                    JobPlanningLines.VALIDATE("No.");
                    JobPlanningLines."Line Type":=JobPlanningLines."Line Type"::Schedule;
                    JobPlanningLines."Planning Date":=Date;
                    JobPlanningLines."Planned Delivery Date":=Date;
                    JobPlanningLines.Description:=OtherCosts.Description;
                    JobPlanningLines."Work Type Code":=OtherCosts."Work Type";
                    //JobPlanningLines.VALIDATE("Work Type Code");
                    JobPlanningLines.Quantity:=OtherCosts."Quantity Required";
                    JobPlanningLines."Unit Cost":=OtherCosts."Unit Cost";
                    JobPlanningLines."Unit Cost (LCY)":=OtherCosts."Unit Cost";
                    JobPlanningLines."Line Amount":=OtherCosts."Line Amount";
                    JobPlanningLines."Line Amount (LCY)":=OtherCosts."Line Amount";
                    IF JobPlanningLines."Line Amount"<>0 THEN
                     BEGIN
                      JobPlanningLines.INSERT(TRUE);
                      */
                    OtherCosts.Posted := true;
                    OtherCosts.Modify;
                //END;
                until OtherCosts.Next = 0;
            //

            ImprestMemo.Posted := true;
            ImprestMemo."Posted By" := UserId;
            ImprestMemo.Modify;
            //

            //
        end;

    end;


    procedure PostPettyCash(PCASH: Record Payments)
    var
        PCASHLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        PCLines: Record "Petty Cash Lines";
        GLEntryrec: Record "G/L Entry";
    begin
        if Confirm('Are you sure you want to post the Petty Cash Voucher No. ' + PCASH."No." + ' ?') = true then begin
            /*IF PCASH.Status<>PCASH.Status::Released THEN
             ERROR('The Petty Cash Voucher No %1 has not been fully approved',PCASH."No.");*/
            if PCASH.Posted then
                Error('Petty Cash Voucher %1 has been posted', PCASH."No.");
            PCASH.TestField(Date);
            PCASH.TestField("Paying Bank Account");
            PCASH.TestField(PCASH.Payee);
            PCASH.TestField(PCASH."Pay Mode");
            PCASH.TestField(PCASH."Posting Date");
            if PCASH."Pay Mode" = 'CHEQUE' then begin
                PCASH.TestField(PCASH."Cheque No");
                PCASH.TestField(PCASH."Cheque Date");
            end;

            //Check Lines
            PCASH.CalcFields("Total Amount");
            if PCASH."Total Amount" = 0 then
                Error('Amount is cannot be zero');
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if not PCASHLines.FindLast then
                Error('Petty Cash voucher Lines cannot be empty');

            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if PCASHLines.FindSet then begin
                repeat
                    PCASHLines.TestField(PCASHLines.Amount);
                    PCASHLines.TestField(PCASHLines."Account No");
                    PCASHLines.TestField(PCASHLines."Account Type", PCASHLines."account type"::"G/L Account");
                until PCASHLines.Next = 0;
            end;
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."PCASH Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            GenJnLine.DeleteAll;

            /*
              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Payment Voucher Template";
              Batch.Name:=PV."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
            */
            //Bank Entries
            LineNo := LineNo + 10000;
            PCASH.CalcFields(PCASH."Total Amount");
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            PCASHLines.Validate(PCASHLines.Amount);
            // PCASHLines.CALCSUMS(PCASHLines.Amount);
            // PCASHLines.CALCSUMS(PCASHLines."W/Tax Amount");
            // PCASHLines.CALCSUMS(PCASHLines."VAT Amount");
            // PCASHLines.CALCSUMS(PCASHLines."Retention  Amount");
            // PCASHLines.CALCSUMS(PCASHLines."Net Amount");
            LineNo := LineNo + 10000;
            PCASH.CalcFields(PCASH."Total Amount");
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            PCASHLines.Validate(PCASHLines.Amount);
            // PCASHLines.CALCSUMS(PCASHLines.Amount);
            // PCASHLines.CALCSUMS(PCASHLines."W/Tax Amount");
            // PCASHLines.CALCSUMS(PCASHLines."VAT Amount");
            // PCASHLines.CALCSUMS(PCASHLines."Retention  Amount");
            // PCASHLines.CALCSUMS(PCASHLines."Net Amount");


            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."PCASH Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := PCASH."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PCASH.Date = 0D then
                Error('You must specify the PCASH date');
            GenJnLine."Posting Date" := PCASH."Posting Date";
            GenJnLine."Document No." := PCASH."No.";
            GenJnLine."External Document No." := PCASH."Cheque No";
            GenJnLine."Payment Method Code" := PCASH."Pay Mode";
            GenJnLine.Description := 'Pay for:' + PCASH."Payment Narration";
            GenJnLine.Amount := -PCASH."Total Amount";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);//
            GenJnLine."Bal. Account Type" := PCASH."Account Type";
            GenJnLine."Bal. Account No." := PCASH."Account No.";
            GenJnLine.Validate("Bal. Account No.");


            GenJnLine."Shortcut Dimension 1 Code" := PCASH."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PCASH."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

            GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            GenJnLine."Applies-to Doc. No." := PCASH."Applies- To Doc No.";
            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntryrec.Reset;
            GLEntryrec.SetRange("Document No.", PCASH."No.");
            GLEntryrec.SetRange(Reversed, false);
            if GLEntryrec.FindSet then begin
                PCASH.Posted := true;
                PCASH."Posted By" := UserId;
                PCASH."Posted Date" := Today;
                PCASH."Time Posted" := Time;
                PCASH.Status := PCASH.Status::Released;
                //PCASH."Payment Type":=PCASH."Payment Type"::"Petty Cash Surrender";
                CreatePettyCashSurrender(PCASH, PCASHLines);
                PCASH.Modify;

                //Update Petty Cash Lines
                UpdatePCLines(PCASH);
            end;
            //Create Imprest Surrender in the event the document originated from an imprest.
            /*
            IF PV."Original Document"=PV."Original Document"::Imprest THEN BEGIN
               PV."Payment Type":=PV."Payment Type"::"10";
               PV.Status:=PV.Status::Open;
               PV.MODIFY;
            END;
            */
            //END;


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
            AddToNoText(NoText, NoTextIndex, PrintExponent, WText026)
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                Ones := No DIV Power(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, WText027);
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

        AddToNoText(NoText, NoTextIndex, PrintExponent, WText028);
        AddToNoText(NoText, NoTextIndex, PrintExponent, Format(No * 100) + '/100');

        if CurrencyCode <> '' then
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(WText029, AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;


    procedure InitTextVariable()
    begin
        OnesText[1] := WText032;
        OnesText[2] := WText033;
        OnesText[3] := WText034;
        OnesText[4] := WText035;
        OnesText[5] := WText036;
        OnesText[6] := WText037;
        OnesText[7] := WText038;
        OnesText[8] := WText039;
        OnesText[9] := WText040;
        OnesText[10] := WText041;
        OnesText[11] := WText042;
        OnesText[12] := WText043;
        OnesText[13] := WText044;
        OnesText[14] := WText045;
        OnesText[15] := WText046;
        OnesText[16] := WText047;
        OnesText[17] := WText048;
        OnesText[18] := WText049;
        OnesText[19] := WText050;

        TensText[1] := '';
        TensText[2] := WText051;
        TensText[3] := WText052;
        TensText[4] := WText053;
        TensText[5] := WText054;
        TensText[6] := WText055;
        TensText[7] := WText056;
        TensText[8] := WText057;
        TensText[9] := WText058;

        ExponentText[1] := '';
        ExponentText[2] := WText059;
        ExponentText[3] := WText060;
        ExponentText[4] := WText061;
    end;


    procedure "Post ImprestSurrender"(var Imprest: Record Payments)
    var
        ImprestLines: Record "Imprest Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImprestHeader: Record Payments;
    begin

        if Confirm(Text002, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");

            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", Imprest."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                Imprest.Posted := true;
                Imprest."Posted By" := UserId;
                Imprest."Posted Date" := Today;
                Imprest."Time Posted" := Time;
                Imprest.Modify;
                exit;
            end;


            Imprest.TestField("Account No.");
            //Imprest.TESTFIELD("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            // Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            Imprest.TestField("Posting Date");

            /*
              //Check if the imprest Lines have been populated
              ImprestLines.SETRANGE(ImprestLines."No.",Imprest."No.");
              IF NOT ImprestLines.FINDLAST  THEN
               ERROR(Text004);

            */

            Imprest.CalcFields("Imprest Amount", "Actual Amount Spent");
            /*IF Imprest."Imprest Amount"=0 THEN
           {  ERROR(Text005);}
           IF Imprest."Actual Amount Spent"=0 THEN
             ERROR(Text005);
             */

            if Imprest.Posted then
                Error(Text006, Imprest."No.");


            CMSetup.Get();
            CMSetup.TestField("Imprest Due Date");
            CMSetup.TestField(CMSetup."IMPREST SUR Journal Batch Name");
            CMSetup.TestField(CMSetup."Imprest Surrender Template");

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST SUR Journal Batch Name");
            GenJnLine.DeleteAll;



            /*
              // Delete Lines Present on the General Journal Line
              GenJnLine.RESET;
              GenJnLine.SETRANGE(GenJnLine."Journal Template Name",CMSetup."Imprest Template");
              GenJnLine.SETRANGE(GenJnLine."Journal Batch Name",Imprest."No.");
              GenJnLine.DELETEALL;

              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Imprest Template";
              Batch.Name:=Imprest."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
              */
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::Employee;
            GenJnLine."Account No." := Imprest."Account No.";
            GenJnLine."Posting Date" := Imprest."Posting Date";
            GenJnLine."Document No." := Imprest."No.";
            GenJnLine."External Document No." := Imprest."Imprest Memo No";
            GenJnLine.Description := 'Surrendered by: ' + Imprest.Payee;
            GenJnLine.Amount := -Imprest."Actual Amount Spent";
            GenJnLine.Validate(Amount);
            /*
            GenJnLine."Shortcut Dimension 1 Code":=Imprest."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=Imprest."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 2 Code");

          *///
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            //GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Customer;
            //// GenJnLine."Bal. Account No.":=Imprest."Account No.";
            // GenJnLine.VALIDATE("Bal. Account No.");

            GenJnLine."Applies-to Doc. No." := Imprest."Reference No.";
            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

            GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //IMP surrender Lines Entries
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, Imprest."No.");
            if ImprestLines.FindFirst then begin
                repeat
                    //ImprestLines.TESTFIELD(ImprestLines."Job Task No.");
                    ImprestLines.Validate(ImprestLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    //IF CMSetup.GET THEN
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
                    //GenJnLine."Journal Template Name":=CMSetup."PCASH Journal Template";
                    //GenJnLine."Journal Batch Name":=CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    GenJnLine."Account No." := ImprestLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Imprest."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := Imprest."Posting Date";
                    GenJnLine."Document No." := Imprest."No.";
                    GenJnLine."External Document No." := Imprest."Imprest Issue Doc. No";
                    GenJnLine.Description := ImprestLines.Purpose;
                    GenJnLine.Amount := ImprestLines."Actual Spent";
                    //IF PCASH."Pay Mode"='CHEQUE' THEN
                    //GenJnLine."Pay Mode":=PCASH."Pay Mode";
                    GenJnLine."Currency Code" := Imprest."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);


                    //add jobs
                    /*GenJnLine."Job No.":=Imprest.Project;
                    GenJnLine."Job Task No.":=ImprestLines."Job Task No.";
                    GenJnLine."Job Quantity":=1;
                    GenJnLine.VALIDATE(GenJnLine."Job No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Quantity");*/ //Commented by Morris
                                                                    //end jobs

                    //add jobs Morris
                    GenJnLine."Job No." := Imprest.Job;
                    GenJnLine."Job Task No." := Imprest."Job Task No";
                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity"); //Added by Morris
                                                                  //end jobs
                                                                  //GenJnLine."Shortcut Dimension 1 Code":=PCASHLines."Shortcut Dimension 1 Code";
                                                                  //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                                                                  //GenJnLine."Shortcut Dimension 2 Code":=PCASHLines."Shortcut Dimension 2 Code";
                                                                  //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    //GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    //GenJnLine."Applies-to Doc. No.":=PCASHLines."Applies to Doc. No";
                    //GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", Imprest."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            //GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
            if GLEntry.FindFirst then begin
                Imprest.Posted := true;
                Imprest."Posted By" := UserId;
                Imprest."Posted Date" := Today;
                Imprest."Time Posted" := Time;
                /// Imprest.Status:=Imprest.Status::Open;
                //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
                //Update the Imprest Deadline
                //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);
                Imprest.Modify;

                /*IF ImprestHeader.GET(Imprest."Reference No.") THEN BEGIN
                ImprestHeader.Surrendered:=TRUE;
                ImprestHeader.MODIFY;
                END;
                */
            end;

        end;

    end;


    procedure PostBankTransfer(PCASH: Record Payments)
    var
        PCASHLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm('Are u sure u want to post this InterBank Transfer' + PCASH."No." + ' ?') = true then begin
            if PCASH.Status <> PCASH.Status::Released then
                Error('The InterBank Transfer No %1 has not been fully approved', PCASH."No.");
            if PCASH.Posted then
                Error('InterBank Transfer %1 has been posted', PCASH."No.");
            PCASH.TestField(Date);
            PCASH.TestField("Paying Bank Account");
            //PCASH.TESTFIELD(PCASH.Payee);
            PCASH.TestField(PCASH."Pay Mode");
            PCASH.TestField(PCASH."Posting Date");
            if PCASH."Pay Mode" = 'CHEQUE' then begin
                PCASH.TestField(PCASH."Cheque No");
                PCASH.TestField(PCASH."Cheque Date");
            end;

            //Check Lines
            //Today
            PCASH.CalcFields("Total Amount");
            if PCASH."Total Amount" = 0 then
                Error('Amount is cannot be zero');
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if not PCASHLines.FindLast then
                Error('InterBank Transfer Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Bank TR Journal Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Bank TR Journal Batch Name");
            GenJnLine.DeleteAll;

            /*
              Batch.INIT;
              IF CMSetup.GET() THEN
              Batch."Journal Template Name":=CMSetup."Payment Voucher Template";
              Batch.Name:=PV."No.";
              IF NOT Batch.GET(Batch."Journal Template Name",Batch.Name) THEN
              Batch.INSERT;
            */
            //Bank Entries
            //Today
            LineNo := LineNo + 10000;
            PCASH.CalcFields(PCASH."Total Amount");
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            PCASHLines.Validate(PCASHLines.Amount);
            PCASHLines.CalcSums(PCASHLines.Amount);
            //PCASHLines.CALCSUMS(PCASHLines."W/Tax Amount");
            /////PCASHLines.CALCSUMS(PCASHLines."VAT Amount");
            //PCASHLines.CALCSUMS(PCASHLines."Retention Amount1");
            //PCASHLines.CALCSUMS(PCASHLines."Net Amount");


            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Bank TR Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Bank TR Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := PCASH."Paying Bank Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if PCASH.Date = 0D then
                Error('You must specify the Transfer date');
            GenJnLine."Posting Date" := PCASH."Posting Date";
            GenJnLine."Document No." := PCASH."No.";
            GenJnLine."External Document No." := PCASH."Cheque No";
            GenJnLine."Payment Method Code" := PCASH."Pay Mode";
            GenJnLine.Description := PCASH."Payment Narration";
            GenJnLine.Amount := -PCASH."Total Amount";//TODAY WAS AMOUNT1
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);//

            /*
            //add jobs
            GenJnLine."Job No.":=PCASH.Project;
            GenJnLine."Job Task No.":=PCASH."Job Task No.";
            GenJnLine.Quantity:=1;
            GenJnLine.VALIDATE(GenJnLine."Job No.");
            GenJnLine.VALIDATE(GenJnLine."Job Task No.");
            GenJnLine.VALIDATE(GenJnLine.Quantity);
            */
            //GenJnLine."Pay Mode":=PCASH."Pay Mode";//
            //IF PCASH."Pay Mode"='CHEQUE' THEN
            //GenJnLine."Cheque Date":=PCASH."Cheque Date";

            GenJnLine."Shortcut Dimension 1 Code" := PCASH."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := PCASH."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

            GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //PCASH Lines Entries
            PCASHLines.Reset;
            PCASHLines.SetRange(PCASHLines.No, PCASH."No.");
            if PCASHLines.FindFirst then begin
                repeat
                    PCASHLines.Validate(PCASHLines.Amount);//WAS aMOUNT
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Bank TR Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Bank TR Journal Batch Name";
                    //GenJnLine."Journal Template Name":=CMSetup."PCASH Journal Template";
                    //GenJnLine."Journal Batch Name":=CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PCASHLines."Account Type";
                    GenJnLine."Account No." := PCASHLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PCASH."Posting Date" = 0D then
                        Error('You must specify the Transfer date');
                    GenJnLine."Posting Date" := PCASH."Posting Date";
                    GenJnLine."Document No." := PCASH."No.";
                    GenJnLine."External Document No." := PCASH."Cheque No";
                    GenJnLine."Payment Method Code" := PCASH."Pay Mode";
                    GenJnLine.Description := PCASH."Payment Narration";
                    //GenJnLine."Description 2":=PCASH."On behalf of";
                    GenJnLine.Amount := PCASHLines.Amount;
                    //IF PCASH."Pay Mode"='CHEQUE' THEN
                    //GenJnLine."Pay Mode":=PCASH."Pay Mode";
                    GenJnLine."Currency Code" := PCASH."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    /*
                    //add jobs
                    GenJnLine."Job No.":=PCASH.Project;
                    GenJnLine."Job Task No.":=PCASH."Job Task No.";
                    GenJnLine."Job Quantity":=1;
                    GenJnLine.VALIDATE(GenJnLine."Job No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Quantity");
                    //end jobs
                    */
                    GenJnLine."Shortcut Dimension 1 Code" := PCASHLines."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := PCASHLines."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := PCASH."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    /*
                    GenJnLine."Applies-to Doc. Type":=GenJnLine."Applies-to Doc. Type"::Invoice;
                    GenJnLine."Applies-to Doc. No.":=PCASHLines."Applies to Doc. No";
                    GenJnLine.VALIDATE(GenJnLine."Applies-to Doc. No.");

                    */

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until PCASHLines.Next = 0;
            end;



            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",PCASH."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            IF GLEntry.FINDFIRST THEN BEGIN*/
            PCASH.Posted := true;
            PCASH."Posted By" := UserId;
            PCASH."Posted Date" := Today;
            PCASH."Time Posted" := Time;
            PCASH.Modify;//today


            //Create Imprest Surrender in the event the document originated from an imprest.
            /*
            IF PV."Original Document"=PV."Original Document"::Imprest THEN BEGIN
               PV."Payment Type":=PV."Payment Type"::"10";
               PV.Status:=PV.Status::Open;
               PV.MODIFY;
            END;
            */
            //END;


        end;



        //staff claims posting



        //end of staff claims posting

    end;


    procedure PostPettyCashSurrender(var PCash: Record Payments)
    var
        PCLines: Record "Petty Cash Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
    begin

        if Confirm(Text014, false, PCash."No.") = true then begin
            if PCash.Status <> PCash.Status::Released then
                Error(Text003, PCash."No.");

            PCash.TestField("Surrender Date");


            PCash.CalcFields("Petty Cash Amount", PCash."Actual Petty Cash Amount Spent");
            if PCash."Petty Cash Amount" = 0 then
                Error(Text005);
            /*IF PCash."Actual Petty Cash Amount Spent"=0 THEN
              ERROR(Text016);*/


            if PCash.Surrendered then
                Error(Text015, PCash."No.");


            CMSetup.Get();
            CMSetup.TestField("Petty Cash Surrender Template");
            CMSetup.TestField("PCASH Journal Batch Name");

            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Petty Cash Surrender Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."PCASH Journal Batch Name");
            GenJnLine.DeleteAll;

            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
            Batch.Name := CMSetup."PCASH Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
            GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := PCash."Account Type";
            GenJnLine."Account No." := PCash."Account No.";
            if PCash."Posting Date" = 0D then
                Error('You must specify the posting date');
            GenJnLine."Posting Date" := PCash."Posting Date";
            GenJnLine."Document No." := PCash."No.";
            GenJnLine.Description := 'Petty Cash Surrendered by: ' + PCash."Account Name";
            GenJnLine.Amount := -PCash."Actual Petty Cash Amount Spent";
            GenJnLine.Validate(Amount);
            /*
            GenJnLine."Shortcut Dimension 1 Code":=Imprest."Shortcut Dimension 1 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code":=Imprest."Shortcut Dimension 2 Code";
            GenJnLine.VALIDATE("Shortcut Dimension 2 Code");

          *///
            //Imprest.CALCFIELDS(Imprest."Dimension Set ID");

            //GenJnLine."Bal. Account Type":=GenJnLine."Bal. Account Type"::Customer;
            //// GenJnLine."Bal. Account No.":=Imprest."Account No.";
            // GenJnLine.VALIDATE("Bal. Account No.");

            //Fred Post Application
            GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::" ";
            GenJnLine."Applies-to Doc. No." := PCash."Reference No.";
            GenJnLine.Validate("Applies-to Doc. No.");
            //Fred End Post Application

            GenJnLine."Dimension Set ID" := PCash."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Petty Cash surrender Lines Entries
            PCLines.Reset;
            PCLines.SetRange(PCLines.No, PCash."No.");
            if PCLines.FindFirst then begin
                repeat
                    PCLines.Validate(PCLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Petty Cash Surrender Template";
                    GenJnLine."Journal Batch Name" := CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := PCLines."Account Type";
                    GenJnLine."Account No." := PCLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if PCash."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := PCash."Posting Date";
                    GenJnLine."Document No." := PCash."No.";
                    //PCLines.TESTFIELD(Description);
                    GenJnLine.Description := 'Petty Cash for  ' + PCash."Payment Narration";
                    GenJnLine.Amount := PCLines."Actual Spent";
                    GenJnLine."Currency Code" := PCash."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Set these fields to blanks
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::" ";
                    GenJnLine.Validate("Gen. Posting Type");
                    GenJnLine."Gen. Bus. Posting Group" := '';
                    GenJnLine.Validate("Gen. Bus. Posting Group");
                    GenJnLine."Gen. Prod. Posting Group" := '';
                    GenJnLine.Validate("Gen. Prod. Posting Group");
                    GenJnLine."VAT Bus. Posting Group" := '';
                    GenJnLine.Validate("VAT Bus. Posting Group");
                    GenJnLine."VAT Prod. Posting Group" := '';
                    GenJnLine.Validate("VAT Prod. Posting Group");

                    //add jobs
                    //GenJnLine."Job No.":=PCash.Project;
                    //GenJnLine."Job Task No.":=PCash."Job Task No.";
                    GenJnLine."Job No." := PCash.Job;
                    GenJnLine."Job Task No." := PCash."Job Task No";
                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs


                    GenJnLine."Dimension Set ID" := PCash."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until PCLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", PCash."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            //GLEntry.SETRANGE("Posting Date",PCash."Posting Date");
            if GLEntry.FindSet then begin
                PCash.Surrendered := true;
                PCash."Surrendered By" := UserId;
                PCash."Date Surrendered" := Today;
                PCash.Modify;
            end;

        end;

    end;

    local procedure UpdatePCLines(PCash: Record Payments)
    var
        PCLines: Record "Petty Cash Lines";
        PVLines: Record "PV Lines";
    begin
        PVLines.Reset;
        PVLines.SetRange(No, PCash."No.");
        if PVLines.Find('-') then
            repeat
                PCLines.Init;
                PCLines.No := PVLines.No;
                PCLines."Line No" := PVLines."Line No";
                PCLines."Account Type" := PVLines."Account Type";
                PCLines."Account No" := PVLines."Account No";
                PCLines."Account Name" := PVLines."Account Name";
                PCLines.Description := PVLines.Description;
                PCLines.Amount := PVLines.Amount;
                PCLines.Validate(Amount);
                if not PCLines.Get(PCLines.No, PCLines."Line No") then
                    PCLines.Insert;
            until
           PVLines.Next = 0;
    end;


    procedure PostReceipt(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm(Text017, false, ReceiptRec."No.") = true then begin

            if ReceiptRec.Posted = true then
                Error(Text018, ReceiptRec."No.");
            ReceiptRec.TestField(Date);
            ReceiptRec.TestField("Bank Code");
            ReceiptRec.TestField("Received From");
            ReceiptRec.TestField("Pay Mode");

            if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
                ReceiptRec.TestField("Cheque No");
                ReceiptRec.TestField("Cheque Date");
            end;

            ReceiptRec.CalcFields(Amount);
            //Check Lines
            if ReceiptRec.Amount = 0 then
                Error('Amount cannot be zero');
            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            if not RcptLines.FindLast then
                Error('Receipt Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
            GenJnLine.DeleteAll;


            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := CMSetup."Receipt Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Bank Entries
            LineNo := LineNo + 10000;

            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            RcptLines.Validate(Amount);
            RcptLines.CalcSums(Amount);



            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := ReceiptRec."Bank Code";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec.Date;
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := ReceiptRec.Amount;
            GenJnLine."Currency Code" := ReceiptRec."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec.Date;
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := -RcptLines.Amount;
                    GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    //Application of document

                    if GenJnLine."Account Type" = GenJnLine."account type"::Customer then begin
                        GenJnLine."Applies-to Doc. Type" := GenJnLine."applies-to doc. type"::Invoice;
                        GenJnLine."Applies-to Doc. No." := RcptLines."Applies to Doc. No";
                        GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                    end;

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                ReceiptRec.Posted := true;
                ReceiptRec."Posted By" := UserId;
                ReceiptRec."Posted Date" := ReceiptRec.Date;
                ReceiptRec."Posted Time" := Time;
                ReceiptRec."Posting Date" := ReceiptRec.Date;
                ReceiptRec.Modify;

            end;

        end;
    end;


    procedure PostImprestMemoSurr(var ImprestMemo: Record "Imprest Memo")
    var
        JobPlanningLines: Record "Job Planning Line";
        LineNo: Integer;
        ProjectMembers: Record "Project Members";
        WorkType: Record "Work Type";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
    begin
        if not Confirm(Text019, false, ImprestMemo."No.") then
            exit;

        begin
            //Check if Posted
            if ImprestMemo.Posted and ImprestMemo.Surrendered then
                Error(Text020);

            //
            //Check totals
            /*
            ImprestMemo.CALCFIELDS("Actual Subsistence Allowance");
            IF ImprestMemo."Actual Subsistence Allowance"=0 THEN
              ERROR(Text012);
              */

            //Loop through Project Members
            ProjectMembers.Reset;
            ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            ProjectMembers.SetRange(Posted, false);
            if ProjectMembers.Find('-') then
                repeat
                    ProjectMembers.Posted := true;
                    ProjectMembers.Modify;
                //END;
                until ProjectMembers.Next = 0;
            //

            //Loop Through the casuals
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", ImprestMemo."No.");
            Casuals.SetRange(Posted, false);
            if Casuals.Find('-') then
                repeat
                    Casuals.TestField("Resource No.");

                    Casuals.Posted := true;
                    Casuals.Modify;

                //END;
                until Casuals.Next = 0;
            //

            //Loop Through the Miscelleneous Costs

            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", ImprestMemo."No.");
            OtherCosts.SetRange(Posted, false);
            if OtherCosts.Find('-') then
                repeat
                    OtherCosts.TestField("No.");

                    OtherCosts.Posted := true;
                    OtherCosts.Modify;
                //END;
                until OtherCosts.Next = 0;
            //

            ImprestMemo.Posted := true;
            ImprestMemo."Posted By" := UserId;
            ImprestMemo.Surrendered := true;
            ImprestMemo.Modify;
            //

            //
        end;

        //post of staff claims

    end;


    procedure PostStaffClaims(Sclaims: Record Payments)
    var
        GenJnLine: Record "Gen. Journal Line";
        sclaimlines: Record "PV Lines";
        LineNo: Integer;
    begin
        if Confirm(text024, false, Sclaims."No.") = true then begin
            if Sclaims.Status <> Sclaims.Status::Released then
                Error(Text023, Sclaims."No.");
            Sclaims.TestField(Sclaims.Date);
            Sclaims.CalcFields(Sclaims."Total Amount");
            if Sclaims."Total Amount" = 0 then
                Error(text022);
            CMSetup.Get();
            CMSetup.TestField(CMSetup."Staff Claim Journal Template");
            CMSetup.TestField(CMSetup."Staff Claim Journal Batch Name");
            GenJnLine.Reset;
            GenJnLine.SetRange("Journal Template Name", CMSetup."Staff Claim Journal Template");
            GenJnLine.SetRange("Journal Batch Name", CMSetup."Staff Claim Journal Batch Name");
            GenJnLine.DeleteAll;
            Batch.Init;
            Batch."Journal Template Name" := CMSetup."Staff Claim Journal Template";
            Batch.Name := CMSetup."Staff Claim Journal Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;
            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := Sclaims."Account Type";
            GenJnLine."Account No." := Sclaims."Account No.";
            GenJnLine."Posting Date" := Sclaims."Posting Date";
            // GenJnLine."Document Type":=GenJnLine."Document Type"::I;
            GenJnLine."Document No." := Sclaims."No.";
            GenJnLine."External Document No." := Sclaims."Account No.";
            GenJnLine.Description := 'Staff Claim From:  ' + Sclaims."Account Name";
            GenJnLine.Amount := -Sclaims."Total Amount";
            GenJnLine.Validate(Amount);

            //Added for Jobs
            GenJnLine."Job No." := Sclaims.Job;
            GenJnLine."Job Task No." := Sclaims."Job Task No";

            GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //Staff Claim Lines
            sclaimlines.Reset;
            sclaimlines.SetRange(sclaimlines.No, Sclaims."No.");
            if sclaimlines.FindFirst then begin
                repeat
                    sclaimlines.Validate(sclaimlines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    GenJnLine."Journal Template Name" := CMSetup."Staff Claim Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Staff Claim Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := sclaimlines."Account Type";
                    GenJnLine."Account No." := sclaimlines."Account No";
                    GenJnLine."External Document No." := Sclaims."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Sclaims."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := Sclaims."Posting Date";
                    //GenJnLine."Document Type":=GenJnLine."Document Type"::Refund;
                    GenJnLine."Document No." := Sclaims."No.";
                    GenJnLine."External Document No." := Sclaims."Account No.";
                    sclaimlines.TestField(Description);
                    GenJnLine.Description := sclaimlines.Description;
                    GenJnLine.Amount := sclaimlines.Amount;
                    GenJnLine.Validate(GenJnLine.Amount);

                    //Job ledger entries

                    //Added for Jobs
                    GenJnLine."Job No." := Sclaims.Job;
                    GenJnLine."Job Task No." := Sclaims."Job Task No";

                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity");
                    //end jobs

                    GenJnLine."Dimension Set ID" := Sclaims."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until sclaimlines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            Sclaims.Posted := true;
            Sclaims."Posted By" := UserId;
            Sclaims."Posted Date" := Today;
            Sclaims.Modify;

        end;

        //end of staff claim post
    end;


    procedure SendforPosting(var Imprest: Record Payments)
    var
        ImprestLines: Record Payments;
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImpLine: Record "Imprest Lines";
    begin

        if Confirm(Text102, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");


            Imprest.TestField("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Pay Mode");
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            //Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            // Imprest.TESTFIELD("Posting Date");


            if Imprest."Pay Mode" = 'CHEQUE' then begin
                Imprest.TestField("Cheque No");
                Imprest.TestField("Cheque Date");
            end;
            //Check if the imprest Lines have been populated
            ImprestLines.SetRange(ImprestLines."No.", Imprest."No.");
            if not ImprestLines.FindLast then
                Error(Text004);

            Imprest.CalcFields("Imprest Amount");
            if Imprest."Imprest Amount" = 0 then
                Error(Text005);

            if Imprest.Posted then
                Error(Text006, Imprest."No.");

            Imprest."Send for Posting" := true;
            Imprest.Modify;
            Message('Imprest %1 has been sent for posting successfully', Imprest."No.");

        end;
    end;


    procedure PostDIV(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Confirm(Text017, false, ReceiptRec."No.") = true then begin

            if ReceiptRec.Posted = true then
                Error(Text018, ReceiptRec."No.");
            ReceiptRec.TestField(Date);
            ReceiptRec.TestField("Bank Code");
            ReceiptRec.TestField("Received From");
            ReceiptRec.TestField("Pay Mode");

            if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
                ReceiptRec.TestField("Cheque No");
                ReceiptRec.TestField("Cheque Date");
            end;

            ReceiptRec.CalcFields(Amount);
            //Check Lines
            if ReceiptRec.Amount = 0 then
                Error('Amount cannot be zero');
            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            if not RcptLines.FindLast then
                Error('Receipt Lines cannot be empty');

            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
            GenJnLine.DeleteAll;


            Batch.Init;
            if CMSetup.Get() then
                Batch."Journal Template Name" := CMSetup."Receipt Template";
            Batch.Name := CMSetup."Receipt Batch Name";
            if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
                Batch.Insert;

            //Bank Entries
            LineNo := LineNo + 10000;

            RcptLines.Reset;
            RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
            RcptLines.Validate(Amount);
            RcptLines.CalcSums(Amount);



            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := ReceiptRec."Bank Code";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec.Date;
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := ReceiptRec.Amount;
            GenJnLine."Currency Code" := ReceiptRec."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec.Date;
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := -RcptLines.Amount;
                    GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            //DIV
            LineNo := LineNo + 10000;
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
            GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
            GenJnLine."Account No." := ReceiptRec."Expense Account";
            GenJnLine.Validate(GenJnLine."Account No.");
            if ReceiptRec.Date = 0D then
                Error('You must specify the Receipt date');
            GenJnLine."Posting Date" := ReceiptRec.Date;
            GenJnLine."Document No." := ReceiptRec."No.";
            GenJnLine."External Document No." := ReceiptRec."Cheque No";
            GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
            GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
            GenJnLine.Amount := -ReceiptRec.Amount;
            GenJnLine."Currency Code" := ReceiptRec."Currency Code";
            GenJnLine.Validate("Currency Code");
            GenJnLine.Validate(GenJnLine.Amount);
            GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;

            //Receipt Lines Entries
            RcptLines.Reset;
            RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
            if RcptLines.FindFirst then begin
                repeat
                    RcptLines.Validate(RcptLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := RcptLines."Account Type";
                    GenJnLine."Account No." := RcptLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    GenJnLine."Posting Date" := ReceiptRec.Date;
                    GenJnLine."Document No." := ReceiptRec."No.";
                    GenJnLine."External Document No." := ReceiptRec."Cheque No";
                    GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                    GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                    GenJnLine.Amount := RcptLines.Amount;
                    GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                    //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                    //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until RcptLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            GLEntry.Reset;
            GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
            GLEntry.SetRange(GLEntry.Reversed, false);
            if GLEntry.FindFirst then begin
                ReceiptRec.Posted := true;
                ReceiptRec."Posted By" := UserId;
                ReceiptRec."Posted Date" := ReceiptRec.Date;
                ReceiptRec."Posted Time" := Time;
                ReceiptRec.Modify;

            end;

        end;
    end;

    local procedure CreatePettyCashSurrender(PettyCash: Record Payments; PettyCashLines: Record "PV Lines")
    var
        PettyCashSurrender: Record Payments;
        PettCashSurrLines: Record "Petty Cash Lines";
    begin
        PettyCashSurrender.Init;
        PettyCashSurrender."Document Type" := PettyCashSurrender."document type"::Surrender;
        PettyCashSurrender."Payment Type" := PettyCashSurrender."payment type"::"Petty Cash Surrender";
        PettyCashSurrender."No." := '';
        PettyCashSurrender.Date := PettyCash.Date;
        PettyCashSurrender."Pay Mode" := PettyCash."Pay Mode";
        PettyCashSurrender."Paying Bank Account" := PettyCash."Paying Bank Account";
        PettyCashSurrender."Account Name" := PettyCash."Account Name";
        PettyCashSurrender."Account No." := PettyCash."Account No.";
        PettyCashSurrender."Account Type" := PettyCash."Account Type";
        PettyCashSurrender."Bank Name" := PettyCash."Bank Name";
        PettyCashSurrender."Payment Narration" := PettyCash."Payment Narration";
        PettyCashSurrender."Posting Date" := PettyCash."Posting Date";
        PettyCashSurrender."Shortcut Dimension 1 Code" := PettyCash."Shortcut Dimension 1 Code";
        PettyCashSurrender."Shortcut Dimension 2 Code" := PettyCash."Shortcut Dimension 2 Code";
        PettyCashSurrender."Shortcut Dimension 3 Code" := PettyCash."Shortcut Dimension 3 Code";
        PettyCashSurrender."Shortcut Dimension 4 Code" := PettyCash."Shortcut Dimension 4 Code";
        //PettyCashSurrender."Shortcut Dimension 1 Code":=PettyCash."Shortcut Dimension 1 Code";
        PettyCashSurrender.Job := PettyCash.Job;
        PettyCashSurrender."Job Task No" := PettyCash."Job Task No";
        PettyCashSurrender."Job Task No." := PettyCash."Job Task No.";
        PettyCashSurrender.Payee := PettyCash.Payee;
        //PettyCashSurrender.VALIDATE("Department Code",PettyCash."Department Code");
        PettyCashSurrender.Validate("Dimension Set ID", PettyCash."Dimension Set ID");
        PettyCashSurrender."Reference No." := PettyCash."No.";
        PettyCashSurrender.Status := PettyCash.Status;
        PettyCashSurrender.Posted := PettyCash.Posted;
        PettyCashSurrender.Insert(true);

        i := 0;
        PettyCashLines.Reset;
        PettyCashLines.SetRange(PettyCashLines.No, PettyCash."No.");
        if PettyCashLines.FindSet then begin
            repeat
                i := i + 1;
                PettCashSurrLines.No := PettyCashSurrender."No.";
                PettCashSurrLines.Validate("Account No", PettyCashLines."Account No");
                PettCashSurrLines."Account Type" := PettyCashLines."Account Type";
                PettCashSurrLines.Validate(Amount, PettyCashLines.Amount);
                PettCashSurrLines."Entry No" := i;
                //PettCashSurrLines.Date:=PettyCashLines.Date;
                //PettCashSurrLines."Applies to Doc. No":=PettyCash."Applies- To Doc No.";
                //PettCashSurrLines."Applies-to Doc. No.":=PettyCash."Applies- To Doc No.";
                PettCashSurrLines.Insert(true);
            // MESSAGE('%2 - %1 inserted',PettyCashLines.Amount,i);
            until PettyCashLines.Next = 0;
        end;
    end;


    procedure PostWarrantVoucher(Warrant: Record Payments)
    var
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        Employee: Record Employee;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        if Dialog.Confirm('Are you sure you want to post the Warrant Voucher No. ' + Warrant."No." + ' ?', true) then begin
            if Warrant.Status <> Warrant.Status::Released then
                Error('The Warrant Voucher No %1 has not been fully approved', Warrant."No.");
            if Warrant.Posted then
                Error('Warrant Voucher %1 has been posted', Warrant."No.");
            Warrant.TestField("Paying Bank Account");
            Warrant.TestField(Warrant."Pay Mode");
            Warrant.TestField("Cheque No");
            Warrant.TestField(Warrant."Posting Date");
            Warrant.TestField(Warrant."Cheque Date");

            Warrant.CalcFields("Imprest Voucher Amount");
            if Warrant."Imprest Voucher Amount" = 0 then
                Error('Amount is cannot be zero');
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            if not ImprestVoucherLines.FindLast then
                Error('Warrant voucher Lines cannot be empty');
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine.DeleteAll;

            Warrant.CalcFields("Imprest Voucher Amount");
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine."Shortcut Dimension 1 Code" := Warrant."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Warrant."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
            GenJnLine."Posting Date" := Warrant."Posting Date";
            GenJnLine."Document No." := Warrant."Cheque No";
            GenJnLine."External Document No." := Warrant."No.";
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Warrant."Paying Bank Account";
            GenJnLine.Description := Warrant."Payment Narration" + '-' + Format(Warrant."Cheque No");
            GenJnLine.Amount := -Warrant."Imprest Voucher Amount";
            GenJnLine.Validate(Amount);
            GenJnLine.Insert;
            //PV Lines Entries
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            if ImprestVoucherLines.FindSet then begin
                repeat
                    LineNo := LineNo + 1000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
                    GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
                    GenJnLine."Account Type" := GenJnLine."account type"::Employee;
                    GenJnLine."Account No." := ImprestVoucherLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Warrant."Posting Date" = 0D then
                        Error('You must specify the Imprest Voucher posting date');
                    GenJnLine."Posting Date" := Warrant."Posting Date";
                    GenJnLine."Document No." := Warrant."Cheque No";
                    GenJnLine."External Document No." := Warrant."No.";
                    //Ruth
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine.Description := Format((Warrant."Payment Narration") + '- ' + Warrant."Cheque No", 50);
                    GenJnLine.Amount := ImprestVoucherLines.Amount;
                    GenJnLine."Currency Code" := Warrant."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestVoucherLines."Global Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestVoucherLines."Global Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                until ImprestVoucherLines.Next = 0;
            end;
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);

            /*
             Payments.RESET;
             Payments.SETRANGE("Account No.",Warrant."Account No.");
             Payments.SETRANGE("Cheque No",Warrant."Cheque No");
             //do not create a new surrender
             IF Payments.FINDSET THEN BEGIN
                Warrant.Posted:=TRUE;
                Warrant."Posted By":=USERID;
                Warrant."Posted Date":=TODAY;
                Warrant."Time Posted":=TIME;
                Warrant.MODIFY;
                MESSAGE('The voucher has been successfully posted!');
             END ELSE BEGIN
               //create a new surrender
               CreateSurrender(Warrant."Imprest Memo No");
                Warrant.Posted:=TRUE;
                Warrant."Posted By":=USERID;
                Warrant."Posted Date":=TODAY;
                Warrant."Time Posted":=TIME;
                Warrant.MODIFY;
                MESSAGE('The voucher has been successfully posted!');
             END;
             */

            //check if entries are in the register
            BankAccountLedgerEntry.Reset;
            BankAccountLedgerEntry.SetRange("External Document No.", Warrant."No.");
            if BankAccountLedgerEntry.FindSet then begin
                Warrant.Posted := true;
                Warrant."Posted By" := UserId;
                Warrant."Posted Date" := Today;
                Warrant."Time Posted" := Time;
                Warrant.Modify(true);

            end;
            CreateSurrender(Warrant."Imprest Memo No", Warrant."Cheque No");
            Message('The voucher has been successfully posted!');
        end

    end;


    procedure CreateSurrender(Memo: Code[30]; DocumentNo: Code[30])
    var
        Memoheaders: Record "Imprest Memo";
        OtherCost: Record "Other Costs";
        SafariMembers: Record "Project Members";
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit "No. Series";
        Imprestlines: Record "Imprest Lines";
        glName: Record "G/L Account";
        ProjectTeam: Record "Project Members";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Email: Text;
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];

        // SMTP: Codeunit "SMTP Mail";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
    begin
        Memoheaders.Reset;
        Memoheaders.SetRange(Memoheaders."No.", Memo);
        if Memoheaders.Find('-') then begin
            SafariMembers.Reset;
            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
            if SafariMembers.Find('-') then begin
                repeat
                    //get the no. series
                    CashMgt.Reset;
                    if CashMgt.Find('-') then begin
                        NoSeries := CashMgt."Imprest Surrender Nos";
                        Email2 := CashMgt."Imprest Email";
                    end;

                    LineNo := 10000;
                    Imprestheaders.Init;
                    Imprestheaders."No." := NoSeriesMgt.GetNextNo(NoSeries, Imprestheaders.Date, true);
                    Imprestheaders.Date := Today;
                    Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                    Imprestheaders."Account No." := SafariMembers."No.";
                    Imprestheaders.Validate(Imprestheaders."Account No.");
                    Imprestheaders."Reference No." := DocumentNo;
                    Imprestheaders."Account Name" := SafariMembers.Name;
                    Imprestheaders."Payment Type" := Imprestheaders."payment type"::Surrender;
                    Imprestheaders.Payee := SafariMembers.Name;
                    Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                    Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                    Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                    Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                    Imprestheaders.Job := Memoheaders.Job;
                    Imprestheaders.Validate(Job);
                    Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                    //Imprestheaders.VALIDATE("Job Task No");
                    //add the userid of the safari members
                    UserSetup.Reset;
                    UserSetup.SetRange("Resource No", Imprestheaders."Account No.");
                    if UserSetup.Find('-') then begin
                        // Usersetup.CALCFIELDS("E-Mail");

                        Imprestheaders."Created By" := UserSetup."User ID";
                        Email := UserSetup."E-Mail";
                        EmailHOD := UserSetup.Approvermail;

                    end;

                    Imprestheaders."Travel Date" := Memoheaders."Start Date";
                    Imprestheaders."Payment Narration" := Memoheaders.Subject;
                    Imprestheaders.Validate(Imprestheaders."Travel Date");
                    Imprestheaders."Document Type" := Imprestheaders."document type"::Surrender;
                    Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                    Imprestheaders."On behalf of" := SafariMembers.Name;
                    Imprestheaders.Status := Imprestheaders.Status::Open;
                    //          Imprestheaders."Shortcut Dimension 1 Code":=Memoheaders."Global Dimension 1 Code";
                    //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 1 Code");
                    //          Imprestheaders."Shortcut Dimension 2 Code":=Memoheaders."Global Dimension 2 Code";
                    //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");
                    //          Imprestheaders."Shortcut Dimension 3 Code":=Memoheaders."Shortcut Dimension 3 Code";
                    //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                    //          Imprestheaders."Shortcut Dimension 4 Code":=Memoheaders."Shortcut Dimension 4 Code";
                    //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");

                    Imprestheaders.Validate(Imprestheaders."Dimension Set ID", Memoheaders."Dimension Set ID");
                    Imprestheaders.Insert;

                    //Start of Imprest lines
                    Imprestlines.Init;
                    Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                    Imprestlines.No := Imprestheaders."No.";
                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                    SafariMembers.CalcFields("G/L Account");
                    Imprestlines."Account No." := SafariMembers."G/L Account";
                    Imprestlines.Validate(Imprestlines."Account No.");
                    glName.Get(Imprestlines."Account No.");
                    Imprestlines."Account Name" := glName.Name;
                    Imprestlines.Purpose := Memoheaders.Subject;
                    Imprestlines.Amount := SafariMembers.Entitlement;
                    Imprestlines.Insert;
                    LineNo := LineNo + 10;
                    if SafariMembers."Transport Costs" <> 0 then begin
                        Imprestlines.Init;
                        Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                        Imprestlines.No := Imprestheaders."No.";
                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                        SafariMembers.CalcFields("G/L Account");
                        Imprestlines."Account No." := SafariMembers."G/L Account";
                        Imprestlines.Validate(Imprestlines."Account No.");
                        glName.Get(Imprestlines."Account No.");
                        Imprestlines."Account Name" := glName.Name;
                        Imprestlines.Purpose := 'Transport Allowance';
                        Imprestlines.Amount := SafariMembers."Transport Costs";
                        Imprestlines.Insert;
                        LineNo := LineNo + 10;
                    end;
                    //IF SafariMembers."Project Lead" = TRUE THEN
                    // BEGIN
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Memo);
                    ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                    ProjectTeam.SetFilter("Direct Unit Cost", '>%1', 0);
                    if ProjectTeam.Find('-') then
                    //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                    begin
                        repeat
                            Imprestlines.Init;
                            Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                            Imprestlines.No := Imprestheaders."No.";
                            Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                            SafariMembers.CalcFields("G/L Account");
                            Imprestlines."Account No." := ProjectTeam."G/L Account";
                            Imprestlines.Validate(Imprestlines."Account No.");
                            glName.Get(Imprestlines."Account No.");
                            Imprestlines."Account Name" := glName.Name;
                            Imprestlines.Purpose := ProjectTeam."Work Type";
                            Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                            Imprestlines.Insert;
                            LineNo := LineNo + 10;

                        until ProjectTeam.Next = 0;
                    end;
                    OtherCost.Reset;
                    OtherCost.SetRange(OtherCost."Imprest Memo No.", Memo);
                    OtherCost.SetRange("Employee No.", SafariMembers."No.");
                    OtherCost.SetFilter("Line Amount", '>%1', 0);
                    if OtherCost.Find('-') then begin
                        repeat
                            Imprestlines.Init;
                            Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                            Imprestlines.No := Imprestheaders."No.";

                            Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                            OtherCost.CalcFields("No.");
                            Imprestlines."Account No." := OtherCost."No.";
                            Imprestlines.Validate(Imprestlines."Account No.");
                            glName.Get(Imprestlines."Account No.");
                            Imprestlines."Account Name" := glName.Name;
                            Imprestlines.Purpose := OtherCost."Required For";
                            Imprestlines.Amount := OtherCost."Line Amount";
                            Imprestlines.Insert;
                            LineNo := LineNo + 10;

                        until OtherCost.Next = 0;
                    end;
                    //END;
                    Message('%1 %2', Email, Email2);

                    //send email to participants
                    CashMgt.Get;
                    if CashMgt."Send Email Notification" = true then begin
                        Body := 'Your surrender application no. has been generated ' + Imprestheaders."No." + ' has been created from memo no. ' + Memo;

                        //cc// SMTP.CreateMessage('NACOSTI IMPREST SURRENDER', Email2,
                        // Email, 'Surrender ' + 'No: ' + Imprestheaders."No.",
                        // 'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                        // 'Your imprest surrender no. <b>' + Imprestheaders."No." + '</b> has been generated from memo no. <b>' + Memo +
                        // '</b> Kindly on return from your trip to:' + Imprestheaders."Destination Name" + 'account for it using this document no' + Imprestheaders."No." + 'fill in the actual spent and send it for approval.<BR><BR>', true);
                        //SMTP.AddCC(EmailHOD);
                        // SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                        // SMTP.Send();
                        body := 'Your surrender application no. has been generated ' + Imprestheaders."No." + ' has been created from memo no. ' + Memo;
                        body := body + ' Kindly on return from your trip to:' + Imprestheaders."Destination Name" + 'account for it using this document no' + Imprestheaders."No." + 'fill in the actual spent and send it for approval.<BR><BR>';
                        emailmessage.create(email + email2, 'NACOSTI IMPREST SURRENDER', body);
                        EMAILSNED.send(emailmessage, enum::"Email Scenario"::Default);
                    end;
                until SafariMembers.Next = 0;
            end;
            Memoheaders."Imprest Created" := true;
            Memoheaders."Date converted" := Today;
            Memoheaders."Time converted" := Time;
            Memoheaders."Converted By" := UserId;
            Memoheaders.Posted := true;
            Memoheaders.Modify;
        end;
        Message('surrender Created successfuly!');
    end;


    procedure ReCreateSurrender(Memo: Code[30]; DocumentNo: Code[30])
    var
        Memoheaders: Record "Imprest Memo";
        OtherCost: Record "Other Costs";
        SafariMembers: Record "Project Members";
        CashMgt: Record "Cash Management Setup";
        Imprestheaders: Record Payments;
        NoSeriesMgt: Codeunit "No. Series";
        Imprestlines: Record "Imprest Lines";
        glName: Record "G/L Account";
        ProjectTeam: Record "Project Members";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Email: Text;
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];
        // SMTP: Codeunit "SMTP Mail";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
    begin
        Memoheaders.Reset;
        Memoheaders.SetRange(Memoheaders."No.", Memo);
        if Memoheaders.Find('-') then begin
            SafariMembers.Reset;
            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
            if SafariMembers.Find('-') then
            //BEGIN
            //IF SafariMembers.Type = SafariMembers.Type::Person THEN
            begin
                repeat
                    //get the no. series
                    CashMgt.Reset;
                    if CashMgt.Find('-') then begin
                        NoSeries := CashMgt."Imprest Surrender Nos";
                        Email2 := CashMgt."Imprest Email";
                    end;

                    LineNo := 10000;
                    Imprestheaders.Init;
                    Imprestheaders."No." := NoSeriesMgt.GetNextNo(NoSeries, Imprestheaders.Date, true);
                    Imprestheaders.Date := Today;
                    Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                    Imprestheaders."Account No." := SafariMembers."No.";
                    Imprestheaders.Validate(Imprestheaders."Account No.");
                    Imprestheaders."Reference No." := DocumentNo;
                    Imprestheaders."Account Name" := SafariMembers.Name;
                    Imprestheaders."Payment Type" := Imprestheaders."payment type"::Surrender;
                    Imprestheaders.Payee := SafariMembers.Name;
                    Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                    Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                    Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                    Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                    Imprestheaders.Job := Memoheaders.Job;
                    Imprestheaders.Validate(Job);
                    Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                    //Imprestheaders.VALIDATE("Job Task No");
                    //add the userid of the safari members
                    UserSetup.Reset;
                    UserSetup.SetRange("Resource No", Imprestheaders."Account No.");
                    if UserSetup.Find('-') then begin
                        // Usersetup.CALCFIELDS("E-Mail");

                        Imprestheaders."Created By" := UserSetup."User ID";
                        Email := UserSetup."E-Mail";
                        EmailHOD := UserSetup.Approvermail;

                    end;

                    Imprestheaders."Travel Date" := Memoheaders."Start Date";
                    Imprestheaders."Payment Narration" := Memoheaders.Subject;
                    Imprestheaders.Validate(Imprestheaders."Travel Date");
                    Imprestheaders."Document Type" := Imprestheaders."document type"::Surrender;
                    Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                    Imprestheaders."On behalf of" := SafariMembers.Name;
                    Imprestheaders.Status := Imprestheaders.Status::Open;
                    //          Imprestheaders."Shortcut Dimension 1 Code":=Memoheaders."Global Dimension 1 Code";
                    //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 1 Code");
                    //          Imprestheaders."Shortcut Dimension 2 Code":=Memoheaders."Global Dimension 2 Code";
                    //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");
                    //          Imprestheaders."Shortcut Dimension 3 Code":=Memoheaders."Shortcut Dimension 3 Code";
                    //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                    //          Imprestheaders."Shortcut Dimension 4 Code":=Memoheaders."Shortcut Dimension 4 Code";
                    //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
                    Imprestheaders.Insert;

                    //Start of Imprest lines
                    Imprestlines.Init;
                    Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                    Imprestlines.No := Imprestheaders."No.";
                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                    SafariMembers.CalcFields("G/L Account");
                    Imprestlines."Account No." := SafariMembers."G/L Account";
                    Imprestlines.Validate(Imprestlines."Account No.");
                    glName.Get(Imprestlines."Account No.");
                    Imprestlines."Account Name" := glName.Name;
                    Imprestlines.Purpose := Memoheaders.Subject;
                    Imprestlines.Amount := SafariMembers.Entitlement;
                    Imprestlines.Insert;
                    LineNo := LineNo + 10;
                    if SafariMembers."Transport Costs" <> 0 then begin
                        Imprestlines.Init;
                        Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                        Imprestlines.No := Imprestheaders."No.";
                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                        SafariMembers.CalcFields("G/L Account");
                        Imprestlines."Account No." := SafariMembers."G/L Account";
                        Imprestlines.Validate(Imprestlines."Account No.");
                        glName.Get(Imprestlines."Account No.");
                        Imprestlines."Account Name" := glName.Name;
                        Imprestlines.Purpose := 'Transport Allowance';
                        Imprestlines.Amount := SafariMembers."Transport Costs";
                        Imprestlines.Insert;
                        LineNo := LineNo + 10;
                    end;

                    if SafariMembers."Project Lead" = true then begin
                        ProjectTeam.Reset;
                        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Memo);
                        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                        ProjectTeam.SetFilter("Direct Unit Cost", '>%1', 0);
                        if ProjectTeam.Find('-') then
                        //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                        begin
                            repeat
                                Imprestlines.Init;
                                Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                                Imprestlines.No := Imprestheaders."No.";
                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                SafariMembers.CalcFields("G/L Account");
                                Imprestlines."Account No." := ProjectTeam."G/L Account";
                                Imprestlines.Validate(Imprestlines."Account No.");
                                glName.Get(Imprestlines."Account No.");
                                Imprestlines."Account Name" := glName.Name;
                                Imprestlines.Purpose := ProjectTeam."Work Type";
                                Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                                Imprestlines.Insert;
                                LineNo := LineNo + 10;

                            until ProjectTeam.Next = 0;
                        end;
                        OtherCost.Reset;
                        OtherCost.SetRange(OtherCost."Imprest Memo No.", Memo);
                        OtherCost.SetFilter("Line Amount", '>%1', 0);
                        if OtherCost.Find('-') then begin
                            repeat
                                Imprestlines.Init;
                                Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                                Imprestlines.No := Imprestheaders."No.";

                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                OtherCost.CalcFields("No.");
                                Imprestlines."Account No." := OtherCost."No.";
                                Imprestlines.Validate(Imprestlines."Account No.");
                                glName.Get(Imprestlines."Account No.");
                                Imprestlines."Account Name" := glName.Name;
                                Imprestlines.Purpose := OtherCost."Required For";
                                Imprestlines.Amount := OtherCost."Line Amount";
                                Imprestlines.Insert;
                                LineNo := LineNo + 10;

                            until OtherCost.Next = 0;
                        end;
                    end;

                    //send email to participants
                    CashMgt.Get;
                    if CashMgt."Send Email Notification" = true then begin
                        Body := 'Your surrender application no. has been generated ' + Imprestheaders."No." + ' has been created from memo no. ' + Memo;

                        // SMTP.CreateMessage('NACOSTI IMPREST SURRENDER', Email2,
                        // Email, 'Surrender ' + 'No: ' + Imprestheaders."No.",
                        // 'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                        // 'Your imprest surrender no. <b>' + Imprestheaders."No." + '</b> has been generated from memo no. <b>' + Memo +
                        // '</b> Kindly on return from your trip to:' + Imprestheaders."Destination Name" + 'account for it using this document no' + Imprestheaders."No." + 'fill in the actual spent and send it for approval.<BR><BR>', true);
                        // //SMTP.AddCC(EmailHOD);

                        // SMTP.AppendBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                        // SMTP.Send();
                        body := 'Your surrender application no. has been generated ' + Imprestheaders."No." + ' has been created from memo no. ' + Memo;
                        body := body + ' Kindly on return from your trip to:' + Imprestheaders."Destination Name" + 'account for it using this document no' + Imprestheaders."No." + 'fill in the actual spent and send it for approval.<BR><BR>';
                        emailmessage.create(email + email2, 'NACOSTI IMPREST SURRENDER', body);
                        EMAILSNED.send(emailmessage, enum::"Email Scenario"::Default);

                    end;

                until SafariMembers.Next = 0;

            end;

            Memoheaders."Imprest Created" := true;
            Memoheaders."Date converted" := Today;
            Memoheaders."Time converted" := Time;
            Memoheaders."Converted By" := UserId;
            Memoheaders.Posted := true;
            Memoheaders.Modify;

        end;

    end;


    procedure ReverseWarrantVoucher(Warrant: Record Payments)
    var
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLAccount: Record "G/L Account";
        Employee: Record Employee;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        ImprestMemo: Record "Imprest Memo";
    begin
        if Dialog.Confirm('Are you sure you want to reverse the Warrant Voucher No. ' + Warrant."No." + ' ?', true) then begin
            if Warrant.Posted <> true then
                Error('The Warrant Voucher %1,has not been posted!', Warrant."No.");
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            CMSetup.Get();
            // Delete Lines Present on the General Journal Line
            GenJnLine.Reset;
            GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine.DeleteAll;

            Warrant.CalcFields("Imprest Voucher Amount");
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            GenJnLine.Init;
            if CMSetup.Get then
                GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
            GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
            GenJnLine."Shortcut Dimension 1 Code" := Warrant."Shortcut Dimension 1 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Warrant."Shortcut Dimension 2 Code";
            GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
            GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");
            GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
            GenJnLine."Posting Date" := Warrant."Posting Date";
            GenJnLine."Document No." := Warrant."Cheque No";
            GenJnLine."External Document No." := Warrant."No.";
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Warrant."Paying Bank Account";
            GenJnLine.Description := Format('Reversal-' + Format(Warrant."Cheque No"), 50);
            GenJnLine.Amount := Warrant."Imprest Voucher Amount";
            GenJnLine."Reversing Entry" := true;
            GenJnLine.Validate(Amount);
            GenJnLine.Insert;
            //PV Lines Entries
            ImprestVoucherLines.Reset;
            ImprestVoucherLines.SetRange(ImprestVoucherLines.No, Warrant."No.");
            if ImprestVoucherLines.FindSet then begin
                repeat
                    LineNo := LineNo + 1000;
                    GenJnLine.Init;
                    if CMSetup.Get then
                        GenJnLine."Journal Template Name" := CMSetup."Imp Voucher Journal Template";
                    GenJnLine."Journal Batch Name" := CMSetup."Imp Voucher Journal Batch Name";
                    GenJnLine."Line No." := LineNo + GenJnLine."Line No.";
                    GenJnLine."Account Type" := GenJnLine."account type"::Employee;
                    GenJnLine."Account No." := ImprestVoucherLines."Account No.";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Warrant."Posting Date" = 0D then
                        Error('You must specify the Imprest Voucher posting date');
                    GenJnLine."Posting Date" := Warrant."Posting Date";
                    GenJnLine."Document No." := Warrant."Cheque No";
                    GenJnLine."External Document No." := Warrant."No.";
                    //Ruth
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine.Description := Format('Reversal- ' + Warrant."Cheque No", 50);
                    GenJnLine.Amount := -ImprestVoucherLines.Amount;
                    GenJnLine."Reversing Entry" := true;
                    GenJnLine."Currency Code" := Warrant."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);
                    GenJnLine."Shortcut Dimension 1 Code" := ImprestVoucherLines."Global Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := ImprestVoucherLines."Global Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                    GenJnLine."Dimension Set ID" := Warrant."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");
                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;
                until ImprestVoucherLines.Next = 0;
            end;
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            ImprestMemo.Reset;
            ImprestMemo.SetRange("No.", Warrant."Imprest Memo No");
            if ImprestMemo.FindSet then begin
                ImprestMemo.Posted := false;
                ImprestMemo.Modify;
                Message('Dear %1,Navigate to approved Imprest Memos and create a new voucher from' + Warrant."Imprest Memo No", UserId);
            end;

            Warrant.Reversed := true;
            Warrant."Reversed By" := UserId;
            Warrant."Reversal Date" := Today;
            Warrant.Modify;
            Message('The voucher has been successfully reversed!');

        end
    end;


    procedure PostStandingImprestSurrenders(var Imprest: Record Payments)
    var
        ImprestLines: Record "PV Lines";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        GLEntry: Record "G/L Entry";
        ImprestHeader: Record Payments;
    begin

        if Confirm(Text002, false, Imprest."No.") = true then begin
            if Imprest.Status <> Imprest.Status::Released then
                Error(Text003, Imprest."No.");


            // Imprest.TESTFIELD("Account No.");
            Imprest.TestField("Paying Bank Account");
            Imprest.TestField(Date);
            Imprest.TestField(Payee);
            Imprest.TestField("Shortcut Dimension 1 Code");
            Imprest.TestField("Shortcut Dimension 2 Code");
            // Imprest.TESTFIELD("Shortcut Dimension 3 Code");
            Imprest.TestField("Posting Date");

            Imprest.CalcFields("Imprest Amount", "Actual Amount Spent", "Total Amount");
            if Imprest."Total Amount" = 0 then
                Error(Text005);



            if Imprest.Posted then
                Error(Text006, Imprest."No.");


            CMSetup.Get();
            CMSetup.TestField("Imprest Due Date");
            CMSetup.TestField(CMSetup."IMPREST SUR Journal Batch Name");
            CMSetup.TestField(CMSetup."Imprest Surrender Template");

            GenJnLine.Reset;
            GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Imprest Surrender Template");
            GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."IMPREST SUR Journal Batch Name");
            GenJnLine.DeleteAll;



            LineNo := 1000;
            GenJnLine.Init;
            GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
            GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
            GenJnLine."Line No." := LineNo;
            GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
            GenJnLine."Account No." := Imprest."Paying Bank Account";
            GenJnLine."Posting Date" := Imprest."Posting Date";
            GenJnLine."Document No." := Imprest."No.";
            GenJnLine."External Document No." := Imprest."Imprest Memo No";
            GenJnLine.Description := Imprest."Payment Narration";
            GenJnLine.Amount := -Imprest."Total Amount";
            GenJnLine.Validate(Amount);

            GenJnLine."Shortcut Dimension 1 Code" := Imprest."Shortcut Dimension 1 Code";
            GenJnLine.Validate("Shortcut Dimension 1 Code");
            GenJnLine."Shortcut Dimension 2 Code" := Imprest."Shortcut Dimension 2 Code";
            GenJnLine.Validate("Shortcut Dimension 2 Code");

            GenJnLine."Applies-to Doc. No." := Imprest."Standing Imprest No.";
            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

            GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
            GenJnLine.Validate(GenJnLine."Dimension Set ID");


            if GenJnLine.Amount <> 0 then
                GenJnLine.Insert;


            //IMP surrender Lines Entries
            ImprestLines.Reset;
            ImprestLines.SetRange(ImprestLines.No, Imprest."No.");
            if ImprestLines.FindFirst then begin
                repeat

                    //ImprestLines.TESTFIELD(ImprestLines."Job Task No.");
                    ImprestLines.Validate(ImprestLines.Amount);
                    LineNo := LineNo + 10000;
                    GenJnLine.Init;
                    //IF CMSetup.GET THEN
                    GenJnLine."Journal Template Name" := CMSetup."Imprest Surrender Template";
                    GenJnLine."Journal Batch Name" := CMSetup."IMPREST SUR Journal Batch Name";
                    //GenJnLine."Journal Template Name":=CMSetup."PCASH Journal Template";
                    //GenJnLine."Journal Batch Name":=CMSetup."PCASH Journal Batch Name";
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := ImprestLines."Account Type";
                    GenJnLine."Account No." := ImprestLines."Account No";
                    GenJnLine.Validate(GenJnLine."Account No.");
                    if Imprest."Posting Date" = 0D then
                        Error('You must specify the posting date');
                    GenJnLine."Posting Date" := Imprest."Posting Date";
                    GenJnLine."Document No." := Imprest."No.";
                    GenJnLine."External Document No." := Imprest."Imprest Issue Doc. No";
                    //GenJnLine.Description:=ImprestLines.Description;
                    GenJnLine.Description := ImprestLines."Account Name";
                    //GenJnLine.Description:=Imprest."Payment Narration";
                    GenJnLine."Gen. Posting Type" := GenJnLine."gen. posting type"::Purchase;

                    GenJnLine.Amount := ImprestLines.Amount;
                    //IF PCASH."Pay Mode"='CHEQUE' THEN
                    //GenJnLine."Pay Mode":=PCASH."Pay Mode";
                    GenJnLine."Currency Code" := Imprest."Currency Code";
                    GenJnLine.Validate("Currency Code");
                    GenJnLine.Validate(GenJnLine.Amount);


                    //add jobs
                    /*GenJnLine."Job No.":=Imprest.Project;
                    GenJnLine."Job Task No.":=ImprestLines."Job Task No.";
                    GenJnLine."Job Quantity":=1;
                    GenJnLine.VALIDATE(GenJnLine."Job No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Task No.");
                    GenJnLine.VALIDATE(GenJnLine."Job Quantity");*/ //Commented by Morris
                                                                    //end jobs

                    //add jobs Morris
                    GenJnLine."Job No." := Imprest.Job;
                    GenJnLine."Job Task No." := Imprest."Job Task No";
                    GenJnLine."Job Quantity" := 1;
                    GenJnLine.Validate(GenJnLine."Job No.");
                    GenJnLine.Validate(GenJnLine."Job Task No.");
                    GenJnLine.Validate(GenJnLine."Job Quantity"); //Added by Morris
                                                                  //end jobs
                    GenJnLine."Shortcut Dimension 1 Code" := Imprest."Shortcut Dimension 1 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                    GenJnLine."Shortcut Dimension 2 Code" := Imprest."Shortcut Dimension 2 Code";
                    GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");

                    GenJnLine."Dimension Set ID" := Imprest."Dimension Set ID";
                    GenJnLine.Validate(GenJnLine."Dimension Set ID");

                    if GenJnLine.Amount <> 0 then
                        GenJnLine.Insert;

                until ImprestLines.Next = 0;
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnLine);
            /*GLEntry.RESET;
            GLEntry.SETRANGE(GLEntry."Document No.",Imprest."No.");
            GLEntry.SETRANGE(GLEntry.Reversed,FALSE);
            GLEntry.SETRANGE("Posting Date",Imprest."Posting Date");
            IF GLEntry.FINDFIRST THEN BEGIN*/
            Imprest.Posted := true;
            Imprest.Surrendered := true;
            //MESSAGE('%1', Imprest."No.");
            Imprest."Posted By" := UserId;
            Imprest."Posted Date" := Today;
            Imprest."Time Posted" := Time;
            /// Imprest.Status:=Imprest.Status::Open;
            //Imprest."Payment Type":=Imprest."Payment Type"::"Imprest Surrender";
            //Update the Imprest Deadline
            //Imprest."Imprest Deadline":=CALCDATE(CMSetup."Imprest Due Date",TODAY);
            Imprest.Modify;
            //Update Selected Standing Imprest as surrendered...Fred
            if Imprest.Get(Imprest."Standing Imprest No.") then begin
                Imprest.Surrendered := true;
                Message('%1', Imprest."Standing Imprest No.");
                Imprest.Modify;
            end;
        end;

    end;


    procedure FundRounding(var Amount: Decimal) FundRounding: Decimal
    var
        Cashsetup: Record "Cash Management Setup";
    begin

        Cashsetup.Get();
        if Cashsetup."Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if Cashsetup."Rounding Type" = Cashsetup."rounding type"::Nearest then
            FundRounding := ROUND(Amount, Cashsetup."Rounding Precision", '=');

        if Cashsetup."Rounding Type" = Cashsetup."rounding type"::Up then
            FundRounding := ROUND(Amount, Cashsetup."Rounding Precision", '>');

        if Cashsetup."Rounding Type" = Cashsetup."rounding type"::Down then
            FundRounding := ROUND(Amount, Cashsetup."Rounding Precision", '<');
    end;


    procedure PostBatchReceipt(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
        ReceiptsHeader3: Record "Receipts Header1";
        GenJournalLine2: Record "Gen. Journal Line";
    begin
        ReceiptRec.TestField(Date);
        ReceiptRec.TestField("Bank Code");
        ReceiptRec.TestField("Received From");
        ReceiptRec.TestField("Pay Mode");

        if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
            ReceiptRec.TestField("Cheque No");
            ReceiptRec.TestField("Cheque Date");
        end;

        ReceiptRec.CalcFields(Amount);
        //Check Lines
        if ReceiptRec.Amount = 0 then
            Error('Amount cannot be zero');
        RcptLines.Reset;
        RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
        if not RcptLines.FindLast then
            Error('Receipt Lines cannot be empty');

        CMSetup.Get();
        // Delete Lines Present on the General Journal Line
        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
        GenJnLine.DeleteAll;


        Batch.Init;
        if CMSetup.Get() then
            Batch."Journal Template Name" := CMSetup."Receipt Template";
        Batch.Name := CMSetup."Receipt Batch Name";
        if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
            Batch.Insert;

        //Bank Entries
        LineNo := LineNo + 10000;

        RcptLines.Reset;
        RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
        RcptLines.Validate(Amount);
        RcptLines.CalcSums(Amount);



        GenJnLine.Init;
        if CMSetup.Get then
            GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
        GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
        GenJnLine."Line No." := LineNo;
        // GenJournalLine2.RESET;
        // GenJournalLine2.SETRANGE("Journal Batch Name", CMSetup."Receipt Batch Name");
        // IF GenJournalLine2.FINDLAST THEN BEGIN
        // GenJnLine."Line No.":=GenJournalLine2."Line No."+10000;
        //  END;
        GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
        GenJnLine."Account No." := ReceiptRec."Bank Code";
        GenJnLine.Validate(GenJnLine."Account No.");
        if ReceiptRec.Date = 0D then
            Error('You must specify the Receipt date');
        GenJnLine."Posting Date" := ReceiptRec.Date;
        GenJnLine."Document No." := ReceiptRec."No.";
        GenJnLine."External Document No." := ReceiptRec."Cheque No";
        GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
        GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
        GenJnLine.Amount := ReceiptRec.Amount;
        GenJnLine."Currency Code" := ReceiptRec."Currency Code";
        GenJnLine.Validate("Currency Code");
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;

        //Receipt Lines Entries
        RcptLines.Reset;
        RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
        if RcptLines.FindFirst then begin
            repeat
                RcptLines.Validate(RcptLines.Amount);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                GenJnLine."Line No." := LineNo;
                // GenJournalLine2.RESET;
                // GenJournalLine2.SETRANGE("Journal Batch Name", CMSetup."Receipt Batch Name");
                // IF GenJournalLine2.FINDLAST THEN BEGIN
                // GenJnLine."Line No.":=GenJournalLine2."Line No."+10000;
                //  END;
                GenJnLine."Account Type" := RcptLines."Account Type";
                GenJnLine."Account No." := RcptLines."Account No.";
                GenJnLine.Validate(GenJnLine."Account No.");
                GenJnLine."Posting Date" := ReceiptRec.Date;
                GenJnLine."Document No." := ReceiptRec."No.";
                GenJnLine."External Document No." := ReceiptRec."Cheque No";
                GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                GenJnLine.Amount := -RcptLines.Amount;
                GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                //Application of document


                GenJnLine."Applies-to Doc. No." := RcptLines."Applies to Doc. No";
                GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");

                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;

            until RcptLines.Next = 0;
        end;

        //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnLine);

        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnLine);

        // COMMIT;
        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
        GLEntry.SetRange(GLEntry.Reversed, false);
        if GLEntry.FindFirst then begin
        end;
        ReceiptsHeader3.Reset;
        ReceiptsHeader3.SetRange("No.", ReceiptRec."No.");
        if ReceiptsHeader3.FindSet then begin
            ReceiptsHeader3.Posted := true;
            ReceiptsHeader3."Posted By" := UserId;
            ReceiptsHeader3."Posted Date" := ReceiptRec.Date;
            ReceiptsHeader3."Posted Time" := Time;
            ReceiptsHeader3."Posting Date" := ReceiptRec.Date;
            ReceiptsHeader3.Modify(true);
        end;
    end;


    procedure PostBatchDiv(ReceiptRec: Record "Receipts Header1")
    var
        RcptLines: Record "Receipt Lines1";
        GenJnLine: Record "Gen. Journal Line";
        LineNo: Integer;
        VATSetup: Record "VAT Posting Setup";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        GLEntry: Record "G/L Entry";
        CMSetup: Record "Cash Management Setup";
    begin
        // IF CONFIRM(Text017,FALSE,ReceiptRec."No.")=TRUE THEN BEGIN
        //
        // IF ReceiptRec.Posted=TRUE THEN
        // ERROR(Text018,ReceiptRec."No.");
        ReceiptRec.TestField("Expense Account");
        ReceiptRec.TestField(Date);
        ReceiptRec.TestField("Bank Code");
        ReceiptRec.TestField("Received From");
        ReceiptRec.TestField("Pay Mode");

        if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
            ReceiptRec.TestField("Cheque No");
            ReceiptRec.TestField("Cheque Date");
        end;

        ReceiptRec.CalcFields(Amount);
        //Check Lines
        if ReceiptRec.Amount = 0 then
            Error('Amount cannot be zero');
        RcptLines.Reset;
        RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
        if not RcptLines.FindLast then
            Error('Receipt Lines cannot be empty');

        CMSetup.Get();
        // Delete Lines Present on the General Journal Line
        GenJnLine.Reset;
        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Receipt Template");
        GenJnLine.SetRange(GenJnLine."Journal Batch Name", CMSetup."Receipt Batch Name");
        GenJnLine.DeleteAll;


        Batch.Init;
        if CMSetup.Get() then
            Batch."Journal Template Name" := CMSetup."Receipt Template";
        Batch.Name := CMSetup."Receipt Batch Name";
        if not Batch.Get(Batch."Journal Template Name", Batch.Name) then
            Batch.Insert;

        //Bank Entries
        LineNo := LineNo + 10000;

        RcptLines.Reset;
        RcptLines.SetRange("Receipt No.", ReceiptRec."No.");
        RcptLines.Validate(Amount);
        RcptLines.CalcSums(Amount);



        GenJnLine.Init;
        if CMSetup.Get then
            GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
        GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
        GenJnLine."Line No." := LineNo;
        GenJnLine."Account Type" := GenJnLine."account type"::"Bank Account";
        GenJnLine."Account No." := ReceiptRec."Bank Code";
        GenJnLine.Validate(GenJnLine."Account No.");
        if ReceiptRec.Date = 0D then
            Error('You must specify the Receipt date');
        GenJnLine."Posting Date" := ReceiptRec.Date;
        GenJnLine."Document No." := ReceiptRec."No.";
        GenJnLine."External Document No." := ReceiptRec."Cheque No";
        GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
        GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
        GenJnLine.Amount := ReceiptRec.Amount;
        GenJnLine."Currency Code" := ReceiptRec."Currency Code";
        GenJnLine.Validate("Currency Code");
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;

        //Receipt Lines Entries
        RcptLines.Reset;
        RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
        if RcptLines.FindFirst then begin
            repeat
                RcptLines.Validate(RcptLines.Amount);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := RcptLines."Account Type";
                GenJnLine."Account No." := RcptLines."Account No.";
                GenJnLine.Validate(GenJnLine."Account No.");
                GenJnLine."Posting Date" := ReceiptRec.Date;
                GenJnLine."Document No." := ReceiptRec."No.";
                GenJnLine."External Document No." := ReceiptRec."Cheque No";
                GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                GenJnLine.Amount := -RcptLines.Amount;
                GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;

            until RcptLines.Next = 0;
        end;

        //DIV
        LineNo := LineNo + 10000;
        GenJnLine.Init;
        if CMSetup.Get then
            GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
        GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
        GenJnLine."Line No." := LineNo;
        GenJnLine."Account Type" := GenJnLine."account type"::"G/L Account";
        GenJnLine."Account No." := ReceiptRec."Expense Account";
        GenJnLine.Validate(GenJnLine."Account No.");
        if ReceiptRec.Date = 0D then
            Error('You must specify the Receipt date');
        GenJnLine."Posting Date" := ReceiptRec.Date;
        GenJnLine."Document No." := ReceiptRec."No.";
        GenJnLine."External Document No." := ReceiptRec."Cheque No";
        GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
        GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
        GenJnLine.Amount := -ReceiptRec.Amount;
        GenJnLine."Currency Code" := ReceiptRec."Currency Code";
        GenJnLine.Validate("Currency Code");
        GenJnLine.Validate(GenJnLine.Amount);
        GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
        GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
        GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
        GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";

        if GenJnLine.Amount <> 0 then
            GenJnLine.Insert;

        //Receipt Lines Entries
        RcptLines.Reset;
        RcptLines.SetRange(RcptLines."Receipt No.", ReceiptRec."No.");
        if RcptLines.FindFirst then begin
            repeat
                RcptLines.Validate(RcptLines.Amount);
                LineNo := LineNo + 10000;
                GenJnLine.Init;
                if CMSetup.Get then
                    GenJnLine."Journal Template Name" := CMSetup."Receipt Template";
                GenJnLine."Journal Batch Name" := CMSetup."Receipt Batch Name";
                GenJnLine."Line No." := LineNo;
                GenJnLine."Account Type" := RcptLines."Account Type";
                GenJnLine."Account No." := RcptLines."Account No.";
                GenJnLine.Validate(GenJnLine."Account No.");
                GenJnLine."Posting Date" := ReceiptRec.Date;
                GenJnLine."Document No." := ReceiptRec."No.";
                GenJnLine."External Document No." := ReceiptRec."Cheque No";
                GenJnLine."Payment Method Code" := ReceiptRec."Pay Mode";
                GenJnLine.Description := 'Received from:' + ReceiptRec."Received From";
                GenJnLine.Amount := RcptLines.Amount;
                GenJnLine."Currency Code" := ReceiptRec."Currency Code";
                GenJnLine.Validate("Currency Code");
                GenJnLine.Validate(GenJnLine.Amount);
                GenJnLine."Shortcut Dimension 1 Code" := ReceiptRec."Shortcut Dimension 1 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 1 Code");
                GenJnLine."Shortcut Dimension 2 Code" := ReceiptRec."Shortcut Dimension 2 Code";
                GenJnLine.Validate(GenJnLine."Shortcut Dimension 2 Code");
                GenJnLine."Dimension Set ID" := ReceiptRec."Dimension Set ID";
                //GenJnLine."Shortcut Dimension 3 Code":=RcptLines."Shortcut Dimension 3 Code";
                //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 3 Code");

                if GenJnLine.Amount <> 0 then
                    GenJnLine.Insert;

            until RcptLines.Next = 0;
        end;

        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnLine);
        //CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnLine);

        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."Document No.", ReceiptRec."No.");
        GLEntry.SetRange(GLEntry.Reversed, false);
        if GLEntry.FindSet then begin
            ReceiptRec.Posted := true;
            ReceiptRec."Posted By" := UserId;
            ReceiptRec."Posted Date" := ReceiptRec.Date;
            ReceiptRec."Posted Time" := Time;
            ReceiptRec.Modify(true);
        end;
    end;
}
