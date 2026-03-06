#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69051 "Director Ledger Entry"
{
    DataCaptionFields = "Director No", Description;
    DrillDownPageID = "Director Ledger Entries";
    LookupPageID = "Director Ledger Entries";

    fields
    {
        field(1; "Director No"; Code[30])
        {
            NotBlank = true;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if DirectorRec.Get("Director No") then begin
                    DirectorRec.CalcFields("Total Allowances", "Total Deductions");

                    "Posting Group Filter" := DirectorRec."Vendor Posting Group";
                    "Department Code" := DirectorRec."Global Dimension 1 Code";
                    if DirectorRec."Vendor Posting Group" = '' then
                        Error('Assign  %1  %2 a posting group before assigning any earning or deduction', DirectorRec."No.", DirectorRec.Name);
                    "Pay Mode" := DirectorRec."Payroll Pay Mode";

                    // IF DirectorRec.Status<>DirectorRec.Status::Active THEN
                    // ERROR('Can only assign Earnings and deductions to Active DirectorRecoyees Please confirm if '+ //
                    // '%1 %2 is an Active DirectorRecoyee',DirectorRec."First Name",DirectorRec."Last Name");
                end;
            end;
        }
        field(2; Type; Option)
        {
            NotBlank = false;
            OptionCaption = 'Payment,Deduction';
            OptionMembers = Payment,Deduction;
        }
        field(3; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = if (Type = const(Payment)) "Directors Earnings"
            else if (Type = const(Deduction)) "Director Deductions";

            trigger OnValidate()
            begin

                HRSetup.Get;
                GetPayPeriod;
                "Payroll Period" := PayStartDate;
                "Pay Period" := PayPeriodText;

                //*********************Allowances Calculation rules etc***************
                if Type = Type::Payment then begin
                    if Payments.Get(Code) then begin
                        // check if blocked
                        if Payments.Block = true then
                            Error(' Earning Blocked');
                        Description := Payments.Description;
                        if Payments."Earning Type" = Payments."earning type"::"Tax Relief" then
                            "Tax Relief" := true;
                        "Non-Cash Benefit" := Payments."Non-Cash Benefit";
                        Taxable := Payments.Taxable;
                        "Tax Deductible" := Payments."Reduces Tax";
                        if Payments."Pay Type" = Payments."pay type"::Recurring then
                            "Next Period Entry" := true;
                        if Payments."Calculation Method" = Payments."calculation method"::"Flat amount" then
                            Amount := Payments."Flat Amount";


                        if Payments."Calculation Method" = Payments."calculation method"::"% of Gross pay" then begin
                            if DirectorRec.Get("Director No") then begin
                                DirectorRec.SetRange(DirectorRec."Pay Period Filter", "Payroll Period");
                                DirectorRec.CalcFields(DirectorRec."Total Allowances");
                                Amount := ((Payments.Percentage / 100) * (DirectorRec."Total Allowances"));
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;

                        if Payments."Calculation Method" = Payments."calculation method"::"% of Taxable income" then begin
                            if DirectorRec.Get("Director No") then begin
                                DirectorRec.SetRange("Pay Period Filter", PayStartDate);
                                DirectorRec.CalcFields(DirectorRec."Taxable Income");
                                Amount := ((Payments.Percentage / 100) * (DirectorRec."Taxable Income"));
                                Amount := PayrollRounding(Amount);//round
                            end;
                        end;
                        if Payments."Reduces Tax" then begin
                            //Amount:=-Amount;
                            Amount := PayrollRounding(Amount);//round
                        end;

                    end;
                end;

                //*********Deductions****************************************
                if Type = Type::Deduction then begin
                    if Deductions.Get(Code) then begin
                        if Deductions.Block = true then
                            Error('Deduction Blocked');
                        Description := Deductions.Description;
                        "G/L Account" := Deductions."G/L Account";
                        "Tax Deductible" := Deductions."Tax deductible";
                        Paye := Deductions."PAYE Code";







                        if Deductions.Type = Deductions.Type::Recurring then
                            "Next Period Entry" := true;
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Flat Amount" then begin
                            Amount := Deductions."Flat Amount";
                        end;


                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table" then begin
                            if DirectorRec.Get("Director No") then begin
                                DirectorRec.CalcFields(DirectorRec."Total Allowances");
                                Amount := ((Deductions.Percentage / 100) * (DirectorRec."Total Allowances"));
                                Amount := PayrollRounding(Amount);
                            end;
                        end;

                        ///remove nega
                        if Type = Type::Deduction then
                            Amount := -Amount;

                        //*******New Addition*******************
                        if Deductions."Calculation Method" = Deductions."calculation method"::"Based on Table" then begin
                            GetPayPeriod;
                            DirectorRec.Reset;
                            DirectorRec.SetRange(DirectorRec."No.", "Director No");
                            DirectorRec.SetRange(DirectorRec."Pay Period Filter", PayStartDate);
                            DirectorRec.CalcFields(DirectorRec."Total Allowances");
                            // used gross pay new requirement for NHIF changed by Linus
                            //GetBracket(Deductions."Deduction Table",DirectorRec."Total Allowances1");

                            //adjusted by kugun to use taxable allawance
                            if HRSetup."NHIF Code" = Deductions.Code then
                                GetBracket(Deductions."Deduction Table", DirectorRec."Total Allowances");



                            Amount := -TableAmount;
                        end;

                    end;
                end;
                //**********END**************************************************************************
            end;
        }
        field(4; "Payroll Period"; Date)
        {
            NotBlank = false;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            begin

                if PayPeriod.Get("Payroll Period") then
                    "Pay Period" := PayPeriod.Name;
            end;
        }
        field(5; Amount; Decimal)
        {

            trigger OnValidate()
            begin

                if (Type = Type::Payment) then
                    if Payments.Get(Code) then
                        if Payments."Reduces Tax" then begin
                            //Amount:=-Amount;
                        end;
                //Amount:=-Amount;

                if (Type = Type::Payment) then
                    if Amount < 0 then
                        Error('Earning must not be negative');



                if (Type = Type::Deduction) then begin




                end;
                //END;
                TestField(Closed, false);

                Amount := PayrollRounding(Amount);
                if "Manual Entry" then begin
                    if DirectorRec.Get("Director No") then begin
                        DirectorRec.SetRange(DirectorRec."Pay Period Filter", "Payroll Period");
                        DirectorRec.CalcFields(DirectorRec."Total Allowances", DirectorRec."Total Deductions");

                    end;
                end;

                if not "Manual Entry" then begin
                    if DirectorRec.Get("Director No") then begin
                        DirectorRec.SetRange(DirectorRec."Pay Period Filter", "Payroll Period");
                        DirectorRec.CalcFields(DirectorRec."Total Allowances", DirectorRec."Total Deductions");


                    end;
                end;
            end;
        }
        field(6; Description; Text[80])
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(7; Taxable; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(8; "Tax Deductible"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(9; Frequency; Option)
        {
            OptionMembers = Recurring,"Non-recurring";
        }
        field(10; "Pay Period"; Text[30])
        {
        }
        field(11; "G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(12; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(13; "Next Period Entry"; Boolean)
        {
        }
        field(14; "Posting Group Filter"; Code[20])
        {
            TableRelation = "Vendor Posting Group";

            trigger OnValidate()
            begin

                TestField(Closed, false);
            end;
        }
        field(15; Closed; Boolean)
        {
            Editable = true;
        }
        field(16; "Tax Relief"; Boolean)
        {
        }
        field(17; "Non-Cash Benefit"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField(Closed, false);
            end;
        }
        field(18; "Opening Balance"; Decimal)
        {

            trigger OnValidate()
            begin

                TestField(Closed, false);
            end;
        }
        field(19; "Payroll Group"; Code[20])
        {
            TableRelation = "Vendor Posting Group".Code;
        }
        field(20; Paye; Boolean)
        {
        }
        field(21; "Taxable amount"; Decimal)
        {
        }
        field(22; "Less Tax Exempt"; Decimal)
        {
        }
        field(23; "Monthly Personal Relief"; Decimal)
        {
        }
        field(24; "Manual Entry"; Boolean)
        {
        }
        field(25; "Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
        }
        field(26; "No of Days"; Integer)
        {
        }
        field(27; "Date of Meeting"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Director No", Type, "Code", "Payroll Period", "Date of Meeting")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TestField(Closed, false);
        //IF Paye THEN
        //ERROR('You cannot manually delete P.A.Y.E');
    end;

    trigger OnInsert()
    begin
        TestField(Closed, false);
    end;

    trigger OnModify()
    begin
        TestField(Closed, false);
        //IF Paye THEN
        //ERROR('You cannot manually edit or change P.A.Y.E');
    end;

    trigger OnRename()
    begin
        TestField(Closed, false);
    end;

    var
        Payments: Record "Directors Earnings";
        Deductions: Record "Director Deductions";
        Paydeduct: Decimal;
        DirectorRec: Record Vendor;
        PayPeriod: Record "Payroll PeriodX";
        Loan: Record "Loans transactionsX";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        TableAmount: Decimal;
        Basic: Decimal;
        ReducedBal: Decimal;
        InterestAmt: Decimal;
        HRSetup: Record "Human Resources Setup";
        Maxlimit: Decimal;
        Benefits: Record BracketsX;
        InterestDiff: Decimal;
        SalarySteps: Record "Assignment Matrix-X";
        LoanProductType: Record "Loan Product Type";
        LoanApp: Record "Loan Application";
        "reference no": Record "Assignment Matrix-X";
        Emp: Record Employee;
        EmpPostingGrp: Record "Employee Posting GroupX";
        AssignMatrix: Record "Assignment Matrix-X";


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then
            PayStartDate := PayPeriod."Starting Date";
        PayPeriodText := PayPeriod.Name;
    end;


    procedure GetBracket(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record BracketsX;
    begin
        BracketTable.SetRange(BracketTable."Table Code", TableCode);
        if BracketTable.Find('-') then begin
            repeat
                if ((BasicPay >= BracketTable."Lower Limit") and (BasicPay <= BracketTable."Upper Limit")) then
                    TableAmount := BracketTable.Amount;
            until BracketTable.Next = 0;
        end;
        //ELSE
        //MESSAGE('The Brackets have not been defined');
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


    procedure GetBracketNSSF1(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record BracketsX;
    begin
        BracketTable.SetRange(BracketTable."Table Code", TableCode);
        if BracketTable.Find('-') then begin
            repeat
                //IF ((BasicPay>=BracketTable."Lower Limit") AND (BasicPay<=BracketTable."Upper Limit")) THEN
                //TableAmount:=BasicPay*BracketTable.Percentage/100;
                if (BasicPay >= BracketTable."Upper Limit") then
                    TableAmount := BracketTable."Upper Limit" * BracketTable.Percentage / 100
                else
                    TableAmount := BasicPay * BracketTable.Percentage / 100;

            until BracketTable.Next = 0;
        end;

        //MESSAGE('%1',TableAmount);

        //ELSE
        //MESSAGE('The Brackets have not been defined');
    end;


    procedure GetBracketNSSF2(var TableCode: Code[10]; var BasicPay: Decimal)
    var
        BracketTable: Record BracketsX;
    begin


        BracketTable.SetRange(BracketTable."Table Code", TableCode);
        if BracketTable.Find('-') then begin
            repeat
                if ((BasicPay >= BracketTable."Lower Limit") and (BasicPay < BracketTable."Upper Limit")) then
                    TableAmount := (BasicPay - BracketTable."Lower Limit" + 1) * BracketTable.Percentage / 100;
                if (BasicPay >= BracketTable."Upper Limit") then
                    TableAmount := (BracketTable."Upper Limit" - BracketTable."Lower Limit" + 1) * BracketTable.Percentage / 100;

            until BracketTable.Next = 0;
        end;


        //ELSE
        //MESSAGE('The Brackets have not been defined');
    end;
}
