#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55017 "Committee Recommendatio Header"
{

    fields
    {
        field(1; "Recommendation No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Meeting Group"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Committees";

            trigger OnValidate()
            begin
                Committees1.Get("Meeting Group");
                "Meeting Group Name" := Committees1.Description;
            end;
        }
        field(3; "Meeting Group Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Date of the Meeting"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Time; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No.Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Meeting Ref No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Meetings";
        }
    }

    keys
    {
        key(Key1; "Recommendation No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Title; "Meeting Ref No.")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Recommendation No" = '' then begin
            CashMgt.Get;
            CashMgt.TestField(CashMgt."Recommendation No.");
         //   NoSeriesMgt.InitSeries(CashMgt."Recommendation No.", xRec."No.Series", 0D, "Recommendation No", "No.Series");
            "Recommendation No" := NoSeriesMgt.GetNextNo(CashMgt."Recommendation No.", Today, true);
        end;

        "Created By" := UserId;
        "Date of the Meeting" := Today;
        Time := Time;
    end;

    var
        Committees1: Record "Board Committees";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record "Cash Management Setup";
}
