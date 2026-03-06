#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69011 "Loan Application"
{
    // // Flat Rate
    // LineNoInt := 1;
    // //IF LoanTypeRec."Interest Calculation Method"=LoanTypeRec."Interest Calculation Method"::"Flat Rate" THEN
    // IF "Interest Calculation Method"="Interest Calculation Method"::"Flat Rate" THEN
    // BEGIN
    // 
    // //
    // EVALUATE(GP,FORMAT("Grace Period"));
    // //
    // RemainingPrincipalAmountDec :="Approved Amount";
    // IF "Pays Interest During GP"=FALSE THEN BEGIN
    //  IF GP<>'' THEN
    //   RunningDate:=CALCDATE("Grace Period",RunningDate)
    //  ELSE
    //   RunningDate:=CALCDATE("Instalment Period",RunningDate);
    // END ELSE
    //   RunningDate:=CALCDATE("Instalment Period",RunningDate);
    // IF LineNoInt <Installments+1 THEN BEGIN
    //  REPEAT
    //   NewSchedule."Instalment No":= LineNoInt;
    //   NewSchedule."Member No." :="Client Code";
    //   NewSchedule."Loan No." :="Loan  No.";
    //   NewSchedule."Repayment Date" := RunningDate;
    //   NewSchedule."Monthly Interest" := "Flat rate Interest";
    //   NewSchedule."Monthly Repayment":=Repayment;
    //   NewSchedule."Loan Category":="Loan product type";
    //   NewSchedule."Loan Amount":="Approved Amount";
    //   NewSchedule."Group Code":="Group Code";
    //   NewSchedule."Loan Application No":="Loan  No.";
    //   NewSchedule."Principal Repayment" := "Flat Rate Principal";
    //   IF Installments=1 THEN
    //    RemainingPrincipalAmountDec:="Approved Amount"-Repayment
    //   ELSE
    //    RemainingPrincipalAmountDec:=RemainingPrincipalAmountDec-Repayment;
    // 
    //   NewSchedule."Remaining Debt" :=RemainingPrincipalAmountDec;
    // 
    //   NewSchedule."Instalment No" := LineNoInt;
    //   EVALUATE(ScheduleCode, FORMAT(LineNoInt));
    //   NewSchedule."Repayment Code":=ScheduleCode;
    // 
    //   LineNoInt:=LineNoInt+1;
    //    IF InstalmentDays<>0 THEN
    //     RunningDate:=RunningDate+InstalmentDays
    //    ELSE
    //     RunningDate:=CALCDATE("Instalment Period",RunningDate);
    //  NewSchedule.INSERT;
    //  UNTIL LineNoInt>Installments
    //  END;
    // 
    // END;

    DrillDownPageID = "Loan Applications";
    LookupPageID = "Loan Applications";

    fields
    {
        field(1; "Loan No"; Code[20])
        {

            trigger OnValidate()
            begin
                if "Loan No" <> xRec."Loan No" then begin
                    if LoanType.Get("Loan Product Type") then begin
                        NoSeriesMgt.TestManual(LoanType."Loan No Series");
                        "No Series" := '';
                    end;
                end;
            end;
        }
        field(2; "Application Date"; Date)
        {
        }
        field(3; "Loan Product Type"; Code[20])
        {
            TableRelation = "Loan Product Type".Code;

            trigger OnValidate()
            begin
                if LoanType.Get("Loan Product Type") then begin
                    "Interest Deduction Code" := LoanType."Interest Deduction Code";
                    "Deduction Code" := LoanType."Deduction Code";
                    Description := LoanType.Description;
                    "Interest Rate" := LoanType."Interest Rate";
                    "Interest Calculation Method" := LoanType."Interest Calculation Method";

                end;
            end;
        }
        field(4; "Amount Requested"; Decimal)
        {
        }
        field(5; "Approved Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Interest Calculation Method" = "interest calculation method"::" " then
                    Error('Interest Calculation method can only be Balance');
                ;


                Installments := Instalment;
                if Installments <= 0 then
                    Error('Number of installments must be greater than Zero!');

                if LoanType.Get("Loan Product Type") then begin
                    if "Interest Calculation Method" = "interest calculation method"::"Reducing Balance" then begin
                        Repayment := ROUND("Approved Amount" / Installments, 0.0001, '>');

                        /* IF "Interest Rate" = 0 THEN
                           Repayment := ROUND("Approved Amount"/ Installments,0.0001,'>')
                         ELSE
                           Repayment := ROUND(DebtService("Approved Amount","Interest Rate",Installments),0.0001,'>');*/
                    end;
                end;
                //"Total Repayment":=Installments*Repayment;

                //Flat Rate
                //

                if "Interest Calculation Method" = "interest calculation method"::"Flat Rate" then begin
                    Repayment := ROUND(("Approved Amount" / Installments) + FlatRateCalc("Approved Amount", Interest), 0.01, '>');
                    "Flat Rate Interest" := ROUND(FlatRateCalc("Approved Amount", "Interest Rate"), 0.01, '>');
                    "Flat Rate Principal" := Repayment - "Flat Rate Interest";
                end;


                "Approved Amount" := Abs("Approved Amount");

            end;
        }
        field(6; "Loan Status"; Option)
        {
            OptionCaption = 'Application,Being Processed,Rejected,Approved,Issued,Being Repaid,Repaid';
            OptionMembers = Application,"Being Processed",Rejected,Approved,Issued,"Being Repaid",Repaid;
        }
        field(7; "Issued Date"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(8; Instalment; Integer)
        {
        }
        field(9; Repayment; Decimal)
        {
        }
        field(10; "Flat Rate Principal"; Decimal)
        {
        }
        field(11; "Flat Rate Interest"; Decimal)
        {
        }
        field(12; "Interest Rate"; Decimal)
        {
        }
        field(13; "No Series"; Code[10])
        {
        }
        field(14; "Interest Calculation Method"; Option)
        {
            OptionMembers = " ","Flat Rate","Reducing Balance";
        }
        field(15; "Employee No"; Code[20])
        {
            TableRelation = Employee."No." where(Status = const(Active));
        }
        field(16; "Employee Name"; Text[100])
        {
        }
        field(17; "Payroll Group"; Code[20])
        {
            TableRelation = "Employee Posting GroupX".Code;
        }
        field(18; Description; Text[80])
        {
        }
        field(19; "Opening Loan"; Boolean)
        {
            Editable = true;
        }
        field(20; "Total Repayment"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee No"),
                                                                  Type = const(Deduction),
                                                                  Code = field("Deduction Code"),
                                                                  "Payroll Period" = field(upperlimit("Date filter")),
                                                                  "Reference No" = field("Loan No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Date filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(22; "Period Repayment"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee No"),
                                                                  Type = const(Deduction),
                                                                  Code = field("Deduction Code"),
                                                                  "Payroll Period" = field(upperlimit("Date filter")),
                                                                  "Reference No" = field("Loan No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; Interest; Decimal)
        {
        }
        field(24; "Interest Imported"; Decimal)
        {
        }
        field(25; "principal imported"; Decimal)
        {
        }
        field(26; "Interest Rate Per"; Option)
        {
            OptionMembers = " ",Annum,Monthly;
        }
        field(27; "Reference No"; Code[50])
        {
        }
        field(28; "Interest Deduction Code"; Code[10])
        {
            CalcFormula = lookup("Loan Product Type"."Interest Deduction Code" where(Code = field("Loan Product Type")));
            FieldClass = FlowField;
            TableRelation = DeductionsX;
        }
        field(29; "Deduction Code"; Code[10])
        {
            CalcFormula = lookup("Loan Product Type"."Deduction Code" where(Code = field("Loan Product Type")));
            FieldClass = FlowField;
            TableRelation = DeductionsX;
        }
        field(30; "Debtors Code"; Code[10])
        {
            TableRelation = Customer;
        }
        field(31; "Interest Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("Employee No"),
                                                                  Type = const(Deduction),
                                                                  Code = field("Interest Deduction Code"),
                                                                  "Payroll Period" = field(upperlimit("Date filter")),
                                                                  "Reference No" = field("Loan No")));
            FieldClass = FlowField;
        }
        field(32; "External Document No"; Code[20])
        {
        }
        field(33; Receipts; Decimal)
        {
            CalcFormula = sum("Non Payroll Receipts".Amount where("Loan No" = field("Loan No"),
                                                                   "Receipt Date" = field("Date filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "HELB No."; Code[50])
        {
        }
        field(35; "University Name"; Code[100])
        {
        }
        field(36; "Stop Loan"; Boolean)
        {
        }
        field(37; "Refinanced From Loan:"; Code[20])
        {
        }
        field(38; Employee2; Text[50])
        {
            FieldClass = Normal;
        }
        field(39; "Employee Name."; Text[50])
        {
            CalcFormula = lookup(Employee."Emp F L" where("No." = field("Employee No")));
            FieldClass = FlowField;
        }
        field(40; "Description."; Text[50])
        {
            CalcFormula = lookup("Loan Product Type".Description where(Code = field("Loan Product Type")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Loan No", "Loan Product Type")
        {
            Clustered = true;
        }
        key(Key2; "Payroll Group", "Loan Product Type")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if "Loan Status" = "loan status"::Issued then begin
            AssMatrix.Reset;
            AssMatrix.SetRange(AssMatrix."Employee No", "Loan No", AssMatrix."Reference No");
            AssMatrix.SetRange(AssMatrix.Closed, true);
            if AssMatrix.Find('-') then
                Error('Cannot delete loan already issued');
        end;
    end;

    trigger OnInsert()
    begin

        if "Loan No" = '' then begin
            if LoanType.Get("Loan Product Type") then begin
                LoanType.TestField(LoanType."Loan No Series");
              //  NoSeriesMgt.InitSeries(LoanType."Loan No Series", xRec."No Series", 0D, "Loan No", "No Series");
                "Loan No" := NoSeriesMgt.GetNextNo(LoanType."Loan No Series", Today, true);
            end;
        end
    end;

    trigger OnModify()
    begin
        AssMatrix.Reset;
        AssMatrix.SetRange(AssMatrix."Employee No", "Loan No", AssMatrix."Reference No");
        AssMatrix.SetRange(AssMatrix.Closed, true);
        if AssMatrix.Find('-') then
            Error('Cannot modify a running loan');
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRsetup: Record "Human Resources Setup";
        LoanType: Record "Loan Product Type";
        EmpRec: Record Employee;
        PeriodInterest: Decimal;
        Installments: Decimal;
        NewSchedule: Record "Repayment Schedule";
        RunningDate: Date;
        Interest: Decimal;
        FlatPeriodInterest: Decimal;
        FlatRateTotalInterest: Decimal;
        FlatPeriodInterval: Code[10];
        LineNoInt: Integer;
        RemainingPrincipalAmountDec: Decimal;
        AssMatrix: Record "Assignment Matrix-X";


    procedure DebtService(Principal: Decimal; Interest: Decimal; PayPeriods: Integer): Decimal
    var
        PeriodInterest: Decimal;
    begin
        //PeriodInterval:=
        //EVALUATE(PeriodInterval,FORMAT("Instalment Period"));
        //1M
        //IF PeriodInterval='1M' THEN

        PeriodInterest := Interest / 12 / 100;

        exit(PeriodInterest / (1 - Power((1 + PeriodInterest), -PayPeriods)) * Principal);
        /*
         //1W
        IF PeriodInterval='1W' THEN
         PeriodInterest:= Interest / 52 / 100;
         //2W
        IF PeriodInterval='2W' THEN
         PeriodInterest:= Interest / 26 / 100;
         //1Q
        IF PeriodInterval='1Q' THEN
         PeriodInterest:= Interest / 4 / 100;
        
        
        */

    end;


    procedure CreateAnnuityLoan()
    var
        LoanEntryRec: Record "Loan Application";
        LoanTypeRec: Record "Loan Product Type";
        LoopEndBool: Boolean;
        LineNoInt: Integer;
        PeriodCode: Code[10];
        InterestAmountDec: Decimal;
        RemainingPrincipalAmountDec: Decimal;
        RepaymentAmountDec: Decimal;
        RoundPrecisionDec: Decimal;
        RoundDirectionCode: Code[10];
    begin
        //Loan Applic. No.,Group Code,Client Code,Loan no
        Installments := Instalment;

        if Installments <= 0 then
            Error('Instalment Amount must be specified');
        //IF  Repayment> "Approved Amount" THEN
        //  ERROR('Instalment Amount is higher than Principal');
        LoopEndBool := false;

        LineNoInt := 0;

        LoanTypeRec.Get("Loan Product Type");

        case LoanTypeRec.Rounding of
            LoanTypeRec.Rounding::Nearest:
                RoundDirectionCode := '=';
            LoanTypeRec.Rounding::Down:
                RoundDirectionCode := '<';
            LoanTypeRec.Rounding::Up:
                RoundDirectionCode := '>';
        end;

        RoundPrecisionDec := LoanTypeRec."Rounding Precision";
        //
        //EVALUATE(GP,FORMAT("Grace Period"));
        //
        RemainingPrincipalAmountDec := "Approved Amount";
        RunningDate := "Issued Date";

        repeat
            InterestAmountDec := ROUND(RemainingPrincipalAmountDec / 100 / 12 *
           LoanTypeRec."Interest Rate", RoundPrecisionDec, RoundDirectionCode);

            if InterestAmountDec >= Repayment then
                Error('This Loan is not possible because\the the instalment Amount must\be higher than %1', InterestAmountDec);
            //
            LineNoInt := LineNoInt + 1;

            NewSchedule."Instalment No" := LineNoInt;
            NewSchedule."Employee No" := "Employee No";
            NewSchedule."Loan No" := "Loan No";
            NewSchedule."Repayment Date" := RunningDate;
            NewSchedule."Monthly Interest" := InterestAmountDec;
            NewSchedule."Monthly Repayment" := Repayment;
            NewSchedule."Loan Category" := "Loan Product Type";
            NewSchedule."Loan Amount" := "Approved Amount";

            // Area to be looked at
            if LineNoInt = Installments then begin
                NewSchedule."Remaining Debt" := 0;
                NewSchedule."Monthly Repayment" := RemainingPrincipalAmountDec + NewSchedule."Monthly Interest";
                NewSchedule."Principal Repayment" := NewSchedule."Monthly Repayment" - NewSchedule."Monthly Interest";

                LoopEndBool := true;
            end;

            if (Repayment - InterestAmountDec) >= RemainingPrincipalAmountDec then begin
                NewSchedule."Principal Repayment" := RemainingPrincipalAmountDec;
                NewSchedule."Remaining Debt" := 0;
                LoopEndBool := true;
            end else begin
                NewSchedule."Principal Repayment" := Repayment - InterestAmountDec;
                RemainingPrincipalAmountDec := RemainingPrincipalAmountDec - (Repayment - InterestAmountDec);
                NewSchedule."Remaining Debt" := RemainingPrincipalAmountDec;
            end;
            NewSchedule.Insert;
            RunningDate := CalcDate('1M', RunningDate)
        //RunningDate:=CALCDATE("Instalment Period",RunningDate)

        //MODIFY;
        until LoopEndBool;

        Message('Schedule Created');
    end;


    procedure FlatRateCalc(var FlatLoanAmount: Decimal; var FlatInterestRate: Decimal) FlatRateCalc: Decimal
    begin
        //FlatPeriodInterval:=
        //EVALUATE(FlatPeriodInterval,FORMAT("Instalment Period"));
        //1M
        //IF FlatPeriodInterval='1M' THEN

        FlatPeriodInterest := FlatLoanAmount * FlatInterestRate / 100 * 1 / 12;
        FlatRateCalc := FlatPeriodInterest;

        /*
         //1W
        
        IF FlatPeriodInterval='1W' THEN
         FlatPeriodInterest:= FlatLoanAmount*FlatInterestRate/100*1/52;
         //2W
        IF FlatPeriodInterval='2W' THEN
         FlatPeriodInterest:= FlatLoanAmount*FlatInterestRate/100*1/26;
         //1Q
        IF FlatPeriodInterval='1Q' THEN
         FlatPeriodInterest:= FlatLoanAmount*FlatInterestRate/100*1/4;
        */

    end;


    procedure CreateFlatRateSchedule()
    begin
        // Flat Rate
        LineNoInt := 1;
        Installments := Instalment;
        if "Interest Calculation Method" = "interest calculation method"::"Flat Rate" then begin
            RunningDate := "Issued Date";

            RemainingPrincipalAmountDec := "Approved Amount";

            if LineNoInt < Installments + 1 then begin
                repeat
                    NewSchedule."Instalment No" := LineNoInt;
                    NewSchedule."Employee No" := "Employee No";
                    NewSchedule."Loan No" := "Loan No";
                    NewSchedule."Repayment Date" := RunningDate;
                    NewSchedule."Monthly Interest" := "Flat Rate Interest";
                    NewSchedule."Monthly Repayment" := Repayment;
                    NewSchedule."Loan Category" := "Loan Product Type";
                    NewSchedule."Loan Amount" := "Approved Amount";
                    NewSchedule."Principal Repayment" := "Flat Rate Principal";
                    if LineNoInt = 1 then
                        RemainingPrincipalAmountDec := "Approved Amount" - Repayment
                    else
                        RemainingPrincipalAmountDec := RemainingPrincipalAmountDec - Repayment;
                    NewSchedule."Remaining Debt" := RemainingPrincipalAmountDec;
                    NewSchedule."Instalment No" := LineNoInt;
                    NewSchedule.Insert;

                    LineNoInt := LineNoInt + 1;
                    RunningDate := CalcDate('CD+1M', RunningDate);

                until LineNoInt > Installments
            end;

        end;
        Message('Schedule Created');
    end;
}
