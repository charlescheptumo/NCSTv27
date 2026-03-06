#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59052 Planning
{

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    PlanningSetup.Get;
                    NoSeriesMgt.TestManual(PlanningSetup."Planning Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Annual Workplan"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Procurement Plan"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Annual Budget"; Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Department; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Accounting Period"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(9; "Responsible Employee"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Responsible Employee") then begin
                    "Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                end;
            end;
        }
        field(10; "Employee Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Strategic Objective"; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = Strategic;
        }
        field(12; Strategies; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategies Objective";
        }
        field(13; Activities; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Activities";
        }
        field(14; KPI; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic KPI";
        }
        field(15; Directorate; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = Directorate;
        }
        field(16; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Directorate Head"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(18; Subactivities; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(19; Division; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20; Section; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(21; Unit; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = "<Open",Released,"Pending Approval","Pending Prepayment>";
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
            PlanningSetup.Get;
            PlanningSetup.TestField(PlanningSetup."Planning Nos");
            //NoSeriesMgt.InitSeries(PlanningSetup."Planning Nos", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(PlanningSetup."Planning Nos", WorkDate(), true);
        end;
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        Emp: Record Employee;
        PlanningSetup: Record "Planning Setups";
        NoSeriesMgt: Codeunit "No. Series";

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Responsibility Center", No, FieldNumber, ShortcutDimCode);
        Modify;
    end;
}
