#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50041 tableextension50041 extends Employee
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Job Title"(Field 6)".


        //Unsupported feature: Property Insertion (FieldClass) on ""Job Title"(Field 6)".


        //Unsupported feature: Property Insertion (CalcFormula) on ""Job Title"(Field 6)".


        //Unsupported feature: Property Insertion (Editable) on ""Job Title"(Field 6)".


        //Unsupported feature: Property Modification (Data type) on ""Phone No."(Field 13)".


        //Unsupported feature: Property Modification (Data type) on ""Mobile Phone No."(Field 14)".


        //Unsupported feature: Property Modification (Data type) on ""E-Mail"(Field 15)".


        //Unsupported feature: Property Modification (Data type) on ""Manager No."(Field 26)".


        //Unsupported feature: Property Modification (Name) on ""Grounds for Term. Code"(Field 35)".


        //Unsupported feature: Property Modification (Data type) on ""Company E-Mail"(Field 50)".


        //Unsupported feature: Property Modification (Data type) on "IBAN(Field 58)".


        //Unsupported feature: Property Modification (CalcFormula) on "Balance(Field 59)".


        //Unsupported feature: Property Modification (Data type) on ""Cost Center Code"(Field 1100)".


        //Unsupported feature: Code Insertion on ""Reason for termination Code"(Field 35)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF GTermination.GET("Reason for termination Code") THEN
        "Reason for termination" := GTermination.Description;
        */
        //end;
        field(90000; "Reason for termination Code"; Code[20])
        {
            //   trigger OnValidate()
            //Parameters and return type have not been exported.
            //begin
            /*
            IF GTermination.GET("Reason for termination Code") THEN
            "Reason for termination" := GTermination.Description;
            */
            //end;
        }
        field(50000; "Payroll Number"; Code[20])
        {
        }
        field(50001; Rank; Option)
        {
            OptionCaption = 'ADMIN';
            OptionMembers = ADMIN;
        }
        field(50002; Branch; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('BRANCH')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                Rec.CalcFields(Rec.Branch);
            end;
        }
        field(50003; "Registration Code"; Code[10])
        {
            Caption = 'Registration Code';
            TableRelation = "Cause of Absence";

            trigger OnValidate()
            begin
                if CauseOfAbsence.Get(Rec."Registration Code") then
                    //Description := CauseOfAbsence.Description;

                    if Rec."Registration Code" <> '' then begin
                        //VALIDATE("Unit of Measure Code",CauseOfAbsence."Unit of Measure Code");
                        // "Quantity (Base)":=1;
                        //VALIDATE("Quantity (Base)");
                    end;


                if Rec."Registration Code" = 'D' then
                    Rec.Shift := Rec.Shift::DAY;
                if Rec."Registration Code" = 'N' then
                    Rec.Shift := Rec.Shift::NIGHT;
                if Rec."Registration Code" = 'RD' then
                    Rec.Shift := Rec.Shift::DAY;
                if Rec."Registration Code" = 'RN' then
                    Rec.Shift := Rec.Shift::NIGHT;
                if Rec."Registration Code" = 'POD' then
                    Rec.Shift := Rec.Shift::DAY;
                if Rec."Registration Code" = 'PON' then
                    Rec.Shift := Rec.Shift::NIGHT;


                /*
               IF "Registration Code"='O' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
               IF "Registration Code"='L' THEN BEGIN
               Shift:=Shift::DAY;
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
               IF "Registration Code"='AB' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='P' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='UL' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               END;

               IF "Registration Code"='SB' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='SBH' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;


               IF "Registration Code"='SUP' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='T' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='SC' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='S' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='M' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='COD' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='CON' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;


               IF "Registration Code"='' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
                */

            end;
        }
        field(50004; Shift; Option)
        {
            OptionCaption = ' ,DAY,NIGHT';
            OptionMembers = " ",DAY,NIGHT;
        }
        field(50005; "Starting Date"; Date)
        {
        }
        field(50006; "Ending Date"; Date)
        {
        }
        field(50007; DaysDeployed; Integer)
        {
            CalcFormula = count("Employee Absence" where("Employee No." = field("No."),
                                                          Checked = filter(true)));
            FieldClass = FlowField;
        }
        field(50008; Paypoint; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('PAYPOINT')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                Rec.CalcFields(Rec.Branch);
            end;
        }
        field(50009; "Country Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COUNTRY'));
        }
        field(50010; "Staffing Group"; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('STAFFINGGRP')));
            FieldClass = FlowField;
        }
        field(50011; Department; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('DEPARTMENT')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(50013; "Region Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('REGION'));
        }
        field(50014; "Projects Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROJECTS'));
        }
        field(50015; "Total Allowances"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Cash Benefit" = const(false),
                                                                  "Normal Earnings" = const(true),
                                                                  "Pay Mode" = field("Pay Mode Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = filter(Deduction | Loan),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; Payment; Code[10])
        {
            TableRelation = "Bracket Tablesx";
        }
        field(50018; Deduction; Code[10])
        {
            TableRelation = "Assignment Matrix-X";
        }
        field(50019; "Posting Group"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Employee Posting GroupX";
        }
        field(50020; "Total Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Type = const("Saving Scheme"),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "Bank Account Number"; Code[100])
        {
        }
        field(50022; "Bank Branch"; Code[100])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank"));
        }
        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(50024; MobileBills; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E003'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50025; "Opening PAYE"; Decimal)
        {
        }
        field(50026; "Tax Deductible to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Tax Deductible" = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50027; "SSF Employer to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where("Tax Deductible" = const(true),
                                                                             "Employee No" = field("No."),
                                                                             "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50028; "Opening Employer SSF"; Decimal)
        {
        }
        field(50029; "Cumm. Basic Pay"; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX"."Basic Pay" where("Payroll Period" = field("Pay Period Filter"),
                                                                          Employee = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Tax Relief Amount"; Decimal)
        {
        }
        field(50031; "P.I.N"; Code[20])
        {
        }
        field(50032; "Passport No."; Code[20])
        {
        }
        field(50033; "Cumm. PAYE"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Paye = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50034; "Cumm. Net Pay"; Decimal)
        {
            Editable = false;
        }
        field(50037; "N.H.I.F No"; Code[20])
        {
        }
        field(50038; "Hourly Rate"; Decimal)
        {
        }
        field(50039; "Daily Rate"; Decimal)
        {
        }
        field(50040; "Pays N.H.I.F"; Boolean)
        {
        }
        field(50041; "Last Modified By"; Code[20])
        {
            Editable = false;
        }
        field(50042; "Gross Cash"; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E001'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50043; "Debtor Code"; Code[10])
        {
            TableRelation = Customer;
        }
        field(50045; "Benefits-Non Cash"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Cash Benefit" = const(true),
                                                                  Type = const(Payment),
                                                                  Taxable = const(true),
                                                                  Code = const('E0020')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50046; "Pay Mode"; Option)
        {
            OptionMembers = Bank,Cash,Cheque,"Bank Transfer";
        }
        field(50047; Housing; Option)
        {
            OptionMembers = Agricultural,Directors,Ordinary;
        }
        field(50048; "Home Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Type = const(Deduction),
                                                                  "Tax Deductible" = const(true),
                                                                  Retirement = const(false)));
            FieldClass = FlowField;
        }
        field(50049; "Retirement Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Tax Deductible" = const(true),
                                                                  Retirement = const(true)));
            FieldClass = FlowField;
        }
        field(50050; "Home Ownership Status"; Option)
        {
            OptionMembers = "None","Owner Occupier","Home Savings";
        }
        field(50051; "Owner Occupier"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Type = const(Payment),
                                                                  "Tax Deductible" = const(true)));
            FieldClass = FlowField;
        }
        field(50052; "National ID"; Code[20])
        {
        }
        field(50053; "House Rent"; Decimal)
        {
        }
        field(50054; "Employer Rent"; Boolean)
        {
        }
        field(50055; "Total Quarters"; Decimal)
        {
        }
        field(50056; "Cumulative Quarters"; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX".Quarters where(Employee = field("No."),
                                                                       "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50057; BfMpr; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX".BfMpr where(Employee = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50058; PensionNo; Code[10])
        {
        }
        field(50059; "Salary Scheme Category"; Code[20])
        {
            TableRelation = Categoryx;
        }
        field(50060; "Salary Steps"; Code[20])
        {

            trigger OnValidate()
            begin
                /*IF Employee.GET("No.") THEN
                IF Status=Employee.Status::Active THEN
                BEGIN
                // populate the basic salary based on the steps
                IF SalaryStep.GET("Salary Steps",SalaryStep.Level::"Level 1","Salary Scheme Category") THEN BEGIN
                 "Basic Pay":=SalaryStep."Basic amount";
                "Gross pay":=SalaryStep."Gross pay";
                END;
                // Get first open pay period
                PayPeriod.RESET;
                PayPeriod.SETRANGE(PayPeriod.Closed,FALSE);
                IF PayPeriod.FIND('-') THEN
                CurrentMonth:=PayPeriod."Starting Date";
                //House all
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."House All. Code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."House allowance";
                  AssMatrix.MODIFY;
                END; */
                /*
                //std allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Standard Overtime code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Standard overtime";
                  AssMatrix.MODIFY;
                END;
                //duty allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Duty Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Duty allowance";
                  AssMatrix.MODIFY;
                END;
                //personal allow
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Personal Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Personal allowance";
                  AssMatrix.MODIFY;
                END;
                // performance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Performance Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Perfomance allowance";
                  AssMatrix.MODIFY;
                END;
                //Standard Allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Std Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Std Allowance";
                  AssMatrix.MODIFY;
                END;
                // Dog handler
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Dog handlers allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Dog handlers allowance";
                  AssMatrix.MODIFY;
                END;
                
                // Public holiday
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Public holiday allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Public holiday allowance";
                  AssMatrix.MODIFY;
                END;
                
                // Insert
                
                //House all
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."House All. Code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."House All. Code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."House All. Code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."House allowance";
                  IF AssMatrix.Amount<>0 THEN
                    AssMatrix.INSERT;
                END;
                //std allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Standard Overtime code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Standard Overtime code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Standard Overtime code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Standard overtime";
                 IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                //duty allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Duty Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Duty Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Duty Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Duty allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                END;
                //personal allow
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Personal Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Personal Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Personal Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Personal allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                //Standard allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Std Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Std Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Personal Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Std Allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                // Dog handler
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Dog handlers allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Dog handlers allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Dog handlers allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Dog handlers allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                
                // performance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Performance Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Performance Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Performance Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix.Amount:=SalaryStep."Perfomance allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                END;
                
                // Public holiday allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Public holiday allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Public holiday allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Public holiday allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix.Amount:=SalaryStep."Public holiday allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                
                
                END;
                END ELSE
                ERROR('Employee not active');  */

            end;
        }
        field(50061; Level; Option)
        {
            OptionMembers = "Level 1","Level 2";
        }
        field(50065; "Share Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Shares = const(true)));
            Caption = 'coop skg fund';
            FieldClass = FlowField;
        }
        field(50066; TRelief; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E002'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50067; Overtime; Decimal)
        {
            Editable = false;
        }
        field(50068; Absence; Decimal)
        {
        }
        field(50069; "Other allowances"; Decimal)
        {
        }
        field(50070; "Total earnings"; Decimal)
        {
        }
        field(50071; PAYE; Decimal)
        {
        }
        field(50072; NHIF; Decimal)
        {
        }
        field(50073; NSSF; Code[50])
        {
        }
        field(50074; Advance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Code = field("Advance Code Filter")));
            FieldClass = FlowField;
        }
        field(50075; Loans; Decimal)
        {
        }
        field(50076; COOP; Decimal)
        {
        }
        field(50077; "Other deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Paye = const(false)));
            FieldClass = FlowField;
        }
        field(50079; "Net pay"; Decimal)
        {
        }
        field(50080; "Advance Code Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = DeductionsX.Code;
        }
        field(50081; "Gross pay"; Decimal)
        {
        }
        field(50082; interest; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Interest Amount" where("Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             Type = filter(Deduction)));
            FieldClass = FlowField;
        }
        field(50083; "Working Hourss"; Decimal)
        {

            trigger OnValidate()
            begin
                Rec."Hourly Rate" := Rec."Daily Rate" / Rec."Working Hours";
            end;
        }
        field(50084; "No. Of Days Worked"; Decimal)
        {
            Editable = false;
        }
        field(50085; "No. of Hours"; Decimal)
        {
            Editable = false;
        }
        field(50086; "No. Of Hours Weekend"; Decimal)
        {
            Editable = false;
        }
        field(50087; Basic; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Basic Salary Code" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50088; ECode; Code[10])
        {
        }
        field(50089; SKey; Code[20])
        {
        }
        field(50090; Employer; Code[20])
        {
        }
        field(50091; "Taxable Income"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50092; "Job ID"; Code[20])
        {
            TableRelation = "Company Jobs";
        }
        field(50094; "Home Phone Number"; Text[15])
        {
        }
        field(50095; "Cellular Phone Number"; Text[15])
        {
        }
        field(50096; "Work Phone Number"; Text[15])
        {
        }
        field(50097; "Ext."; Text[7])
        {
        }
        field(50098; "ID Number"; Text[30])
        {
        }
        field(50099; Gender1; Option)
        {
            OptionMembers = Female,Male;
        }
        field(50100; "Fax Number"; Text[30])
        {
        }
        field(50104; "Known As"; Text[30])
        {

            trigger OnValidate()
            begin
                /*IF (("Known As" <> xRec."Known As") AND  (xRec."Known As" <> ''))  THEN BEGIN
                       CareerEvent.SetMessage('Changing First Name in Career History');
                       CareerEvent.RUNMODAL;
                       OK:= CareerEvent.ReturnResult;
                        IF OK THEN BEGIN
                           CareerHistory.INIT;
                           IF NOT CareerHistory.FIND('-') THEN
                            CareerHistory."Line No.":=1
                          ELSE BEGIN
                            CareerHistory.FIND('+');
                            CareerHistory."Line No.":=CareerHistory."Line No."+1;
                          END;
                
                           CareerHistory.Reason := CareerEvent.ReturnReason;
                           CareerHistory."Employee No.":= "No.";
                           CareerHistory."Date Of Event":= WORKDATE;
                           CareerHistory."Career Event":= 'Surname Changed';
                           CareerHistory."Last Name":= "Last Name";
                           CareerHistory."Employee First Name":= "Known As";
                           CareerHistory."Employee Last Name":= "Last Name";
                
                           CareerHistory.INSERT;
                        END;
                    END;
                  */

            end;
        }
        field(50105; Position; Text[30])
        {
            TableRelation = "Company Jobs";

            trigger OnValidate()
            begin
                /*IF Jobs.GET(Position) THEN
                    "Job Title":=Jobs."Job Description";
                
                
                    IF ((Position <> xRec.Position) AND (xRec.Position <> '')) THEN BEGIN
                        Jobs.RESET;
                        Jobs.SETRANGE(Jobs."Job ID",Position);
                        IF Jobs.FIND('-') THEN BEGIN
                        "Job Title":=Jobs."Job Description";
                
                            Payroll.RESET;
                            Payroll.SETRANGE(Payroll."No.","No.");
                            IF Payroll.FIND('-') THEN BEGIN
                                Payroll."Salary Scheme Category":=Jobs.Category;
                                Payroll."Salary Steps":=Jobs.Grade;
                                Payroll.VALIDATE(Payroll."Salary Steps");
                                Payroll.MODIFY;
                            END
                        END;
                */

                /*

                  CareerEvent.SetMessage('Job Title Changed');
                  CareerEvent.RUNMODAL;
                  OK:= CareerEvent.ReturnResult;
                   IF OK THEN BEGIN
                      CareerHistory.INIT;
                      IF NOT CareerHistory.FIND('-') THEN
                       CareerHistory."Line No.":=1
                     ELSE BEGIN
                       CareerHistory.FIND('+');
                       CareerHistory."Line No.":=CareerHistory."Line No."+1;
                     END;

                      CareerHistory."Employee No.":= "No.";
                      CareerHistory."Date Of Event":= WORKDATE;
                      CareerHistory."Career Event":= 'Job Title Changed';
                      CareerHistory."Job Title":= "Job Title";
                      CareerHistory."Employee First Name":= "Known As";
                      CareerHistory."Employee Last Name":= "Last Name";
                      CareerHistory.INSERT;
                   END;
                  */

                // END;

            end;
        }
        field(50106; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time";

            trigger OnValidate()
            begin
                /*IF ("Full / Part Time" <> xRec."Full / Part Time") THEN BEGIN
                   CareerEvent.SetMessage('Full / Part Time Changed');
                   CareerEvent.RUNMODAL;
                   OK:= CareerEvent.ReturnResult;
                    IF OK THEN BEGIN
                       CareerHistory.INIT;
                       IF NOT CareerHistory.FIND('-') THEN
                        CareerHistory."Line No.":=1
                      ELSE BEGIN
                        CareerHistory.FIND('+');
                        CareerHistory."Line No.":=CareerHistory."Line No."+1;
                      END;

                       CareerHistory."Employee No.":= "No.";
                       CareerHistory."Date Of Event":= WORKDATE;
                       CareerHistory."Career Event":= 'Full / Part Time Changed';
                       CareerHistory."Full/Part Time":= "Full / Part Time";
                       CareerHistory."Employee First Name":= "Known As";
                       CareerHistory."Employee Last Name":= "Last Name";
                       CareerHistory.INSERT;
                    END;
                END;
               */

            end;
        }
        field(50107; "Contract Type"; Code[20])
        {
        }
        field(50108; "Contract End Date"; Date)
        {
        }
        field(50109; "Notice Period"; Code[10])
        {
        }
        field(50110; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;

            trigger OnValidate()
            begin
                /* IF ("Marital Status" <> xRec."Marital Status") THEN BEGIN
                    CareerEvent.SetMessage('Marital Status Changed');
                    CareerEvent.RUNMODAL;
                    OK:= CareerEvent.ReturnResult;
                     IF OK THEN BEGIN
                        CareerHistory.INIT;
                        IF NOT CareerHistory.FIND('-') THEN
                         CareerHistory."Line No.":=1
                       ELSE BEGIN
                         CareerHistory.FIND('+');
                         CareerHistory."Line No.":=CareerHistory."Line No."+1;
                       END;

                        CareerHistory."Employee No.":= "No.";
                        CareerHistory."Date Of Event":= WORKDATE;
                        CareerHistory."Career Event":= 'Marital Status Changed';
                        CareerHistory."Marital Status":= "Marital Status";
                        CareerHistory."Employee First Name":= "Known As";
                        CareerHistory."Employee Last Name":= "Last Name";
                        CareerHistory.INSERT;
                     END;
                 END;
                 */

            end;
        }
        field(50111; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;

            trigger OnValidate()
            begin
                /*EmployeeEquity.SETRANGE("Employee No.","No.");
                OK:= EmployeeEquity.FIND('-');
                IF OK THEN BEGIN
                  EmployeeEquity."Ethnic Origin":= "Ethnic Origin";
                  EmployeeEquity.MODIFY;
                END;
                 */

            end;
        }
        field(50112; "First Language (R/W/S)"; Code[10])
        {
            TableRelation = "Company Jobs";
        }
        field(50113; "Driving Licence"; Code[20])
        {
        }
        field(50114; "Date Of Birth"; Date)
        {
        }
        field(50115; Age; Text[80])
        {
        }
        field(50116; "Date Of Join"; Date)
        {

            trigger OnValidate()
            begin
                /*HumanResSetup.GET;
                DateInt:=DATE2DMY("Date Of Join",1);
                "Pro-Rata on Joining":=HumanResSetup."No. Of Days in Month"-DateInt+1;
                
                */

            end;
        }
        field(50117; "Length Of Service"; Text[80])
        {
        }
        field(50118; "End Of Probation Date"; Date)
        {
        }
        field(50119; "Pension Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                if (Rec."Date Of Leaving" <> 0D) and (Rec."Pension Scheme Join" <> 0D) then
                    Rec."Time Pension Scheme" := Dates.DetermineAge(Rec."Pension Scheme Join", Rec."Date Of Leaving");
            end;
        }
        field(50120; "Time Pension Scheme"; Text[70])
        {
        }
        field(50121; "Medical Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                /*  IF  ("Date Of Leaving" <> 0D) AND ("Medical Scheme Join" <> 0D) THEN
                   "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");
                */

            end;
        }
        field(50122; "Time Medical Scheme"; Text[70])
        {
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(50123; "Date Of Leaving"; Date)
        {

            trigger OnValidate()
            begin
                /*  IF ("Date Of Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                   "Length Of Service":= Dates.DetermineAge("Date Of Join","Date Of Leaving");
                  IF ("Pension Scheme Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                   "Time Pension Scheme":= Dates.DetermineAge("Pension Scheme Join","Date Of Leaving");
                  IF ("Medical Scheme Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                   "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");


                  IF ("Date Of Leaving" <> 0D) AND ("Date Of Leaving" <> xRec."Date Of Leaving") THEN BEGIN
                     ExitInterviews.SETRANGE("Employee No.","No.");
                     OK:= ExitInterviews.FIND('-');
                     IF OK THEN BEGIN
                       ExitInterviews."Date Of Leaving":= "Date Of Leaving";
                       ExitInterviews.MODIFY;
                     END;
                     COMMIT();
                  END;


                 IF ("Date Of Leaving" <> 0D) AND ("Date Of Leaving" <> xRec."Date Of Leaving") THEN BEGIN
                    CareerEvent.SetMessage('Left The Company');
                    CareerEvent.RUNMODAL;
                    OK:= CareerEvent.ReturnResult;
                     IF OK THEN BEGIN
                        CareerHistory.INIT;
                        IF NOT CareerHistory.FIND('-') THEN
                         CareerHistory."Line No.":=1
                       ELSE BEGIN
                         CareerHistory.FIND('+');
                         CareerHistory."Line No.":=CareerHistory."Line No."+1;
                       END;

                        CareerHistory."Employee No.":= "No.";
                        CareerHistory."Date Of Event":= "Date Of Leaving";
                        CareerHistory."Career Event":= 'Left The Company';
                        CareerHistory."Employee First Name":= "Known As";
                        CareerHistory."Employee Last Name":= "Last Name";

                        CareerHistory.INSERT;
                     END;
                 END;
               */

            end;
        }
        field(50124; "Second Language (R/W/S)"; Code[10])
        {
        }
        field(50125; "Additional Language"; Code[10])
        {
        }
        field(50126; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
                //**Added by ACR 12/08/2002
                //**Block resource if Terminated

                if Rec."Resource No." <> '' then begin
                    OK := "Lrec Resource".Get(Rec."Resource No.");
                    "Lrec Resource".Blocked := true;
                    "Lrec Resource".Modify;
                end;

                //**
            end;
        }
        field(50127; "Department:"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(50129; Citizenship; Code[10])
        {
        }
        field(50130; "Passport Number"; Text[20])
        {
        }
        field(50137; "PIN Number"; Code[20])
        {
        }
        field(50138; "NSSF No."; Code[20])
        {
        }
        field(50139; "NHIF No."; Code[20])
        {
        }
        field(50142; "HELB No"; Text[30])
        {
        }
        field(50143; "Co-Operative No"; Text[30])
        {
        }
        field(50144; "Position To Succeed"; Code[20])
        {
            TableRelation = "Company Jobs"."Job ID";

            trigger OnValidate()
            begin
                /*SuccessionGap.RESET;
                SuccessionGap.SETRANGE(SuccessionGap."Employee No","No.");
                IF SuccessionGap.FIND('-') THEN
                SuccessionGap.DELETEALL;
                
                JobReq.RESET;
                JobReq.SETRANGE(JobReq."Job Id","Position To Succeed");
                IF JobReq.FIND('-') THEN
                BEGIN
                REPEAT
                IF NOT EmpQualification.GET("No.",JobReq."Qualification Code") THEN
                BEGIN
                SuccessionGap.INIT;
                SuccessionGap."Employee No":="No.";
                SuccessionGap."Job Id":=JobReq."Job Id";
                SuccessionGap."Qualification Type":=JobReq."Qualification Type";
                SuccessionGap."Qualification Code":=JobReq."Qualification Code";
                SuccessionGap.Qualification:=JobReq.Qualification;
                SuccessionGap.Priority:=JobReq.Priority;
                SuccessionGap.INSERT;
                END;
                UNTIL JobReq.NEXT = 0;
                END;
                */

            end;
        }
        field(50145; "Succesion Date"; Date)
        {
        }
        field(50146; "Send Alert to"; Code[80])
        {
        }
        field(50147; Religion; Code[20])
        {
        }
        field(50149; "Served Notice Period"; Boolean)
        {
        }
        field(50150; "Exit Interview Date"; Date)
        {
        }
        field(50151; "Exit Interview Done by"; Code[100])
        {
            TableRelation = "User Setup";
        }
        field(50152; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(50153; "Postal Address"; Text[80])
        {
        }
        field(50154; "Residential Address"; Text[80])
        {
        }
        field(50155; "Postal Address2"; Text[30])
        {
        }
        field(50156; "Postal Address3"; Text[20])
        {
        }
        field(50157; "Residential Address2"; Text[30])
        {
        }
        field(50158; "Residential Address3"; Text[20])
        {
        }
        field(50159; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(50160; "Incremental Month"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(50161; "Current Date"; Date)
        {
        }
        field(50162; Present; Code[30])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field("Salary Scale"));

            trigger OnValidate()
            begin
                Rec.GetPayPeriod;

                ScaleBenefits.Reset;
                ScaleBenefits.SetRange(ScaleBenefits."Salary Scale", Rec."Salary Scale");
                ScaleBenefits.SetRange(ScaleBenefits."Salary Pointer", Rec.Present);
                if ScaleBenefits.Find('-') then
                    repeat
                        AssMatrix.Init;
                        AssMatrix."Employee No" := Rec."No.";
                        AssMatrix.Validate(AssMatrix."Employee No");
                        AssMatrix.Type := AssMatrix.Type::Payment;
                        AssMatrix.Code := ScaleBenefits."ED Code";
                        AssMatrix.Validate(AssMatrix.Code);
                        // MESSAGE('Payroll period %1',Begindate);
                        AssMatrix."Payroll Period" := Begindate;
                        AssMatrix.Amount := ScaleBenefits.Amount;
                        /*IF NOT AssMatrix.GET(AssMatrix."Employee No",AssMatrix.Type,AssMatrix.Code,AssMatrix."Payroll Period",
                        AssMatrix."Reference No") THEN*/
                        if not AssMatrix.Insert then
                            AssMatrix.Modify;
                    until ScaleBenefits.Next = 0;
                Ded.Reset;
                //Ded.SETRANGE(Ded."Calculation Method",Ded."Calculation Method"::"% of Basic Pay");
                if Ded.Find('-') then begin
                    repeat
                        AssMatrix.Reset;
                        AssMatrix.SetRange(AssMatrix."Employee No", Rec."No.");
                        AssMatrix.SetRange(AssMatrix.Code, Ded.Code);
                        AssMatrix.SetRange(AssMatrix."Payroll Period", Begindate);
                        if AssMatrix.FindFirst then begin
                            AssMatrix.Validate(Code);
                            AssMatrix.Modify;
                        end;
                    until Ded.Next = 0
                end;

            end;
        }
        field(50163; Previous; Code[30])
        {
            Editable = false;
            TableRelation = "Salary Pointers"."Salary Pointer";
        }
        field(50164; Halt; Code[30])
        {
            Editable = false;
        }
        field(50165; "Salary Scale"; Code[30])
        {
            TableRelation = "Salary Scales".Scale;

            trigger OnValidate()
            begin
                if Scale.Get(Rec."Salary Scale") then
                    Rec.Halt := Scale."Maximum Pointer";
                /*GetPayPeriod();
                   ScaleBenefits.RESET;
                   ScaleBenefits.SETRANGE("Salary Scale","Salary Scale");
                   ScaleBenefits.SETRANGE("Salary Pointer",Halt);
                   IF ScaleBenefits.FIND('-') THEN
                   BEGIN
                    REPEAT
                
                      IF AssMatrix.GET("No.",AssMatrix.Type::Payment,ScaleBenefits."ED Code",Begindate) THEN
                     BEGIN
                
                     AssMatrix.Code:=ScaleBenefits."ED Code";
                     AssMatrix.VALIDATE(Code);
                     AssMatrix.Amount:=ScaleBenefits.Amount;
                     AssMatrix.VALIDATE(Amount);
                     AssMatrix.VALIDATE("Employee No");
                      //Assmatrix.VALIDATE("Currency Code");
                     AssMatrix.MODIFY;
                     MESSAGE('%1,  has been changed to %2, effective %3',AssMatrix.Description,AssMatrix.Amount,Begindate);
                     END;
                    UNTIL ScaleBenefits.NEXT=0;
                    END;*/

            end;
        }
        field(50166; Insurance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Insurance Code" = const(true)));
            FieldClass = FlowField;
        }
        field(50167; "days worked"; Decimal)
        {
        }
        field(50168; "Pro-Rata on Joining"; Decimal)
        {
        }
        field(50169; "Pro-rata on Leaving"; Decimal)
        {
        }
        field(50170; "Date OfJoining Payroll"; Date)
        {
        }
        field(50171; "PAYE Diff"; Decimal)
        {
        }
        field(50172; "Pro-Rata Calculated"; Boolean)
        {
        }
        field(50173; "Half Pay"; Boolean)
        {
        }
        field(50174; "Basic Arrears"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Basic Pay Arrears" = const(true)));
            FieldClass = FlowField;
        }
        field(50175; "Relief Amount"; Decimal)
        {
            CalcFormula = - sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Non-Cash Benefit" = const(true),
                                                                   Type = const(Payment),
                                                                   "Tax Deductible" = const(true),
                                                                   "Tax Relief" = const(false)));
            FieldClass = FlowField;
        }
        field(50176; "Employee Qty"; Integer)
        {
            CalcFormula = count(Employee);
            FieldClass = FlowField;
        }
        field(50177; "Employee Act. Qty"; Integer)
        {
            CalcFormula = count(Employee where(Status = const(Active)));
            FieldClass = FlowField;
        }
        field(50178; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = count(Employee where(Status = filter(Inactive | Terminated)));
            FieldClass = FlowField;
        }
        field(50179; "Other Language Read"; Boolean)
        {
        }
        field(50180; "Other Language Write"; Boolean)
        {
        }
        field(50181; "Other Language Speak"; Boolean)
        {
        }
        field(50182; "Employee Job Type"; Option)
        {
            OptionCaption = '  ,Driver';
            OptionMembers = "  ",Driver;
        }
        field(50183; cumul; Integer)
        {
        }
        field(50184; Country; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('COUNTRY')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                Rec.CalcFields(Rec.Branch);
            end;
        }
        field(50185; Region; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('REGION')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                Rec.CalcFields(Rec.Branch);
            end;
        }
        field(50186; Projects; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('PROJECTS')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                Rec.CalcFields(Rec.Branch);
            end;
        }
        field(69000; "Pays SSF?"; Boolean)
        {
        }
        field(69001; "Pays tax?"; Boolean)
        {
        }
        field(69002; "Section/Location"; Code[10])
        {

            trigger OnValidate()
            begin
                //IF SalaryGrade.GET("Salary Grade") THEN
                //"Basic Pay":=SalaryGrade."Minimum salary";
                //MaximumPay:=SalaryGrade."Maximum Salary";
            end;
        }
        field(69003; "Basic Pay"; Decimal)
        {
        }
        field(69004; "Salary Type"; Code[10])
        {
        }
        field(69005; "Paid Overtime?"; Boolean)
        {
        }
        field(69006; "Tax Relief"; Boolean)
        {
        }
        field(69007; "Overtime taxed"; Boolean)
        {
        }
        field(69008; "Agency Car"; Boolean)
        {
        }
        field(69009; "Housed by Employer"; Boolean)
        {
        }
        field(69010; "Employee's Bank"; Code[80])
        {
            TableRelation = "Employee Bank AccountX";
        }
        field(69011; "Paying Bank Code"; Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(69012; "Taxable Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Taxable = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Tax Deductible Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Tax Deductible" = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Cash Benefit" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69014; "Employee Type"; Option)
        {
            FieldClass = Normal;
            OptionCaption = 'Project,Normal';
            OptionMembers = Project,Normal;
        }
        field(69015; "Total Allowances1"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Cash Benefit" = const(false),
                                                                  "Normal Earnings" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69016; "Bank Name"; Text[80])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69017; "Bank Branch Name"; Text[80])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69019; "Terminal Dues"; Boolean)
        {
        }
        field(69020; "Normal Working Days"; Integer)
        {
            CalcFormula = count("Employee Absence" where("Cause of Absence Code" = filter('D' | 'N' | 'RD' | 'RN' | 'T' | 'SUP' | 'SB' | 'IND' | 'U'),
                                                          Checked = const(true),
                                                          "Employee No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69021; "Public Holiday Days"; Integer)
        {
            Editable = false;
        }
        field(69022; "Absent Days"; Integer)
        {
            Editable = false;
        }
        field(69023; "Pay Wages"; Boolean)
        {
        }
        field(69024; "Payroll Group"; Option)
        {
            CalcFormula = lookup("Employee Posting GroupX"."Payroll Group" where(Code = field("Posting Group")));
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ' ,Guards,Admin,Management';
            OptionMembers = " ",Guards,Admin,Management;
        }
        field(69025; "Payroll Period"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(69026; "Exempt Job Book OT/LD"; Boolean)
        {
        }
        field(69027; "Night Allowance Days"; Integer)
        {
            Editable = false;
        }
        field(69028; "Unpaid Leave Days"; Integer)
        {
            Editable = false;
        }
        field(69029; "Total Statutory"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Type = const(Deduction),
                                                                  Description = filter('PAYE' | 'NHIF' | 'NSSF'),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(69030; "Send Payslip By E-mail?"; Boolean)
        {
        }
        field(69046; "House Allowance1"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(HouseAllowance)));
            FieldClass = FlowField;
        }
        field(69047; "Transport Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(TransportAllowance)));
            FieldClass = FlowField;
        }
        field(69048; "Basic Salary"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(Basic)));
            FieldClass = FlowField;
        }
        field(69049; Classification; Code[20])
        {
            //   TableRelation = Table0;
        }
        field(69050; "Leave Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(Leave)));
            FieldClass = FlowField;
        }
        field(69051; "Overtime Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(OT)));
            FieldClass = FlowField;
        }
        field(69052; "Directors Fees"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(DirectorsFees)));
            FieldClass = FlowField;
        }
        field(69053; "Lump Sum"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(LumpSum)));
            FieldClass = FlowField;
        }
        field(69054; "Other Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(Others)));
            FieldClass = FlowField;
        }
        field(69055; "Non Cash Benefit"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(NonCashBenefit)));
            FieldClass = FlowField;
        }
        field(69056; MPR; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(MPR)));
            FieldClass = FlowField;
        }
        field(69057; "Insurance Relief"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(InsuranceRelief)));
            FieldClass = FlowField;
        }
        field(69058; "Days Worked per week"; Integer)
        {
            Editable = false;
        }
        field(69059; "Total Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = filter('ANNUAL' | 'MATERNITY' | 'PATENITY' | 'STUDY' | 'TIMEOFF'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69060; "Annual Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('ANNUAL'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69061; "Compassionate Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('COMPASSIONATE'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69062; "Maternity Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('MATERNITY'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69063; "Paternity Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('PATERNITY'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69064; "Study Leave Days"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('STUDY'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69065; "Unpaid Leave"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('UNPAID'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69066; "Sick Leave"; Decimal)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = const('SICK'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69068; "Non-Fluctuating Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Taxable = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Fluctuating" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69069; "Leave Status"; Option)
        {
            OptionCaption = ' ,On Leave,Resumed';
            OptionMembers = " ","On Leave",Resumed;
        }
        field(69070; "User ID"; Code[50])
        {
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = true;

            trigger OnLookup()
            begin
                UserMgt.DisplayUserInformation(Rec."User ID");
            end;

            trigger OnValidate()
            var
                user1: record User;
            begin
                UserMgt.ValidateUserName(user1, user1, Rec."User ID");
            end;
        }
        field(69071; "Leave Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HR Leave Types".Code;
        }
        field(69072; "Allocated Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             Closed = filter(false),
                                                                             "Current Period" = filter(true),
                                                                             "Leave Entry Type" = filter(Positive)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Rec.CalcFields(Rec."Total Leave Taken");
                Rec."Total (Leave Days)" := Rec."Allocated Leave Days" + Rec."Reimbursed Leave Days";
                //SUM UP LEAVE LEDGER ENTRIES
                Rec."Leave Balance" := Rec."Total (Leave Days)" + Rec."Total Leave Taken";
                //TotalDaysVal := Rec."Total Leave Taken";
            end;
        }
        field(69073; "End of Contract Date"; Date)
        {
        }
        field(69074; "Leave Period Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HR Leave Periods 2"."Starting Date" where("New Fiscal Year" = const(false));
        }
        field(69075; "Annual Leave Account"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('ANNUAL'),
                                                                             "Staff No." = field("No."),
                                                                             "Leave Entry Type" = filter(<> Reimbursement)));
            FieldClass = FlowField;
        }
        field(69076; "Compassionate Leave Acc."; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('COMPASSIONATE'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69077; "Maternity Leave Acc."; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('MATERNITY'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69078; "Paternity Leave Acc."; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('PATERNITY'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69079; "Sick Leave Acc."; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('SICK'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69080; "Study Leave Acc"; Decimal)
        {
        }
        field(69081; "Total Leave Taken"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Entry Type" = const(Negative),
                                                                             Closed = const(false),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Current Period" = filter(true)));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(69082; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(69083; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(69084; "Reimbursed Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             Closed = const(false),
                                                                             BF = const(true)));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Rec.Validate(Rec."Allocated Leave Days");
            end;
        }
        field(69085; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(69086; "Leave Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(69087; "Leave Outstanding Bal"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             Closed = filter(false),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Current Period" = filter(true)));
            FieldClass = FlowField;
        }
        field(69088; "Acrued Leave Days"; Decimal)
        {
        }
        field(69089; "On Leave"; Boolean)
        {
        }
        field(69090; "Total Gratuity Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Gratuity Amount" where("Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             "Basic Salary Code" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69091; "Research Center"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Center" where("Research Center?" = const(true));
        }
        field(70000; "Overtime1.5"; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Hours 1.5" where("Employee No" = field("No."),
                                                                          Code = const('E007'),
                                                                          "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70001; "Overtime2.0"; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Hours 2.0" where("Employee No" = field("No."),
                                                                          Code = const('E009'),
                                                                          "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70003; Leave; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Leave Days" where("Employee No" = field("No."),
                                                                           Closed = filter(false),
                                                                           Code = const('E008')));
            FieldClass = FlowField;
        }
        field(70004; LostDays; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X".Lostdays where("Employee No" = field("No."),
                                                                       Closed = filter(false),
                                                                       Code = const('E014')));
            FieldClass = FlowField;
        }
        field(70005; "Emp F L"; Text[20])
        {
        }
        field(70006; "Payroll Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
        }
        field(70007; "Pay Mode Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Pay Mode";
        }
        field(70008; "Department Name"; Code[70])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70009; "Employement Terms"; Option)
        {
            OptionMembers = Contract,"Permanent ",Seconded,"Intern/Attachee";
        }
        field(70010; Position1; Code[20])
        {
        }
        field(70011; HOD; Boolean)
        {
        }
        field(70012; HR; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70013; "Medical Scheme Join Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70015; "Claim Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70016; "Reason for termination"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70017; "Exit Interview Conducted"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"));
        }
        field(70020; "Date Joined DC"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70021; "Date Joined DB"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70022; Supervisor; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = true;

            trigger OnLookup()
            begin
                UserMgt.DisplayUserInformation(Rec."User ID");
            end;

            trigger OnValidate()
            var
                user1: record User;
            begin
                UserMgt.ValidateUserName(user1, user1, Rec."User ID");
            end;
        }
        field(70023; "Job No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(70024; "Job Task No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"));
        }
        field(70025; "Examination Leave Acc"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Leave Type" = const('EXAMINATION'),
                                                                             "Staff No." = field("No."),
                                                                             "Leave Entry Type" = const(Positive)));
            FieldClass = FlowField;
        }
        field(70026; "Employer Pension"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where("Tax Deductible" = const(true),
                                                                             "Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             Code = filter('D001' | 'D002')));
            FieldClass = FlowField;
        }
        field(70027; "Excess Pension"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Taxable = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Code = filter('E0020'),
                                                                  "Non-Cash Benefit" = const(true)));
            FieldClass = FlowField;
        }
        field(70028; "Other Leave Types"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Entry Type" = const(Negative),
                                                                             Closed = const(false),
                                                                             "Leave Type" = filter(<> 'ANNUAL'),
                                                                             "Current Period" = const(true)));
            Caption = 'Other Leave Types Taken';
            FieldClass = FlowField;
        }
        field(70029; "Other Leave Types Allocated"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Entry Type" = const(Positive),
                                                                             Closed = const(false),
                                                                             "Leave Type" = filter(<> 'ANNUAL')));
            FieldClass = FlowField;
        }
        field(70030; "Total Allowance(AHL)"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Cash Benefit" = const(false),
                                                                  "Normal Earnings" = const(true),
                                                                  "Exclude Housing Levy" = const(false)));
            FieldClass = FlowField;
        }
        field(70031; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    procedure GetPayPeriod()
    begin
        PayPeriod.Reset;
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            Begindate := PayPeriod."Starting Date";
            //MESSAGE('%1',Begindate);
        end;
    end;

    procedure CreateResource(): Boolean
    var
        ResourceRec: Record Resource;
        ResourceGroup: Record "Resource Group";
    begin
        if not ResourceRec.Get(Rec."No.") then begin
            ResourceRec."No." := Rec."No.";
            ResourceRec.Name := Rec."First Name" + ' ' + Rec."Middle Name" + ' ' + Rec."Last Name";
            ResourceRec."Job Title" := Rec."Job Title";
            ResourceRec.Type := ResourceRec.Type::Person;
            /*IF NOT ResourceGroup.GET("Salary Scale") THEN
              ERROR(Text000,"Salary Scale");*/
            ResourceRec."Resource Group No." := Rec."Salary Scale";
            ResourceRec.Insert;
            exit(true)
        end else
            exit(false);

    end;

    procedure CreateCustomer(): Boolean
    var
        CustRec: Record Customer;
        CashMgtSetup: Record "Cash Management Setup";
    begin
        if not CustRec.Get(Rec."No.") then begin
            CashMgtSetup.Get;
            CashMgtSetup.TestField("Imprest Posting Group");
            CustRec."No." := Rec."No.";
            CustRec.Name := Rec."First Name" + ' ' + Rec."Middle Name" + ' ' + Rec."Last Name";
            CustRec."Customer Posting Group" := CashMgtSetup."Imprest Posting Group";
            CustRec.Insert;
            exit(true)
        end else
            exit(false);
    end;


    //Unsupported feature: Property Modification (Id) on "AlternativeAddr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //AlternativeAddr : 1004;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AlternativeAddr : 1554;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "BlockedEmplForJnrlPostingErr(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //BlockedEmplForJnrlPostingErr : 1017;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BlockedEmplForJnrlPostingErr : 1517;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "EmployeeLinkedToResourceErr(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //EmployeeLinkedToResourceErr : 1018;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EmployeeLinkedToResourceErr : 2018;
    //Variable type has not been exported.

    var
        CauseOfAbsence: Record "Cause of Absence";
        Dates: Codeunit "HR Dates";
        SalPointer: Record "Salary Pointers";
        Scale: Record "Salary Scales";
        DateInt: Integer;
        Earnings: Record EarningsX;
        AssMatrix: Record "Assignment Matrix-X";
        Ded: Record DeductionsX;
        PayPeriod: Record "Payroll PeriodX";
        ScaleBenefits: Record "Scale Benefits";
        PeriodStartDate: Date;
        Begindate: Date;
        Payroll: Record Employee;
        OK: Boolean;
        "....added by daudi....": Integer;
        UserMgt: Codeunit "User Management";

    var
        GTermination: Record "Grounds for Termination";
        DedS: Record DeductionsX;
}
