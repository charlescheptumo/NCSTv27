#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70140 "BoQ Template Line1"
{
    Caption = 'Standard Purchase Line';

    fields
    {
        field(1; "BoQ Template ID"; Code[20])
        {
            Caption = 'BoQ Template ID';
            Editable = true;
            TableRelation = "Purchase Requisition Template";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            Editable = true;
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";

            trigger OnValidate()
            var
                OldType: Integer;
            begin
                // OldType := Type;
                // INIT;
                // Type := OldType;
            end;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(" ")) "Standard Text"
            else if (Type = const("G/L Account")) "G/L Account"
            else if (Type = const(Item)) Item where(Blocked = const(false))
            else if (Type = const("Fixed Asset")) "Fixed Asset"
            else if (Type = const("Charge (Item)")) "Item Charge";

            trigger OnValidate()
            var
                GLAcc: Record "G/L Account";
                Item: Record Item;
                ItemCharge: Record "Item Charge";
                FA: Record "Fixed Asset";
                StdTxt: Record "Standard Text";
                StdPurchCode: Record "Standard Purchase Code";
            begin
                // Quantity := 0;
                // "Amount Excl. VAT" := 0;
                // "Unit of Measure Code" := '';
                // Description := '';
                // IF "No." = '' THEN
                //  EXIT;
                // StdPurchCode.GET("Standard Purchase Code");
                // CASE Type OF
                //  Type::" ":
                //    BEGIN
                //      StdTxt.GET("No.");
                //      Description := StdTxt.Description;
                //    END;
                //  Type::"G/L Account":
                //    BEGIN
                //      GLAcc.GET("No.");
                //      GLAcc.CheckGLAcc;
                //      GLAcc.TESTFIELD("Direct Posting",TRUE);
                //      Description := GLAcc.Name;
                //      OnAfterValidateGLAccountNo(Rec,GLAcc);
                //    END;
                //  Type::Item:
                //    BEGIN
                //      Item.GET("No.");
                //      Item.TESTFIELD(Blocked,FALSE);
                //      Item.TESTFIELD("Gen. Prod. Posting Group");
                //      IF Item.Type = Item.Type::Inventory THEN
                //        Item.TESTFIELD("Inventory Posting Group");
                //      "Unit of Measure Code" := Item."Purch. Unit of Measure";
                //      Description := Item.Description;
                //      "Variant Code" := '';
                //    END;
                //  3:
                //    ERROR(Text001);
                //  Type::"Fixed Asset":
                //    BEGIN
                //      FA.GET("No.");
                //      FA.TESTFIELD(Inactive,FALSE);
                //      FA.TESTFIELD(Blocked,FALSE);
                //      Description := FA.Description;
                //    END;
                //  Type::"Charge (Item)":
                //    BEGIN
                //      ItemCharge.GET("No.");
                //      Description := ItemCharge.Description;
                //    END;
                // END;
            end;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(6; Quantity; Decimal)
        {
            BlankZero = true;
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                //TESTFIELD(Type);
            end;
        }
        field(7; "Amount Excl. VAT"; Decimal)
        {
            AutoFormatExpression = GetCurrency;
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Amount Excl. VAT';

            trigger OnValidate()
            begin
                // IF (Type <> Type::"G/L Account") AND (Type <> Type::"Charge (Item)") THEN
                //  ERROR(Text002,FIELDCAPTION(Type),Type);
            end;
        }
        field(8; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Unit of Measure";

            trigger OnValidate()
            begin
                //TESTFIELD(Type);
            end;
        }
        field(9; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(10; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(11; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = if (Type = const(Item)) "Item Variant".Code where("Item No." = field("No."));

            trigger OnValidate()
            var
                Item: Record Item;
                ItemVariant: Record "Item Variant";
            begin
                // IF "Variant Code" = '' THEN BEGIN
                //  IF Type = Type::Item THEN BEGIN
                //    Item.GET("No.");
                //    Description := Item.Description;
                //  END;
                //  EXIT;
                // END;
                //
                // TESTFIELD(Type,Type::Item);
                // ItemVariant.GET("No.","Variant Code");
                // Description := ItemVariant.Description;
            end;
        }
        field(12; "Item Category Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = Table72130.Field2;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDimensions;
            end;

            trigger OnValidate()
            begin
                //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
            end;
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
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
        field(70001; Technology; Code[10])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Table72100.Field1;

            trigger OnValidate()
            begin
                /*RoadTechnology.RESET;
                RoadTechnology.SETRANGE(RoadTechnology.Code,Technology);
                IF RoadTechnology.FINDSET THEN
                  "Labour(%)":=RoadTechnology."Labour Percentage";*/

            end;
        }
        field(70002; "Labour(%)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "BoQ Template ID", "Line No.", "No.", "Item Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // LOCKTABLE;
        // StdPurchCode.GET("Standard Purchase Code");
    end;

    trigger OnRename()
    begin
        //ERROR(Text000,TABLECAPTION);
    end;

    var
        StdPurchCode: Record "Standard Purchase Code";
        DimMgt: Codeunit DimensionManagement;
        Text000: label 'You cannot rename a %1.';
        Text001: label 'You cannot purchase resources.';
        Text002: label '%1 must not be %2.';
        CommentLbl: label 'Comment';

    procedure EmptyLine(): Boolean
    begin
        //EXIT(("No." = '') AND (Quantity = 0))
    end;

    procedure InsertLine(): Boolean
    begin
        //EXIT((Type = Type::" ") OR (NOT EmptyLine));
    end;

    local procedure GetCurrency(): Code[10]
    var
        StdPurchCode: Record "Standard Purchase Code";
    begin
        // IF StdPurchCode.GET("Standard Purchase Code") THEN
        //  EXIT(StdPurchCode."Currency Code");
        //
        // EXIT('');
    end;

    procedure ShowDimensions()
    begin
        // "Dimension Set ID" :=
        //  DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2',"Standard Purchase Code","Line No."));
        // DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        //DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    end;

    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        // DimMgt.LookupDimValueCode(FieldNumber,ShortcutDimCode);
        // DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        //DimMgt.GetShortcutDimensions("Dimension Set ID",ShortcutDimCode);
    end;

    procedure FormatType(): Text[20]
    begin
        // IF Type = Type::" " THEN
        //  EXIT(CommentLbl);
        //
        // EXIT(FORMAT(Type));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateGLAccountNo(var StandardPurchaseLine: Record "Standard Purchase Line"; GLAccount: Record "G/L Account")
    begin
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', '', "BoQ Template ID"),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}
