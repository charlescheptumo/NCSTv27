#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69018 "Loan Repayment Schedule"
{

    fields
    {
        field(1; "Loan No."; Code[20])
        {
        }
        field(2; "Employee No."; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(3; "Instalment No"; Integer)
        {
        }
        field(4; "Loan Amount"; Decimal)
        {
        }
        field(5; "Interest Rate"; Decimal)
        {
        }
        field(6; "Monthly Repayment"; Decimal)
        {
        }
        field(7; "Monthly Interest"; Decimal)
        {
        }
        field(8; "Repayment Date"; Date)
        {
            TableRelation = "Payroll PeriodX";
        }
        field(9; "Principal Repayment"; Decimal)
        {
        }
        field(10; "Loan Application No"; Code[20])
        {
        }
        field(11; "Loan Product Type"; Code[20])
        {
            TableRelation = "Loan Product Type";
        }
        field(12; "Loan Product Name"; Text[30])
        {
            CalcFormula = lookup("Loan Product Type".Description where(Code = field("Loan Product Type")));
            FieldClass = FlowField;
        }
        field(13; "Balance B/F"; Decimal)
        {
        }
        field(14; "Balance C/F"; Decimal)
        {
        }
        field(15; "Principal Ded Code"; Code[10])
        {
            CalcFormula = lookup("Loan Product Type"."Deduction Code" where(Code = field("Loan Product Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Interest Ded Code"; Code[10])
        {
            CalcFormula = lookup("Loan Product Type"."Interest Deduction Code" where(Code = field("Loan Product Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Principal Recovered"; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Code = field("Principal Ded Code"),
                                                                     "Payroll Period" = field("Repayment Date"),
                                                                     "Employee No" = field("Employee No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Interest Recovered"; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Code = field("Interest Ded Code"),
                                                                     "Payroll Period" = field("Repayment Date"),
                                                                     "Employee No" = field("Employee No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Cash Payment"; Decimal)
        {

            trigger OnValidate()
            begin
                //MESSAGE('Loan No: %1\Installment: %2',"Loan No.","Instalment No");
                //MESSAGE('Deduction Code: %1\Interest Code: %2',"Principal Ded Code","Interest Ded Code");
                //MESSAGE('Employee No:',"Employee No.");
                //"asignment-Matrix".SETFILTER("asignment-Matrix"."Payroll Period",'010115D');

                "asignment-Matrix".SetFilter("asignment-Matrix"."Employee No", "Employee No.");
                "asignment-Matrix".SetFilter("asignment-Matrix".Code, "Principal Ded Code");
                "asignment-Matrix".SetFilter("asignment-Matrix"."Payroll Period", Format("Repayment Date"));
                if "asignment-Matrix".FindFirst then begin
                    //MESSAGE('Deduction :%1',"asignment-Matrix".Amount);
                    "asignment-Matrix".Amount := 0;
                    "asignment-Matrix".Delete;
                end;

                "asignment-Matrix".Reset;

                "asignment-Matrix".SetFilter("asignment-Matrix"."Employee No", "Employee No.");
                "asignment-Matrix".SetFilter("asignment-Matrix".Code, "Interest Ded Code");
                "asignment-Matrix".SetFilter("asignment-Matrix"."Payroll Period", Format("Repayment Date"));
                if "asignment-Matrix".FindFirst then begin
                    //MESSAGE('Interest :%1',"asignment-Matrix".Amount);
                    "asignment-Matrix".Amount := 0;
                    "asignment-Matrix".Delete;

                end;



                //.........................................................................................
                k := "Instalment No" + 1;
                lrc.SetFilter(lrc."Loan No.", "Loan No.");
                j := "Instalment No" + 100;
                lrc.SetFilter(lrc."Instalment No", '%1..%2', k, j);
                confirm2 := Dialog.Confirm('Are you sure You want to Modify the Other Installments?');

                if confirm2 then begin
                    if lrc.FindSet then
                        repeat
                            lrc.Delete;
                            i += 1;
                        until lrc.Next = 0;
                end;

                Message('%1 Installments Modified', i);
            end;
        }
        field(21; Refinanced; Boolean)
        {

            trigger OnValidate()
            begin
                if Refinanced = true then begin //..........................................................1

                    //.........................................................................................
                    k := "Instalment No" + 1;
                    lrc.SetFilter(lrc."Loan No.", "Loan No.");
                    j := "Instalment No" + 500;
                    lrc.SetFilter(lrc."Instalment No", '%1..%2', k, j);
                    confirm2 := Dialog.Confirm('Are you sure You want to Refinance this Loan?');
                    Message('%1', loanamount);
                    if confirm2 then begin
                        if lrc.FindSet then
                            repeat
                                EmployeeName := "Employee Name";
                                lrc.Delete;
                                i += 1;
                            until lrc.Next = 0;

                        //Creating a new loan..........................................................................................
                        /*
                        LoanType.SETFILTER(LoanType.Code,"Loan Product Type");
                        IF LoanType.FINDFIRST THEN BEGIN  //...........P
                        LoanTypeCode:=LoanType."Loan No Series";
                        END;    //.....................................P
                        loanappilication."Loan Product Type":="Loan Product Type";
                        loanappilication."Employee No":="Employee No.";
                        //loanappilication."Employee Name":=EmployeeName;
                        loanappilication."Loan No":=NoSeriesMgt.GetNextNo(LoanTypeCode,TODAY,TRUE);
                        loanappilication."Refinanced From Loan:":="Loan No.";
                        loanappilication.INSERT;
                        loanappilication.SETFILTER(loanappilication."Loan Product Type","Loan Product Type");
                        loanappilication.SETFILTER(loanappilication."Employee No","Employee No.");
                        IF loanappilication.FINDLAST THEN BEGIN //...P
                        newloancreated:=loanappilication."Loan No";
                        END;    //...................................P
                        //opening the new Loan for Editing
                         OpenCard.SETTABLEVIEW(loanappilication);
                        //end opening the new loan for editing
                         */
                        //end creating a new loan ......................................................................................
                        Message('%1 Repayment Lines affected\The New Loan: %2 will Open So that You create the Schedule', i, newloancreated);

                        //OpenCard.RUN;
                    end;//.....................................................................................
                end;//............................................................................................................1

            end;
        }
        field(22; "Employee Name"; Text[100])
        {
            CalcFormula = lookup("Loan Application"."Employee Name" where("Employee No" = field("Employee No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Loan No.", "Instalment No", "Employee No.")
        {
            Clustered = true;
        }
        key(Key2; "Loan Product Type")
        {
        }
    }

    fieldgroups
    {
    }

    var
        lrc: Record "Loan Repayment Schedule";
        i: Integer;
        j: Integer;
        confirm: Dialog;
        confirm2: Boolean;
        k: Integer;
        "asignment-Matrix": Record "Assignment Matrix-X";
        loanappilication: Record "Loan Application";
        newloancreated: Code[20];
        newloantext: Text[250];
        NoSeriesMgt: Codeunit "No. Series";
        LoanType: Record "Loan Product Type";
        LoanTypeCode: Code[20];
        NoSeriesManagement: Codeunit "No. Series";
        EmployeeName: Text[100];
        loanamount: Decimal;
}
