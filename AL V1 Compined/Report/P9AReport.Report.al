#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69019 "P9A Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/P9A Report.rdlc';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Posting Group", "Job No", "Date Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(FirstName_Employee; Employee."First Name")
            {
            }
            column(MiddleName_Employee; Employee."Middle Name")
            {
            }
            column(LastName_Employee; Employee."Last Name")
            {
            }
            column(CompanyPIN; CoPin)
            {
            }
            column(CompanyName; Company.Name)
            {
            }
            column(EmpPIN; Employee."P.I.N")
            {
            }
            column(TheYear; TheYear)
            {
            }
            column(RubberStamp; CompanyInfo.RubberStamp)
            {
            }
            dataitem("Payroll PeriodX"; "Payroll PeriodX")
            {
                DataItemTableView = sorting("Starting Date") order(ascending);
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(Name_PayrollPeriodX; "Payroll PeriodX".Name)
                {
                }
                column(TotalAllowances; Employee."Total Allowances" + DirectorGross)
                {
                }
                column(BenefitsVar; Abs(BenefitsVar))
                {
                }
                column(QuartersVar; QuartersVar)
                {
                }
                column(ThirtyPerPension; "30PerPension")
                {
                }
                column(RetirementVar; Abs(RetirementVar))
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
                column(PAYE; Abs(Employee."Cumm. PAYE") + Abs(DirectorPaye))
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
                    RetiremntConEmployer := 0;
                    Relief := 0;



                    if Employee."Pays tax?" then begin
                        Employee.SetRange("Pay Period Filter", "Payroll PeriodX"."Starting Date");
                        Employee.CalcFields("Taxable Allowance", "Tax Deductible Amount", "Total Allowances", Employee."Cumm. PAYE");
                        Employee.CalcFields(Employee."Taxable Allowance", "Tax Deductible Amount", Employee."Taxable Income");
                        Employee.CalcFields("Total Allowances", "Total Deductions", Employee."Retirement Contribution");
                        Employee.CalcFields("Total Savings", BfMpr);
                        Employee.CalcFields(Basic, "Home Savings");
                        Employee.CalcFields("Cumulative Quarters", "Benefits-Non Cash", "Owner Occupier", "Non Cash Benefit");


                    end;
                    /*
                   //DIRECTORS PAYROLL
                   Directors.RESET;
                   Directors.SETRANGE("PIN Number",Employee."P.I.N");
                   //Directors.SETRANGE("Pay Period Filter",20200107D,"Payroll PeriodX"."Starting Date");
                   Directors.SETRANGE("Pay Period Filter","Payroll PeriodX"."Starting Date");
                   IF Directors.FINDSET THEN BEGIN
                     IF "Payroll PeriodX"."Starting Date" >=  20200701D THEN BEGIN
                      DirectorGross:=0;
                    DirectorPaye:=0;
                    DirectorTaxableAMount:=0;
                     Directors.CALCFIELDS("Total Allowances","Total Deductions","Taxable Income","Cumm. PAYE");
                     DirectorGross:=Directors."Total Allowances";
                     DirectorPaye:=Directors."Cumm. PAYE";
                     DirectorTaxableAMount:=Directors."Taxable Income";
                     //MESSAGE('%1,%2 ',DirectorGross,"Payroll PeriodX"."Starting Date");
                     END;
                     END;
                     */

                    BenefitsVar := Employee."Benefits-Non Cash";
                    "30PerPension" := 30 / 100 * Employee.Basic;
                    //"30PerPension":=30/100* (Employee."Total Allowances"+BenefitsVar+DirectorGross);
                    PensionLimit := 20000;

                    AssMatrix.Reset;
                    AssMatrix.SetRange(AssMatrix.Type, AssMatrix.Type::Deduction);
                    AssMatrix.SetRange(AssMatrix."Employee No", Employee."No.");
                    AssMatrix.SetRange(AssMatrix."Payroll Period", "Payroll PeriodX"."Starting Date");
                    AssMatrix.SetRange(AssMatrix.Retirement, true);
                    if AssMatrix.Find('-') then begin
                        repeat
                            RetiremntConEmployer := RetiremntConEmployer + Abs(AssMatrix."Employer Amount");
                            RetirementVar := Abs(Employee."Retirement Contribution") + RetiremntConEmployer - 200;
                        until AssMatrix.Next = 0;
                    end;


                    TaxableAmount := Employee."Taxable Income" + DirectorTaxableAMount;
                    if TaxableAmount <= 0 then
                        PensionLimit := 0;




                    //MESSAGE('%1',Employee."Total Deductions");
                    // Get Owner Occupier

                    Earn.Reset;
                    Earn.SetCurrentkey(Earn."Earning Type");
                    Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Owner Occupier");
                    if Earn.Find('-') then begin
                        AssMatrix.Reset;
                        AssMatrix.SetRange(AssMatrix.Type, AssMatrix.Type::Payment);
                        AssMatrix.SetRange(AssMatrix."Employee No", Employee."No.");
                        AssMatrix.SetRange(AssMatrix."Payroll Period", "Payroll PeriodX"."Starting Date");
                        AssMatrix.SetRange(Code, Earn.Code);
                        if AssMatrix.Find('-') then
                            OccupierVar := AssMatrix.Amount;
                    end;

                    // Get Personal Relief

                    Earn.Reset;
                    Earn.SetCurrentkey(Earn."Earning Type");
                    Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Tax Relief");
                    if Earn.Find('-') then begin
                        AssMatrix.Reset;
                        AssMatrix.SetRange(AssMatrix.Type, AssMatrix.Type::Payment);
                        AssMatrix.SetRange(AssMatrix."Employee No", Employee."No.");
                        AssMatrix.SetRange(AssMatrix."Payroll Period", "Payroll PeriodX"."Starting Date");
                        AssMatrix.SetRange(Code, Earn.Code);
                        if AssMatrix.Find('-') then
                            Relief := AssMatrix.Amount;
                    end;

                    // Get Insurance Relief

                    Earn.Reset;
                    Earn.SetCurrentkey(Earn."Earning Type");
                    Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Insurance Relief");
                    //Earn.SETRANGE(Earn.Code,'SP15');
                    if Earn.Find('-') then begin
                        AssMatrix.Reset;
                        AssMatrix.SetRange(AssMatrix.Type, AssMatrix.Type::Payment);
                        AssMatrix.SetRange(AssMatrix."Employee No", Employee."No.");
                        AssMatrix.SetRange(AssMatrix."Payroll Period", "Payroll PeriodX"."Starting Date");
                        AssMatrix.SetRange(Code, Earn.Code);
                        if AssMatrix.Find('-') then
                            InsuranceRelief := AssMatrix.Amount;
                    end;
                    //Ushindi...Get Non-Cash Benefits


                    Earn.Reset;
                    Earn.SetCurrentkey(Earn."Earning Type");
                    //Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Insurance Relief");
                    Earn.SetRange(Earn.Code, 'E009');
                    if Earn.Find('-') then begin
                        AssMatrix.Reset;
                        AssMatrix.SetRange(AssMatrix.Type, AssMatrix.Type::Payment);
                        AssMatrix.SetRange(AssMatrix."Employee No", Employee."No.");
                        AssMatrix.SetRange(AssMatrix."Payroll Period", "Payroll PeriodX"."Starting Date");
                        AssMatrix.SetRange(Code, Earn.Code);
                        if AssMatrix.Find('-') then
                            BenefitsVar := AssMatrix.Amount;
                    end;


                    /*****Calculate the totals*******************************/
                    TotBasic := TotBasic + Employee."Total Allowances";
                    //TotNonQuarter:=TotQuarter+Employee."Total Allowances";
                    //TotQuarter:=TotQuarter+QuartersVar;
                    // TotGross:=TotGross+Employee."Cumm. Basic Pay"+Employee."Taxable Allowance"+QuartersVar+BenefitsVar;
                    TotPercentage := TotPercentage + ((30 / 100) * (Employee."Cumm. Basic Pay" + Employee."Total Allowances" +
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
                    if Abs(DefinedContrMin) < PensionLimit
                     then begin

                        DefinedContrMin := Abs(RetirementVar) + Abs(OccupierVar);
                        /*IF DefinedContrMin >PensionLimit THEN
                        DefinedContrMin:=PensionLimit*/
                    end
                    else
                        DefinedContrMin := Abs(PensionLimit) + Abs(OccupierVar);


                    NoOfMonths := NoOfMonths + 1;
                    TotRet := TotRet + Abs(DefinedContrMin) + Abs(OccupierVar);

                end;

                trigger OnPreDataItem()
                begin

                    "Payroll PeriodX".SetRange("Payroll PeriodX"."Starting Date", StringDate, EndDate);
                    CurrReport.CreateTotals(Employee."Total Allowances", BenefitsVar, QuartersVar, "30PerPension", PensionLimit, RetirementVar, OccupierVar)
                    ;
                    CurrReport.CreateTotals(TaxableAmount, Employee."Cumm. PAYE", InsuranceRelief, Relief);
                end;
            }
            dataitem(EarningsX; EarningsX)
            {
                DataItemLink = "Employee Filter" = field("No.");
                DataItemTableView = sorting(Code);
                column(ReportForNavId_1000000002; 1000000002)
                {
                }
                dataitem("Company Information"; "Company Information")
                {
                    column(ReportForNavId_1; 1)
                    {
                    }
                    column(VATRegistrationNo_CompanyInformation; "Company Information"."VAT Registration No.")
                    {
                    }
                    column(PinNo_CompanyInformation; "Company Information"."Pin No")
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin

                    EarningsX.CalcFields(EarningsX."Total Amount", EarningsX.Counter, EarningsX.NoOfUnits);
                    EmployeeBenefits := EmployeeBenefits + EarningsX."Total Amount";

                    if EarningsX.Counter <> 0 then
                        Numb := EarningsX.NoOfUnits / EarningsX.Counter;
                end;

                trigger OnPostDataItem()
                begin
                    EmployeeBenefits := 0;
                end;

                trigger OnPreDataItem()
                begin

                    EarningsX.SetRange(EarningsX."Non-Cash Benefit", true);
                    EarningsX.SetRange(EarningsX.Taxable, true);
                    EarningsX.SetRange("Pay Period Filter", StringDate, EndDate);
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
                Employee."Total Quarters" := 0;
                Company.Get;
                CoPin := Company."VAT Registration No.";

                /*IF StringDate=0D THEN
                  StringDate:=Employee.GETRANGEMAX("Date Filter");
                IF EndDate=0D THEN
                  EndDate:=Employee.GETRANGEMIN("Date Filter");
                
                TheYear:=DATE2DMY(EndDate,3);
                */

            end;

            trigger OnPreDataItem()
            begin

                if StringDate = 0D then
                    StringDate := Employee.GetRangeMin("Date Filter");
                if EndDate = 0D then
                    EndDate := Employee.GetRangemax("Date Filter");
                //MESSAGE('startdate %1', StringDate);
                //MESSAGE('endDatedate %1',EndDate);

                TheYear := Date2dmy(EndDate, 3);

                CompanyInfo.CalcFields(CompanyInfo.RubberStamp);

                /* IF (StringDate=0D) OR (EndDate=0D) THEN
               ERROR('Please specify the correct period on the option of the request form');
               */
                Employee.SetFilter("Home Ownership Status", '<>%1', Employee."home ownership status"::"Home Savings");
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
                    //cc//    OptionCaption = 'Due Date,Posting Date,Document Date';
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
        GCOntrib: Decimal;
        Directors: Record Vendor;
        DirectorGross: Decimal;
        DirectorTaxableAMount: Decimal;
        DirectorPaye: Decimal;
        RetiremntConEmployer: Decimal;


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
        if not Employee."Pays tax?" then
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
