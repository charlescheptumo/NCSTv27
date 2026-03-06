#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 57006 RIMSPaymentsPosting
{

    trigger OnRun()
    begin
        //MESSAGE(FnReceiveRIMSPayments('RTI0922311','CUST10001','Steve Test','Licenses and Permits - Undergraduate/Diploma(Rest of Africa)',5, 'BANK001',20221206D));
    end;

    var
        Rec: Variant;
        Batch: Record "Gen. Journal Batch";

    procedure FnReceiveRIMSPayments(refno: Text[30]; customercode: Text[20]; fullname: Text[150]; customerdetails: Text[255]; amount: Decimal; bankcode: Text[10]; paymentdate: Date; paymode: Code[20]; currencycode: Code[20]; fundingsourcecode: Code[100]; paymentreference: Code[100]) status: Text
    var
        RIMSPaymentBuffer: Record "RIMS Payments Buffer";
        ReceiptHeader: Record "Receipts Header1";
        ReceiptLines: Record "Receipt Lines1";
        GlobalPaymentsPosting: Codeunit "Payments-Post";
        CashManagementSetup: Record "Cash Management Setup";
    begin
        CashManagementSetup.Get;
        RIMSPaymentBuffer.Reset;
        RIMSPaymentBuffer.SetRange(RIMSPaymentBuffer."RIMS Ref No", refno);
        //RIMSPaymentBuffer.SETRANGE(RIMSPaymentBuffer."Payment Reference No",paymentreference);
        if RIMSPaymentBuffer.Find('-') then begin
            status := 'error' + '*' + 'Payment Reference No Already Exists';
        end else begin
            RIMSPaymentBuffer.Init;
            RIMSPaymentBuffer."RIMS Ref No" := refno;
            RIMSPaymentBuffer."Customer Code" := customercode;
            RIMSPaymentBuffer."Full Name" := fullname;
            RIMSPaymentBuffer."Customer Details" := customerdetails;
            RIMSPaymentBuffer."Paid Amount" := amount;
            RIMSPaymentBuffer."Payment Date" := paymentdate;
            RIMSPaymentBuffer."Bank Code" := bankcode;
            RIMSPaymentBuffer."Pay Mode" := paymode;
            RIMSPaymentBuffer."Currency Code" := currencycode;
            RIMSPaymentBuffer."Funding Source Code" := fundingsourcecode;
            RIMSPaymentBuffer."Payment Reference No" := paymentreference;
            RIMSPaymentBuffer.Posted := false;
            if RIMSPaymentBuffer.Insert(true) then begin
                ReceiptHeader.Reset;
                ReceiptHeader.SetRange(ReceiptHeader."Payment Reference", RIMSPaymentBuffer."Payment Reference No");
                if ReceiptHeader.Find('-') then begin
                end else begin
                    status := 'error' + '*' + 'Payment Reference No Already Exists on Receipts Header';
                end;
                ReceiptHeader.Init;
                ReceiptHeader."Cheque No" := RIMSPaymentBuffer."RIMS Ref No";
                ReceiptHeader."Received From" := RIMSPaymentBuffer."Full Name";
                ReceiptHeader."On Behalf Of" := RIMSPaymentBuffer."Full Name";
                ReceiptHeader."Cheque Date" := RIMSPaymentBuffer."Payment Date";
                ReceiptHeader."Bank Code" := RIMSPaymentBuffer."Bank Code";
                ReceiptHeader."Pay Mode" := RIMSPaymentBuffer."Pay Mode";
                if RIMSPaymentBuffer."Currency Code" = 'KES' then
                    ReceiptHeader."Currency Code" := ''
                else
                    ReceiptHeader."Currency Code" := RIMSPaymentBuffer."Currency Code";
                ReceiptHeader."Payment Reference" := RIMSPaymentBuffer."Payment Reference No";
                ReceiptHeader."Expense Account" := CashManagementSetup."RIMS Income Account";
                ReceiptHeader."Direct Income Voucher" := true;
                ReceiptHeader.Amount := amount;
                if ReceiptHeader.Insert(true) then begin
                    ReceiptLines.Init;
                    ReceiptLines."Receipt No." := ReceiptHeader."No.";
                    ReceiptLines."Account Type" := ReceiptLines."account type"::Customer;
                    ReceiptLines."Account No." := RIMSPaymentBuffer."Customer Code";
                    ReceiptLines."Account Name" := RIMSPaymentBuffer."Customer Details";
                    ReceiptLines.Description := ReceiptHeader."Received From";
                    ReceiptLines.Amount := ReceiptHeader.Amount;
                    if RIMSPaymentBuffer."Currency Code" = 'KES' then
                        ReceiptLines."Currency Code" := ''
                    else
                        ReceiptLines."Currency Code" := RIMSPaymentBuffer."Currency Code";
                    ReceiptLines."Global Dimension 2 Code" := RIMSPaymentBuffer."Funding Source Code";
                    if ReceiptLines.Insert(true) then begin
                        Rec := ReceiptHeader;
                        //Post Receipt
                        // GlobalPaymentsPosting.PostReceipt(Rec);
                        // PostReceipt(Rec);
                        PostDirectInvoiceVoucher(Rec);

                    end else begin
                    end;

                    status := 'success' + '*' + ReceiptHeader."No." + '*' + 'Payment Record Created Successfully';
                    RIMSPaymentBuffer."NAV Receipt No" := ReceiptHeader."No.";
                    RIMSPaymentBuffer.Modify();
                end else begin
                    status := 'error' + '*' + 'Receipt No  could not be created';
                end;

            end else begin
                status := 'error' + '*' + 'Payment record could not be created';
            end;

        end
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
        //IF CONFIRM(Text017,FALSE,ReceiptRec."No.")=TRUE THEN BEGIN
        //ReceiptRec.RESET;
        //ReceiptRec.SETRANGE(ReceiptRec.Posted, TRUE);
        //IF ReceiptRec.FIND('-') THEN BEGIN
        // // ERROR(Text018,ReceiptRec."No.");
        //  END ELSE BEGIN

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
        GenJnLine."Posting Date" := Today;
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
        //END;
    end;


    procedure PostDirectInvoiceVoucher(ReceiptRec: Record "Receipts Header1")
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
        //IF CONFIRM(Text017,FALSE,ReceiptRec."No.")=TRUE THEN BEGIN

        //IF ReceiptRec.Posted=TRUE THEN
        //ERROR(Text018,ReceiptRec."No.");
        ReceiptRec.TestField(Date);
        ReceiptRec.TestField("Bank Code");
        ReceiptRec.TestField("Received From");
        ReceiptRec.TestField("Pay Mode");

        if ReceiptRec."Pay Mode" = 'CHEQUE' then begin
            ReceiptRec.TestField("Cheque No");
            ReceiptRec.TestField("Payment Reference");
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
        GenJnLine."Posting Date" := Today;
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
                GenJnLine."Posting Date" := Today;
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
        // IF ReceiptRec.Date=0D THEN
        // ERROR('You must specify the Receipt date');
        GenJnLine."Posting Date" := Today;
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
                GenJnLine."Posting Date" := Today;
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
            ReceiptRec."Posted Date" := Today;
            ReceiptRec."Posted Time" := Time;
            ReceiptRec."Posting Date" := Today;
            ReceiptRec.Modify;

        end;

        //END;
    end;
}
