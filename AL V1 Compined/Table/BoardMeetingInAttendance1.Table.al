#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55019 "Board Meeting In Attendance1"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Meeting Code"; Code[20])
        {
            TableRelation = "Board Meetings";
        }
        field(3; "Member No"; Code[20])
        {
            TableRelation = "Committee Board Members".Code;

            trigger OnValidate()
            begin
                /*IF Memb.GET("Member No") THEN
                  "Member Name":=Memb.Names;*/

            end;
        }
        field(4; "Commitee No"; Code[20])
        {
            Editable = false;
            TableRelation = "Board Committees".Code;
        }
        field(5; "Meeting Name"; Text[250])
        {
            Editable = false;
        }
        field(6; "Member Name"; Text[30])
        {
            Editable = false;
        }
        field(7; "Committee  Name"; Text[250])
        {
        }
        field(8; "Meeting Date"; Date)
        {
            Editable = false;
        }
        field(9; Venue; Text[30])
        {
            Editable = false;
        }
        field(10; Attendance; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Present,Apology,Absent';
            OptionMembers = " ",Present,Apology,Absent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*IF Meeting.GET("Meeting Code") THEN BEGIN
          "Meeting Name":=Meeting.Description;
          "Meeting Date":=Meeting."Start date";
          "Commitee No":=Meeting."Meeting group Code";
          "Committee  Name":=Meeting."Meeting group";
          Venue:=Meeting."Venue/Location";
        END;
        */

    end;
}
