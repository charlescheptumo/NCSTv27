#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55008 "Worksheet Header"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Document Date"; Date)
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Pay Period"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(5; "Posted By"; Code[100])
        {
            Editable = false;
        }
        field(6; "Posted Date"; Date)
        {
            Editable = false;
        }
        field(7; Posted; Boolean)
        {
            Editable = false;
        }
        field(8; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(9; "Total Gross"; Decimal)
        {
            Editable = false;
        }
        field(10; "Total Net"; Decimal)
        {
            Editable = false;
        }
        field(11; "Total Tax"; Decimal)
        {
            Editable = false;
        }
        field(12; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(13; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(14; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Project Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Posted Time"; Time)
        {
            Editable = false;
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
}
