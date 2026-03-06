#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 90595 "Adjust Exchange Rates2"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Adjust Exchange Rates';
    Permissions = TableData "Cust. Ledger Entry" = rimd,
                  TableData "Vendor Ledger Entry" = rimd,
                  TableData "Exch. Rate Adjmt. Reg." = rimd,
                  TableData "VAT Entry" = rimd,
                  TableData "Detailed Cust. Ledg. Entry" = rimd,
                  TableData "Detailed Vendor Ledg. Entry" = rimd;
    ProcessingOnly = true;
    UsageCategory = Tasks;

    dataset
    {
        dataitem(Currency; Currency)
        {
            DataItemTableView = sorting(Code);
            RequestFilterFields = "Code";
            column(ReportForNavId_4146; 4146)
            {
            }
            dataitem("Bank Account"; "Bank Account")
            {
                DataItemLink = "Currency Code" = field(Code);
                DataItemTableView = sorting("Bank Acc. Posting Group");
                column(ReportForNavId_4558; 4558)
                {
                }
                dataitem(BankAccountGroupTotal; "Integer")
                {
                    DataItemTableView = sorting(Number);
                    MaxIteration = 1;
                    column(ReportForNavId_3273; 3273)
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        BankAccount: Record "Bank Account";
                        GroupTotal: Boolean;
                    begin
                        BankAccount.Copy("Bank Account");
                        if BankAccount.Next = 1 then begin
                            if BankAccount."Bank Acc. Posting Group" <> "Bank Account"."Bank Acc. Posting Group" then
                                GroupTotal := true;
                        end else
                            GroupTotal := true;

                        if GroupTotal then
                            if TotalAdjAmount <> 0 then begin
                                AdjExchRateBufferUpdate(
                                  "Bank Account"."Currency Code", "Bank Account"."Bank Acc. Posting Group",
                                  TotalAdjBase, TotalAdjBaseLCY, TotalAdjAmount, 0, 0, 0, PostingDate, '');
                                InsertExchRateAdjmtReg(3, "Bank Account"."Bank Acc. Posting Group", "Bank Account"."Currency Code");
                                TotalBankAccountsAdjusted += 1;
                                AdjExchRateBuffer.Reset;
                                AdjExchRateBuffer.DeleteAll;
                                TotalAdjBase := 0;
                                TotalAdjBaseLCY := 0;
                                TotalAdjAmount := 0;
                            end;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    TempEntryNoAmountBuf.DeleteAll;
                    BankAccNo := BankAccNo + 1;
                    Window.Update(1, ROUND(BankAccNo / BankAccNoTotal * 10000, 1));

                    TempDimSetEntry.Reset;
                    TempDimSetEntry.DeleteAll;
                    TempDimBuf.Reset;
                    TempDimBuf.DeleteAll;

                    "Bank Account".CalcFields("Bank Account"."Balance at Date", "Bank Account"."Balance at Date (LCY)");
                    AdjBase := "Bank Account"."Balance at Date";
                    AdjBaseLCY := "Bank Account"."Balance at Date (LCY)";
                    AdjAmount :=
                      ROUND(
                        CurrExchRate.ExchangeAmtFCYToLCYAdjmt(
                          PostingDate, Currency.Code, "Bank Account"."Balance at Date", Currency."Currency Factor")) -
                      "Bank Account"."Balance at Date (LCY)";

                    if AdjAmount <> 0 then begin
                        GenJnlLine.Validate("Posting Date", PostingDate);
                        GenJnlLine."Document No." := PostingDocNo;
                        GenJnlLine."Account Type" := GenJnlLine."account type"::"Bank Account";
                        GenJnlLine.Validate("Account No.", "Bank Account"."No.");
                        GenJnlLine.Description := PadStr(StrSubstNo(PostingDescription, Currency.Code, AdjBase), MaxStrLen(GenJnlLine.Description));
                        GenJnlLine.Validate(Amount, 0);
                        GenJnlLine."Amount (LCY)" := ROUND(AdjAmount, 0.1, '=');
                        // MESSAGE(FORMAT(ROUND(AdjAmount,0.1,'=')));
                        //GenJnlLine."Amount (LCY)" := AdjAmount;
                        GenJnlLine."Source Currency Code" := Currency.Code;
                        if Currency.Code = GLSetup."Additional Reporting Currency" then
                            GenJnlLine."Source Currency Amount" := 0;
                        GenJnlLine."Source Code" := SourceCodeSetup."Exchange Rate Adjmt.";
                        GenJnlLine."System-Created Entry" := true;
                        GetJnlLineDefDim(GenJnlLine, TempDimSetEntry);
                        CopyDimSetEntryToDimBuf(TempDimSetEntry, TempDimBuf);
                        PostGenJnlLine(GenJnlLine, TempDimSetEntry);
                        begin
                            TempEntryNoAmountBuf.Init;
                            TempEntryNoAmountBuf."Business Unit Code" := '';
                            TempEntryNoAmountBuf."Entry No." := TempEntryNoAmountBuf."Entry No." + 1;
                            TempEntryNoAmountBuf.Amount := AdjAmount;
                            TempEntryNoAmountBuf.Amount2 := AdjBase;
                            TempEntryNoAmountBuf.Insert;
                        end;
                        TempDimBuf2.Init;
                        TempDimBuf2."Table ID" := TempEntryNoAmountBuf."Entry No.";
                        TempDimBuf2."Entry No." := GetDimCombID(TempDimBuf);
                        TempDimBuf2.Insert;
                        TotalAdjBase := TotalAdjBase + AdjBase;
                        TotalAdjBaseLCY := TotalAdjBaseLCY + AdjBaseLCY;
                        TotalAdjAmount := TotalAdjAmount + AdjAmount;
                        Window.Update(4, TotalAdjAmount);

                        if TempEntryNoAmountBuf.Amount <> 0 then begin
                            TempDimSetEntry.Reset;
                            TempDimSetEntry.DeleteAll;
                            TempDimBuf.Reset;
                            TempDimBuf.DeleteAll;
                            TempDimBuf2.SetRange("Table ID", TempEntryNoAmountBuf."Entry No.");
                            if TempDimBuf2.FindFirst then
                                DimBufMgt.GetDimensions(TempDimBuf2."Entry No.", TempDimBuf);
                            DimMgt.CopyDimBufToDimSetEntry(TempDimBuf, TempDimSetEntry);
                            if TempEntryNoAmountBuf.Amount > 0 then
                                PostAdjmt(
                                  Currency.GetRealizedGainsAccount, -TempEntryNoAmountBuf.Amount, TempEntryNoAmountBuf.Amount2,
                                  "Bank Account"."Currency Code", TempDimSetEntry, PostingDate, '')
                            else
                                PostAdjmt(
                                  Currency.GetRealizedLossesAccount, -TempEntryNoAmountBuf.Amount, TempEntryNoAmountBuf.Amount2,
                                  "Bank Account"."Currency Code", TempDimSetEntry, PostingDate, '');
                        end;
                    end;
                    TempDimBuf2.DeleteAll;
                end;

                trigger OnPreDataItem()
                begin
                    "Bank Account".SetRange("Bank Account"."Date Filter", StartDate, EndDate);
                    TempDimBuf2.DeleteAll;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Currency."Last Date Adjusted" := PostingDate;
                Currency.Modify;

                Currency."Currency Factor" :=
                  CurrExchRate.ExchangeRateAdjmt(PostingDate, Currency.Code);

                Currency2 := Currency;
                Currency2.Insert;
            end;

            trigger OnPostDataItem()
            begin
                if (Currency.Code = '') and AdjCustVendBank then
                    Error(Text011);
            end;

            trigger OnPreDataItem()
            begin
                CheckPostingDate;
                if not AdjCustVendBank then
                    CurrReport.Break;

                Window.Open(
                  Text006 +
                  Text007 +
                  Text008 +
                  Text009 +
                  Text010);

                CustNoTotal := Customer.Count;
                VendNoTotal := Vendor.Count;
                Currency.Copyfilter(Currency.Code, "Bank Account"."Currency Code");
                Currency.FilterGroup(2);
                "Bank Account".SetFilter("Currency Code", '<>%1', '');
                Currency.FilterGroup(0);
                BankAccNoTotal := "Bank Account".Count;
                "Bank Account".Reset;
            end;
        }
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.");
            column(ReportForNavId_6836; 6836)
            {
            }
            dataitem(CustomerLedgerEntryLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_3687; 3687)
                {
                }
                dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
                {
                    DataItemTableView = sorting("Cust. Ledger Entry No.", "Posting Date");
                    column(ReportForNavId_6942; 6942)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        AdjustCustomerLedgerEntry(CustLedgerEntry, "Detailed Cust. Ledg. Entry"."Posting Date");
                    end;

                    trigger OnPreDataItem()
                    begin
                        "Detailed Cust. Ledg. Entry".SetCurrentkey("Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.");
                        "Detailed Cust. Ledg. Entry".SetRange("Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.", CustLedgerEntry."Entry No.");
                        "Detailed Cust. Ledg. Entry".SetFilter("Detailed Cust. Ledg. Entry"."Posting Date", '%1..', CalcDate('<+1D>', PostingDate));
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    TempDtldCustLedgEntrySums.DeleteAll;

                    if FirstEntry then begin
                        TempCustLedgerEntry.Find('-');
                        FirstEntry := false
                    end else
                        if TempCustLedgerEntry.Next = 0 then
                            CurrReport.Break;
                    CustLedgerEntry.Get(TempCustLedgerEntry."Entry No.");
                    AdjustCustomerLedgerEntry(CustLedgerEntry, PostingDate);
                end;

                trigger OnPreDataItem()
                begin
                    if not TempCustLedgerEntry.Find('-') then
                        CurrReport.Break;
                    FirstEntry := true;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CustNo := CustNo + 1;
                Window.Update(2, ROUND(CustNo / CustNoTotal * 10000, 1));

                TempCustLedgerEntry.DeleteAll;

                Currency.Copyfilter(Code, CustLedgerEntry."Currency Code");
                CustLedgerEntry.FilterGroup(2);
                CustLedgerEntry.SetFilter("Currency Code", '<>%1', '');
                CustLedgerEntry.FilterGroup(0);

                DtldCustLedgEntry.Reset;
                DtldCustLedgEntry.SetCurrentkey("Customer No.", "Posting Date", "Entry Type");
                DtldCustLedgEntry.SetRange("Customer No.", Customer."No.");
                DtldCustLedgEntry.SetRange("Posting Date", CalcDate('<+1D>', EndDate), Dmy2date(31, 12, 9999));
                if DtldCustLedgEntry.Find('-') then
                    repeat
                        CustLedgerEntry."Entry No." := DtldCustLedgEntry."Cust. Ledger Entry No.";
                        if CustLedgerEntry.Find('=') then
                            if (CustLedgerEntry."Posting Date" >= StartDate) and
                               (CustLedgerEntry."Posting Date" <= EndDate)
                            then begin
                                TempCustLedgerEntry."Entry No." := CustLedgerEntry."Entry No.";
                                if TempCustLedgerEntry.Insert then;
                            end;
                    until DtldCustLedgEntry.Next = 0;

                CustLedgerEntry.SetCurrentkey("Customer No.", Open);
                CustLedgerEntry.SetRange("Customer No.", Customer."No.");
                CustLedgerEntry.SetRange(Open, true);
                CustLedgerEntry.SetRange("Posting Date", 0D, EndDate);
                if CustLedgerEntry.Find('-') then
                    repeat
                        TempCustLedgerEntry."Entry No." := CustLedgerEntry."Entry No.";
                        if TempCustLedgerEntry.Insert then;
                    until CustLedgerEntry.Next = 0;
                CustLedgerEntry.Reset;
            end;

            trigger OnPostDataItem()
            begin
                if CustNo <> 0 then
                    HandlePostAdjmt(1); // Customer
            end;

            trigger OnPreDataItem()
            begin
                if not AdjCustVendBank then
                    CurrReport.Break;

                DtldCustLedgEntry.LockTable;
                CustLedgerEntry.LockTable;

                CustNo := 0;

                if DtldCustLedgEntry.Find('+') then
                    NewEntryNo := DtldCustLedgEntry."Entry No." + 1
                else
                    NewEntryNo := 1;

                Clear(DimMgt);
                TempEntryNoAmountBuf.DeleteAll;
            end;
        }
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = sorting("No.");
            column(ReportForNavId_3182; 3182)
            {
            }
            dataitem(VendorLedgerEntryLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_1221; 1221)
                {
                }
                dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
                {
                    DataItemTableView = sorting("Vendor Ledger Entry No.", "Posting Date");
                    column(ReportForNavId_2149; 2149)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        AdjustVendorLedgerEntry(VendorLedgerEntry, "Detailed Vendor Ledg. Entry"."Posting Date");
                    end;

                    trigger OnPreDataItem()
                    begin
                        "Detailed Vendor Ledg. Entry".SetCurrentkey("Detailed Vendor Ledg. Entry"."Vendor Ledger Entry No.");
                        "Detailed Vendor Ledg. Entry".SetRange("Detailed Vendor Ledg. Entry"."Vendor Ledger Entry No.", VendorLedgerEntry."Entry No.");
                        "Detailed Vendor Ledg. Entry".SetFilter("Detailed Vendor Ledg. Entry"."Posting Date", '%1..', CalcDate('<+1D>', PostingDate));
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    TempDtldVendLedgEntrySums.DeleteAll;

                    if FirstEntry then begin
                        TempVendorLedgerEntry.Find('-');
                        FirstEntry := false
                    end else
                        if TempVendorLedgerEntry.Next = 0 then
                            CurrReport.Break;
                    VendorLedgerEntry.Get(TempVendorLedgerEntry."Entry No.");
                    AdjustVendorLedgerEntry(VendorLedgerEntry, PostingDate);
                end;

                trigger OnPreDataItem()
                begin
                    if not TempVendorLedgerEntry.Find('-') then
                        CurrReport.Break;
                    FirstEntry := true;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                VendNo := VendNo + 1;
                Window.Update(3, ROUND(VendNo / VendNoTotal * 10000, 1));

                TempVendorLedgerEntry.DeleteAll;

                Currency.Copyfilter(Code, VendorLedgerEntry."Currency Code");
                VendorLedgerEntry.FilterGroup(2);
                VendorLedgerEntry.SetFilter("Currency Code", '<>%1', '');
                VendorLedgerEntry.FilterGroup(0);

                DtldVendLedgEntry.Reset;
                DtldVendLedgEntry.SetCurrentkey("Vendor No.", "Posting Date", "Entry Type");
                DtldVendLedgEntry.SetRange("Vendor No.", Vendor."No.");
                DtldVendLedgEntry.SetRange("Posting Date", CalcDate('<+1D>', EndDate), Dmy2date(31, 12, 9999));
                if DtldVendLedgEntry.Find('-') then
                    repeat
                        VendorLedgerEntry."Entry No." := DtldVendLedgEntry."Vendor Ledger Entry No.";
                        if VendorLedgerEntry.Find('=') then
                            if (VendorLedgerEntry."Posting Date" >= StartDate) and
                               (VendorLedgerEntry."Posting Date" <= EndDate)
                            then begin
                                TempVendorLedgerEntry."Entry No." := VendorLedgerEntry."Entry No.";
                                if TempVendorLedgerEntry.Insert then;
                            end;
                    until DtldVendLedgEntry.Next = 0;

                VendorLedgerEntry.SetCurrentkey("Vendor No.", Open);
                VendorLedgerEntry.SetRange("Vendor No.", Vendor."No.");
                VendorLedgerEntry.SetRange(Open, true);
                VendorLedgerEntry.SetRange("Posting Date", 0D, EndDate);
                if VendorLedgerEntry.Find('-') then
                    repeat
                        TempVendorLedgerEntry."Entry No." := VendorLedgerEntry."Entry No.";
                        if TempVendorLedgerEntry.Insert then;
                    until VendorLedgerEntry.Next = 0;
                VendorLedgerEntry.Reset;
            end;

            trigger OnPostDataItem()
            begin
                if VendNo <> 0 then
                    HandlePostAdjmt(2); // Vendor
            end;

            trigger OnPreDataItem()
            begin
                if not AdjCustVendBank then
                    CurrReport.Break;

                DtldVendLedgEntry.LockTable;
                VendorLedgerEntry.LockTable;

                VendNo := 0;
                if DtldVendLedgEntry.Find('+') then
                    NewEntryNo := DtldVendLedgEntry."Entry No." + 1
                else
                    NewEntryNo := 1;

                Clear(DimMgt);
                TempEntryNoAmountBuf.DeleteAll;
            end;
        }
        dataitem("VAT Posting Setup"; "VAT Posting Setup")
        {
            DataItemTableView = sorting("VAT Bus. Posting Group", "VAT Prod. Posting Group");
            column(ReportForNavId_1756; 1756)
            {
            }

            trigger OnAfterGetRecord()
            begin
                VATEntryNo := VATEntryNo + 1;
                Window.Update(1, ROUND(VATEntryNo / VATEntryNoTotal * 10000, 1));

                VATEntry.SetRange("VAT Bus. Posting Group", "VAT Posting Setup"."VAT Bus. Posting Group");
                VATEntry.SetRange("VAT Prod. Posting Group", "VAT Posting Setup"."VAT Prod. Posting Group");

                if "VAT Posting Setup"."VAT Calculation Type" <> "VAT Posting Setup"."vat calculation type"::"Sales Tax" then begin
                    AdjustVATEntries(VATEntry.Type::Purchase, false);
                    if (VATEntry2.Amount <> 0) or (VATEntry2."Additional-Currency Amount" <> 0) then begin
                        AdjustVATAccount(
                          "VAT Posting Setup".GetPurchAccount(false),
                          VATEntry2.Amount, VATEntry2."Additional-Currency Amount",
                          VATEntryTotalBase.Amount, VATEntryTotalBase."Additional-Currency Amount");
                        if "VAT Posting Setup"."VAT Calculation Type" = "VAT Posting Setup"."vat calculation type"::"Reverse Charge VAT" then
                            AdjustVATAccount(
                              "VAT Posting Setup".GetRevChargeAccount(false),
                              -VATEntry2.Amount, -VATEntry2."Additional-Currency Amount",
                              -VATEntryTotalBase.Amount, -VATEntryTotalBase."Additional-Currency Amount");
                    end;
                    if (VATEntry2."Remaining Unrealized Amount" <> 0) or
                       (VATEntry2."Add.-Curr. Rem. Unreal. Amount" <> 0)
                    then begin
                        "VAT Posting Setup".TestField("VAT Posting Setup"."Unrealized VAT Type");
                        AdjustVATAccount(
                          "VAT Posting Setup".GetPurchAccount(true),
                          VATEntry2."Remaining Unrealized Amount",
                          VATEntry2."Add.-Curr. Rem. Unreal. Amount",
                          VATEntryTotalBase."Remaining Unrealized Amount",
                          VATEntryTotalBase."Add.-Curr. Rem. Unreal. Amount");
                        if "VAT Posting Setup"."VAT Calculation Type" = "VAT Posting Setup"."vat calculation type"::"Reverse Charge VAT" then
                            AdjustVATAccount(
                              "VAT Posting Setup".GetRevChargeAccount(true),
                              -VATEntry2."Remaining Unrealized Amount",
                              -VATEntry2."Add.-Curr. Rem. Unreal. Amount",
                              -VATEntryTotalBase."Remaining Unrealized Amount",
                              -VATEntryTotalBase."Add.-Curr. Rem. Unreal. Amount");
                    end;

                    AdjustVATEntries(VATEntry.Type::Sale, false);
                    if (VATEntry2.Amount <> 0) or (VATEntry2."Additional-Currency Amount" <> 0) then
                        AdjustVATAccount(
                          "VAT Posting Setup".GetSalesAccount(false),
                          VATEntry2.Amount, VATEntry2."Additional-Currency Amount",
                          VATEntryTotalBase.Amount, VATEntryTotalBase."Additional-Currency Amount");
                    if (VATEntry2."Remaining Unrealized Amount" <> 0) or
                       (VATEntry2."Add.-Curr. Rem. Unreal. Amount" <> 0)
                    then begin
                        "VAT Posting Setup".TestField("VAT Posting Setup"."Unrealized VAT Type");
                        AdjustVATAccount(
                          "VAT Posting Setup".GetSalesAccount(true),
                          VATEntry2."Remaining Unrealized Amount",
                          VATEntry2."Add.-Curr. Rem. Unreal. Amount",
                          VATEntryTotalBase."Remaining Unrealized Amount",
                          VATEntryTotalBase."Add.-Curr. Rem. Unreal. Amount");
                    end;
                end else begin
                    if TaxJurisdiction.Find('-') then
                        repeat
                            VATEntry.SetRange("Tax Jurisdiction Code", TaxJurisdiction.Code);
                            AdjustVATEntries(VATEntry.Type::Purchase, false);
                            AdjustPurchTax(false);
                            AdjustVATEntries(VATEntry.Type::Purchase, true);
                            AdjustPurchTax(true);
                            AdjustVATEntries(VATEntry.Type::Sale, false);
                            AdjustSalesTax;
                        until TaxJurisdiction.Next = 0;
                    VATEntry.SetRange("Tax Jurisdiction Code");
                end;
                Clear(VATEntryTotalBase);
            end;

            trigger OnPreDataItem()
            begin
                if not AdjGLAcc or
                   (GLSetup."VAT Exchange Rate Adjustment" = GLSetup."vat exchange rate adjustment"::"No Adjustment")
                then
                    CurrReport.Break;

                Window.Open(
                  Text012 +
                  Text013);

                VATEntryNoTotal := VATEntry.Count;
                if not
                   VATEntry.SetCurrentkey(
                     Type, Closed, "VAT Bus. Posting Group", "VAT Prod. Posting Group", "Posting Date")
                then
                    VATEntry.SetCurrentkey(
                      Type, Closed, "Tax Jurisdiction Code", "Use Tax", "Posting Date");
                VATEntry.SetRange(Closed, false);
                VATEntry.SetRange("Posting Date", StartDate, EndDate);
            end;
        }
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = sorting("No.") where("Exchange Rate Adjustment" = filter("Adjust Amount" .. "Adjust Additional-Currency Amount"));
            column(ReportForNavId_6710; 6710)
            {
            }

            trigger OnAfterGetRecord()
            begin
                GLAccNo := GLAccNo + 1;
                Window.Update(1, ROUND(GLAccNo / GLAccNoTotal * 10000, 1));
                if "G/L Account"."Exchange Rate Adjustment" = "G/L Account"."exchange rate adjustment"::"No Adjustment" then
                    CurrReport.Skip;

                TempDimSetEntry.Reset;
                TempDimSetEntry.DeleteAll;
                "G/L Account".CalcFields("G/L Account"."Net Change", "G/L Account"."Additional-Currency Net Change");
                case "G/L Account"."Exchange Rate Adjustment" of
                    "G/L Account"."exchange rate adjustment"::"Adjust Amount":
                        PostGLAccAdjmt(
                          "G/L Account"."No.", "G/L Account"."exchange rate adjustment"::"Adjust Amount",
                          ROUND(
                            CurrExchRate2.ExchangeAmtFCYToLCYAdjmt(
                              PostingDate, GLSetup."Additional Reporting Currency",
                              "G/L Account"."Additional-Currency Net Change", AddCurrCurrencyFactor) -
                            "G/L Account"."Net Change"),
                          "G/L Account"."Net Change",
                          "G/L Account"."Additional-Currency Net Change");
                    "G/L Account"."exchange rate adjustment"::"Adjust Additional-Currency Amount":
                        PostGLAccAdjmt(
                          "G/L Account"."No.", "G/L Account"."exchange rate adjustment"::"Adjust Additional-Currency Amount",
                          ROUND(
                            CurrExchRate2.ExchangeAmtLCYToFCY(
                              PostingDate, GLSetup."Additional Reporting Currency",
                              "G/L Account"."Net Change", AddCurrCurrencyFactor) -
                            "G/L Account"."Additional-Currency Net Change",
                            Currency3."Amount Rounding Precision"),
                          "G/L Account"."Net Change",
                          "G/L Account"."Additional-Currency Net Change");
                end;
            end;

            trigger OnPostDataItem()
            begin
                if AdjGLAcc then begin
                    GenJnlLine."Document No." := PostingDocNo;
                    GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                    GenJnlLine."Posting Date" := PostingDate;
                    GenJnlLine."Source Code" := SourceCodeSetup."Exchange Rate Adjmt.";

                    if GLAmtTotal <> 0 then begin
                        if GLAmtTotal < 0 then
                            GenJnlLine."Account No." := Currency3.GetRealizedGLLossesAccount
                        else
                            GenJnlLine."Account No." := Currency3.GetRealizedGLGainsAccount;
                        GenJnlLine.Description :=
                          StrSubstNo(
                            PostingDescription,
                            GLSetup."Additional Reporting Currency",
                            GLAddCurrNetChangeTotal);
                        GenJnlLine."Additional-Currency Posting" := GenJnlLine."additional-currency posting"::"Amount Only";
                        GenJnlLine."Currency Code" := '';
                        GenJnlLine.Amount := -GLAmtTotal;
                        GenJnlLine."Amount (LCY)" := -GLAmtTotal;
                        GetJnlLineDefDim(GenJnlLine, TempDimSetEntry);
                        PostGenJnlLine(GenJnlLine, TempDimSetEntry);
                    end;
                    if GLAddCurrAmtTotal <> 0 then begin
                        if GLAddCurrAmtTotal < 0 then
                            GenJnlLine."Account No." := Currency3.GetRealizedGLLossesAccount
                        else
                            GenJnlLine."Account No." := Currency3.GetRealizedGLGainsAccount;
                        GenJnlLine.Description :=
                          StrSubstNo(
                            PostingDescription, '',
                            GLNetChangeTotal);
                        GenJnlLine."Additional-Currency Posting" := GenJnlLine."additional-currency posting"::"Additional-Currency Amount Only";
                        GenJnlLine."Currency Code" := GLSetup."Additional Reporting Currency";
                        GenJnlLine.Amount := -GLAddCurrAmtTotal;
                        GenJnlLine."Amount (LCY)" := 0;
                        GetJnlLineDefDim(GenJnlLine, TempDimSetEntry);
                        PostGenJnlLine(GenJnlLine, TempDimSetEntry);
                    end;

                    begin
                        ExchRateAdjReg."No." := ExchRateAdjReg."No." + 1;
                        ExchRateAdjReg."Creation Date" := PostingDate;
                        ExchRateAdjReg."Account Type" := ExchRateAdjReg."account type"::"G/L Account";
                        ExchRateAdjReg."Posting Group" := '';
                        ExchRateAdjReg."Currency Code" := GLSetup."Additional Reporting Currency";
                        ExchRateAdjReg."Currency Factor" := CurrExchRate2."Adjustment Exch. Rate Amount";
                        ExchRateAdjReg."Adjusted Base" := 0;
                        ExchRateAdjReg."Adjusted Base (LCY)" := GLNetChangeBase;
                        ExchRateAdjReg."Adjusted Amt. (LCY)" := GLAmtTotal;
                        ExchRateAdjReg."Adjusted Base (Add.-Curr.)" := GLAddCurrNetChangeBase;
                        ExchRateAdjReg."Adjusted Amt. (Add.-Curr.)" := GLAddCurrAmtTotal;
                        ExchRateAdjReg.Insert;
                    end;

                    TotalGLAccountsAdjusted += 1;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if not AdjGLAcc then
                    CurrReport.Break;

                Window.Open(
                  Text014 +
                  Text015);

                GLAccNoTotal := "G/L Account".Count;
                "G/L Account".SetRange("G/L Account"."Date Filter", StartDate, EndDate);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    group("Adjustment Period")
                    {
                        Caption = 'Adjustment Period';
                        field(StartingDate; StartDate)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Starting Date';
                            ToolTip = 'Specifies the beginning of the period for which entries are adjusted. This field is usually left blank, but you can enter a date.';
                        }
                        field(EndingDate; EndDateReq)
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Ending Date';
                            ToolTip = 'Specifies the last date for which entries are adjusted. This date is usually the same as the posting date in the Posting Date field.';

                            trigger OnValidate()
                            begin
                                PostingDate := EndDateReq;
                            end;
                        }
                    }
                    field(PostingDescription; PostingDescription)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posting Description';
                        ToolTip = 'Specifies text for the general ledger entries that are created by the batch job. The default text is Exchange Rate Adjmt. of %1 %2, in which %1 is replaced by the currency code and %2 is replaced by the currency amount that is adjusted. For example, Exchange Rate Adjmt. of DEM 38,000.';
                    }
                    field(PostingDate; PostingDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the date on which the general ledger entries are posted. This date is usually the same as the ending date in the Ending Date field.';

                        trigger OnValidate()
                        begin
                            CheckPostingDate;
                        end;
                    }
                    field(DocumentNo; PostingDocNo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the document number that will appear on the general ledger entries that are created by the batch job.';
                    }
                    field(AdjCustVendBank; AdjCustVendBank)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Adjust Customer, Vendor and Bank Accounts';
                        MultiLine = true;
                        ToolTip = 'Specifies if you want to adjust customer, vendor, and bank accounts for currency fluctuations.';
                    }
                    field(AdjGLAcc; AdjGLAcc)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Adjust G/L Accounts for Add.-Reporting Currency';
                        MultiLine = true;
                        ToolTip = 'Specifies if you want to post in an additional reporting currency and adjust general ledger accounts for currency fluctuations between LCY and the additional reporting currency.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            if PostingDescription = '' then
                PostingDescription := Text016;
            if not (AdjCustVendBank or AdjGLAcc) then
                AdjCustVendBank := true;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnInitReport(IsHandled);
        if IsHandled then
            exit;
    end;

    trigger OnPostReport()
    begin
        UpdateAnalysisView.UpdateAll(0, true);

        if TotalCustomersAdjusted + TotalVendorsAdjusted + TotalBankAccountsAdjusted + TotalGLAccountsAdjusted < 1 then
            Message(NothingToAdjustMsg)
        else
            Message(RatesAdjustedMsg);
    end;

    trigger OnPreReport()
    begin
        if EndDateReq = 0D then
            EndDate := Dmy2date(31, 12, 9999)
        else
            EndDate := EndDateReq;
        if PostingDocNo = '' then
            Error(Text000, GenJnlLine.FieldCaption("Document No."));
        if not AdjCustVendBank and AdjGLAcc then
            if not Confirm(Text001 + Text004, false) then
                Error(Text005);

        SourceCodeSetup.Get;

        if ExchRateAdjReg.FindLast then
            ExchRateAdjReg.Init;

        GLSetup.Get;

        if AdjGLAcc then begin
            GLSetup.TestField("Additional Reporting Currency");

            Currency3.Get(GLSetup."Additional Reporting Currency");
            "G/L Account".Get(Currency3.GetRealizedGLGainsAccount);
            "G/L Account".TestField("Exchange Rate Adjustment", "G/L Account"."exchange rate adjustment"::"No Adjustment");

            "G/L Account".Get(Currency3.GetRealizedGLLossesAccount);
            "G/L Account".TestField("Exchange Rate Adjustment", "G/L Account"."exchange rate adjustment"::"No Adjustment");

            if VATPostingSetup2.Find('-') then
                repeat
                    if VATPostingSetup2."VAT Calculation Type" <> VATPostingSetup2."vat calculation type"::"Sales Tax" then begin
                        CheckExchRateAdjustment(
                          VATPostingSetup2."Purchase VAT Account", VATPostingSetup2.TableCaption, VATPostingSetup2.FieldCaption(VATPostingSetup2."Purchase VAT Account"));
                        CheckExchRateAdjustment(
                          VATPostingSetup2."Reverse Chrg. VAT Acc.", VATPostingSetup2.TableCaption, VATPostingSetup2.FieldCaption(VATPostingSetup2."Reverse Chrg. VAT Acc."));
                        CheckExchRateAdjustment(
                          VATPostingSetup2."Purch. VAT Unreal. Account", VATPostingSetup2.TableCaption, VATPostingSetup2.FieldCaption(VATPostingSetup2."Purch. VAT Unreal. Account"));
                        CheckExchRateAdjustment(
                          VATPostingSetup2."Reverse Chrg. VAT Unreal. Acc.", VATPostingSetup2.TableCaption, VATPostingSetup2.FieldCaption(VATPostingSetup2."Reverse Chrg. VAT Unreal. Acc."));
                        CheckExchRateAdjustment(
                          VATPostingSetup2."Sales VAT Account", VATPostingSetup2.TableCaption, VATPostingSetup2.FieldCaption(VATPostingSetup2."Sales VAT Account"));
                        CheckExchRateAdjustment(
                          VATPostingSetup2."Sales VAT Unreal. Account", VATPostingSetup2.TableCaption, VATPostingSetup2.FieldCaption(VATPostingSetup2."Sales VAT Unreal. Account"));
                    end;
                until VATPostingSetup2.Next = 0;

            if TaxJurisdiction2.Find('-') then
                repeat
                    CheckExchRateAdjustment(
                      TaxJurisdiction2."Tax Account (Purchases)", TaxJurisdiction2.TableCaption, TaxJurisdiction2.FieldCaption(TaxJurisdiction2."Tax Account (Purchases)"));
                    CheckExchRateAdjustment(
                      TaxJurisdiction2."Reverse Charge (Purchases)", TaxJurisdiction2.TableCaption, TaxJurisdiction2.FieldCaption(TaxJurisdiction2."Reverse Charge (Purchases)"));
                    CheckExchRateAdjustment(
                      TaxJurisdiction2."Unreal. Tax Acc. (Purchases)", TaxJurisdiction2.TableCaption, TaxJurisdiction2.FieldCaption(TaxJurisdiction2."Unreal. Tax Acc. (Purchases)"));
                    CheckExchRateAdjustment(
                      TaxJurisdiction2."Unreal. Rev. Charge (Purch.)", TaxJurisdiction2.TableCaption, TaxJurisdiction2.FieldCaption(TaxJurisdiction2."Unreal. Rev. Charge (Purch.)"));
                    CheckExchRateAdjustment(
                      TaxJurisdiction2."Tax Account (Sales)", TaxJurisdiction2.TableCaption, TaxJurisdiction2.FieldCaption(TaxJurisdiction2."Tax Account (Sales)"));
                    CheckExchRateAdjustment(
                      TaxJurisdiction2."Unreal. Tax Acc. (Sales)", TaxJurisdiction2.TableCaption, TaxJurisdiction2.FieldCaption(TaxJurisdiction2."Unreal. Tax Acc. (Sales)"));
                until TaxJurisdiction2.Next = 0;

            AddCurrCurrencyFactor :=
              CurrExchRate2.ExchangeRateAdjmt(PostingDate, GLSetup."Additional Reporting Currency");
        end;
    end;

    var
        Text000: label '%1 must be entered.';
        Text001: label 'Do you want to adjust general ledger entries for currency fluctuations without adjusting customer, vendor and bank ledger entries? This may result in incorrect currency adjustments to payables, receivables and bank accounts.\\ ';
        Text004: label 'Do you wish to continue?';
        Text005: label 'The adjustment of exchange rates has been canceled.';
        Text006: label 'Adjusting exchange rates...\\';
        Text007: label 'Bank Account    @1@@@@@@@@@@@@@\\';
        Text008: label 'Customer        @2@@@@@@@@@@@@@\';
        Text009: label 'Vendor          @3@@@@@@@@@@@@@\';
        Text010: label 'Adjustment      #4#############';
        Text011: label 'No currencies have been found.';
        Text012: label 'Adjusting VAT Entries...\\';
        Text013: label 'VAT Entry    @1@@@@@@@@@@@@@';
        Text014: label 'Adjusting general ledger...\\';
        Text015: label 'G/L Account    @1@@@@@@@@@@@@@';
        Text016: label 'Adjmt. of %1 %2, Ex.Rate Adjust.', Comment = '%1 = Currency Code, %2= Adjust Amount';
        Text017: label '%1 on %2 %3 must be %4. When this %2 is used in %5, the exchange rate adjustment is defined in the %6 field in the %7. %2 %3 is used in the %8 field in the %5. ';
        DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        TempDtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry" temporary;
        TempDtldCustLedgEntrySums: Record "Detailed Cust. Ledg. Entry" temporary;
        DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
        TempDtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry" temporary;
        TempDtldVendLedgEntrySums: Record "Detailed Vendor Ledg. Entry" temporary;
        ExchRateAdjReg: Record "Exch. Rate Adjmt. Reg.";
        CustPostingGr: Record "Customer Posting Group";
        VendPostingGr: Record "Vendor Posting Group";
        GenJnlLine: Record "Gen. Journal Line";
        SourceCodeSetup: Record "Source Code Setup";
        AdjExchRateBuffer: Record "Adjust Exchange Rate Buffer" temporary;
        AdjExchRateBuffer2: Record "Adjust Exchange Rate Buffer" temporary;
        Currency2: Record Currency temporary;
        Currency3: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        CurrExchRate2: Record "Currency Exchange Rate";
        GLSetup: Record "General Ledger Setup";
        VATEntry: Record "VAT Entry";
        VATEntry2: Record "VAT Entry";
        VATEntryTotalBase: Record "VAT Entry";
        TaxJurisdiction: Record "Tax Jurisdiction";
        VATPostingSetup2: Record "VAT Posting Setup";
        TaxJurisdiction2: Record "Tax Jurisdiction";
        TempDimBuf: Record "Dimension Buffer" temporary;
        TempDimBuf2: Record "Dimension Buffer" temporary;
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        TempEntryNoAmountBuf: Record "Entry No. Amount Buffer" temporary;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TempCustLedgerEntry: Record "Cust. Ledger Entry" temporary;
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        TempVendorLedgerEntry: Record "Vendor Ledger Entry" temporary;
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        UpdateAnalysisView: Codeunit "Update Analysis View";
        DimMgt: Codeunit DimensionManagement;
        DimBufMgt: Codeunit "Dimension Buffer Management";
        Window: Dialog;
        TotalAdjBase: Decimal;
        TotalAdjBaseLCY: Decimal;
        TotalAdjAmount: Decimal;
        GainsAmount: Decimal;
        LossesAmount: Decimal;
        PostingDate: Date;
        PostingDescription: Text[100];
        AdjBase: Decimal;
        AdjBaseLCY: Decimal;
        AdjAmount: Decimal;
        CustNo: Decimal;
        CustNoTotal: Decimal;
        VendNo: Decimal;
        VendNoTotal: Decimal;
        BankAccNo: Decimal;
        BankAccNoTotal: Decimal;
        GLAccNo: Decimal;
        GLAccNoTotal: Decimal;
        GLAmtTotal: Decimal;
        GLAddCurrAmtTotal: Decimal;
        GLNetChangeTotal: Decimal;
        GLAddCurrNetChangeTotal: Decimal;
        GLNetChangeBase: Decimal;
        GLAddCurrNetChangeBase: Decimal;
        PostingDocNo: Code[20];
        StartDate: Date;
        EndDate: Date;
        EndDateReq: Date;
        Correction: Boolean;
        OK: Boolean;
        AdjCustVendBank: Boolean;
        AdjGLAcc: Boolean;
        AddCurrCurrencyFactor: Decimal;
        VATEntryNoTotal: Decimal;
        VATEntryNo: Decimal;
        NewEntryNo: Integer;
        Text018: label 'This posting date cannot be entered because it does not occur within the adjustment period. Reenter the posting date.';
        FirstEntry: Boolean;
        MaxAdjExchRateBufIndex: Integer;
        RatesAdjustedMsg: label 'One or more currency exchange rates have been adjusted.';
        NothingToAdjustMsg: label 'There is nothing to adjust.';
        TotalBankAccountsAdjusted: Integer;
        TotalCustomersAdjusted: Integer;
        TotalVendorsAdjusted: Integer;
        TotalGLAccountsAdjusted: Integer;

    local procedure PostAdjmt(GLAccNo: Code[20]; PostingAmount: Decimal; AdjBase2: Decimal; CurrencyCode2: Code[10]; var DimSetEntry: Record "Dimension Set Entry"; PostingDate2: Date; ICCode: Code[20]) TransactionNo: Integer
    begin
        if PostingAmount <> 0 then begin
            GenJnlLine.Init;
            GenJnlLine.Validate(GenJnlLine."Posting Date", PostingDate2);
            GenJnlLine."Document No." := PostingDocNo;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
            GenJnlLine.Validate(GenJnlLine."Account No.", GLAccNo);
            GenJnlLine.Description := PadStr(StrSubstNo(PostingDescription, CurrencyCode2, AdjBase2), MaxStrLen(GenJnlLine.Description));
            GenJnlLine.Validate(GenJnlLine.Amount, PostingAmount);
            GenJnlLine."Source Currency Code" := CurrencyCode2;
            GenJnlLine."IC Partner Code" := ICCode;
            if CurrencyCode2 = GLSetup."Additional Reporting Currency" then
                GenJnlLine."Source Currency Amount" := 0;
            GenJnlLine."Source Code" := SourceCodeSetup."Exchange Rate Adjmt.";
            GenJnlLine."System-Created Entry" := true;
            TransactionNo := PostGenJnlLine(GenJnlLine, DimSetEntry);
        end;
    end;

    local procedure InsertExchRateAdjmtReg(AdjustAccType: Integer; PostingGrCode: Code[20]; CurrencyCode: Code[10])
    begin
        if Currency2.Code <> CurrencyCode then
            Currency2.Get(CurrencyCode);

        begin
            ExchRateAdjReg."No." := ExchRateAdjReg."No." + 1;
            ExchRateAdjReg."Creation Date" := PostingDate;
            ExchRateAdjReg."Account Type" := AdjustAccType;
            ExchRateAdjReg."Posting Group" := PostingGrCode;
            ExchRateAdjReg."Currency Code" := Currency2.Code;
            ExchRateAdjReg."Currency Factor" := Currency2."Currency Factor";
            ExchRateAdjReg."Adjusted Base" := AdjExchRateBuffer.AdjBase;
            ExchRateAdjReg."Adjusted Base (LCY)" := AdjExchRateBuffer.AdjBaseLCY;
            ExchRateAdjReg."Adjusted Amt. (LCY)" := AdjExchRateBuffer.AdjAmount;
            ExchRateAdjReg.Insert;
        end;
    end;

    procedure InitializeRequest(NewStartDate: Date; NewEndDate: Date; NewPostingDescription: Text[100]; NewPostingDate: Date)
    begin
        StartDate := NewStartDate;
        EndDate := NewEndDate;
        PostingDescription := NewPostingDescription;
        PostingDate := NewPostingDate;
        if EndDate = 0D then
            EndDateReq := Dmy2date(31, 12, 9999)
        else
            EndDateReq := EndDate;
    end;

    procedure InitializeRequest2(NewStartDate: Date; NewEndDate: Date; NewPostingDescription: Text[100]; NewPostingDate: Date; NewPostingDocNo: Code[20]; NewAdjCustVendBank: Boolean; NewAdjGLAcc: Boolean)
    begin
        InitializeRequest(NewStartDate, NewEndDate, NewPostingDescription, NewPostingDate);
        PostingDocNo := NewPostingDocNo;
        AdjCustVendBank := NewAdjCustVendBank;
        AdjGLAcc := NewAdjGLAcc;
    end;

    local procedure AdjExchRateBufferUpdate(CurrencyCode2: Code[10]; PostingGroup2: Code[20]; AdjBase2: Decimal; AdjBaseLCY2: Decimal; AdjAmount2: Decimal; GainsAmount2: Decimal; LossesAmount2: Decimal; DimEntryNo: Integer; Postingdate2: Date; ICCode: Code[20]): Integer
    begin
        AdjExchRateBuffer.Init;
        OK := AdjExchRateBuffer.Get(CurrencyCode2, PostingGroup2, DimEntryNo, Postingdate2, ICCode);

        AdjExchRateBuffer.AdjBase := AdjExchRateBuffer.AdjBase + AdjBase2;
        AdjExchRateBuffer.AdjBaseLCY := AdjExchRateBuffer.AdjBaseLCY + AdjBaseLCY2;
        AdjExchRateBuffer.AdjAmount := AdjExchRateBuffer.AdjAmount + AdjAmount2;
        AdjExchRateBuffer.TotalGainsAmount := AdjExchRateBuffer.TotalGainsAmount + GainsAmount2;
        AdjExchRateBuffer.TotalLossesAmount := AdjExchRateBuffer.TotalLossesAmount + LossesAmount2;

        if not OK then begin
            AdjExchRateBuffer."Currency Code" := CurrencyCode2;
            AdjExchRateBuffer."Posting Group" := PostingGroup2;
            AdjExchRateBuffer."Dimension Entry No." := DimEntryNo;
            AdjExchRateBuffer."Posting Date" := Postingdate2;
            AdjExchRateBuffer."IC Partner Code" := ICCode;
            MaxAdjExchRateBufIndex += 1;
            AdjExchRateBuffer.Index := MaxAdjExchRateBufIndex;
            AdjExchRateBuffer.Insert;
        end else
            AdjExchRateBuffer.Modify;

        exit(AdjExchRateBuffer.Index);
    end;

    local procedure HandlePostAdjmt(AdjustAccType: Integer)
    var
        GLEntry: Record "G/L Entry";
        TempDtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer" temporary;
    begin
        if AdjExchRateBuffer.Find('-') then begin
            // Summarize per currency and dimension combination
            repeat
                AdjExchRateBuffer2.Init;
                OK :=
                  AdjExchRateBuffer2.Get(
                    AdjExchRateBuffer."Currency Code",
                    '',
                    AdjExchRateBuffer."Dimension Entry No.",
                    AdjExchRateBuffer."Posting Date",
                    AdjExchRateBuffer."IC Partner Code");
                AdjExchRateBuffer2.AdjBase := AdjExchRateBuffer2.AdjBase + AdjExchRateBuffer.AdjBase;
                AdjExchRateBuffer2.TotalGainsAmount := AdjExchRateBuffer2.TotalGainsAmount + AdjExchRateBuffer.TotalGainsAmount;
                AdjExchRateBuffer2.TotalLossesAmount := AdjExchRateBuffer2.TotalLossesAmount + AdjExchRateBuffer.TotalLossesAmount;
                if not OK then begin
                    AdjExchRateBuffer2."Currency Code" := AdjExchRateBuffer."Currency Code";
                    AdjExchRateBuffer2."Dimension Entry No." := AdjExchRateBuffer."Dimension Entry No.";
                    AdjExchRateBuffer2."Posting Date" := AdjExchRateBuffer."Posting Date";
                    AdjExchRateBuffer2."IC Partner Code" := AdjExchRateBuffer."IC Partner Code";
                    AdjExchRateBuffer2.Insert;
                end else
                    AdjExchRateBuffer2.Modify;
            until AdjExchRateBuffer.Next = 0;

            // Post per posting group and per currency
            if AdjExchRateBuffer2.Find('-') then
                repeat
                begin
                    AdjExchRateBuffer.SetRange(AdjExchRateBuffer."Currency Code", AdjExchRateBuffer2."Currency Code");
                    AdjExchRateBuffer.SetRange(AdjExchRateBuffer."Dimension Entry No.", AdjExchRateBuffer2."Dimension Entry No.");
                    AdjExchRateBuffer.SetRange(AdjExchRateBuffer."Posting Date", AdjExchRateBuffer2."Posting Date");
                    AdjExchRateBuffer.SetRange(AdjExchRateBuffer."IC Partner Code", AdjExchRateBuffer2."IC Partner Code");
                    TempDimBuf.Reset;
                    TempDimBuf.DeleteAll;
                    TempDimSetEntry.Reset;
                    TempDimSetEntry.DeleteAll;
                    AdjExchRateBuffer.Find('-');
                    DimBufMgt.GetDimensions(AdjExchRateBuffer."Dimension Entry No.", TempDimBuf);
                    DimMgt.CopyDimBufToDimSetEntry(TempDimBuf, TempDimSetEntry);
                    repeat
                        TempDtldCVLedgEntryBuf.Init;
                        TempDtldCVLedgEntryBuf."Entry No." := AdjExchRateBuffer.Index;
                        if AdjExchRateBuffer.AdjAmount <> 0 then
                            case AdjustAccType of
                                1: // Customer
                                    begin
                                        CustPostingGr.Get(AdjExchRateBuffer."Posting Group");
                                        TempDtldCVLedgEntryBuf."Transaction No." :=
                                          PostAdjmt(
                                            CustPostingGr.GetReceivablesAccount, AdjExchRateBuffer.AdjAmount, AdjExchRateBuffer.AdjBase, AdjExchRateBuffer."Currency Code", TempDimSetEntry,
                                            AdjExchRateBuffer2."Posting Date", AdjExchRateBuffer."IC Partner Code");
                                        if TempDtldCVLedgEntryBuf.Insert then;
                                        InsertExchRateAdjmtReg(1, AdjExchRateBuffer."Posting Group", AdjExchRateBuffer."Currency Code");
                                        TotalCustomersAdjusted += 1;
                                    end;
                                2: // Vendor
                                    begin
                                        VendPostingGr.Get(AdjExchRateBuffer."Posting Group");
                                        TempDtldCVLedgEntryBuf."Transaction No." :=
                                          PostAdjmt(
                                            VendPostingGr.GetPayablesAccount, AdjExchRateBuffer.AdjAmount, AdjExchRateBuffer.AdjBase, AdjExchRateBuffer."Currency Code", TempDimSetEntry,
                                            AdjExchRateBuffer2."Posting Date", AdjExchRateBuffer."IC Partner Code");
                                        if TempDtldCVLedgEntryBuf.Insert then;
                                        InsertExchRateAdjmtReg(2, AdjExchRateBuffer."Posting Group", AdjExchRateBuffer."Currency Code");
                                        TotalVendorsAdjusted += 1;
                                    end;
                            end;
                    until AdjExchRateBuffer.Next = 0;
                end;

                begin
                    Currency2.Get(AdjExchRateBuffer2."Currency Code");
                    if AdjExchRateBuffer2.TotalGainsAmount <> 0 then
                        PostAdjmt(
                          Currency2.GetUnrealizedGainsAccount, -AdjExchRateBuffer2.TotalGainsAmount, AdjExchRateBuffer2.AdjBase, AdjExchRateBuffer2."Currency Code", TempDimSetEntry,
                          AdjExchRateBuffer2."Posting Date", AdjExchRateBuffer2."IC Partner Code");
                    if AdjExchRateBuffer2.TotalLossesAmount <> 0 then
                        PostAdjmt(
                          Currency2.GetUnrealizedLossesAccount, -AdjExchRateBuffer2.TotalLossesAmount, AdjExchRateBuffer2.AdjBase, AdjExchRateBuffer2."Currency Code", TempDimSetEntry,
                          AdjExchRateBuffer2."Posting Date", AdjExchRateBuffer2."IC Partner Code");
                end;
                until AdjExchRateBuffer2.Next = 0;

            GLEntry.FindLast;
            case AdjustAccType of
                1: // Customer
                    if TempDtldCustLedgEntry.Find('-') then
                        repeat
                            if TempDtldCVLedgEntryBuf.Get(TempDtldCustLedgEntry."Transaction No.") then
                                TempDtldCustLedgEntry."Transaction No." := TempDtldCVLedgEntryBuf."Transaction No."
                            else
                                TempDtldCustLedgEntry."Transaction No." := GLEntry."Transaction No.";
                            DtldCustLedgEntry := TempDtldCustLedgEntry;
                            DtldCustLedgEntry.Insert(true);
                        until TempDtldCustLedgEntry.Next = 0;
                2: // Vendor
                    if TempDtldVendLedgEntry.Find('-') then
                        repeat
                            if TempDtldCVLedgEntryBuf.Get(TempDtldVendLedgEntry."Transaction No.") then
                                TempDtldVendLedgEntry."Transaction No." := TempDtldCVLedgEntryBuf."Transaction No."
                            else
                                TempDtldVendLedgEntry."Transaction No." := GLEntry."Transaction No.";
                            DtldVendLedgEntry := TempDtldVendLedgEntry;
                            DtldVendLedgEntry.Insert(true);
                        until TempDtldVendLedgEntry.Next = 0;
            end;

            AdjExchRateBuffer.Reset;
            AdjExchRateBuffer.DeleteAll;
            AdjExchRateBuffer2.Reset;
            AdjExchRateBuffer2.DeleteAll;
            TempDtldCustLedgEntry.Reset;
            TempDtldCustLedgEntry.DeleteAll;
            TempDtldVendLedgEntry.Reset;
            TempDtldVendLedgEntry.DeleteAll;
        end;
    end;

    local procedure AdjustVATEntries(VATType: Integer; UseTax: Boolean)
    begin
        Clear(VATEntry2);
        begin
            VATEntry.SetRange(VATEntry.Type, VATType);
            VATEntry.SetRange(VATEntry."Use Tax", UseTax);
            if VATEntry.Find('-') then
                repeat
                    Accumulate(VATEntry2.Base, VATEntry.Base);
                    Accumulate(VATEntry2.Amount, VATEntry.Amount);
                    Accumulate(VATEntry2."Unrealized Amount", VATEntry."Unrealized Amount");
                    Accumulate(VATEntry2."Unrealized Base", VATEntry."Unrealized Base");
                    Accumulate(VATEntry2."Remaining Unrealized Amount", VATEntry."Remaining Unrealized Amount");
                    Accumulate(VATEntry2."Remaining Unrealized Base", VATEntry."Remaining Unrealized Base");
                    Accumulate(VATEntry2."Additional-Currency Amount", VATEntry."Additional-Currency Amount");
                    Accumulate(VATEntry2."Additional-Currency Base", VATEntry."Additional-Currency Base");
                    Accumulate(VATEntry2."Add.-Currency Unrealized Amt.", VATEntry."Add.-Currency Unrealized Amt.");
                    Accumulate(VATEntry2."Add.-Currency Unrealized Base", VATEntry."Add.-Currency Unrealized Base");
                    Accumulate(VATEntry2."Add.-Curr. Rem. Unreal. Amount", VATEntry."Add.-Curr. Rem. Unreal. Amount");
                    Accumulate(VATEntry2."Add.-Curr. Rem. Unreal. Base", VATEntry."Add.-Curr. Rem. Unreal. Base");

                    Accumulate(VATEntryTotalBase.Base, VATEntry.Base);
                    Accumulate(VATEntryTotalBase.Amount, VATEntry.Amount);
                    Accumulate(VATEntryTotalBase."Unrealized Amount", VATEntry."Unrealized Amount");
                    Accumulate(VATEntryTotalBase."Unrealized Base", VATEntry."Unrealized Base");
                    Accumulate(VATEntryTotalBase."Remaining Unrealized Amount", VATEntry."Remaining Unrealized Amount");
                    Accumulate(VATEntryTotalBase."Remaining Unrealized Base", VATEntry."Remaining Unrealized Base");
                    Accumulate(VATEntryTotalBase."Additional-Currency Amount", VATEntry."Additional-Currency Amount");
                    Accumulate(VATEntryTotalBase."Additional-Currency Base", VATEntry."Additional-Currency Base");
                    Accumulate(VATEntryTotalBase."Add.-Currency Unrealized Amt.", VATEntry."Add.-Currency Unrealized Amt.");
                    Accumulate(VATEntryTotalBase."Add.-Currency Unrealized Base", VATEntry."Add.-Currency Unrealized Base");
                    Accumulate(
                      VATEntryTotalBase."Add.-Curr. Rem. Unreal. Amount", VATEntry."Add.-Curr. Rem. Unreal. Amount");
                    Accumulate(VATEntryTotalBase."Add.-Curr. Rem. Unreal. Base", VATEntry."Add.-Curr. Rem. Unreal. Base");

                    AdjustVATAmount(VATEntry.Base, VATEntry."Additional-Currency Base");
                    AdjustVATAmount(VATEntry.Amount, VATEntry."Additional-Currency Amount");
                    AdjustVATAmount(VATEntry."Unrealized Amount", VATEntry."Add.-Currency Unrealized Amt.");
                    AdjustVATAmount(VATEntry."Unrealized Base", VATEntry."Add.-Currency Unrealized Base");
                    AdjustVATAmount(VATEntry."Remaining Unrealized Amount", VATEntry."Add.-Curr. Rem. Unreal. Amount");
                    AdjustVATAmount(VATEntry."Remaining Unrealized Base", VATEntry."Add.-Curr. Rem. Unreal. Base");
                    VATEntry.Modify;

                    Accumulate(VATEntry2.Base, -VATEntry.Base);
                    Accumulate(VATEntry2.Amount, -VATEntry.Amount);
                    Accumulate(VATEntry2."Unrealized Amount", -VATEntry."Unrealized Amount");
                    Accumulate(VATEntry2."Unrealized Base", -VATEntry."Unrealized Base");
                    Accumulate(VATEntry2."Remaining Unrealized Amount", -VATEntry."Remaining Unrealized Amount");
                    Accumulate(VATEntry2."Remaining Unrealized Base", -VATEntry."Remaining Unrealized Base");
                    Accumulate(VATEntry2."Additional-Currency Amount", -VATEntry."Additional-Currency Amount");
                    Accumulate(VATEntry2."Additional-Currency Base", -VATEntry."Additional-Currency Base");
                    Accumulate(VATEntry2."Add.-Currency Unrealized Amt.", -VATEntry."Add.-Currency Unrealized Amt.");
                    Accumulate(VATEntry2."Add.-Currency Unrealized Base", -VATEntry."Add.-Currency Unrealized Base");
                    Accumulate(VATEntry2."Add.-Curr. Rem. Unreal. Amount", -VATEntry."Add.-Curr. Rem. Unreal. Amount");
                    Accumulate(VATEntry2."Add.-Curr. Rem. Unreal. Base", -VATEntry."Add.-Curr. Rem. Unreal. Base");
                until VATEntry.Next = 0;
        end;
    end;

    local procedure AdjustVATAmount(var AmountLCY: Decimal; var AmountAddCurr: Decimal)
    begin
        case GLSetup."VAT Exchange Rate Adjustment" of
            GLSetup."vat exchange rate adjustment"::"Adjust Amount":
                AmountLCY :=
                  ROUND(
                    CurrExchRate2.ExchangeAmtFCYToLCYAdjmt(
                      PostingDate, GLSetup."Additional Reporting Currency",
                      AmountAddCurr, AddCurrCurrencyFactor));
            GLSetup."vat exchange rate adjustment"::"Adjust Additional-Currency Amount":
                AmountAddCurr :=
                  ROUND(
                    CurrExchRate2.ExchangeAmtLCYToFCY(
                      PostingDate, GLSetup."Additional Reporting Currency",
                      AmountLCY, AddCurrCurrencyFactor));
        end;
    end;

    local procedure AdjustVATAccount(AccNo: Code[20]; AmountLCY: Decimal; AmountAddCurr: Decimal; BaseLCY: Decimal; BaseAddCurr: Decimal)
    begin
        "G/L Account".Get(AccNo);
        "G/L Account".SetRange("Date Filter", StartDate, EndDate);
        case GLSetup."VAT Exchange Rate Adjustment" of
            GLSetup."vat exchange rate adjustment"::"Adjust Amount":
                PostGLAccAdjmt(
                  AccNo, GLSetup."vat exchange rate adjustment"::"Adjust Amount",
                  -AmountLCY, BaseLCY, BaseAddCurr);
            GLSetup."vat exchange rate adjustment"::"Adjust Additional-Currency Amount":
                PostGLAccAdjmt(
                  AccNo, GLSetup."vat exchange rate adjustment"::"Adjust Additional-Currency Amount",
                  -AmountAddCurr, BaseLCY, BaseAddCurr);
        end;
    end;

    local procedure AdjustPurchTax(UseTax: Boolean)
    begin
        if (VATEntry2.Amount <> 0) or (VATEntry2."Additional-Currency Amount" <> 0) then begin
            TaxJurisdiction.TestField("Tax Account (Purchases)");
            AdjustVATAccount(
              TaxJurisdiction."Tax Account (Purchases)",
              VATEntry2.Amount, VATEntry2."Additional-Currency Amount",
              VATEntryTotalBase.Amount, VATEntryTotalBase."Additional-Currency Amount");
            if UseTax then begin
                TaxJurisdiction.TestField("Reverse Charge (Purchases)");
                AdjustVATAccount(
                  TaxJurisdiction."Reverse Charge (Purchases)",
                  -VATEntry2.Amount, -VATEntry2."Additional-Currency Amount",
                  -VATEntryTotalBase.Amount, -VATEntryTotalBase."Additional-Currency Amount");
            end;
        end;
        if (VATEntry2."Remaining Unrealized Amount" <> 0) or
           (VATEntry2."Add.-Curr. Rem. Unreal. Amount" <> 0)
        then begin
            TaxJurisdiction.TestField("Unrealized VAT Type");
            TaxJurisdiction.TestField("Unreal. Tax Acc. (Purchases)");
            AdjustVATAccount(
              TaxJurisdiction."Unreal. Tax Acc. (Purchases)",
              VATEntry2."Remaining Unrealized Amount", VATEntry2."Add.-Curr. Rem. Unreal. Amount",
              VATEntryTotalBase."Remaining Unrealized Amount", VATEntry2."Add.-Curr. Rem. Unreal. Amount");

            if UseTax then begin
                TaxJurisdiction.TestField("Unreal. Rev. Charge (Purch.)");
                AdjustVATAccount(
                  TaxJurisdiction."Unreal. Rev. Charge (Purch.)",
                  -VATEntry2."Remaining Unrealized Amount",
                  -VATEntry2."Add.-Curr. Rem. Unreal. Amount",
                  -VATEntryTotalBase."Remaining Unrealized Amount",
                  -VATEntryTotalBase."Add.-Curr. Rem. Unreal. Amount");
            end;
        end;
    end;

    local procedure AdjustSalesTax()
    begin
        TaxJurisdiction.TestField("Tax Account (Sales)");
        AdjustVATAccount(
          TaxJurisdiction."Tax Account (Sales)",
          VATEntry2.Amount, VATEntry2."Additional-Currency Amount",
          VATEntryTotalBase.Amount, VATEntryTotalBase."Additional-Currency Amount");
        if (VATEntry2."Remaining Unrealized Amount" <> 0) or
           (VATEntry2."Add.-Curr. Rem. Unreal. Amount" <> 0)
        then begin
            TaxJurisdiction.TestField("Unrealized VAT Type");
            TaxJurisdiction.TestField("Unreal. Tax Acc. (Sales)");
            AdjustVATAccount(
              TaxJurisdiction."Unreal. Tax Acc. (Sales)",
              VATEntry2."Remaining Unrealized Amount",
              VATEntry2."Add.-Curr. Rem. Unreal. Amount",
              VATEntryTotalBase."Remaining Unrealized Amount",
              VATEntryTotalBase."Add.-Curr. Rem. Unreal. Amount");
        end;
    end;

    local procedure Accumulate(var TotalAmount: Decimal; AmountToAdd: Decimal)
    begin
        TotalAmount := TotalAmount + AmountToAdd;
    end;

    local procedure PostGLAccAdjmt(GLAccNo: Code[20]; ExchRateAdjmt: Integer; Amount: Decimal; NetChange: Decimal; AddCurrNetChange: Decimal)
    begin
        GenJnlLine.Init;
        case ExchRateAdjmt of
            "G/L Account"."exchange rate adjustment"::"Adjust Amount":
                begin
                    GenJnlLine."Additional-Currency Posting" := GenJnlLine."additional-currency posting"::"Amount Only";
                    GenJnlLine."Currency Code" := '';
                    GenJnlLine.Amount := Amount;
                    GenJnlLine."Amount (LCY)" := GenJnlLine.Amount;
                    GLAmtTotal := GLAmtTotal + GenJnlLine.Amount;
                    GLAddCurrNetChangeTotal := GLAddCurrNetChangeTotal + AddCurrNetChange;
                    GLNetChangeBase := GLNetChangeBase + NetChange;
                end;
            "G/L Account"."exchange rate adjustment"::"Adjust Additional-Currency Amount":
                begin
                    GenJnlLine."Additional-Currency Posting" := GenJnlLine."additional-currency posting"::"Additional-Currency Amount Only";
                    GenJnlLine."Currency Code" := GLSetup."Additional Reporting Currency";
                    GenJnlLine.Amount := Amount;
                    GenJnlLine."Amount (LCY)" := 0;
                    GLAddCurrAmtTotal := GLAddCurrAmtTotal + GenJnlLine.Amount;
                    GLNetChangeTotal := GLNetChangeTotal + NetChange;
                    GLAddCurrNetChangeBase := GLAddCurrNetChangeBase + AddCurrNetChange;
                end;
        end;
        if GenJnlLine.Amount <> 0 then begin
            GenJnlLine."Document No." := PostingDocNo;
            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
            GenJnlLine."Account No." := GLAccNo;
            GenJnlLine."Posting Date" := PostingDate;
            case GenJnlLine."Additional-Currency Posting" of
                GenJnlLine."additional-currency posting"::"Amount Only":
                    GenJnlLine.Description :=
                      StrSubstNo(
                        PostingDescription,
                        GLSetup."Additional Reporting Currency",
                        AddCurrNetChange);
                GenJnlLine."additional-currency posting"::"Additional-Currency Amount Only":
                    GenJnlLine.Description :=
                      StrSubstNo(
                        PostingDescription,
                        '',
                        NetChange);
            end;
            GenJnlLine."System-Created Entry" := true;
            GenJnlLine."Source Code" := SourceCodeSetup."Exchange Rate Adjmt.";
            GetJnlLineDefDim(GenJnlLine, TempDimSetEntry);
            PostGenJnlLine(GenJnlLine, TempDimSetEntry);
        end;
    end;

    local procedure CheckExchRateAdjustment(AccNo: Code[20]; SetupTableName: Text[100]; SetupFieldName: Text[100])
    var
        GLAcc: Record "G/L Account";
        GLSetup: Record "General Ledger Setup";
    begin
        if AccNo = '' then
            exit;
        GLAcc.Get(AccNo);
        if GLAcc."Exchange Rate Adjustment" <> GLAcc."exchange rate adjustment"::"No Adjustment" then begin
            GLAcc."Exchange Rate Adjustment" := GLAcc."exchange rate adjustment"::"No Adjustment";
            Error(
              Text017,
              GLAcc.FieldCaption("Exchange Rate Adjustment"), GLAcc.TableCaption,
              GLAcc."No.", GLAcc."Exchange Rate Adjustment",
              SetupTableName, GLSetup.FieldCaption("VAT Exchange Rate Adjustment"),
              GLSetup.TableCaption, SetupFieldName);
        end;
    end;

    local procedure HandleCustDebitCredit(Amount: Decimal; AmountLCY: Decimal; Correction: Boolean; AdjAmount: Decimal)
    begin
        if ((Amount > 0) or (AmountLCY > 0)) and (not Correction) or
           ((Amount < 0) or (AmountLCY < 0)) and Correction
        then begin
            TempDtldCustLedgEntry."Debit Amount (LCY)" := AdjAmount;
            TempDtldCustLedgEntry."Credit Amount (LCY)" := 0;
        end else begin
            TempDtldCustLedgEntry."Debit Amount (LCY)" := 0;
            TempDtldCustLedgEntry."Credit Amount (LCY)" := -AdjAmount;
        end;
    end;

    local procedure HandleVendDebitCredit(Amount: Decimal; AmountLCY: Decimal; Correction: Boolean; AdjAmount: Decimal)
    begin
        if ((Amount > 0) or (AmountLCY > 0)) and (not Correction) or
           ((Amount < 0) or (AmountLCY < 0)) and Correction
        then begin
            TempDtldVendLedgEntry."Debit Amount (LCY)" := AdjAmount;
            TempDtldVendLedgEntry."Credit Amount (LCY)" := 0;
        end else begin
            TempDtldVendLedgEntry."Debit Amount (LCY)" := 0;
            TempDtldVendLedgEntry."Credit Amount (LCY)" := -AdjAmount;
        end;
    end;

    local procedure GetJnlLineDefDim(var GenJnlLine: Record "Gen. Journal Line"; var DimSetEntry: Record "Dimension Set Entry")
    var
        DimSetID: Integer;
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        begin
            case GenJnlLine."Account Type" of
                GenJnlLine."account type"::"G/L Account":
                    TableID[1] := Database::"G/L Account";
                GenJnlLine."account type"::"Bank Account":
                    TableID[1] := Database::"Bank Account";
            end;
            No[1] := GenJnlLine."Account No.";
            // DimSetID :=
            //   DimMgt.GetDefaultDimID(
            //     TableID, No, GenJnlLine."Source Code", GenJnlLine."Shortcut Dimension 1 Code", GenJnlLine."Shortcut Dimension 2 Code", GenJnlLine."Dimension Set ID", 0);
        end;
        DimMgt.GetDimensionSet(DimSetEntry, DimSetID);
    end;

    local procedure CopyDimSetEntryToDimBuf(var DimSetEntry: Record "Dimension Set Entry"; var DimBuf: Record "Dimension Buffer")
    begin
        if DimSetEntry.Find('-') then
            repeat
                DimBuf."Table ID" := Database::"Dimension Buffer";
                DimBuf."Entry No." := 0;
                DimBuf."Dimension Code" := DimSetEntry."Dimension Code";
                DimBuf."Dimension Value Code" := DimSetEntry."Dimension Value Code";
                DimBuf.Insert;
            until DimSetEntry.Next = 0;
    end;

    local procedure GetDimCombID(var DimBuf: Record "Dimension Buffer"): Integer
    var
        DimEntryNo: Integer;
    begin
        DimEntryNo := DimBufMgt.FindDimensions(DimBuf);
        if DimEntryNo = 0 then
            DimEntryNo := DimBufMgt.InsertDimensions(DimBuf);
        exit(DimEntryNo);
    end;

    local procedure PostGenJnlLine(var GenJnlLine: Record "Gen. Journal Line"; var DimSetEntry: Record "Dimension Set Entry"): Integer
    begin
        GenJnlLine."Shortcut Dimension 1 Code" := GetGlobalDimVal(GLSetup."Global Dimension 1 Code", DimSetEntry);
        GenJnlLine."Shortcut Dimension 2 Code" := GetGlobalDimVal(GLSetup."Global Dimension 2 Code", DimSetEntry);
        GenJnlLine."Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);
        GenJnlPostLine.Run(GenJnlLine);
        exit(GenJnlPostLine.GetNextTransactionNo);
    end;

    local procedure GetGlobalDimVal(GlobalDimCode: Code[20]; var DimSetEntry: Record "Dimension Set Entry"): Code[20]
    var
        DimVal: Code[20];
    begin
        if GlobalDimCode = '' then
            DimVal := ''
        else begin
            DimSetEntry.SetRange("Dimension Code", GlobalDimCode);
            if DimSetEntry.Find('-') then
                DimVal := DimSetEntry."Dimension Value Code"
            else
                DimVal := '';
            DimSetEntry.SetRange("Dimension Code");
        end;
        exit(DimVal);
    end;

    procedure CheckPostingDate()
    begin
        if PostingDate < StartDate then
            Error(Text018);
        if PostingDate > EndDateReq then
            Error(Text018);
    end;

    procedure AdjustCustomerLedgerEntry(CusLedgerEntry: Record "Cust. Ledger Entry"; PostingDate2: Date)
    var
        DimSetEntry: Record "Dimension Set Entry";
        DimEntryNo: Integer;
        OldAdjAmount: Decimal;
        Adjust: Boolean;
        AdjExchRateBufIndex: Integer;
    begin
        begin
            CusLedgerEntry.SetRange(CusLedgerEntry."Date Filter", 0D, PostingDate2);
            Currency2.Get(CusLedgerEntry."Currency Code");
            GainsAmount := 0;
            LossesAmount := 0;
            OldAdjAmount := 0;
            Adjust := false;

            TempDimSetEntry.Reset;
            TempDimSetEntry.DeleteAll;
            TempDimBuf.Reset;
            TempDimBuf.DeleteAll;
            DimSetEntry.SetRange("Dimension Set ID", CusLedgerEntry."Dimension Set ID");
            CopyDimSetEntryToDimBuf(DimSetEntry, TempDimBuf);
            DimEntryNo := GetDimCombID(TempDimBuf);

            CusLedgerEntry.CalcFields(
              CusLedgerEntry.Amount, CusLedgerEntry."Amount (LCY)", CusLedgerEntry."Remaining Amount", CusLedgerEntry."Remaining Amt. (LCY)", CusLedgerEntry."Original Amt. (LCY)",
              CusLedgerEntry."Debit Amount", CusLedgerEntry."Credit Amount", CusLedgerEntry."Debit Amount (LCY)", CusLedgerEntry."Credit Amount (LCY)");

            // Calculate Old Unrealized Gains and Losses
            SetUnrealizedGainLossFilterCust(DtldCustLedgEntry, CusLedgerEntry."Entry No.");
            DtldCustLedgEntry.CalcSums("Amount (LCY)");

            SetUnrealizedGainLossFilterCust(TempDtldCustLedgEntrySums, CusLedgerEntry."Entry No.");
            TempDtldCustLedgEntrySums.CalcSums("Amount (LCY)");
            OldAdjAmount := DtldCustLedgEntry."Amount (LCY)" + TempDtldCustLedgEntrySums."Amount (LCY)";
            CusLedgerEntry."Remaining Amt. (LCY)" := CusLedgerEntry."Remaining Amt. (LCY)" + TempDtldCustLedgEntrySums."Amount (LCY)";
            CusLedgerEntry."Debit Amount (LCY)" := CusLedgerEntry."Debit Amount (LCY)" + TempDtldCustLedgEntrySums."Amount (LCY)";
            CusLedgerEntry."Credit Amount (LCY)" := CusLedgerEntry."Credit Amount (LCY)" + TempDtldCustLedgEntrySums."Amount (LCY)";
            TempDtldCustLedgEntrySums.Reset;

            // Modify Currency factor on Customer Ledger Entry
            if CusLedgerEntry."Adjusted Currency Factor" <> Currency2."Currency Factor" then begin
                CusLedgerEntry."Adjusted Currency Factor" := Currency2."Currency Factor";
                CusLedgerEntry.Modify;
            end;

            // Calculate New Unrealized Gains and Losses
            AdjAmount :=
              ROUND(
                CurrExchRate.ExchangeAmtFCYToLCYAdjmt(
                  PostingDate2, Currency2.Code, CusLedgerEntry."Remaining Amount", Currency2."Currency Factor")) -
              CusLedgerEntry."Remaining Amt. (LCY)";

            if AdjAmount <> 0 then begin
                InitDtldCustLedgEntry(CusLedgerEntry, TempDtldCustLedgEntry);
                TempDtldCustLedgEntry."Entry No." := NewEntryNo;
                TempDtldCustLedgEntry."Posting Date" := PostingDate2;
                TempDtldCustLedgEntry."Document No." := PostingDocNo;

                Correction :=
                  (CusLedgerEntry."Debit Amount" < 0) or
                  (CusLedgerEntry."Credit Amount" < 0) or
                  (CusLedgerEntry."Debit Amount (LCY)" < 0) or
                  (CusLedgerEntry."Credit Amount (LCY)" < 0);

                if OldAdjAmount > 0 then
                    case true of
                        (AdjAmount > 0):
                            begin
                                TempDtldCustLedgEntry."Amount (LCY)" := AdjAmount;
                                TempDtldCustLedgEntry."Entry Type" := TempDtldCustLedgEntry."entry type"::"Unrealized Gain";
                                HandleCustDebitCredit(
                                  CusLedgerEntry.Amount, CusLedgerEntry."Amount (LCY)", Correction, TempDtldCustLedgEntry."Amount (LCY)");
                                InsertTempDtldCustomerLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                GainsAmount := AdjAmount;
                                Adjust := true;
                            end;
                        (AdjAmount < 0):
                            if -AdjAmount <= OldAdjAmount then begin
                                TempDtldCustLedgEntry."Amount (LCY)" := AdjAmount;
                                TempDtldCustLedgEntry."Entry Type" := TempDtldCustLedgEntry."entry type"::"Unrealized Loss";
                                HandleCustDebitCredit(
                                  CusLedgerEntry.Amount, CusLedgerEntry."Amount (LCY)", Correction, TempDtldCustLedgEntry."Amount (LCY)");
                                InsertTempDtldCustomerLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                LossesAmount := AdjAmount;
                                Adjust := true;
                            end else begin
                                AdjAmount := AdjAmount + OldAdjAmount;
                                TempDtldCustLedgEntry."Amount (LCY)" := -OldAdjAmount;
                                TempDtldCustLedgEntry."Entry Type" := TempDtldCustLedgEntry."entry type"::"Unrealized Gain";
                                HandleCustDebitCredit(
                                  CusLedgerEntry.Amount, CusLedgerEntry."Amount (LCY)", Correction, TempDtldCustLedgEntry."Amount (LCY)");
                                InsertTempDtldCustomerLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                AdjExchRateBufIndex :=
                                  AdjExchRateBufferUpdate(
                                    CusLedgerEntry."Currency Code", Customer."Customer Posting Group",
                                    0, 0, -OldAdjAmount, -OldAdjAmount, 0, DimEntryNo, PostingDate2, Customer."IC Partner Code");
                                TempDtldCustLedgEntry."Transaction No." := AdjExchRateBufIndex;
                                ModifyTempDtldCustomerLedgerEntry;
                                Adjust := false;
                            end;
                    end;
                if OldAdjAmount < 0 then
                    case true of
                        (AdjAmount < 0):
                            begin
                                TempDtldCustLedgEntry."Amount (LCY)" := AdjAmount;
                                TempDtldCustLedgEntry."Entry Type" := TempDtldCustLedgEntry."entry type"::"Unrealized Loss";
                                HandleCustDebitCredit(
                                  CusLedgerEntry.Amount, CusLedgerEntry."Amount (LCY)", Correction, TempDtldCustLedgEntry."Amount (LCY)");
                                InsertTempDtldCustomerLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                LossesAmount := AdjAmount;
                                Adjust := true;
                            end;
                        (AdjAmount > 0):
                            if AdjAmount <= -OldAdjAmount then begin
                                TempDtldCustLedgEntry."Amount (LCY)" := AdjAmount;
                                TempDtldCustLedgEntry."Entry Type" := TempDtldCustLedgEntry."entry type"::"Unrealized Gain";
                                HandleCustDebitCredit(
                                  CusLedgerEntry.Amount, CusLedgerEntry."Amount (LCY)", Correction, TempDtldCustLedgEntry."Amount (LCY)");
                                InsertTempDtldCustomerLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                GainsAmount := AdjAmount;
                                Adjust := true;
                            end else begin
                                AdjAmount := OldAdjAmount + AdjAmount;
                                TempDtldCustLedgEntry."Amount (LCY)" := -OldAdjAmount;
                                TempDtldCustLedgEntry."Entry Type" := TempDtldCustLedgEntry."entry type"::"Unrealized Loss";
                                HandleCustDebitCredit(
                                  CusLedgerEntry.Amount, CusLedgerEntry."Amount (LCY)", Correction, TempDtldCustLedgEntry."Amount (LCY)");
                                InsertTempDtldCustomerLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                AdjExchRateBufIndex :=
                                  AdjExchRateBufferUpdate(
                                    CusLedgerEntry."Currency Code", Customer."Customer Posting Group",
                                    0, 0, -OldAdjAmount, 0, -OldAdjAmount, DimEntryNo, PostingDate2, Customer."IC Partner Code");
                                TempDtldCustLedgEntry."Transaction No." := AdjExchRateBufIndex;
                                ModifyTempDtldCustomerLedgerEntry;
                                Adjust := false;
                            end;
                    end;
                if not Adjust then begin
                    TempDtldCustLedgEntry."Amount (LCY)" := AdjAmount;
                    HandleCustDebitCredit(CusLedgerEntry.Amount, CusLedgerEntry."Amount (LCY)", Correction, TempDtldCustLedgEntry."Amount (LCY)");
                    TempDtldCustLedgEntry."Entry No." := NewEntryNo;
                    if AdjAmount < 0 then begin
                        TempDtldCustLedgEntry."Entry Type" := TempDtldCustLedgEntry."entry type"::"Unrealized Loss";
                        GainsAmount := 0;
                        LossesAmount := AdjAmount;
                    end else
                        if AdjAmount > 0 then begin
                            TempDtldCustLedgEntry."Entry Type" := TempDtldCustLedgEntry."entry type"::"Unrealized Gain";
                            GainsAmount := AdjAmount;
                            LossesAmount := 0;
                        end;
                    InsertTempDtldCustomerLedgerEntry;
                    NewEntryNo := NewEntryNo + 1;
                end;

                TotalAdjAmount := TotalAdjAmount + AdjAmount;
                Window.Update(4, TotalAdjAmount);
                AdjExchRateBufIndex :=
                  AdjExchRateBufferUpdate(
                    CusLedgerEntry."Currency Code", Customer."Customer Posting Group",
                    CusLedgerEntry."Remaining Amount", CusLedgerEntry."Remaining Amt. (LCY)", TempDtldCustLedgEntry."Amount (LCY)",
                    GainsAmount, LossesAmount, DimEntryNo, PostingDate2, Customer."IC Partner Code");
                TempDtldCustLedgEntry."Transaction No." := AdjExchRateBufIndex;
                ModifyTempDtldCustomerLedgerEntry;
            end;
        end;
    end;

    procedure AdjustVendorLedgerEntry(VendLedgerEntry: Record "Vendor Ledger Entry"; PostingDate2: Date)
    var
        DimSetEntry: Record "Dimension Set Entry";
        DimEntryNo: Integer;
        OldAdjAmount: Decimal;
        Adjust: Boolean;
        AdjExchRateBufIndex: Integer;
    begin
        begin
            VendLedgerEntry.SetRange(VendLedgerEntry."Date Filter", 0D, PostingDate2);
            Currency2.Get(VendLedgerEntry."Currency Code");
            GainsAmount := 0;
            LossesAmount := 0;
            OldAdjAmount := 0;
            Adjust := false;

            TempDimBuf.Reset;
            TempDimBuf.DeleteAll;
            DimSetEntry.SetRange("Dimension Set ID", VendLedgerEntry."Dimension Set ID");
            CopyDimSetEntryToDimBuf(DimSetEntry, TempDimBuf);
            DimEntryNo := GetDimCombID(TempDimBuf);

            VendLedgerEntry.CalcFields(
              VendLedgerEntry.Amount, VendLedgerEntry."Amount (LCY)", VendLedgerEntry."Remaining Amount", VendLedgerEntry."Remaining Amt. (LCY)", VendLedgerEntry."Original Amt. (LCY)",
              VendLedgerEntry."Debit Amount", VendLedgerEntry."Credit Amount", VendLedgerEntry."Debit Amount (LCY)", VendLedgerEntry."Credit Amount (LCY)");

            // Calculate Old Unrealized GainLoss
            SetUnrealizedGainLossFilterVend(DtldVendLedgEntry, VendLedgerEntry."Entry No.");
            DtldVendLedgEntry.CalcSums("Amount (LCY)");

            SetUnrealizedGainLossFilterVend(TempDtldVendLedgEntrySums, VendLedgerEntry."Entry No.");
            TempDtldVendLedgEntrySums.CalcSums("Amount (LCY)");
            OldAdjAmount := DtldVendLedgEntry."Amount (LCY)" + TempDtldVendLedgEntrySums."Amount (LCY)";
            VendLedgerEntry."Remaining Amt. (LCY)" := VendLedgerEntry."Remaining Amt. (LCY)" + TempDtldVendLedgEntrySums."Amount (LCY)";
            VendLedgerEntry."Debit Amount (LCY)" := VendLedgerEntry."Debit Amount (LCY)" + TempDtldVendLedgEntrySums."Amount (LCY)";
            VendLedgerEntry."Credit Amount (LCY)" := VendLedgerEntry."Credit Amount (LCY)" + TempDtldVendLedgEntrySums."Amount (LCY)";
            TempDtldVendLedgEntrySums.Reset;

            // Modify Currency factor on Vendor Ledger Entry
            if VendLedgerEntry."Adjusted Currency Factor" <> Currency2."Currency Factor" then begin
                VendLedgerEntry."Adjusted Currency Factor" := Currency2."Currency Factor";
                VendLedgerEntry.Modify;
            end;

            // Calculate New Unrealized Gains and Losses
            AdjAmount :=
              ROUND(
                CurrExchRate.ExchangeAmtFCYToLCYAdjmt(
                  PostingDate2, Currency2.Code, VendLedgerEntry."Remaining Amount", Currency2."Currency Factor")) -
              VendLedgerEntry."Remaining Amt. (LCY)";

            if AdjAmount <> 0 then begin
                InitDtldVendLedgEntry(VendLedgerEntry, TempDtldVendLedgEntry);
                TempDtldVendLedgEntry."Entry No." := NewEntryNo;
                TempDtldVendLedgEntry."Posting Date" := PostingDate2;
                TempDtldVendLedgEntry."Document No." := PostingDocNo;

                Correction :=
                  (VendLedgerEntry."Debit Amount" < 0) or
                  (VendLedgerEntry."Credit Amount" < 0) or
                  (VendLedgerEntry."Debit Amount (LCY)" < 0) or
                  (VendLedgerEntry."Credit Amount (LCY)" < 0);

                if OldAdjAmount > 0 then
                    case true of
                        (AdjAmount > 0):
                            begin
                                TempDtldVendLedgEntry."Amount (LCY)" := AdjAmount;
                                TempDtldVendLedgEntry."Entry Type" := TempDtldVendLedgEntry."entry type"::"Unrealized Gain";
                                HandleVendDebitCredit(VendLedgerEntry.Amount, VendLedgerEntry."Amount (LCY)", Correction, TempDtldVendLedgEntry."Amount (LCY)");
                                InsertTempDtldVendorLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                GainsAmount := AdjAmount;
                                Adjust := true;
                            end;
                        (AdjAmount < 0):
                            if -AdjAmount <= OldAdjAmount then begin
                                TempDtldVendLedgEntry."Amount (LCY)" := AdjAmount;
                                TempDtldVendLedgEntry."Entry Type" := TempDtldVendLedgEntry."entry type"::"Unrealized Loss";
                                HandleVendDebitCredit(
                                  VendLedgerEntry.Amount, VendLedgerEntry."Amount (LCY)", Correction, TempDtldVendLedgEntry."Amount (LCY)");
                                InsertTempDtldVendorLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                LossesAmount := AdjAmount;
                                Adjust := true;
                            end else begin
                                AdjAmount := AdjAmount + OldAdjAmount;
                                TempDtldVendLedgEntry."Amount (LCY)" := -OldAdjAmount;
                                TempDtldVendLedgEntry."Entry Type" := TempDtldVendLedgEntry."entry type"::"Unrealized Gain";
                                HandleVendDebitCredit(
                                  VendLedgerEntry.Amount, VendLedgerEntry."Amount (LCY)", Correction, TempDtldVendLedgEntry."Amount (LCY)");
                                InsertTempDtldVendorLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                AdjExchRateBufIndex :=
                                  AdjExchRateBufferUpdate(
                                    VendLedgerEntry."Currency Code", Vendor."Vendor Posting Group",
                                    0, 0, -OldAdjAmount, -OldAdjAmount, 0, DimEntryNo, PostingDate2, Vendor."IC Partner Code");
                                TempDtldVendLedgEntry."Transaction No." := AdjExchRateBufIndex;
                                ModifyTempDtldVendorLedgerEntry;
                                Adjust := false;
                            end;
                    end;
                if OldAdjAmount < 0 then
                    case true of
                        (AdjAmount < 0):
                            begin
                                TempDtldVendLedgEntry."Amount (LCY)" := AdjAmount;
                                TempDtldVendLedgEntry."Entry Type" := TempDtldVendLedgEntry."entry type"::"Unrealized Loss";
                                HandleVendDebitCredit(VendLedgerEntry.Amount, VendLedgerEntry."Amount (LCY)", Correction, TempDtldVendLedgEntry."Amount (LCY)");
                                InsertTempDtldVendorLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                LossesAmount := AdjAmount;
                                Adjust := true;
                            end;
                        (AdjAmount > 0):
                            if AdjAmount <= -OldAdjAmount then begin
                                TempDtldVendLedgEntry."Amount (LCY)" := AdjAmount;
                                TempDtldVendLedgEntry."Entry Type" := TempDtldVendLedgEntry."entry type"::"Unrealized Gain";
                                HandleVendDebitCredit(
                                  VendLedgerEntry.Amount, VendLedgerEntry."Amount (LCY)", Correction, TempDtldVendLedgEntry."Amount (LCY)");
                                InsertTempDtldVendorLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                GainsAmount := AdjAmount;
                                Adjust := true;
                            end else begin
                                AdjAmount := OldAdjAmount + AdjAmount;
                                TempDtldVendLedgEntry."Amount (LCY)" := -OldAdjAmount;
                                TempDtldVendLedgEntry."Entry Type" := TempDtldVendLedgEntry."entry type"::"Unrealized Loss";
                                HandleVendDebitCredit(
                                  VendLedgerEntry.Amount, VendLedgerEntry."Amount (LCY)", Correction, TempDtldVendLedgEntry."Amount (LCY)");
                                InsertTempDtldVendorLedgerEntry;
                                NewEntryNo := NewEntryNo + 1;
                                AdjExchRateBufIndex :=
                                  AdjExchRateBufferUpdate(
                                    VendLedgerEntry."Currency Code", Vendor."Vendor Posting Group",
                                    0, 0, -OldAdjAmount, 0, -OldAdjAmount, DimEntryNo, PostingDate2, Vendor."IC Partner Code");
                                TempDtldVendLedgEntry."Transaction No." := AdjExchRateBufIndex;
                                ModifyTempDtldVendorLedgerEntry;
                                Adjust := false;
                            end;
                    end;

                if not Adjust then begin
                    TempDtldVendLedgEntry."Amount (LCY)" := AdjAmount;
                    HandleVendDebitCredit(VendLedgerEntry.Amount, VendLedgerEntry."Amount (LCY)", Correction, TempDtldVendLedgEntry."Amount (LCY)");
                    TempDtldVendLedgEntry."Entry No." := NewEntryNo;
                    if AdjAmount < 0 then begin
                        TempDtldVendLedgEntry."Entry Type" := TempDtldVendLedgEntry."entry type"::"Unrealized Loss";
                        GainsAmount := 0;
                        LossesAmount := AdjAmount;
                    end else
                        if AdjAmount > 0 then begin
                            TempDtldVendLedgEntry."Entry Type" := TempDtldVendLedgEntry."entry type"::"Unrealized Gain";
                            GainsAmount := AdjAmount;
                            LossesAmount := 0;
                        end;
                    InsertTempDtldVendorLedgerEntry;
                    NewEntryNo := NewEntryNo + 1;
                end;

                TotalAdjAmount := TotalAdjAmount + AdjAmount;
                Window.Update(4, TotalAdjAmount);
                AdjExchRateBufIndex :=
                  AdjExchRateBufferUpdate(
                    VendLedgerEntry."Currency Code", Vendor."Vendor Posting Group",
                    VendLedgerEntry."Remaining Amount", VendLedgerEntry."Remaining Amt. (LCY)",
                    TempDtldVendLedgEntry."Amount (LCY)", GainsAmount, LossesAmount, DimEntryNo, PostingDate2, Vendor."IC Partner Code");
                TempDtldVendLedgEntry."Transaction No." := AdjExchRateBufIndex;
                ModifyTempDtldVendorLedgerEntry;
            end;
        end;
    end;

    local procedure InitDtldCustLedgEntry(CustLedgEntry: Record "Cust. Ledger Entry"; var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry")
    begin
        begin
            DtldCustLedgEntry.Init;
            DtldCustLedgEntry."Cust. Ledger Entry No." := CustLedgEntry."Entry No.";
            DtldCustLedgEntry.Amount := 0;
            DtldCustLedgEntry."Customer No." := CustLedgEntry."Customer No.";
            DtldCustLedgEntry."Currency Code" := CustLedgEntry."Currency Code";
            DtldCustLedgEntry."User ID" := UserId;
            DtldCustLedgEntry."Source Code" := SourceCodeSetup."Exchange Rate Adjmt.";
            DtldCustLedgEntry."Journal Batch Name" := CustLedgEntry."Journal Batch Name";
            DtldCustLedgEntry."Reason Code" := CustLedgEntry."Reason Code";
            DtldCustLedgEntry."Initial Entry Due Date" := CustLedgEntry."Due Date";
            DtldCustLedgEntry."Initial Entry Global Dim. 1" := CustLedgEntry."Global Dimension 1 Code";
            DtldCustLedgEntry."Initial Entry Global Dim. 2" := CustLedgEntry."Global Dimension 2 Code";
            DtldCustLedgEntry."Initial Document Type" := CustLedgEntry."Document Type";
        end;

        OnAfterInitDtldCustLedgerEntry(DtldCustLedgEntry);
    end;

    local procedure InitDtldVendLedgEntry(VendLedgEntry: Record "Vendor Ledger Entry"; var DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry")
    begin
        begin
            DtldVendLedgEntry.Init;
            DtldVendLedgEntry."Vendor Ledger Entry No." := VendLedgEntry."Entry No.";
            DtldVendLedgEntry.Amount := 0;
            DtldVendLedgEntry."Vendor No." := VendLedgEntry."Vendor No.";
            DtldVendLedgEntry."Currency Code" := VendLedgEntry."Currency Code";
            DtldVendLedgEntry."User ID" := UserId;
            DtldVendLedgEntry."Source Code" := SourceCodeSetup."Exchange Rate Adjmt.";
            DtldVendLedgEntry."Journal Batch Name" := VendLedgEntry."Journal Batch Name";
            DtldVendLedgEntry."Reason Code" := VendLedgEntry."Reason Code";
            DtldVendLedgEntry."Initial Entry Due Date" := VendLedgEntry."Due Date";
            DtldVendLedgEntry."Initial Entry Global Dim. 1" := VendLedgEntry."Global Dimension 1 Code";
            DtldVendLedgEntry."Initial Entry Global Dim. 2" := VendLedgEntry."Global Dimension 2 Code";
            DtldVendLedgEntry."Initial Document Type" := VendLedgEntry."Document Type";
        end;

        OnAfterInitDtldVendLedgerEntry(DtldVendLedgEntry);
    end;

    local procedure SetUnrealizedGainLossFilterCust(var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry"; EntryNo: Integer)
    begin
        begin
            DtldCustLedgEntry.Reset;
            DtldCustLedgEntry.SetCurrentkey(DtldCustLedgEntry."Cust. Ledger Entry No.", DtldCustLedgEntry."Entry Type");
            DtldCustLedgEntry.SetRange(DtldCustLedgEntry."Cust. Ledger Entry No.", EntryNo);
            DtldCustLedgEntry.SetRange(DtldCustLedgEntry."Entry Type", DtldCustLedgEntry."entry type"::"Unrealized Loss", DtldCustLedgEntry."entry type"::"Unrealized Gain");
        end;
    end;

    local procedure SetUnrealizedGainLossFilterVend(var DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry"; EntryNo: Integer)
    begin
        begin
            DtldVendLedgEntry.Reset;
            DtldVendLedgEntry.SetCurrentkey(DtldVendLedgEntry."Vendor Ledger Entry No.", DtldVendLedgEntry."Entry Type");
            DtldVendLedgEntry.SetRange(DtldVendLedgEntry."Vendor Ledger Entry No.", EntryNo);
            DtldVendLedgEntry.SetRange(DtldVendLedgEntry."Entry Type", DtldVendLedgEntry."entry type"::"Unrealized Loss", DtldVendLedgEntry."entry type"::"Unrealized Gain");
        end;
    end;

    local procedure InsertTempDtldCustomerLedgerEntry()
    begin
        TempDtldCustLedgEntry.Insert;
        TempDtldCustLedgEntrySums := TempDtldCustLedgEntry;
        TempDtldCustLedgEntrySums.Insert;
    end;

    local procedure InsertTempDtldVendorLedgerEntry()
    begin
        TempDtldVendLedgEntry.Insert;
        TempDtldVendLedgEntrySums := TempDtldVendLedgEntry;
        TempDtldVendLedgEntrySums.Insert;
    end;

    local procedure ModifyTempDtldCustomerLedgerEntry()
    begin
        TempDtldCustLedgEntry.Modify;
        TempDtldCustLedgEntrySums := TempDtldCustLedgEntry;
        TempDtldCustLedgEntrySums.Modify;
    end;

    local procedure ModifyTempDtldVendorLedgerEntry()
    begin
        TempDtldVendLedgEntry.Modify;
        TempDtldVendLedgEntrySums := TempDtldVendLedgEntry;
        TempDtldVendLedgEntrySums.Modify;
    end;

    [IntegrationEvent(true, true)]
    local procedure OnBeforeOnInitReport(var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInitDtldCustLedgerEntry(var DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInitDtldVendLedgerEntry(var DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry")
    begin
    end;
}
