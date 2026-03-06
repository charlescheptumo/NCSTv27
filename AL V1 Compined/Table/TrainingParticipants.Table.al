#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69221 "Training Participants"
{
    // DrillDownPageID = UnknownPage39005559;
    //LookupPageID = UnknownPage39005559;

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Employee Code"; Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                TrainingNeed: Record "Training Needs";
            begin
                HRemp.Reset;
                if HRemp.Get("Employee Code") then begin
                    "Employee Name" := HRemp."First Name" + ' ' + HRemp."Middle Name" + ' ' + HRemp."Last Name";
                    "Job Title" := HRemp."Job Title";
                    "Job Description" := HRemp.Position;
                    "Global Dimension 1 Code" := HRemp."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := HRemp."Global Dimension 2 Code";
                    //***********Added to facilitate the development of bondage report
                    TrainingNeed.Get("Training Code");
                    Bonded := TrainingNeed."Bondage Required";
                end
            end;
        }
        field(3; "Employee Name"; Text[60])
        {
        }
        field(4; Objectives; Text[100])
        {
        }
        field(5; "Training Code"; Code[20])
        {
        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(8; "Job Title"; Code[30])
        {
            TableRelation = "Company Jobs";
        }
        field(9; "Job Description"; Text[100])
        {
            CalcFormula = lookup("Company Jobs"."Job Description" where("Job ID" = field("Job Title")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; Bonded; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Training Code", "Employee Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
    }

    var
        HRemp: Record Employee;
}

