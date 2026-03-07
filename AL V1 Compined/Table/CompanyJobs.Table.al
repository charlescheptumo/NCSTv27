#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59105 "Company Jobs"
{
    DrillDownPageID = Positions;
    LookupPageID = Positions;

    fields
    {
        field(1; "Job ID"; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Job Description"; Text[250])
        {
        }
        field(3; "No of Posts"; Integer)
        {

            trigger OnValidate()
            begin
                if "No of Posts" <> xRec."No of Posts" then
                    "Vacant Positions" := "No of Posts" - "Occupied Positions";
            end;
        }
        field(4; "Position Reporting to"; Code[20])
        {
            TableRelation = "Company Jobs"."Job ID";
        }
        field(5; "Occupied Positions"; Integer)
        {
            CalcFormula = count(Employee where(Position = field("Job ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Vacant Positions"; Integer)
        {
        }
        field(7; "Score code"; Code[20])
        {
            TableRelation = "Company Jobs";
        }
        field(8; "Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(9; "Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(10; "Dimension 3"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(11; "Dimension 4"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(12; "Dimension 5"; Code[20])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(13; "Dimension 6"; Code[20])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
        }
        field(14; "Dimension 7"; Code[20])
        {
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
        }
        field(15; "Dimension 8"; Code[20])
        {
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
        }
        field(16; "No of Position"; Integer)
        {
        }
        field(17; "Total Score"; Decimal)
        {
            CalcFormula = sum("Job Requirementx"."Score ID" where("Job Id" = field("Job ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Stage filter"; Integer)
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value";
        }
        field(19; Objective; Text[250])
        {
        }
        field(21; "Key Position"; Boolean)
        {
        }
        field(22; Category; Code[20])
        {
        }
        field(23; Grade; Code[20])
        {
            TableRelation = "Salary Scales";
        }
        field(24; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(25; "2nd Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(26; "3nd Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(27; Management; Boolean)
        {
        }
        field(28; "Employee Requisitions"; Integer)
        {
            CalcFormula = count("Employee Requisitions" where("Job ID" = field("Job ID")));
            FieldClass = FlowField;
        }
        field(29; UserID; Code[50])
        {
        }
        field(30; Status; Option)
        {
            Editable = true;
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(31; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(32; "Date Created"; Date)
        {
        }
        field(33; "Supervisor/Manager"; Code[50])
        {
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                HREmp.Get("Supervisor/Manager");
                "Supervisor Name" := HREmp.FullName;
            end;
        }
        field(34; "Supervisor Name"; Text[60])
        {
            Editable = false;
        }
        field(44; "Is Supervisor"; Boolean)
        {
        }
        field(45; "G/L Account"; Code[50])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(46; "Branch Name"; Text[50])
        {
        }
        field(47; Department; Code[10])
        {

            trigger OnValidate()
            begin
                /*Deps.RESET;
                Deps.SETRANGE(Deps."No.",Department);
                IF Deps.FIND('-') THEN BEGIN
                "Dept Name":=Deps.Department
                END*/

            end;
        }
        field(48; "Dept Name"; Text[50])
        {
        }
        field(49; "Activity Code"; Code[30])
        {
            TableRelation = Dimension;
        }
        field(50; Advertised; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Job ID")
        {
            Clustered = true;
        }
        key(Key2; "Job Description")
        {
        }
        key(Key3; "Vacant Positions")
        {
        }
        key(Key4; "Dimension 1")
        {
        }
        key(Key5; "Dimension 2")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Job; "Job ID", "Job Description")
        {
        }
    }

    var
        NoOfPosts: Decimal;
        HREmp: Record Employee;
}
