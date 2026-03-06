#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56204 "Annual Appraisal"
{

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;
        }
        field(2; "Date created"; Date)
        {
            Editable = false;
        }
        field(3; "Time Created"; Time)
        {
            Editable = false;
        }
        field(4; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(5; "Employee No"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(6; "Employee Name"; Text[250])
        {
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                DimensionVal.Reset;
                DimensionVal.SetRange(Code, "Global Dimension 1 Code");
                if DimensionVal.FindSet then begin
                    "Department Name" := DimensionVal.Name;
                end;
            end;
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                DimensionVal.Reset;
                DimensionVal.SetRange(Code, "Global Dimension 2 Code");
                if DimensionVal.FindSet then begin
                    "Depot Name" := DimensionVal.Name;
                end;
            end;
        }
        field(9; Quarter; Option)
        {
            OptionCaption = ' ,Quarter 1,Quarter 2,Quarter 3,Quarter 4';
            OptionMembers = " ","Quarter 1","Quarter 2","Quarter 3","Quarter 4";
        }
        field(10; "Appraisal Period"; Code[20])
        {
            Caption = 'Appraisal Period';
            TableRelation = "Appraisal  Period";

            trigger OnValidate()
            begin
                //add start date and end date for the appraisal period
                AppPeriod.Reset;
                AppPeriod.SetRange(Period, "Appraisal Period");
                if AppPeriod.FindSet then begin
                    "From Date" := AppPeriod."Start Date";
                    "To Date" := AppPeriod."End Date";
                end;


                //add the departmental objectives
                ObjHeader.Reset;
                ObjHeader.SetRange("Global Dimension 1 Code", "Global Dimension 1 Code");
                ObjHeader.SetRange("Appraisal Period", "Appraisal Period");
                //ObjHeader.SETRANGE(Rating,FALSE);
                if ObjHeader.FindSet then begin
                    ObjLines.Reset;
                    ObjLines.SetRange(Code, ObjHeader.Code);
                    if ObjLines.FindSet then begin
                        repeat
                            //IF
                            /*Objectives.INIT;
                             Objectives."Appraisal No" := No;
                             Objectives."Line No." := ObjLines."Line No";
                             Objectives.Objectives := ObjLines.Objective;
                             Objectives.INSERT;*/



                            //insert the objectives in the apparaisal lines
                            //added on 08/08/2018
                            AppraisalLines.Init;
                            AppraisalLines."Appraisal No" := No;
                            AppraisalLines."Line No." := ObjLines."Line No";
                            AppraisalLines."Performance Objectives" := ObjLines.Objective;
                            AppraisalLines.Insert;
                        until ObjLines.Next = 0;
                    end;
                end;

                //add the ratings per period
                ObjHeader1.Reset;
                ObjHeader1.SetRange("Appraisal Period", "Appraisal Period");
                ObjHeader1.SetRange(Rating, true);
                if ObjHeader1.FindSet then begin
                    ObjLines1.Reset;
                    ObjLines1.SetRange(Code, ObjHeader1.Code);
                    if ObjLines1.FindSet then begin
                        repeat
                            Objectives1.Init;
                            Objectives1."Appraisal No" := No;
                            Objectives1."Line No." := ObjLines1."Line No";
                            Objectives1.Objectives := ObjLines1.Objective;
                            Objectives1.Description := ObjLines1.Description;
                            Objectives1.Rating := ObjLines1.Rating;
                            Objectives1."Rating %" := ObjLines1."Rating %";
                            Objectives1.Rate := true;
                            Objectives1.Insert;
                        until ObjLines1.Next = 0;
                    end;
                end;

            end;
        }
        field(11; "Overall Quartely score"; Decimal)
        {
            Editable = false;
        }
        field(12; "Additional Assignment"; Blob)
        {
        }
        field(13; Remarks; Blob)
        {
        }
        field(14; "Supervisor Code"; Code[10])
        {
        }
        field(15; "Supervisor Name"; Text[100])
        {
        }
        field(16; "Supervisor Designation"; Text[100])
        {
        }
        field(17; Status; Option)
        {
            OptionCaption = 'Open,Sent to supervisor,Appraisee Comments,Supervisor Comments,Second Supervisor,Recommendation,Completed,Rejected,Cancelled';
            OptionMembers = Open,"Sent to supervisor","Appraisee Comments","Supervisor Comments","Second Supervisor",Recommendation,Completed,Rejected,Cancelled;
        }
        field(18; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(19; "Current Designation"; Text[100])
        {
        }
        field(20; "Terms of service"; Text[100])
        {
        }
        field(21; "Acting Appointment"; Text[150])
        {
            Caption = 'Acting Appointment/Special Duty';
        }
        field(22; "Appraisee comments"; Text[10])
        {
            Caption = 'Appraisee comments on performance';
        }
        field(24; "Supervisor Comments"; Text[150])
        {
            Caption = 'Supervisor Comments on performance';
        }
        field(25; "Reward Type Recommended"; Text[150])
        {
        }
        field(26; "Other Interventions"; Text[150])
        {
        }
        field(27; "Duration in present position"; Decimal)
        {
        }
        field(28; "Length of service"; Decimal)
        {
        }
        field(29; "Total score Supervisor"; Decimal)
        {
            CalcFormula = sum("Annual  Appraisal Lines"."Rating Supervisor (%)" where("Appraisal No" = field(No)));
            Caption = 'Total score Supervisor';
            FieldClass = FlowField;
        }
        field(30; "Mean Appraisal score"; Decimal)
        {
            CalcFormula = average("Annual  Appraisal Lines"."Rating Supervisor (%)" where("Appraisal No" = field(No)));
            FieldClass = FlowField;
        }
        field(31; "Previous score"; Decimal)
        {
            Caption = 'Appraisal score for the previous Period';
        }
        field(32; "Supervisor comments on targets"; Text[10])
        {
            Caption = 'Second Supervisor comments on targets';
        }
        field(33; "Discussion help you"; Option)
        {
            Caption = 'Did Discussion help you?';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(34; "Discussion take place"; Option)
        {
            Caption = 'Did performance related discussions with your supervisor take place during the reporting period?';
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(35; "General comments by Appraisee"; Text[10])
        {
        }
        field(36; "General comments by supervisor"; Text[10])
        {
        }
        field(37; "Comments by second supervisor"; Text[10])
        {
        }
        field(38; "Recommended reward or sanction"; Option)
        {
            OptionCaption = ' ,A bonus of one month''s basic and a commendation letter for excellent performance will be awarded will be awarded upon approval by the authorized officer,A commendation letter for good performance,Warning/cautionary letter for poor performance,Dismissal/termination of appointment for very poor performance,Extension of probation as applicable,Other';
            OptionMembers = " ","A bonus of one month's basic and a comnd. letter for exllnt. performance will be awarded will be awarded upon approval","A commendation letter for good performance","Warning/cautionary letter for poor performance","Dismissal/termination of appointment for very poor performance","Extension of probation as applicable",Other;
        }
        field(39; "Other recommendation"; Text[150])
        {
        }
        field(40; Recommendation; Text[150])
        {
            Caption = 'Recommendation by the Performance Management Committee';
        }
        field(41; "Meeting held on"; Date)
        {
        }
        field(42; "Minutes No."; Code[50])
        {
        }
        field(43; "Comments by Managing Director"; Text[10])
        {
        }
        field(44; "CompetenceTotal Overall rating"; Decimal)
        {
            Caption = 'Competence Total Overall rating';
        }
        field(45; Mission; Text[250])
        {
        }
        field(46; Vision; Text[250])
        {
        }
        field(47; "Core Values"; Text[250])
        {
        }
        field(48; "From Date"; Date)
        {
        }
        field(49; "To Date"; Date)
        {
        }
        field(50; "Department Name"; Code[100])
        {
            Editable = true;
        }
        field(51; "Total score self rating"; Decimal)
        {
            CalcFormula = sum("Annual  Appraisal Lines"."Rating Self (%)" where("Appraisal No" = field(No)));
            Caption = 'Total score self rating';
            Editable = false;
            FieldClass = FlowField;
        }
        field(52; "Competency/skill Total"; Decimal)
        {
            CalcFormula = sum("Values Appraisal"."Self Rating" where("Appraisal No" = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(53; "Actual of Eighty"; Decimal)
        {
            CalcFormula = sum("Annual  Appraisal Lines"."Actual of Eighty" where("Appraisal No" = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; "Second Supervisor Code"; Code[10])
        {
        }
        field(55; "Second Supervisor Name"; Text[100])
        {
        }
        field(56; "Second Supervisor Designation"; Text[100])
        {
        }
        field(57; ApproverID; Code[50])
        {
        }
        field(58; "Second ApproverID"; Code[50])
        {
        }
        field(59; "Reason for cancelling"; Text[250])
        {
        }
        field(60; "Cancelled By"; Code[50])
        {
        }
        field(61; "Date Cancelled"; Date)
        {
        }
        field(62; "Time Cancelled"; Time)
        {
        }
        field(63; "Depot Name"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            HumanResSetup.Get();
            HumanResSetup.TestField("Annual Appraisal Nos.");
           // NoSeriesMgt.InitSeries(HumanResSetup."Annual Appraisal Nos.", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(HumanResSetup."Annual Appraisal Nos.", Today, true);
        end;

        "Time Created" := Time;
        "Date created" := Today;
        "Created By" := UserId;

        ApproverUSerID := '';
        SecondApproverUSerID := '';

        Usersetup.Get("Created By");
        "Employee No" := Usersetup."Employee No.";
        "Employee Name" := Usersetup."Employee Name";
        ApproverUSerID := Usersetup."Approver ID";
        SecondApproverUSerID := Usersetup."Second Supervisor";

        if EmployeeRec.Get("Employee No") then begin
            "Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";
            Validate("Global Dimension 1 Code");
            "Global Dimension 2 Code" := EmployeeRec."Global Dimension 2 Code";
            Validate("Global Dimension 2 Code");
            EmployeeRec.CalcFields(EmployeeRec."Job Title");
            "Current Designation" := EmployeeRec."Job Title";
            "Terms of service" := Format(EmployeeRec."Employement Terms");
        end;

        //approver 1
        EmployeeRec1.Reset;
        EmployeeRec1.SetRange("User ID", ApproverUSerID);
        if EmployeeRec1.Find('-') then begin
            "Supervisor Code" := EmployeeRec1."No.";
            EmployeeRec1.CalcFields(EmployeeRec1."Job Title");
            "Supervisor Designation" := EmployeeRec1."Job Title";
            "Supervisor Name" := EmployeeRec1.FullName;
            ApproverID := ApproverUSerID;
        end;

        //approver 2
        EmployeeRec2.Reset;
        EmployeeRec2.SetRange(HOD, false);
        EmployeeRec2.SetRange("User ID", SecondApproverUSerID);
        if EmployeeRec2.Find('-') then begin
            "Second Supervisor Code" := EmployeeRec2."No.";
            EmployeeRec2.CalcFields(EmployeeRec2."Job Title");
            "Second Supervisor Designation" := EmployeeRec2."Job Title";
            "Second Supervisor Name" := EmployeeRec2.FullName;
            "Second ApproverID" := SecondApproverUSerID;
        end;

        //details from company info
        CompanyInfo.Reset;
        if CompanyInfo.FindSet then begin
            Mission := CompanyInfo.Mission;
            Vision := CompanyInfo.Vision;
            "Core Values" := CompanyInfo."Core Values";
        end;
    end;

    var
        Employee: Record Employee;
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Usersetup: Record "User Setup";
        EmployeeRec: Record Employee;
        ApproverUSerID: Code[100];
        EmployeeRec1: Record Employee;
        CompanyInfo: Record "Company Information";
        Objectives: Record "Departmental ObjectisAppraisal";
        ObjHeader: Record "Departmental Objectives Header";
        ObjLines: Record "Departmental Objectives Lines";
        AppPeriod: Record "Appraisal  Period";
        Objectives1: Record "Departmental ObjectisAppraisal";
        ObjHeader1: Record "Departmental Objectives Header";
        ObjLines1: Record "Departmental Objectives Lines";
        AppraisalLines: Record "Annual  Appraisal Lines";
        EmployeeRec2: Record Employee;
        SecondApproverUSerID: Code[100];
        DimensionVal: Record "Dimension Value";
}

