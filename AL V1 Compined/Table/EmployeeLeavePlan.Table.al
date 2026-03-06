#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69047 "Employee Leave Plan"
{
    DrillDownPageID = "Completed Training Planing";
    LookupPageID = "Completed Training Planing";

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if emp.Get("Employee No") then begin
                    "Employee Name" := Format(emp.Title) + ' ' + emp."First Name" + ' ' + emp."Middle Name" + '' + emp."Last Name";
                    "Date of Joining Company" := EmpRec."Date Of Join";
                    "Department Code" := emp."Global Dimension 1 Code";
                    LeaveTypes.Reset;
                    LeaveTypes.SetRange(LeaveTypes."Annual Leave", true);
                    if LeaveTypes.Find('-') then
                        "Leave Code" := LeaveTypes.Code;

                end;
            end;
        }
        field(2; "Application No"; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                "Application Date" := Today;
                if UserSertup.Get(UserId) then begin
                    //"Employee No":=UserSertup."Open Service Contract";
                    Validate("Employee No");
                    "User ID" := UserId;
                    if EmpRec.Get("Employee No") then
                        "Department Code" := EmpRec."Global Dimension 1 Code";
                end;
            end;
        }
        field(3; "Leave Code"; Code[20])
        {
            TableRelation = "Leave Types";

            trigger OnValidate()
            begin
                if xRec.Status <> Status::Open then
                    Error('You cannot change a document an approved document');


                emp.Get("Employee No");
                if LeaveTypes.Get("Leave Code") then begin
                    if LeaveTypes.Gender = LeaveTypes.Gender::Female then
                        if emp.Gender1 = emp.Gender1::Male then
                            Error('%1 can only be assigned to %2 employees', LeaveTypes.Description, LeaveTypes.Gender);

                    if LeaveTypes.Gender = LeaveTypes.Gender::Male then
                        if emp.Gender1 = emp.Gender1::Female then
                            Error('%1 can only be assigned to %2 employees', LeaveTypes.Description, LeaveTypes.Gender);
                    "Leave Entitlment" := LeaveTypes.Days;

                    CalcFields("Total Leave Days Taken", "Recalled Days", "Off Days");
                    "Leave balance" := "Leave Entitlment" + "Recalled Days" + "Off Days" - "Total Leave Days Taken";
                    if "Days Applied" > "Leave balance" then
                        Error('The days applied for are more than your leave balance');


                end;


                if EmpLeave.Get("Employee No", "Leave Code", "Maturity Date") then begin
                    if "Leave Earned to Date" = 0 then
                        "Leave Entitlment" := EmpLeave.Entitlement + EmpLeave."Balance Brought Forward"
                    else
                        "Leave Entitlment" := "Leave Earned to Date";





                    CalcFields("Total Leave Days Taken", "Recalled Days", "Off Days");
                    "Leave balance" := "Leave Entitlment" + "Recalled Days" + "Off Days" - "Total Leave Days Taken";
                    if "Days Applied" > "Leave balance" then
                        Error('The days applied for are more than your leave balance');

                end;




                "Date of Joining Company" := emp."Date Of Join";
                "Annual Leave Entitlement Bal" := "Leave balance" - "Days Applied";
            end;
        }
        field(4; "Days Applied"; Decimal)
        {

            trigger OnValidate()
            begin
                if xRec.Status <> Status::Open then
                    Error('You cannot change a document an approved document');

                Validate("Start Date");
                Validate("Leave Code");



                /*
                "Approved Days":="Days Applied";
                
                IF "Start Date" <> 0D THEN BEGIN;
                "Approved Start Date":="Start Date";
                
                IF "Days Applied" > 0 THEN BEGIN
                LeaveTypes.RESET;
                LeaveTypes.SETFILTER(LeaveTypes.Code,"Leave Code");
                CurDate:="Start Date";
                DayApp:="Days Applied";
                REPEAT
                DayApp := DayApp - 1;
                {
                IF LeaveTypes."Inclusive of Holidays" = FALSE THEN BEGIN
                GeneralOptions.FIND('-');
                BaseCalender.RESET;
                BaseCalender.SETFILTER(BaseCalender."Base Calendar Code",GeneralOptions."Base Calender");
                BaseCalender.SETRANGE(BaseCalender.Date,CurDate);
                IF BaseCalender.FIND('-') THEN BEGIN
                  IF BaseCalender.Nonworking = FALSE THEN BEGIN
                     CurDate := CALCDATE('1D',CurDate);
                  END
                  ELSE BEGIN
                     CurDate := CurDate;
                  END;
                
                
                END
                ELSE BEGIN
                  CurDate := CALCDATE('1D',CurDate);
                END;
                
                END;
                }
                 CurDate := CALCDATE('1D',CurDate);
                UNTIL DayApp = 0;
                
                END;
                
                "End Date":=CurDate;
                
                END;
                         */

            end;
        }
        field(5; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                if xRec.Status <> Status::Open then
                    Error('You cannot change a document an approved document');

                GeneralOptions.Get;
                NoOfWorkingDays := 0;
                if "Days Applied" <> 0 then begin
                    if "Start Date" <> 0D then begin
                        NextWorkingDate := "Start Date";

                        repeat
                            //cc//     //cc// if not CalendarMgmt.CheckDateStatus(GeneralOptions."Base Calendar Code", NextWorkingDate, Description) then
                            NoOfWorkingDays := NoOfWorkingDays + 1;

                            if LeaveTypes.Get("Leave Code") then begin
                                if LeaveTypes."Inclusive of Holidays" then begin
                                    BaseCalendar.Reset;
                                    BaseCalendar.SetRange(BaseCalendar."Base Calendar Code", GeneralOptions."Base Calendar Code");
                                    BaseCalendar.SetRange(BaseCalendar.Date, NextWorkingDate);
                                    BaseCalendar.SetRange(BaseCalendar.Nonworking, true);
                                    BaseCalendar.SetRange(BaseCalendar."Recurring System", BaseCalendar."recurring system"::"Annual Recurring");
                                    if BaseCalendar.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        // MESSAGE('Holiday =%1 Day of week %2',BaseCalendar.Date,BaseCalendar.Description);
                                    end;

                                end;

                                if LeaveTypes."Inclusive of Saturday" then begin
                                    BaseCalender.Reset;
                                    BaseCalender.SetRange(BaseCalender."Period Type", BaseCalender."period type"::Date);
                                    BaseCalender.SetRange(BaseCalender."Period Start", NextWorkingDate);
                                    BaseCalender.SetRange(BaseCalender."Period No.", 6);

                                    if BaseCalender.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        // MESSAGE('SATURDAY =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                                    end;
                                end;


                                if LeaveTypes."Inclusive of Sunday" then begin
                                    BaseCalender.Reset;
                                    BaseCalender.SetRange(BaseCalender."Period Type", BaseCalender."period type"::Date);
                                    BaseCalender.SetRange(BaseCalender."Period Start", NextWorkingDate);
                                    BaseCalender.SetRange(BaseCalender."Period No.", 7);
                                    if BaseCalender.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        //  MESSAGE('Sunday =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                                    end;
                                end;


                                if LeaveTypes."Off/Holidays Days Leave" then
                                ;

                            end;

                            NextWorkingDate := CalcDate('1D', NextWorkingDate);
                        until NoOfWorkingDays = "Days Applied";
                        "End Date" := NextWorkingDate - 1;
                        "Resumption Date" := NextWorkingDate;
                    end;
                end;




                //New Joining Employees

                if "Date of Joining Company" > "Fiscal Start Date" then begin

                    if "Date of Joining Company" <> 0D then begin
                        NoofMonthsWorked := 0;
                        Nextmonth := "Date of Joining Company";
                        repeat

                            Nextmonth := CalcDate('1M', Nextmonth);
                            NoofMonthsWorked := NoofMonthsWorked + 1;
                        until Nextmonth >= "Start Date";
                        NoofMonthsWorked := NoofMonthsWorked - 1;
                        "No. of Months Worked" := NoofMonthsWorked;

                        if LeaveTypes.Get("Leave Code") then
                            "Leave Earned to Date" := ROUND(((LeaveTypes.Days / 12) * NoofMonthsWorked), 1);
                        "Leave Entitlment" := "Leave Earned to Date";
                        Validate("Leave Code");
                    end;
                end;
            end;
        }
        field(6; "End Date"; Date)
        {

            trigger OnValidate()
            begin
                //"Approved To Date":="To Date";
                if xRec.Status <> Status::Open then
                    Error('You cannot change a document an approved document');

                Validate("Start Date");
                Validate("Leave Code");
            end;
        }
        field(7; "Application Date"; Date)
        {
        }
        field(8; "Approved Days"; Decimal)
        {

            trigger OnValidate()
            begin
                days := "Approved Days";
            end;
        }
        field(9; "Approved Start Date"; Date)
        {
        }
        field(10; "Verified By Manager"; Boolean)
        {

            trigger OnValidate()
            begin
                "Verification Date" := Today;
            end;
        }
        field(11; "Verification Date"; Date)
        {
        }
        field(12; "Leave Status"; Option)
        {
            OptionCaption = 'Being Processed,Approved,Rejected,Canceled';
            OptionMembers = "Being Processed",Approved,Rejected,Canceled;

            trigger OnValidate()
            begin

                if ("Leave Status" = "leave status"::Approved) and (xRec."Leave Status" <> "leave status"::Approved) then begin
                    ;
                    "Approval Date" := Today;
                    "Employee Leaves".Reset;
                    "Employee Leaves".SetRange("Employee Leaves"."Employee No", "Employee No");
                    "Employee Leaves".SetRange("Employee Leaves"."Leave Code", "Leave Code");
                    if "Employee Leaves".Find('-') then;
                    "Employee Leaves"."No. Of Days" := "Employee Leaves"."No. Of Days" - "Approved Days";
                    "Leave balance" := "Employee Leaves"."No. Of Days";
                    //MESSAGE('%1 %2',"Employee Leaves".Balance,"Approved Days");
                    "Employee Leaves".Validate("Employee Leaves"."No. Of Days");
                    "Employee Leaves".Modify;
                    /*
                    SETRANGE("Leave Allowance Payable",TRUE);
                    IF FIND('-') THEN  BEGIN
                    emp.SETRANGE(emp."No.","Employee No");
                    IF emp.FIND('-') THEN
                    BEGIN
                    earn.SETRANGE(earn."Leave Allowance",TRUE);
                      IF earn.FIND('-') THEN
                        BEGIN
                        ecode:=earn.Code;
                        assmatrix.RESET;
                        assmatrix.SETRANGE(assmatrix."Employee No","Employee No");
                        assmatrix.SETRANGE(assmatrix.Closed,FALSE);
                          IF assmatrix.FIND('-') THEN
                            BEGIN
                            assmatrix."Employee No":="Employee No";
                            assmatrix.VALIDATE("Employee No");
                            assmatrix.Code:=ecode;
                            assmatrix.VALIDATE(Code);
                            assmatrix.INSERT;
                          END;
                       END;
                    END;
                    END;
                    */
                end
                else if ("Leave Status" <> "leave status"::Approved) and (xRec."Leave Status" = "leave status"::Approved) then begin
                    "Approval Date" := Today;
                    "Employee Leaves".Reset;
                    "Employee Leaves".SetRange("Employee Leaves"."Employee No", "Employee No");
                    "Employee Leaves".SetRange("Employee Leaves"."Leave Code", "Leave Code");
                    if "Employee Leaves".Find('-') then;
                    "Employee Leaves"."No. Of Days" := "Employee Leaves"."No. Of Days" + "Approved Days";
                    "Employee Leaves".Validate("Employee Leaves"."No. Of Days");

                    "Employee Leaves".Modify;
                    /*
                    SETRANGE("Leave Allowance Payable",TRUE);
                    IF FIND('-') THEN  BEGIN

                    emp.SETRANGE(emp."No.","Employee No");
                    IF emp.FIND('-') THEN
                    BEGIN
                    earn.SETRANGE(earn."Leave Allowance",TRUE);
                      IF earn.FIND('-') THEN
                        BEGIN
                        ecode:=earn.Code;
                        assmatrix.RESET;
                        assmatrix.SETRANGE(assmatrix."Employee No","Employee No");
                        assmatrix.SETRANGE(assmatrix.Closed,FALSE);
                          IF assmatrix.FIND('-') THEN
                            BEGIN
                            assmatrix."Employee No":="Employee No";
                            assmatrix.VALIDATE("Employee No");
                            assmatrix.Code:=ecode;
                            assmatrix.VALIDATE(Code);
                            assmatrix.INSERT;
                          END;
                       END;
                       */
                end;
                //END;





                //END;

            end;
        }
        field(13; "Approved End Date"; Date)
        {
        }
        field(14; "Approval Date"; Date)
        {
        }
        field(15; Comments; Text[250])
        {
        }
        field(16; Taken; Boolean)
        {
        }
        field(17; "Acrued Days"; Decimal)
        {
        }
        field(18; "Over used Days"; Decimal)
        {
        }
        field(19; "Leave Allowance Payable"; Option)
        {
            OptionMembers = " ",Yes,No;

            trigger OnValidate()
            begin
                HumanResSetup.Get;
                if "Leave Allowance Payable" = "leave allowance payable"::Yes then
                    if "Days Applied" < HumanResSetup."Qualification Days (Leave)" then
                        Error('You can only be paid leave allowance if you take more or %1 Days', HumanResSetup."Qualification Days (Leave)");
            end;
        }
        field(20; Post; Boolean)
        {
        }
        field(21; days; Decimal)
        {
        }
        field(23; "No. series"; Code[10])
        {
        }
        field(24; "Leave balance"; Decimal)
        {
        }
        field(25; "Resumption Date"; Date)
        {
        }
        field(26; "Employee Name"; Text[50])
        {
        }
        field(27; Status; Option)
        {
            Editable = false;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(28; "Leave Entitlment"; Decimal)
        {
        }
        field(29; "Total Leave Days Taken"; Decimal)
        {
            CalcFormula = sum("Employee Leave Application"."Days Applied" where(Status = const(Released),
                                                                                 "Employee No" = field("Employee No"),
                                                                                 "Leave Code" = field("Leave Code"),
                                                                                 "Maturity Date" = field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(30; "Duties Taken Over By"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if xRec.Status <> Status::Open then
                    Error('You cannot change a document an approved document');

                if emp.Get("Duties Taken Over By") then
                    Name := emp."First Name" + '' + emp."Middle Name" + '' + emp."Last Name";
            end;
        }
        field(31; Name; Text[50])
        {
        }
        field(32; "Mobile No"; Code[20])
        {
        }
        field(33; "Balance brought forward"; Decimal)
        {
        }
        field(34; "Leave Earned to Date"; Decimal)
        {
        }
        field(35; "Maturity Date"; Date)
        {
        }
        field(36; "Date of Joining Company"; Date)
        {
        }
        field(37; "Fiscal Start Date"; Date)
        {
        }
        field(38; "No. of Months Worked"; Decimal)
        {
        }
        field(39; "Annual Leave Entitlement Bal"; Decimal)
        {
        }
        field(40; "Recalled Days"; Decimal)
        {
            CalcFormula = sum("Employee Off/Holidays"."No. of Off Days" where("Employee No" = field("Employee No"),
                                                                               "Maturity Date" = field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(41; "Off Days"; Decimal)
        {
            CalcFormula = sum("Holidays_Off Days"."No. of Days" where("Employee No." = field("Employee No"),
                                                                       "Leave Type" = field("Leave Code"),
                                                                       "Maturity Date" = field("Maturity Date")));
            FieldClass = FlowField;
        }
        field(42; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(43; "User ID"; Code[20])
        {
        }
        field(44; "Line No"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", "Line No")
        {
            Clustered = true;
            SumIndexFields = days;
        }
        key(Key2; "Employee No", Status, "Leave Code", "Maturity Date")
        {
            SumIndexFields = "Days Applied", "Approved Days";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        //IF Post=TRUE THEN
        // ERROR('You cannot Delete the Record');
    end;

    trigger OnInsert()
    begin



        /*IF "Application No" = '' THEN BEGIN
          HumanResSetup.GET;
          HumanResSetup.TESTFIELD("Leave Plan Nos");
          NoSeriesMgt.InitSeries(HumanResSetup."Leave Plan Nos",xRec."No. series",0D,"Application No","No. series");
        END;*/

        "Application Date" := Today;
        FindMaturityDate;
        "Maturity Date" := MaturityDate;
        "Fiscal Start Date" := FiscalStart;

    end;

    trigger OnModify()
    begin
        //IF Post=TRUE THEN
        // ERROR('You cannot Modify the Record');
    end;

    trigger OnRename()
    begin
        if Post = true then
            Error('You cannot Rename the Record');
    end;

    var
        "Employee Leaves": Record "Employee Leaves";
        BaseCalender: Record Date;
        CurDate: Date;
        LeaveTypes: Record "Leave Types";
        DayApp: Decimal;
        Dayofweek: Integer;
        i: Integer;
        textholder: Text[30];
        emp: Record Employee;
        leaveapp: Record "Employee Leave Plan";
        GeneralOptions: Record "Company Information";
        NoOfDays: Integer;
        BaseCalendar: Record "Base Calendar Change";
        yearend: Date;
        d: Date;
        d2: Integer;
        d3: Integer;
        d4: Integer;
        d1: Integer;
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        earn: Record EarningsX;
        assmatrix: Record "Assignment Matrix-X";
        ecode: Code[10];
        ldated: Date;
        UserSertup: Record "User Setup";
        CalendarMgmt: Codeunit "Calendar Management";
        NextWorkingDate: Date;
        Description: Text[30];
        NoOfWorkingDays: Integer;
        LeaveAllowancePaid: Boolean;
        PayrollPeriod: Record "Payroll PeriodX";
        PayPeriodStart: Date;
        EmpRec: Record Employee;
        MaturityDate: Date;
        EmpLeave: Record "Employee Leaves";
        NoofMonthsWorked: Integer;
        FiscalStart: Date;
        Nextmonth: Date;
        DimVal: Record "Dimension Value";


    procedure CreateLeaveAllowance(var LeaveApp: Record "Employee Leave Application")
    var
        HRSetup: Record "Human Resources Setup";
        AccPeriod: Record "Payroll PeriodX";
        FiscalStart: Date;
        FiscalEnd: Date;
        ScaleBenefits: Record "Scale Benefits";
    begin
        if LeaveApp."Leave Allowance Payable" = LeaveApp."leave allowance payable"::Yes then begin
            AccPeriod.Reset;
            AccPeriod.SetRange(AccPeriod."Starting Date", 0D, Today);
            AccPeriod.SetRange(AccPeriod."New Fiscal Year", true);
            if AccPeriod.Find('+') then
                FiscalStart := AccPeriod."Starting Date";
            //MESSAGE('%1',FiscalStart);

            FiscalEnd := CalcDate('1Y', FiscalStart) - 1;
            //MESSAGE('%1',FiscalEnd);


            assmatrix.Reset;
            assmatrix.SetRange(assmatrix."Payroll Period", FiscalStart, FiscalEnd);
            assmatrix.SetRange(assmatrix.Type, assmatrix.Type::Payment);
            assmatrix.SetRange(assmatrix.Code, HRSetup."Leave Allowance Code");
            if assmatrix.Find('-') then begin
                LeaveAllowancePaid := true;
                Message('Leave allowance paid on %1', assmatrix."Payroll Period");
            end;


            if not LeaveAllowancePaid then begin



                if HRSetup.Get then begin
                    if "Days Applied" >= HRSetup."Qualification Days (Leave)" then begin
                        if emp.Get("Employee No") then begin
                            ScaleBenefits.Reset;
                            ScaleBenefits.SetRange(ScaleBenefits."Salary Scale", emp."Salary Scale");
                            ScaleBenefits.SetRange(ScaleBenefits."Salary Pointer", emp.Present);
                            ScaleBenefits.SetRange(ScaleBenefits."ED Code", HRSetup."Leave Allowance Code");
                            if ScaleBenefits.Find('-') then begin
                                PayrollPeriod.Reset;
                                PayrollPeriod.SetRange(PayrollPeriod."Close Pay", false);
                                if PayrollPeriod.Find('-') then
                                    PayPeriodStart := PayrollPeriod."Starting Date";

                                assmatrix.Init;
                                assmatrix."Employee No" := "Employee No";
                                assmatrix.Type := assmatrix.Type::Payment;
                                assmatrix.Code := HRSetup."Leave Allowance Code";
                                assmatrix.Validate(assmatrix.Code);
                                assmatrix."Payroll Period" := PayPeriodStart;
                                assmatrix.Amount := ScaleBenefits.Amount;

                                if not assmatrix.Get(assmatrix."Employee No", assmatrix.Type, assmatrix.Code, assmatrix."Payroll Period") then
                                    assmatrix.Insert;
                            end;
                        end;

                    end;




                end;
            end;
        end;
    end;


    procedure FindMaturityDate()
    var
        AccPeriod: Record "Payroll PeriodX";
    begin
        AccPeriod.Reset;
        AccPeriod.SetRange(AccPeriod."Starting Date", 0D, Today);
        AccPeriod.SetRange(AccPeriod."New Fiscal Year", true);
        if AccPeriod.Find('+') then begin
            FiscalStart := AccPeriod."Starting Date";
            MaturityDate := CalcDate('1Y', AccPeriod."Starting Date") - 1;
        end;
    end;
}
