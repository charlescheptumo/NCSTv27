#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 90002 tableextension90002 extends "Salesperson/Purchaser"
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(1, Rec."Global Dimension 1 Code");
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(2, Rec."Global Dimension 2 Code");
            end;
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(2, Rec."Global Dimension 2 Code");
            end;
        }
        field(70000; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Department),
                                                                "Direct Reports To" = field("Directorate Code"));
        }
        field(70001; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70002; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70003; Region; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70004; "Role Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Sales Person,Procurement Officer';
            OptionMembers = ,"Sales Person","Procurement Officer";
        }
        field(70005; "Employee Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(70006; Blocked2; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70007; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                emP.Reset;
                emP.SetRange("No.", Rec."Employee No");
                if emP.FindSet then begin
                    emP.CalcFields("Job Title");
                    Rec.Name := emP.FullName;
                    Rec."Employee Status" := emP.Status;
                    Rec."Job Title" := emP."Job Title";
                    Rec."Directorate Code" := emP."Directorate Code";
                    Rec."Department Code" := emP."Department Code";
                    Rec.Region := emP.Region;
                    Rec."Phone No." := emP."Phone No.";
                    Rec."E-Mail" := emP."E-Mail";
                    Rec.Validate(Rec."Global Dimension 1 Code", emP."Global Dimension 1 Code");
                    Rec.Validate(Rec."Global Dimension 2 Code", emP."Global Dimension 2 Code");
                end;
            end;
        }
    }

    var
        emP: Record Employee;
}
