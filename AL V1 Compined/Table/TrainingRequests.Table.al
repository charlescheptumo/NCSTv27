#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69220 "Training Requests"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            Editable = true;

            trigger OnValidate()
            begin
                if "Employee No." <> xRec."Employee No." then begin
                    HRSetup.Get;
                    NoSeriesMgt.TestManual(HRSetup."Training Application Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Course Title"; Code[20])
        {
            NotBlank = false;
            TableRelation = "Training Needs"."No.";

            trigger OnValidate()
            begin
                HRTrainingNeeds.Reset;
                if HRTrainingNeeds.Get("Course Title") then begin
                    Description := HRTrainingNeeds.Description;
                    "Start DateTime" := HRTrainingNeeds."Start Date";
                    "End DateTime" := HRTrainingNeeds."End Date";
                    "Bondage Period" := HRTrainingNeeds."Bondage Duration";
                    "Duration Units" := HRTrainingNeeds."Duration Units";
                    Duration := HRTrainingNeeds.Duration;
                    Cost := HRTrainingNeeds."Cost Of Training";
                    "Purpose of Training" := Format(HRTrainingNeeds."Need Source");
                    Location := HRTrainingNeeds.Location;
                    Provider := HRTrainingNeeds.Provider;
                    "Provider Name" := HRTrainingNeeds."Provider Name";
                    "Approved Cost" := HRTrainingNeeds."Cost Of Training";
                end else begin
                    Description := '';
                    "Start DateTime" := 0D;
                    "End DateTime" := 0D;
                    //"Duration Units":=0dt;
                    // Duration:=;
                    Cost := 0;
                    "Purpose of Training" := '';
                    Location := '';
                    Provider := '';
                    "Provider Name" := '';

                end;

                CalcFields("No. of Participants");
            end;
        }
        field(3; "Start DateTime"; Date)
        {
            Editable = false;
        }
        field(4; "End DateTime"; Date)
        {
            Editable = false;
        }
        field(5; "Duration Units"; Option)
        {
            Editable = false;
            Enabled = false;
            OptionMembers = Hours,Days,Weeks,Months,Years;
        }
        field(6; Duration; Decimal)
        {
            Editable = false;
        }
        field(7; Cost; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if Posted then begin
                    if Duration <> xRec.Duration then begin
                        Error('%1', 'You cannot change the costs after posting');
                        Duration := xRec.Duration;
                    end
                end
            end;
        }
        field(8; Location; Text[30])
        {
            Editable = false;
        }
        field(11; Posted; Boolean)
        {
            Editable = true;
        }
        field(12; Description; Text[100])
        {
            Editable = false;
        }
        field(28; "Training Evaluation Results"; Option)
        {
            OptionMembers = "Not Evaluated",Passed,Failed;
        }
        field(29; Year; Integer)
        {
        }
        field(30; Provider; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange(Vend."No.", Provider);
                if Vend.Find('-') then begin
                    "Provider Name" := Vend.Name;
                end;
            end;
        }
        field(31; "Purpose of Training"; Text[100])
        {
        }
        field(32; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(33; "Employee No."; Code[10])
        {
            NotBlank = true;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if HREmp.Get("Employee No.") then begin
                    "Employee Department" := HREmp."Global Dimension 2 Code";
                    "Employee Name" := HREmp.FullName;
                    "Date of First Appointment" := HREmp."Employment Date";
                    HREmp.CalcFields(HREmp."Job Title");
                    Designation := HREmp."Job Title";
                end;
            end;
        }
        field(35; "Application Date"; Date)
        {
            Editable = false;
        }
        field(36; "No. Series"; Code[10])
        {
        }
        field(37; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(39; Recommendations; Code[20])
        {
        }
        field(40; "User ID"; Code[50])
        {
        }
        field(41; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(42; "Employee Department"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(43; "Employee Name"; Text[50])
        {
        }
        field(44; "Provider Name"; Text[50])
        {
        }
        field(45; "Training Group No."; Code[10])
        {
            NotBlank = true;
            TableRelation = "Training Applications Group"."Line No.";
        }
        field(46; "No. of Participants"; Integer)
        {
            CalcFormula = count("Training Participants" where("Training Code" = field("Course Title")));
            FieldClass = FlowField;
        }
        field(47; "Approved Cost"; Decimal)
        {
        }
        field(48; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(49; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50; "Actual Start Date"; Date)
        {

            trigger OnValidate()
            var
                NullDate: DateFormula;
            begin
                /*IF Duration <> NullDate THEN
                IF "Actual Start Date" <> 0D THEN BEGIN
                "Actual End Date" := CALCDATE(Duration,"Actual Start Date");
                END
                ELSE
                "Actual End Date" :=  0D;
                */

            end;
        }
        field(51; "Actual End Date"; Date)
        {

            trigger OnValidate()
            begin
                if Format("Bondage Period") <> '' then
                    if "Actual End Date" <> 0D then begin
                        "Bondage End Date" := CalcDate("Bondage Period", "Actual End Date");
                    end
                    else
                        "Bondage End Date" := 0D;
            end;
        }
        field(52; "Bondage Period"; DateFormula)
        {

            trigger OnValidate()
            begin
                if Format("Bondage Period") <> '' then
                    if "Actual End Date" <> 0D then begin
                        "Bondage End Date" := CalcDate("Bondage Period", "Actual End Date");
                    end
                    else
                        "Bondage End Date" := 0D;
            end;
        }
        field(53; "Bondage End Date"; Date)
        {
        }
        field(54; "Estimated Cost"; Decimal)
        {
            CalcFormula = sum("Training Cost".Cost where("Training ID" = field("Course Title")));
            FieldClass = FlowField;
        }
        field(55; "Mode of study"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Date of First Appointment"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(57; Designation; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        if Status <> Status::Open then
            Error(mcontent);
    end;

    trigger OnInsert()
    begin
        if Code = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Training Application Nos.");
         //   NoSeriesMgt.InitSeries(HRSetup."Training Application Nos.", xRec."No. Series", 0D, Code, "No. Series");
            Code := NoSeriesMgt.GetNextNo(HRSetup."Training Application Nos.", Today, true);
        end;

        "User ID" := UserId;
        "Application Date" := Today;
    end;

    var
        HRTrainingNeeds: Record "Training Needs";
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        mcontent: label 'Status must be new on Training Application No.';
        mcontent2: label '. Please cancel the approval request and try again';
        HREmp: Record Employee;
        Vend: Record Vendor;
}

