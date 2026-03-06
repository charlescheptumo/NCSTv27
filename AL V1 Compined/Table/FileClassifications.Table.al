#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59076 "File Classifications"
{
    Caption = 'Responsibility Center';
    DrillDownPageID = "Responsibility Center List";
    LookupPageID = "Responsibility Center List";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[255])
        {
            Caption = 'Name';
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
        fieldgroup(Brick; "Code", Name)
        {
        }
    }

    trigger OnDelete()
    begin
        DimMgt.DeleteDefaultDim(Database::"Responsibility Center", Code);
    end;

    trigger OnRename()
    begin
        DimMgt.RenameDefaultDim(Database::"Responsibility Center", xRec.Code, Code);
    end;

    var
        PostCode: Record "Post Code";
        DimMgt: Codeunit DimensionManagement;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Responsibility Center", Code, FieldNumber, ShortcutDimCode);
        Modify;
    end;
}
