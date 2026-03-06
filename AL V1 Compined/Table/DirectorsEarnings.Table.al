#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69052 "Directors Earnings"
{
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Directors Earnings";
    LookupPageID = "Directors Earnings";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Pay Type"; Option)
        {
            OptionCaption = 'Recurring,Non-recurring';
            OptionMembers = Recurring,"Non-recurring";
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "End Date"; Date)
        {
        }
        field(6; Taxable; Boolean)
        {
        }
        field(7; "Calculation Method"; Option)
        {
            OptionCaption = 'Flat amount,% of Basic pay,% of Gross pay,% of Insurance Amount,% of Taxable income,% of Basic after tax,Based on Hourly Rate,Based on Daily Rate';
            OptionMembers = "Flat amount","% of Basic pay","% of Gross pay","% of Insurance Amount","% of Taxable income","% of Basic after tax","Based on Hourly Rate","Based on Daily Rate";
        }
        field(8; "Flat Amount"; Decimal)
        {
        }
        field(9; Percentage; Decimal)
        {
        }
        field(10; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(11; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry".Amount where(Type = const(Payment),
                                                                    Code = field(Code),
                                                                    "Posting Group Filter" = field("Posting Group Filter"),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Department Code" = field("Department Filter"),
                                                                    "Pay Mode" = field("Pay Mode Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Date Filter"; Date)
        {
        }
        field(13; "Posting Group Filter"; Code[200])
        {
            FieldClass = FlowFilter;
            TableRelation = "Vendor Posting Group";
        }
        field(14; "Pay Period Filter"; Date)
        {
            ClosingDates = false;
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(15; "Non-Cash Benefit"; Boolean)
        {
        }
        field(16; "Minimum Limit"; Decimal)
        {
        }
        field(17; "Maximum Limit"; Decimal)
        {
        }
        field(18; "Reduces Tax"; Boolean)
        {
        }
        field(19; "Director Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Vendor;
        }
        field(20; Counter; Integer)
        {
            CalcFormula = count("Director Ledger Entry" where("Payroll Period" = field("Pay Period Filter"),
                                                               "Director No" = field("Director Filter"),
                                                               Code = field(Code)));
            FieldClass = FlowField;
        }
        field(21; "Show Balance"; Boolean)
        {
        }
        field(22; CoinageRounding; Boolean)
        {
        }
        field(23; "Opening Balance"; Decimal)
        {
            CalcFormula = sum("Director Ledger Entry"."Opening Balance" where(Type = const(Payment),
                                                                               Code = field(Code),
                                                                               "Director No" = field("Director Filter")));
            FieldClass = FlowField;
        }
        field(24; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(25; Months; Decimal)
        {
            Description = 'Used to cater for taxation based on annual bracket eg 1,12 months (the default is 1month) FOR NEPAL';
        }
        field(26; "Show on Report"; Boolean)
        {
        }
        field(27; "Earning Type"; Option)
        {
            OptionCaption = 'Normal Earning,Owner Occupier,Home Savings,Low Interest,Tax Relief,Insurance Relief';
            OptionMembers = "Normal Earning","Owner Occupier","Home Savings","Low Interest","Tax Relief","Insurance Relief";
        }
        field(28; "Applies to All"; Boolean)
        {
        }
        field(29; "Show on Master Roll"; Boolean)
        {
        }
        field(30; Block; Boolean)
        {
        }
        field(31; "No of Entries"; Integer)
        {
            CalcFormula = count("Assignment Matrix-X" where(Type = const(Payment),
                                                             Code = field(Code),
                                                             "Payroll Period" = field("Pay Period Filter"),
                                                             "Pay Mode" = field("Pay Mode Filter")));
            FieldClass = FlowField;
        }
        field(32; "Pay Mode Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Pay Mode";
        }
        field(33; "Account Type"; Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(34; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else if ("Account Type" = const(Vendor)) Vendor;

            trigger OnValidate()
            begin

                // CASE "Account Type" OF
                //  "Account Type":::
                //    BEGIN
                //     IF Customer.GET("Account No.") THEN
                //       BEGIN
                //         "Account Name":=Customer.Name;
                //         Payee:=Customer.Name;
                //         END;
                //    END;
                // END;
            end;
        }
        field(35; "Per Diem"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Show on Master Roll")
        {
        }
        key(Key3; "Account Type")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        DirectorLedgerEntry.Reset;
        DirectorLedgerEntry.SetRange(Type, DirectorLedgerEntry.Type::Payment);
        DirectorLedgerEntry.SetRange(Code, Code);
        if DirectorLedgerEntry.Find('+') then
            Error('You cannot delete this earning because it has entries');
    end;

    var
        DirectorLedgerEntry: Record "Director Ledger Entry";
}
