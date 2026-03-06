#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69101 "Staff Establishment Header"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "CSP ID"; Code[30])
        {
            TableRelation = "Corporate Strategic Plans";
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "End Date"; Date)
        {
        }
        field(6; "CSP Description"; Text[100])
        {
            CalcFormula = lookup("Corporate Strategic Plans".Description where(Code = field("CSP ID")));
            FieldClass = FlowField;
        }
        field(7; "Created By"; Code[30])
        {
        }
        field(8; "Created On"; DateTime)
        {
        }
        field(9; Active; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Approved Quantity"; Integer)
        {
            CalcFormula = sum("Staff Establishment Task Lines"."No. of Posts" where("Staff Establishment Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(11; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(12; "Esta Dimension 1 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Esta Dimension 2 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Esta Dimension 3 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Esta Dimension 4 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
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

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
    end;

    var
        QualificationSetUp: Record Qualification;
}

