#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50044 tableextension50044 extends "Fixed Asset"
{
    fields
    {
        field(50001; "FA G/L Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50002; "Reference Number"; Text[30])
        {
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ///ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(52000; Barcode; Code[20])
        {
        }
        field(52001; "Main Location"; Code[100])
        {
        }
        field(52002; "Sub Location"; Code[100])
        {
        }
        field(52003; Room; Code[50])
        {
        }
        field(52004; user; Code[100])
        {
        }
        field(52005; Dep; Code[150])
        {
        }
        field(56002; "Fixed Asset Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Vehicle,Others;
        }
        field(57021; "Vote Item"; Code[20])
        {
            CalcFormula = lookup("FA Posting Group"."Acquisition Cost Account" where(Code = field("FA Subclass Code")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "G/L Account";
        }
        field(57022; "Research Center"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Research Center?" = const(true),
                                                           "Operating Unit Type" = const(Department));
        }
        field(59002; test; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70000; "Asset Purchase Groups"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}
