#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69010 "Loan Product Type"
{
    // DrillDownPageID = UnknownPage69016;
    //LookupPageID = UnknownPage69016;

    fields
    {
        field(1; "Code"; Code[50])
        {

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    SalesSetup.Get;
                    NoSeriesMgt.TestManual(HRsetup."Loan Product Type Nos.");
                    "No Series" := '';
                end;
            end;
        }
        field(2; Description; Text[80])
        {
        }
        field(3; "Interest Rate"; Decimal)
        {
            DecimalPlaces = 2 : 10;
        }
        field(4; "Interest Calculation Method"; Option)
        {
            OptionMembers = " ","Flat Rate","Reducing Balance";
        }
        field(5; "No Series"; Code[10])
        {
        }
        field(6; "No of Instalment"; Integer)
        {
        }
        field(7; "Loan No Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(8; Rounding; Option)
        {
            OptionCaption = 'Nearest,Down,Up';
            OptionMembers = Nearest,Down,Up;
        }
        field(28; "Rounding Precision"; Decimal)
        {
            InitValue = 1;
            MaxValue = 1;
            MinValue = 0.01;
        }
        field(29; "Loan Category"; Option)
        {
            OptionMembers = " ",Advance,"Sacco Loan","Other Loan";
        }
        field(30; "Calculate Interest"; Boolean)
        {
        }
        field(31; "Interest Deduction Code"; Code[10])
        {
            TableRelation = DeductionsX;
        }
        field(32; "Deduction Code"; Code[50])
        {
            TableRelation = DeductionsX;
        }
        field(33; Internal; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Loan Category")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if Code = '' then begin
            HRsetup.Get;
            HRsetup.TestField(HRsetup."Loan Product Type Nos.");
            //NoSeriesMgt.InitSeries(HRsetup."Loan Product Type Nos.", xRec."No Series", 0D, Code, "No Series");
            Code := NoSeriesMgt.GetNextNo(HRsetup."Loan Product Type Nos.", Today, true);
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        HRsetup: Record "Human Resources Setup";
}
