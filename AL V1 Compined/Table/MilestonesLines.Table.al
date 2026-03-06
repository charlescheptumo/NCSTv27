#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65045 "Milestones Lines"
{

    fields
    {
        field(1; "Project No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where("Document Type" = const(Project));
        }
        field(2; "Task No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project No"));
        }
        field(3; "Milestone Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Milestone Description"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Milestone Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Milestone End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Notification Period"; DateFormula)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Notfification Date" := CalcDate('-' + Format("Notification Period"), "Milestone End Date");
            end;
        }
        field(8; "Notfification Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Project No", "Task No", "Milestone Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
