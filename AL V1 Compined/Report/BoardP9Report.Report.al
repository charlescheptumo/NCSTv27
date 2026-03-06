#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69021 "BoardP9 Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/BoardP9 Report.rdlc';
    PreviewMode = PrintLayout;
    ApplicationArea = All;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            RequestFilterFields = "No.";
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
                    Board.SetRange("No.", Vendor."No.");
                    if Board.FindSet then begin
                        if Board."Pays tax" then
                            Board.SetFilter("Pay Period Filter", '%1..%2', StringDate, EndDate);
                        Board.CalcFields("Taxable Income", "Total Allowances", Board."Cumm. PAYE");
                        Board.CalcFields("Total Allowances", "Total Deductions");
                        TaxableAmount := Board."Total Allowances";

                    end;



                    AssMatrix.Reset;
                    //CC// AssMatrix.SetRange(AssMatrix.Type, AssMatrix.Type::"1");
                    //CC// AssMatrix.SetRange(AssMatrix."Director No", Board."No.");
                    AssMatrix.SetRange(AssMatrix."Payroll Period", "Directorsl PeriodX"."Starting Date");

                    if AssMatrix.Find('-') then begin
                        repeat
                            RetirementVar := RetirementVar + Abs(AssMatrix.Amount);
                        until AssMatrix.Next = 0;
                    end;



                    /*****Calculate the totals*******************************/
                    TotBasic := TotBasic + Board."Total Allowances";
                    TotTaxable := TotTaxable + TaxableAmount;
                    TotTax := TotTax + IncomeTax;
                    TotRelief := TotRelief + Relief;
                    Board.CalcFields("Cumm. PAYE");
                    TotPAYE := Board."Cumm. PAYE";
                    TaxablePound := ROUND(TaxablePound, 1, '<');
                    TotPound := TotPound + TaxablePound;

                    NoOfMonths := NoOfMonths + 1;
                    TotRet := TotRet + Abs(DefinedContrMin) + Abs(OccupierVar);

                end;

                trigger OnPreDataItem()
                begin

                    "Directorsl PeriodX".SetRange("Directorsl PeriodX"."Starting Date", StringDate, EndDate);
                    CurrReport.CreateTotals(Board."Total Allowances", BenefitsVar, QuartersVar, "30PerPension", PensionLimit, RetirementVar, OccupierVar);
                    CurrReport.CreateTotals(TaxableAmount, Board."Cumm. PAYE", InsuranceRelief, Relief);
                end;
            }
            dataitem("Directors Earnings"; "Directors Earnings")
            {
                DataItemLink = "Director Filter" = field("No.");
                DataItemTableView = sorting(Code);
                column(ReportForNavId_1000000002; 1000000002)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    EarningsX.CalcFields(EarningsX."Total Amount", EarningsX.Counter, EarningsX."No of Entries");
                    EmployeeBenefits := EmployeeBenefits + EarningsX."Total Amount";

                    if EarningsX.Counter <> 0 then
                        Numb := EarningsX."No of Entries" / EarningsX.Counter;
                end;

                trigger OnPostDataItem()
                begin
                    EmployeeBenefits := 0;
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

                Company.Get;
                CoPin := Company."Giro No.";

                TheYear := Date2dmy(EndDate, 3);
            end;

            trigger OnPreDataItem()
            begin

                CompanyInfo.CalcFields(CompanyInfo.RubberStamp);

                if (StringDate = 0D) or (EndDate = 0D) then
                    Error('Please specify the correct period on the option of the request form');
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
        Earn: Record EarningsX;
        AssMatrix: Record "Assignment Matrix-X";
        InsuranceRelief: Decimal;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[50];
        CUser: Code[50];
        CompanyInfo: Record "Company Information";
        TheYear: Integer;
        Board: Record Vendor;
        EarningsX: Record "Directors Earnings";


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
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
}
