#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69164 "Employee Absentism"
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
                if "Employee No" = '' then
                    Delete;
            end;
        }
        field(3; "Absent From"; Date)
        {
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(4; Approved; Boolean)
        {

            trigger OnValidate()
            begin

                /* "Leave Types".RESET;
                 "Leave Types".SETRANGE("Leave Types"."Off/Holidays Days Leave",TRUE);
                 IF "Leave Types".FIND('-') THEN;
                      "Employee Leave".RESET;
                      "Employee Leave".SETRANGE("Employee Leave"."Employee No","Employee No");
                      "Employee Leave".SETRANGE("Employee Leave"."Leave Code","Leave Types".Code);
                      IF "Employee Leave".FIND('-') THEN;
                           IF Approved= TRUE THEN BEGIN;
                           "Employee Leave".Balance := "Employee Leave".Balance + 1;
                           "Employee Leave".MODIFY;
                           END
                           ELSE BEGIN
                           "Employee Leave".Balance := "Employee Leave".Balance - 1;
                           "Employee Leave".MODIFY;
                           END;
                           */

            end;
        }
        field(5; "Absentism code"; Code[20])
        {
            TableRelation = "Employee Leave Application" where(Status = const(Released));

            trigger OnValidate()
            begin
                GeneralOptions.Get;
                /* IF LeaveApplication.GET("Leave Application") THEN
                 BEGIN
                   NoOfDaysOff:=0;
                     "Leave Ending Date":=LeaveApplication."End Date";
                   IF LeaveApplication."End Date"<>0D THEN
                   BEGIN
                   NextDate:="Recall Date";
                   REPEAT
                  //cc// if not CalendarMgmt.CheckDateStatus(GeneralOptions."Base Calendar Code",NextDate,Description) THEN
                   NoOfDaysOff:=NoOfDaysOff+1;
                
                   NextDate:=CALCDATE('1D',NextDate);
                   UNTIL NextDate=LeaveApplication."End Date";
                   END;
                
                 END;  */
                "No. of  Days Absent" := NoOfDaysOff;

            end;
        }
        field(6; "Absent To"; Date)
        {

            trigger OnValidate()
            begin
                /* VALIDATE("Leave Application");   */

            end;
        }
        field(7; "No. of  Days Absent"; Decimal)
        {

            trigger OnValidate()
            begin
                if "No. of  Days Absent" < 0 then
                    Message('Invalid entry, Enter a positive value');
                exit;
                //get base calendar to use
                HumanResSetup.Reset();
                HumanResSetup.Get();
                HumanResSetup.TestField(HumanResSetup."Base Calender Code");
                NonWorkingDay := false;
                if "Absent From" <> 0D then begin
                    if "Absent From" < "Absent To" then begin
                        while "Absent From" <> "Absent To"
                              do begin
                            //   NonWorkingDay := CalendarMgmt.CheckDateStatus(HumanResSetup."Base Calender Code", "Absent From", Dsptn);
                            if NonWorkingDay then begin
                                NonWorkingDay := false;
                                Days := +1;
                                "Absent From" := CalcDate('1D', "Absent From");
                            end
                            else begin
                                NonWorkingDay := true;
                            end;
                        end;
                    end;
                end;
                // MESSAGE('');
                // dEDUCT THE NUMBER OF DAYS FROM LEAVE ENTITLE

                if "No. of  Days Absent" = 0 then
                    Delete;
                LeaveApplication.SetRange("Employee No", xRec."Employee No");

                LeaveApplication."Leave Entitlment" := LeaveApplication."Leave Entitlment" - "No. of  Days Absent";
                //MESSAGE(FORMAT("No. of  Days Absent"));
            end;
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
        field(12; "Absent No."; Code[20])
        {
        }
        field(13; Status; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(14; "Fiscal Start Date"; Date)
        {
        }
        field(15; "Reported  By"; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Reported  By") then
                    Name := Emp."First Name" + '' + Emp."Middle Name" + '' + Emp."Last Name";
            end;
        }
        field(16; Name; Text[50])
        {
            Editable = false;
        }
        field(17; "Reason for Absentism"; Text[130])
        {
        }
        field(18; Penalty; Option)
        {
            OptionCaption = ' ,Leave,Salary';
            OptionMembers = " ",Leave,Salary;
        }
    }

    keys
    {
        key(Key1; "Absent No.")
        {
            Clustered = true;
        }
        key(Key2; "Employee No", "Maturity Date")
        {
            SumIndexFields = "No. of  Days Absent";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Absent No." = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField(HumanResSetup."Employee Absentism");
          //  NoSeriesMgt.InitSeries(HumanResSetup."Employee Absentism", xRec."No. Series", 0D, "Absent No.", "No. Series");
            "Absent No." := NoSeriesMgt.GetNextNo(HumanResSetup."Employee Absentism", Today, true);
        end;

        //"Absent From":=TODAY;

        /*IF UserSetup.GET(USERID) THEN
        BEGIN
         "Employee No":=UserSetup."Employee No.";
          VALIDATE("Employee No");
        END;
        FindMaturityDate;
        "Maturity Date":=MaturityDate;
        "Fiscal Start Date":=FiscalStart;*/

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
        NonWorkingDay: Boolean;
        Dsptn: Text[30];
        Days: Integer;


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
