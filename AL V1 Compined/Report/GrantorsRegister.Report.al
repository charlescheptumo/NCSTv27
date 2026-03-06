#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65001 "Grantors Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Grantors Register.rdlc';
    ApplicationArea = Basic, Suite;
    Caption = 'Grantors Register';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("G/L Register"; "G/L Register")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(ReportForNavId_9922; 9922)
            {
            }
            column(COMPANYNAME; CompanyProperty.DisplayName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(G_L_Register__TABLECAPTION__________GLRegFilter; "G/L Register".TableCaption + ': ' + GLRegFilter)
            {
            }
            column(GLRegFilter; GLRegFilter)
            {
            }
            column(G_L_Register__No__; "G/L Register"."No.")
            {
            }
            column(CustDebitAmountLCY; CustDebitAmountLCY)
            {
                AutoFormatType = 1;
            }
            column(CustCreditAmountLCY; CustCreditAmountLCY)
            {
                AutoFormatType = 1;
            }
            column(CustAmountLCY; CustAmountLCY)
            {
                AutoFormatType = 1;
            }
            column(Customer_RegisterCaption; Customer_RegisterCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Posting_Date_Caption; Cust__Ledger_Entry__Posting_Date_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Document_Type_Caption; Cust__Ledger_Entry__Document_Type_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Document_No__Caption; "Cust. Ledger Entry".FieldCaption("Document No."))
            {
            }
            column(Cust__Ledger_Entry_DescriptionCaption; "Cust. Ledger Entry".FieldCaption(Description))
            {
            }
            column(Cust__Ledger_Entry__Customer_No__Caption; "Cust. Ledger Entry".FieldCaption("Customer No."))
            {
            }
            column(Cust_NameCaption; Cust_NameCaptionLbl)
            {
            }
            column(CustAmountCaption; CustAmountCaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Applies_to_Doc__No__Caption; Cust__Ledger_Entry__Applies_to_Doc__No__CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Due_Date_Caption; Cust__Ledger_Entry__Due_Date_CaptionLbl)
            {
            }
            column(Cust__Ledger_Entry__Entry_No__Caption; "Cust. Ledger Entry".FieldCaption("Entry No."))
            {
            }
            column(G_L_Register__No__Caption; G_L_Register__No__CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(CustDebitAmountLCYCaption; CustDebitAmountLCYCaptionLbl)
            {
            }
            column(CustCreditAmountLCYCaption; CustCreditAmountLCYCaptionLbl)
            {
            }
            column(CustAmountLCYCaption; CustAmountLCYCaptionLbl)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemTableView = sorting("Entry No.");
                column(ReportForNavId_8503; 8503)
                {
                }
                column(Cust__Ledger_Entry__Posting_Date_; Format("Cust. Ledger Entry"."Posting Date"))
                {
                }
                column(Cust__Ledger_Entry__Document_Type_; "Cust. Ledger Entry"."Document Type")
                {
                }
                column(Cust__Ledger_Entry__Document_No__; "Cust. Ledger Entry"."Document No.")
                {
                }
                column(Cust__Ledger_Entry_Description; "Cust. Ledger Entry".Description)
                {
                }
                column(Cust__Ledger_Entry__Customer_No__; "Cust. Ledger Entry"."Customer No.")
                {
                }
                column(Cust_Name; Cust.Name)
                {
                }
                column(CustAmount; CustAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Cust__Ledger_Entry__Currency_Code_; "Cust. Ledger Entry"."Currency Code")
                {
                }
                column(Cust__Ledger_Entry__Applies_to_Doc__No__; "Cust. Ledger Entry"."Applies-to Doc. No.")
                {
                }
                column(Cust__Ledger_Entry__Due_Date_; Format("Cust. Ledger Entry"."Due Date"))
                {
                }
                column(Cust__Ledger_Entry__Entry_No__; "Cust. Ledger Entry"."Entry No.")
                {
                }
                column(CustDebitAmountLCY_Control65; CustDebitAmountLCY)
                {
                    AutoFormatType = 1;
                }
                column(CustCreditAmountLCY_Control68; CustCreditAmountLCY)
                {
                    AutoFormatType = 1;
                }
                column(CustAmountLCY_Control71; CustAmountLCY)
                {
                    AutoFormatType = 1;
                }
                column(CustDebitAmountLCY_Control65Caption; CustDebitAmountLCY_Control65CaptionLbl)
                {
                }
                column(CustCreditAmountLCY_Control68Caption; CustCreditAmountLCY_Control68CaptionLbl)
                {
                }
                column(CustAmountLCY_Control71Caption; CustAmountLCY_Control71CaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if not Cust.Get("Cust. Ledger Entry"."Customer No.") then
                        Cust.Init;

                    DtldCustLedgEntry.SetRange("Cust. Ledger Entry No.", "Cust. Ledger Entry"."Entry No.");
                    DtldCustLedgEntry.CalcSums(Amount, "Amount (LCY)", "Debit Amount (LCY)", "Credit Amount (LCY)");

                    if PrintAmountsInLCY then begin
                        CustAmount := DtldCustLedgEntry."Amount (LCY)";
                        "Cust. Ledger Entry"."Currency Code" := '';
                    end else
                        CustAmount := DtldCustLedgEntry.Amount;

                    CustAmountLCY := DtldCustLedgEntry."Amount (LCY)";
                    CustDebitAmountLCY := DtldCustLedgEntry."Debit Amount (LCY)";
                    CustCreditAmountLCY := DtldCustLedgEntry."Credit Amount (LCY)";

                    if ("Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."document type"::Payment) or ("Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."document type"::Refund) then
                        "Cust. Ledger Entry"."Due Date" := 0D;
                end;

                trigger OnPreDataItem()
                begin
                    "Cust. Ledger Entry".SetRange("Cust. Ledger Entry"."Entry No.", "G/L Register"."From Entry No.", "G/L Register"."To Entry No.");
                end;
            }
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
                    field(ShowAmountsInLCY; PrintAmountsInLCY)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Amounts in LCY';
                        ToolTip = 'Specifies if the reported amounts are shown in the local currency.';
                    }
                }
            }
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
        GLRegFilter := "G/L Register".GetFilters;
        DtldCustLedgEntry.SetCurrentkey("Cust. Ledger Entry No.", "Entry Type");
        DtldCustLedgEntry.SetRange("Entry Type", DtldCustLedgEntry."entry type"::"Initial Entry");
    end;

    var
        Cust: Record Customer;
        DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        GLRegFilter: Text;
        CustAmount: Decimal;
        CustAmountLCY: Decimal;
        CustDebitAmountLCY: Decimal;
        CustCreditAmountLCY: Decimal;
        PrintAmountsInLCY: Boolean;
        Customer_RegisterCaptionLbl: label 'Customer Register';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        All_amounts_are_in_LCYCaptionLbl: label 'All amounts are in LCY';
        Cust__Ledger_Entry__Posting_Date_CaptionLbl: label 'Posting Date';
        Cust__Ledger_Entry__Document_Type_CaptionLbl: label 'Document Type';
        Cust_NameCaptionLbl: label 'Name';
        CustAmountCaptionLbl: label 'Original Amount';
        Cust__Ledger_Entry__Applies_to_Doc__No__CaptionLbl: label 'Applies-to Doc. No.';
        Cust__Ledger_Entry__Due_Date_CaptionLbl: label 'Due Date';
        G_L_Register__No__CaptionLbl: label 'Register No.';
        TotalCaptionLbl: label 'Total';
        CustDebitAmountLCYCaptionLbl: label 'Debit (LCY)';
        CustCreditAmountLCYCaptionLbl: label 'Credit (LCY)';
        CustAmountLCYCaptionLbl: label 'Total (LCY)';
        CustDebitAmountLCY_Control65CaptionLbl: label 'Debit (LCY)';
        CustCreditAmountLCY_Control68CaptionLbl: label 'Credit (LCY)';
        CustAmountLCY_Control71CaptionLbl: label 'Total (LCY)';


    procedure InitializeRequest(ShowAmountInLCY: Boolean)
    begin
        PrintAmountsInLCY := ShowAmountInLCY;
    end;
}
