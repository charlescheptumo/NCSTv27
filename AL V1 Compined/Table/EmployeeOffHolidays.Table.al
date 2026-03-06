#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69133 "Employee Off/Holidays"
{

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Employee No") then begin
                    "Employee Name" := Emp."First Name" + '' + Emp."Middle Name" + '' + Emp."Last Name";
                end;
            end;
        }
        field(3; Date; Date)
        {
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(4; Approved; Boolean)
        {

            trigger OnValidate()
            begin

                "Leave Types".Reset;
                "Leave Types".SetRange("Leave Types"."Off/Holidays Days Leave", true);
                if "Leave Types".Find('-') then;
                "Employee Leave".Reset;
                "Employee Leave".SetRange("Employee Leave"."Employee No", "Employee No");
                "Employee Leave".SetRange("Employee Leave"."Leave Code", "Leave Types".Code);
                if "Employee Leave".Find('-') then;
                if Approved = true then begin
                    ;
                    "Employee Leave"."No. Of Days" := "Employee Leave"."No. Of Days" + 1;
                    "Employee Leave".Modify;
                end
                else begin
                    "Employee Leave"."No. Of Days" := "Employee Leave"."No. Of Days" - 1;
                    "Employee Leave".Modify;
                end;
            end;
        }
        field(5; "Leave Application"; Code[20])
        {
            TableRelation = "Employee Leave Application" where(Status = const(Released));

            trigger OnValidate()
            begin
                GeneralOptions.Get;
                if LeaveApplication.Get("Leave Application") then begin
                    NoOfDaysOff := 0;
                    "Leave Ending Date" := LeaveApplication."End Date";
                    if LeaveApplication."End Date" <> 0D then begin
                        NextDate := "Recall Date";
                        repeat
                            //cc// if not CalendarMgmt.CheckDateStatus(GeneralOptions."Base Calendar Code", NextDate, Description) then
                            NoOfDaysOff := NoOfDaysOff + 1;

                            NextDate := CalcDate('1D', NextDate);
                        until NextDate = LeaveApplication."End Date";
                    end;

                end;
                "No. of Off Days" := NoOfDaysOff;
            end;
        }
        field(6; "Recall Date"; Date)
        {

            trigger OnValidate()
            begin
                Validate("Leave Application");
            end;
        }
        field(7; "No. of Off Days"; Decimal)
        {
        }
        field(8; "Leave Ending Date"; Date)
        {
        }
        field(9; "Maturity Date"; Date)
        {
        }
        field(10; "No. Series"; Code[10])
        {
        }
        field(11; "Employee Name"; Text[30])
        {
        }
        field(12; "No."; Code[20])
        {
        }
        field(13; Status; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(14; "Fiscal Start Date"; Date)
        {
        }
        field(15; "Recalled By"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get(Name) then
                    Name := Emp."First Name" + '' + Emp."Middle Name" + '' + Emp."Last Name";
            end;
        }
        field(16; Name; Text[50])
        {
            Editable = false;
        }
        field(17; "Reason for Recall"; Text[130])
        {
        }
        field(18; "Head Of Department"; Text[100])
        {
            TableRelation = "Dimension Value"."Dimension Code" where("Dimension Code" = const('2'));
        }
        field(20; "Recalled From"; Date)
        {
        }
        field(21; "Recalled To"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Employee No", "Maturity Date")
        {
            SumIndexFields = "No. of Off Days";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField(HumanResSetup."Leave Recall Nos");
            //NoSeriesMgt.InitSeries(HumanResSetup."Leave Recall Nos", xRec."No. Series", 0D, "No.", "No. Series");
            "No." := NoSeriesMgt.GetNextNo(HumanResSetup."Leave Recall Nos", Today, true);
        end;

        Date := Today;
        "Recall Date" := Today;
        //commented by serem
        /*IF UserSetup.GET(USERID) THEN
        BEGIN
         "Employee No":=UserSetup."Employee No.";
         VALIDATE("Employee No");
        END;*/
        FindMaturityDate;
        "Maturity Date" := MaturityDate;
        "Fiscal Start Date" := FiscalStart;

    end;

    var
        Holidays: Record "Holidays_Off Days";
        "Employee Leave": Record "Employee Leaves";
        "Leave Types": Record "Leave Types";
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        FiscalStart: Date;
        MaturityDate: Date;
        Emp: Record Employee;
        LeaveApplication: Record "Employee Leave Application";
        NextDate: Date;
        NoOfDaysOff: Decimal;
        CalendarMgmt: Codeunit "Calendar Management";
        GeneralOptions: Record "Company Information";
        Description: Text[30];
        BaseCalender: Record Date;
        NonWorkingDay: Boolean;


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
