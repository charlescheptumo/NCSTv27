#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69124 "Training Needs"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin

                if "No." <> xRec."No." then begin
                    NoSeriesMgt.TestManual(HrSetup."Training Need Nos.");
                end;
            end;
        }
        field(2; Description; Text[200])
        {
            Caption = 'Task That Require Performance Improvement';
        }
        field(3; "Start Date"; Date)
        {
        }
        field(4; "End Date"; Date)
        {
        }
        field(5; "Duration Units"; Option)
        {
            OptionMembers = Hours,Days,Weeks,Months,Years;
        }
        field(6; Duration; Decimal)
        {
        }
        field(7; "Cost Of Training"; Decimal)
        {
            Caption = 'Agreed Estimated Cost';

            trigger OnValidate()
            begin
                if Posted then begin
                    if Duration <> xRec.Duration then begin
                        Message('%1', 'You cannot change the costs after posting');
                        Duration := xRec.Duration;
                    end
                end
            end;
        }
        field(8; Location; Text[100])
        {
        }
        field(9; Qualification; Code[30])
        {
            NotBlank = true;
            TableRelation = Qualification.Code;
        }
        field(10; "Re-Assessment Date"; Date)
        {
        }
        field(11; Source; Code[50])
        {
            NotBlank = true;
            TableRelation = "Training Source".Source;
        }
        field(12; "Need Source"; Option)
        {
            OptionCaption = 'Appraisal,Succesion,Training,Employee,Employee Skill Plan';
            OptionMembers = Appraisal,Succesion,Training,Employee,"Employee Skill Plan";
        }
        field(13; Provider; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(14; Post; Boolean)
        {
        }
        field(15; Posted; Boolean)
        {
            Editable = true;
        }
        field(16; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(17; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(18; Closed; Boolean)
        {
            Editable = false;
        }
        field(19; "Qualification Code"; Code[20])
        {
            TableRelation = Qualification.Code where(Code = field("Qualification Type"));

            trigger OnValidate()
            begin
                HRQualifications.SetRange(HRQualifications.Code, "Qualification Code");
                if HRQualifications.Find('-') then
                    "Qualification Description" := HRQualifications.Description;
            end;
        }
        field(20; "Qualification Type"; Code[30])
        {
            NotBlank = true;
            TableRelation = "HR Models".Code where(Type = const("Qualification Type"));
        }
        field(21; "Qualification Description"; Text[50])
        {
        }
        field(22; "Training Applicants"; Integer)
        {
            CalcFormula = count("Training Participants" where("Training Code" = field("No.")));
            FieldClass = FlowField;
        }
        field(23; "Training Applicants (Passed)"; Integer)
        {
            CalcFormula = count("Training Requests" where("Course Title" = field("No."),
                                                           "Training Evaluation Results" = const(Passed)));
            FieldClass = FlowField;
        }
        field(24; "Training Applicants (Failed)"; Integer)
        {
            CalcFormula = count("Training Requests" where("Course Title" = field("No."),
                                                           "Training Evaluation Results" = const(Failed)));
            FieldClass = FlowField;
        }
        field(25; "Provider Name"; Text[50])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field(Provider)));
            FieldClass = FlowField;
        }
        field(26; "Job id"; Code[50])
        {
            TableRelation = "Company Jobs"."Job ID";
        }
        field(27; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(28; "Budget Controlled"; Boolean)
        {
        }
        field(29; "G/L Account"; Code[10])
        {
            TableRelation = "G/L Account"."No." where("Expense Code" = field("Expense Code"));
        }
        field(30; "G/L Account Name"; Text[50])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("G/L Account")));
            FieldClass = FlowField;
        }
        field(31; "Expense Code"; Code[10])
        {
        }
        field(32; "Bondage Required"; Boolean)
        {

            trigger OnValidate()
            begin
                TestField("Start Date");
                TestField("End Date");

                Clear("Bondage Start Date");
                Clear("Bondage Duration");
                Clear("Bondage Release Date");

                if "Bondage Required" then begin
                    "Bondage Start Date" := "End Date";
                    Validate("Bondage Duration");
                end;
            end;
        }
        field(33; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,Rejected,Submitted;
        }
        field(34; "Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(35; "Early Bonded Exit?"; Boolean)
        {
        }
        field(36; "Bondage Start Date"; Date)
        {
            Editable = false;
        }
        field(37; "Bondage Duration"; DateFormula)
        {

            trigger OnValidate()
            begin
                "Bondage Release Date" := CalcDate("Bondage Duration", "Bondage Start Date");
            end;
        }
        field(38; "Bondage Release Date"; Date)
        {
            Editable = false;
        }
        field(39; "Inclusive of Non Working Days"; Boolean)
        {

            trigger OnValidate()
            begin
                CalculateDate;
            end;
        }
        field(40; "No. of Training Cost Items"; Integer)
        {
            Enabled = false;
        }
        field(41; "Total Cost"; Decimal)
        {
            CalcFormula = sum("Training Cost".Cost where("Training ID" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(44; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(45; Committee; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Committees.Code;

            trigger OnValidate()
            begin
                if CommitteesRec.Get(Committee) then
                    "Committee Name" := CommitteesRec.Description;
            end;
        }
        field(46; "Committee Verdict"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Approved,Disapproved';
            OptionMembers = " ",Approved,Disapproved;
        }
        field(47; "Committee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(48; "Updated By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Date Updated"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Time Updated"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(51; "Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Need Categories".Code where(Cadre = filter(false));

            trigger OnValidate()
            begin
                NeedCategories.Reset;
                NeedCategories.SetRange(Code, "Category Code");
                if NeedCategories.FindSet then begin
                    "Category Description" := NeedCategories.Description;
                end;
            end;
        }
        field(52; "Category Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Cadre Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Need Categories".Code where(Cadre = filter(true));

            trigger OnValidate()
            begin
                NeedCategories.Reset;
                NeedCategories.SetRange(Code, "Cadre Code");
                if NeedCategories.FindSet then begin
                    "Cadre Description" := NeedCategories.Description;
                end;
            end;
        }
        field(54; "Cadre Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "No to be Trained"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Prioritized Training"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Skill for Current Job"; Text[250])
        {
            Caption = 'Skill for Current Job Performance';
            DataClassification = ToBeClassified;
        }
        field(58; "Skill for Career Progression"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Training Dates"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Type of Training"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,In-house Training,External Training';
            OptionMembers = " ","In-house Training","External Training";
        }
        field(61; Planned; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Planned By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Date Planned"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Time Planned"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(65; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Time Created"; Time)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HrSetup.Get;
        HrSetup.TestField(HrSetup."Training Need Nos.");
        if "No." = '' then
          // NoSeriesMgt.InitSeries(HrSetup."Training Need Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            "No." := NoSeriesMgt.GetNextNo(HrSetup."Training Need Nos.", Today, true);
        /*
        IF "Application Code" = '' THEN BEGIN
          HRSetup.GET;
          HRSetup.TESTFIELD(HRSetup."Leave Application Nos.");
          NoSeriesMgt.InitSeries(HRSetup."Leave Application Nos.",xRec."No series",0D,"Application Code","No series");
        END;
        */

        "Time Created" := Time;
        "Date Created" := Today;
        "Created By" := UserId;

    end;

    var
        Employee: Record Employee;
        OK: Boolean;
        NoSeriesMgt: Codeunit "No. Series";
        HrSetup: Record "Human Resources Setup";
        Trainingneeds: Record "Training Needs";
        HRLeaveApp: Record "HR Leave Application";
        HRQualifications: Record Qualification;
        Vend: Record Vendor;
        mDay: Integer;
        Is_Empty: Boolean;
        CommitteesRec: Record Committees;
        NeedCategories: Record "Training Need Categories";


    procedure CalculateDate()
    var
        HRDates: Codeunit "HR Dates";
        DateForm: DateFormula;
        Duration2: text[50];
    begin
        TestField("Start Date");

        if "Start Date" <> 0D then begin
            "Re-Assessment Date" := 0D;


            begin
                if ("Start Date" = 0D) then
                    exit;

                if Duration2 <> '' then begin
                    Evaluate(DateForm, Duration2);
                    "End Date" := CalcDate(DateForm, "Start Date");
                end;
            end;
            "End Date" := CalcDate(Duration2, "Start Date");
        end;
    end;
}
