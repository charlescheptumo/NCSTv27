#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69613 "Recruitment Plan"
{
    //LookupPageId = 69620;
    //DrillDownPageId = 69620;


    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Financial Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";


            //Fred Validate Start and end date from financial year code
            trigger OnValidate()
            begin
                FinYearCode.Reset();
                FinYearCode.SetRange(Code, Rec."Financial Year Code");
                if FinYearCode.FindFirst() then begin
                    "Planning Start Date" := FinYearCode."Starting Date";
                    "Planning End Date" := FinYearCode."Ending Date";
                end;
            end;
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "External Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Planning Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Planning End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Corporate Strategic Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans";
        }
        field(9; "Approved Staff Establishment"; Integer)
        {
            CalcFormula = sum("Recruitment Planning Line"."Staff Establishment" where("Recruitment Plan ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "No. of Planned New Hires"; Integer)
        {
            CalcFormula = sum("Recruitment Planning Line"."No. of Planned New Hires" where("Recruitment Plan ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Total Recruitment Budget (LCY)"; Decimal)
        {
            CalcFormula = sum("Recruitment Plan Position"."Recruitment Budget Cost (LCY)" where("Recruitment Plan ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "No. of Recruitment Requisition"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Approval Status"; Enum "App Status")
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created BY"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Recruitment Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Annual HR Plan,Special Recruitment,Project Recruitment,Manpower Forecast,Functional Plan';
            OptionMembers = "Annual HR Plan","Special Recruitment","Project Recruitment","Manpower Forecast","Functional Plan";
        }
        field(20; "Job No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Average Cost/Hire"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Estimated Annual Salary"; Decimal)
        {
            Caption = 'Total Estimated Annual Salary (LCY)';
            DataClassification = ToBeClassified;
        }
        field(23; "No. of Vacancies"; Integer)
        {
            CalcFormula = count(Vacancy where("Recruitment Plan ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(25; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(26; "Global Dimension 1"; Text[30])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1';
            TableRelation = "Dimension Value".Name where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                DimensionValue.Reset;
                DimensionValue.SetRange("Dimension Code", "Global Dimension 1 Code");
                if DimensionValue.FindSet then begin
                    "Global Dimension 1" := DimensionValue.Name;
                end;
            end;
        }
        field(27; "Global Dimension 2"; Text[30])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2';
            TableRelation = "Dimension Value".Name where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                DimensionValue.Reset;
                DimensionValue.SetRange("Dimension Code", "Global Dimension 2");
                if DimensionValue.FindSet then begin
                    "Global Dimension 2" := DimensionValue.Name;
                end;
            end;
        }
        field(28; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Functional Planned Hires"; Integer)
        {
            CalcFormula = sum("Recruitment Planning Line"."No. of Planned New Hires" where("Recruitment Plan ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Annual Recruitment Plan No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Plan"."Document No." where("Financial Year Code" = field("Financial Year Code"),
                                                                     "Recruitment Plan Type" = const("Annual HR Plan"));
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Recruitment Plan Type" = "recruitment plan type"::"Functional Plan" then begin
            if "Document No." = '' then begin
                HumanResourcesSetup.Get;
                //muga
                //HumanResourcesSetup.TestField("Functional Plan Nos.");
                //NoSeriesMgt.InitSeries(HumanResourcesSetup."Functional Plan Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;

            Employee.Reset;
            Employee.SetRange("User ID", UserId);
            if Employee.FindFirst then begin
                /* "Global Dimension 1 Code":=Employee."Global Dimension 1 Code";//activated per client
                 VALIDATE("Global Dimension 1 Code");
                 "Global Dimension 2 Code":=Employee."Global Dimension 2 Code";
                 VALIDATE("Global Dimension 2 Code");*/
            end;
        end else begin
            if "Recruitment Plan Type" = "recruitment plan type"::"Annual HR Plan" then begin
                if "Document No." = '' then begin
                    HumanResourcesSetup.Get;
                    //muga
                    //HumanResourcesSetup.TestField("Recruitment Plan Nos.");
                    //NoSeriesMgt.InitSeries(HumanResourcesSetup."Recruitment Plan Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
                end;
            end;
        end;
        "Document Date" := Today;
        "Created BY" := UserId;
        "Created On" := CurrentDatetime;

        // FinancialYearCode.Reset();
        // FinancialYearCode.FindLast;
        // "Financial Year Code" := FinancialYearCode.Code;

    end;

    var
        DimMgt: Codeunit DimensionManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
        Employee: Record Employee;
        DimensionValue: Record "Dimension Value";
        NoSeriesMgt: Codeunit "No. Series";
        FinancialYearCode: Record "Financial Year Code";
        FinYearCode: Record "Financial Year Code";

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Recruitment Plan", "Document No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;
}

