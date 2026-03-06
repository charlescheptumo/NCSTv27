#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69039 "DIR P9 Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/DIR P9 Report1.rdlc';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            RequestFilterFields = "No.", "Vendor Type";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee; Vendor."No.")
            {
            }
            column(FirstName_Employee; Vendor.Name)
            {
            }
            column(MiddleName_Employee; Vendor.Name)
            {
            }
            column(LastName_Employee; Vendor.Name)
            {
            }
            column(CompanyPIN; CoPin)
            {
            }
            column(CompanyName; Company.Name)
            {
            }
            column(EmpPIN; Vendor."PIN Number")
            {
            }
            column(TheYear; TheYear)
            {
            }
            column(RubberStamp; CompanyInfo.RubberStamp)
            {
            }
            dataitem("Directorsl PeriodX"; "Directorsl PeriodX")
            {
                DataItemTableView = sorting("Starting Date") order(ascending);
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(Name_PayrollPeriodX; "Directorsl PeriodX".Name)
                {
                }
                column(TotalAllowances; Vendor."Total Allowances")
                {
                }
                column(BenefitsVar; BenefitsVar)
                {
                }
                column(QuartersVar; QuartersVar)
                {
                }
                column(ThirtyPerPension; "30PerPension")
                {
                }
                column(RetirementVar; RetirementVar)
                {
                }
                column(PensionLimit; PensionLimit)
                {
                }
                column(OccupierVar; Abs(OccupierVar))
                {
                }
                column(TaxableAmount; TaxableAmount)
                {
                }
                column(DefinedContrMin; (Abs(DefinedContrMin)))
                {
                }
                column(PAYE; Abs(Vendor."Cumm. PAYE"))
                {
                }
                column(Relief; Relief)
                {
                }
                column(InsuranceRelief; InsuranceRelief)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    TaxableAmount := 0;
                    "30PerPension" := 0;
                    PensionLimit := 0;
                    RetirementVar := 0;
                    OccupierVar := 0;
                    TaxableAmount := 0;
                    InsuranceRelief := 0;
                    Relief := 0;

                    if Vendor."Pays tax" then begin
                        Vendor.SetRange("Pay Period Filter", "Directorsl PeriodX"."Starting Date");
                        Vendor.CalcFields("Taxable Income", "Total Allowances", Vendor."Cumm. PAYE", "Total Deductions", "Director Taxable Income");
                    end;

                    //"30PerPension":=30/100* Vendor."Director Taxable Income";
                    // PensionLimit:=20000;
                    TaxableAmount := Vendor."Director Taxable Income";






                    /*****Calculate the totals*******************************/
                    TotBasic := TotBasic + Vendor."Total Allowances";
                    //TotNonQuarter:=TotQuarter+Vendor."Total Allowances";
                    //TotQuarter:=TotQuarter+QuartersVar;
                    // TotGross:=TotGross+Vendor."Cumm. Basic Pay"+Vendor."Taxable Allowance"+QuartersVar+BenefitsVar;
                    TotPercentage := TotPercentage + ((30 / 100) * (Vendor."Director Taxable Income" + Vendor."Total Allowances" +
                   QuartersVar
                      + BenefitsVar));
                    TotActual := TotActual + RetirementVar;
                    TotFixed := TotFixed + PensionLimit;
                    TotTaxable := TotTaxable + TaxableAmount;
                    TotTax := TotTax + IncomeTax;
                    TotRelief := TotRelief + Relief;
                    TotPAYE := TotPAYE + PAYE;
                    grandPAYE := grandPAYE + PAYE;
                    TotOcc := TotOcc + Abs(OccupierVar);
                    //TotRet:=TotRet+ABS(DefinedContrMin)+ABS(OccupierVar);
                    TaxablePound := TaxableAmount / 20;
                    TaxablePound := ROUND(TaxablePound, 1, '<');
                    TotPound := TotPound + TaxablePound;
                    TotalBenefits := TotalBenefits + BenefitsVar;
                    DefinedContrMin := RetirementVar;
                    //Ushindi.....If minimum exceeds 20k, then lowest should be 20k
                    if DefinedContrMin > PensionLimit
                     then
                        DefinedContrMin := PensionLimit;


                    NoOfMonths := NoOfMonths + 1;
                    TotRet := TotRet + Abs(DefinedContrMin) + Abs(OccupierVar);

                end;

                trigger OnPreDataItem()
                begin

                    "Directorsl PeriodX".SetRange("Directorsl PeriodX"."Starting Date", StringDate, EndDate);
                    // CurrReport.CreateTotals(Vendor."Total Allowances", BenefitsVar, QuartersVar, "30PerPension", PensionLimit, RetirementVar, OccupierVar)
                    ;
                    // CurrReport.CreateTotals(TaxableAmount, Vendor."Cumm. PAYE", InsuranceRelief, Relief);
                end;
            }
            dataitem("Directors Earnings"; "Directors Earnings")
            {
                DataItemLink = Code = field("No.");
                DataItemTableView = sorting(Code);
                column(ReportForNavId_1000000002; 1000000002)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    "Directors Earnings".CalcFields("Directors Earnings"."Total Amount");
                    EmployeeBenefits := EmployeeBenefits + "Directors Earnings"."Total Amount";
                end;

                trigger OnPostDataItem()
                begin
                    EmployeeBenefits := 0;
                end;

                trigger OnPreDataItem()
                begin

                    "Directors Earnings".SetRange("Directors Earnings"."Non-Cash Benefit", true);
                    "Directors Earnings".SetRange("Directors Earnings".Taxable, true);
                    "Directors Earnings".SetRange("Pay Period Filter", StringDate, EndDate);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                TotBasic := 0;
                TotNonQuarter := 0;
                TotQuarter := 0;
                TotGross := 0;
                TotPercentage := 0;
                TotActual := 0;
                TotFixed := 0;
                TotTaxable := 0;
                TotTax := 0;
                TotRelief := 0;
                TotPAYE := 0;
                NoOfMonths := 0;
                TotalBenefits := 0;
                TotOcc := 0;
                TotRet := 0;
                TotPound := 0;
                grandPAYE := 0;
                //"Total Quarters":=0;
                Company.Get;


                if StringDate = 0D then
                    StringDate := Vendor.GetRangemax("Date Filter");
                if EndDate = 0D then
                    EndDate := Vendor.GetRangeMin("Date Filter");

                TheYear := Date2dmy(EndDate, 3);
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get;
                CompanyInfo.CalcFields(CompanyInfo.RubberStamp);
                CoPin := CompanyInfo."VAT Registration No.";


                /* IF (StringDate=0D) OR (EndDate=0D) THEN
               ERROR('Please specify the correct period on the option of the request form');
               */

                CUser := UserId;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StringDate; StringDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Start Date';
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'End Date';
                        // OptionCaption = 'Due Date,Posting Date,Document Date';
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

    var
        TaxableAmount: Decimal;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        TotBasic: Decimal;
        TotNonQuarter: Decimal;
        TotQuarter: Decimal;
        TotGross: Decimal;
        TotPercentage: Decimal;
        TotActual: Decimal;
        TotFixed: Decimal;
        TotTaxable: Decimal;
        TotTax: Decimal;
        TotRelief: Decimal;
        TotPAYE: Decimal;
        TaxablePound: Decimal;
        TotPound: Decimal;
        TotalBenefits: Decimal;
        EmployeeBenefits: Decimal;
        NoOfMonths: Integer;
        NoOfUnits: Integer;
        Numb: Decimal;
        DefinedContrMin: Decimal;
        HRSetup: Record "Human Resources Setup";
        ExcessRetirement: Decimal;
        HseLimit: Decimal;
        BenefitsVar: Decimal;
        QuartersVar: Decimal;
        OccupierVar: Decimal;
        RetirementVar: Decimal;
        PensionLimit: Decimal;
        Relief: Decimal;
        PAYE: Decimal;
        StringDate: Date;
        EndDate: Date;
        TotOcc: Decimal;
        TotRet: Decimal;
        Company: Record "Company Information";
        CoPin: Text[30];
        grandPAYE: Decimal;
        TaxCode: Code[10];
        retirecontribution: Decimal;
        CompRec: Record "Human Resources Setup";
        "30PerPension": Decimal;
        Earn: Record "Directors Earnings";
        AssMatrix: Record "Director Ledger Entry";
        InsuranceRelief: Decimal;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[50];
        CUser: Code[50];
        CompanyInfo: Record "Company Information";
        TheYear: Integer;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := ROUND(AmountRemaining, 0.01);
        EndTax := false;

        TaxTable.SetRange("Table Code", TaxCode);

        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if ROUND((TaxableAmount), 0.01) > TaxTable."Upper Limit" then
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
}
