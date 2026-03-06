#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69214 "HR Leave Periods"
{
    Caption = 'Leave Periods';
    //LookupPageID = UnknownPage39005741;

    fields
    {
        field(1; "Code"; Integer)
        {
            Caption = 'Name';
        }
        field(3; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = true;
        }
        field(4; Locked; Boolean)
        {
            Caption = 'Locked';
        }
        field(5; Description; Text[30])
        {
        }
        field(6; Starts; Date)
        {
        }
        field(8; "Closed By"; Code[20])
        {
        }
        field(9; Ends; Date)
        {
        }
        field(10; test; Integer)
        {
            MaxValue = 99999999;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Closed, Description)
        {
        }
        key(Key3; Locked)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //TESTFIELD(Description,FALSE);
        //UpdateAvgItems(3);
    end;

    trigger OnInsert()
    begin
        /*
        AccountingPeriod2 := Rec;
        IF AccountingPeriod2.FIND('>') THEN
          AccountingPeriod2.TESTFIELD(Description,FALSE);
        //UpdateAvgItems(1);
        */

    end;

    trigger OnModify()
    begin
        //UpdateAvgItems(2);
    end;

    trigger OnRename()
    begin
        /*
        TESTFIELD(Description,FALSE);
        AccountingPeriod2 := Rec;
        IF AccountingPeriod2.FIND('>') THEN
          AccountingPeriod2.TESTFIELD(Description,FALSE);
        //UpdateAvgItems(4);
        */

    end;

    var
        Text000: label '<Month Text>';
        AccountingPeriod2: Record "HR Leave Periods";
        InvtSetup: Record "Inventory Setup";


    procedure UpdateAvgItems()
    begin
    end;
}
