#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 90122 "Bank Comment Line"
{
    Caption = 'Bank Comment Line';
    // // DrillDownPageID = UnknownPage10131;
    //  //LookupPageID = UnknownPage10131;

    fields
    {
        field(1; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionCaption = 'Bank Rec.,Posted Bank Rec.,Deposit,Posted Deposit';
            OptionMembers = "Bank Rec.","Posted Bank Rec.",Deposit,"Posted Deposit";
        }
        field(2; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            NotBlank = true;
            TableRelation = "Bank Account";
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            // TableRelation = if ("Table Name" = const("Bank Rec.")) Table10120.Field2 where(Field1 = field("Bank Account No."))
            // else if ("Table Name" = const("Posted Bank Rec.")) Table10123.Field2 where(Field1 = field("Bank Account No."))
            // else if ("Table Name" = const(Deposit)) Table10140
            // else if ("Table Name" = const("Posted Deposit")) Table10143;
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
        }
        field(6; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(7; Comment; Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Table Name", "Bank Account No.", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }


    procedure SetUpNewLine()
    var
        CommentLine: Record "Bank Comment Line";
    begin
        CommentLine.SetRange("Table Name", "Table Name");
        CommentLine.SetRange("Bank Account No.", "Bank Account No.");
        CommentLine.SetRange("No.", "No.");
        if not CommentLine.FindFirst then
            Date := WorkDate;
    end;
}
