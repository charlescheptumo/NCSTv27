#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69126 "Overtime Header"
{

    fields
    {
        field(1; "EMp No."; Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin

                if "Application Code" <> xRec."Application Code" then begin
                    hrsetup.Get;
                    NoSeriesMgt.TestManual(hrsetup."Overtime Req Nos.");
                    "No. series" := '';
                end;


                if "EMp No." = '' then Name := '';

                employee.Reset;
                if employee.Get("EMp No.") then begin
                    Name := employee."First Name" + ' ' + employee."Middle Name" + ' ' + employee."Last Name";
                    "Responsibility Center" := employee."Job Title";
                    "Dim Code 1" := employee."Global Dimension 1 Code";
                    "Dim Code 2" := employee."Global Dimension 2 Code";
                    //MODIFY
                end

                /*employee.SETRANGE(employee."No.",OT."EMp No.");
                IF employee.FIND('-') THEN BEGIN
                OT.Name:=employee."First Name"+' '+employee."Middle Name"+' '+employee."Last Name";
                OT.MODIFY
                END*/

            end;
        }
        field(2; Name; Text[50])
        {
        }
        field(3; "Convert to pay"; Boolean)
        {
        }
        field(4; "Convert to Leave"; Boolean)
        {
        }
        field(5; "Application Code"; Code[10])
        {
        }
        field(6; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(7; "No. series"; Code[10])
        {
        }
        field(8; "Weekend Hours"; Decimal)
        {
            CalcFormula = sum("Overtime lines".Hours where("Application Code" = field("Application Code"),
                                                            "Overtime Type" = filter(Holiday | Weekend)));
            FieldClass = FlowField;
        }
        field(9; "Application Date"; Date)
        {
        }
        field(10; "Responsibility Center"; Code[10])
        {
        }
        field(11; "Dim Code 1"; Code[10])
        {
        }
        field(12; "Dim Code 2"; Code[10])
        {
        }
        field(13; "Weekday Hours"; Decimal)
        {
            CalcFormula = sum("Overtime lines".Hours where("Application Code" = field("Application Code"),
                                                            "Overtime Type" = filter("Extra Hours")));
            FieldClass = FlowField;
        }
        field(14; "Total Hours"; Decimal)
        {
            CalcFormula = sum("Overtime lines".Hours where("Application Code" = field("Application Code")));
            FieldClass = FlowField;
        }
        field(15; Converted; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "Application Code" = '' then begin
            hrsetup.Get();
            hrsetup.TestField(hrsetup."Overtime Req Nos.");
          //    NoSeriesMgt.InitSeries(hrsetup."Overtime Req Nos.", xRec."No. series", 0D, "Application Code", "No. series");
            "Application Code" := NoSeriesMgt.GetNextNo(hrsetup."Overtime Req Nos.", Today, true);
        end;



        /*IF usersetup.GET(USERID) THEN BEGIN
          IF NOT usersetup."Assigned to Employee" THEN
             ERROR('Your USERID should be linked to an employee account contact your system administrator');
        
        {Employee.GET(Employee."No.");
        Employee.CALCFIELDS(Employee.Picture);
        Picture:=Employee.Picture;
         "User ID":=USERID;
        END ELSE BEGIN
         ERROR('User id'+' '+'['+USERID+']'+' has not been assigned to any employee. Please consult the HR officer for assistance')
        END; }*/


        employee.Reset;
        employee.SetRange(employee."User ID", UserId);
        if employee.Find('-') then begin
            "EMp No." := employee."No."
        end else begin
            Error('User id' + ' ' + '[' + UserId + ']' + ' has not been assigned to any employee. Please consult the HR officer for assistance')
        end;

        "Application Date" := Today;

        Validate("EMp No.");
        /*employee.RESET;
        employee.SETRANGE(employee."No.","EMp No.");
        IF employee.FIND('-') THEN BEGIN
        Name:=employee."First Name"+' '+employee."Middle Name"+' '+employee."Last Name";
        MODIFY
        END*/

    end;

    var
        employee: Record Employee;
        hrsetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        OT: Record "Overtime Header";
        usersetup: Record "User Setup";
        HrLeavePeriods: Record "HR Leave Periods";
        LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        "Days Applied": Decimal;
        "Hours Earned": Decimal;
        "Amount Earned": Decimal;
        EmpTrans: Record "Assignment Matrix-X";


    procedure "Convert Overtime"()
    begin
        //GET OPEN LEAVE PERIOD
        HrLeavePeriods.Reset;
        HrLeavePeriods.SetRange(HrLeavePeriods.Closed, false);
        HrLeavePeriods.Find('-');


        //HRJournalBatch.RESET;
        hrsetup.Get;
        //HRJournalBatch.GET(HRSetup."Default Leave Posting Template",HRSetup."Default Leave Posting Batch");

        /*OT.RESET;
        OT.SETRANGE(OT."Application Code","Application Code");
        IF OT.FIND('-') THEN BEGIN
        OT.CALCFIELDS(OT."Total Hours");
        MESSAGE('test, %1,%2',"Application Code",OT."Total Hours");
        "Hours Earned":=OT."Total Hours"*hrsetup."Leave Hours per Hour";
        IF "Hours Earned">0 THEN
        "Days Applied":="Hours Earned"/8;
        END; */

        Message('"Days Applied","Hours Earned",%1,%2,%3', "Days Applied", "Hours Earned", "Total Hours");

        LeaveGjline.Reset;
        LeaveGjline.SetRange(LeaveGjline."Journal Template Name", 'LEAVE');
        LeaveGjline.SetRange(LeaveGjline."Journal Batch Name", 'LEAVE');
        if LeaveGjline.Find('-') = false then begin
            LeaveGjline.Init;
            LeaveGjline."Journal Template Name" := 'LEAVE';
            LeaveGjline."Journal Batch Name" := 'LEAVE';
            LeaveGjline.Insert;
        end;

        LeaveGjline.SetRange(LeaveGjline."Journal Batch Name", 'SALARIES');
        if LeaveGjline.Find('-') then
            LeaveGjline.DeleteAll;

        //POPULATE JOURNAL LINES
        /*LeaveGjline.RESET;
        LeaveGjline.SETRANGE(LeaveGjline."Journal Template Name",HRSetup."Default Leave Posting Template");
        LeaveGjline.SETRANGE(LeaveGjline."Journal Batch Name",HRSetup."Default Leave Posting Batch");
        IF LeaveGjline.FIND('-') THEN
        HRSetup.DELETEALL
        //LeaveGjline."Line No." := 1000
        ELSE*/

        LeaveGjline."Line No." := 1000;

        "LineNo." := LeaveGjline."Line No.";


        LeaveGjline.Init;
        LeaveGjline."Journal Template Name" := hrsetup."Default Leave Posting Template";
        LeaveGjline."Journal Batch Name" := hrsetup."Default Leave Posting Batch";
        LeaveGjline."Line No." := "LineNo." + 1000;
        LeaveGjline."Leave Period" := Format(HrLeavePeriods.Code);
        LeaveGjline."Document No." := "Application Code";
        LeaveGjline."Staff No." := "EMp No.";
        LeaveGjline.Validate(LeaveGjline."Staff No.");
        LeaveGjline."Posting Date" := Today;
        LeaveGjline."Leave Entry Type" := LeaveGjline."leave entry type"::Positive;
        LeaveGjline."Leave Approval Date" := Today;
        LeaveGjline.Description := 'Leave Days from Overtime';//HRJournalBatch."Posting Description";
        LeaveGjline."Leave Type" := 'ANNUAL';//"Leave Type";
        LeaveGjline."Leave Period Start Date" := HrLeavePeriods.Starts;
        LeaveGjline."Leave Period End Date" := HrLeavePeriods.Ends;
        LeaveGjline."No. of Days" := "Days Applied";
        //GET NO. OF DAYS FROM APPROVAL COMMENTS
        /*ApprovalComments.RESET;
        ApprovalComments.SETRANGE(ApprovalComments."Document No.","Application Code");
        ApprovalComments.SETRANGE(ApprovalComments."User ID",Supervisor);
        IF ApprovalComments.FIND('-') THEN
        LeaveGjline."No. of Days":=ApprovalComments."Approved Days";*/


        LeaveGjline.Insert(true);
        Message('Lines copied to HR Journal');


        //Post Journal

        /*LeaveGjline.RESET;
        LeaveGjline.SETRANGE("Journal Template Name",'LEAVE');
        LeaveGjline.SETRANGE("Journal Batch Name",'DEFAULT');
        IF LeaveGjline.FIND('-') THEN BEGIN
        CODEUNIT.RUN(CODEUNIT::"HR Leave Jnl.-Post",LeaveGjline);
        END;*/

    end;


    procedure "Convert Payroll"()
    begin
        hrsetup.Reset;
        hrsetup.Get();


        OT.Reset;
        OT.SetRange(OT."Application Code", "Application Code");
        if OT.Find('-') then begin
            OT.CalcFields(OT."Total Hours");
            Message('test, %1,%2', "Application Code", OT."Total Hours");
            "Amount Earned" := OT."Total Hours" * hrsetup."Amount Per Hour";
            //IF "Hours Earned">0 THEN
            //"Days Applied":="Hours Earned"/8;
        end;

        if "Amount Earned" <> 0 then begin
            EmpTrans.Reset;
            EmpTrans.SetRange(EmpTrans."Employee No", "EMp No.");

            if EmpTrans.Find('-') then begin
                EmpTrans.Init;
                EmpTrans."Employee No" := "EMp No.";
                /*EmpTrans."Transaction Code":=
                EmpTrans."Period Month":=
                EmpTrans."Period Year":=
                EmpTrans."Transaction Name":=*/
                EmpTrans.Amount := "Amount Earned";

                EmpTrans.Insert;


            end

        end

    end;
}
