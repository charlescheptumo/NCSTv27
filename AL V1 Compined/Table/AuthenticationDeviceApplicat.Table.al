#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56047 "Authentication Device Applicat"
{

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then
                    NoSeriesMgt.TestManual(CopyrightSetup."Authentication Nos");
            end;
        }
        field(2; "Applicant No."; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Cust.Get("Applicant No.") then
                    "Applicant Name" := Cust.Name;
            end;
        }
        field(3; Date; Date)
        {
            Editable = false;
        }
        field(4; "Copyright Works"; Code[20])
        {
            TableRelation = "Service Item"."No." where("Customer No." = field("Applicant No."));

            trigger OnValidate()
            begin
                if APDS.Get("Copyright Works") then
                    "Copyright Title" := APDS."Copyright Title";
            end;
        }
        field(5; "Applicant Name"; Text[60])
        {
            Editable = false;
        }
        field(6; "Copyright Title"; Text[60])
        {
            Editable = false;
        }
        field(7; "Authentication Item"; Code[20])
        {
        }
        field(8; "Authentication Description"; Text[60])
        {
            Editable = false;
        }
        field(9; "Quantity Requested"; Decimal)
        {
            MinValue = 250;

            trigger OnValidate()
            begin
                "Amount Due" := "Quantity Requested" * "Unit Price";
            end;
        }
        field(10; "Unit Price"; Decimal)
        {
            Editable = false;
        }
        field(11; "Amount Due"; Decimal)
        {
            Editable = false;
        }
        field(12; "Minimum Quantity"; Decimal)
        {
            Editable = false;
        }
        field(13; "Date Created"; Date)
        {
            Editable = false;
        }
        field(14; "Time Created"; Time)
        {
            Editable = false;
        }
        field(15; "Created By"; Code[22])
        {
            Editable = false;
        }
        field(16; "Captured by"; Code[30])
        {
            Editable = false;
        }
        field(17; Created; Boolean)
        {
            Editable = false;
        }
        field(18; "No. Series"; Code[20])
        {
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

    trigger OnInsert()
    begin
        CopyrightSetup.Get();
        if "No." = '' then
          //  NoSeriesMgt.InitSeries(CopyrightSetup."Authentication Nos", xRec."No. Series", 0D, "No.", "No. Series");
          "No." := NoSeriesMgt.GetNextNo(CopyrightSetup."Authentication Nos", Today, true);
        "Created By" := UserId;
        "Date Created" := Today;
        "Time Created" := Time;
        "Minimum Quantity" := CopyrightSetup."APSD Minimum Quantity";
        "Unit Price" := CopyrightSetup."APSD Default Unit Price";
        "Authentication Item" := CopyrightSetup."Default APSD Item";
        if Item1.Get("Authentication Item") then
            "Authentication Description" := Item1.Description;
        Date := Today;
    end;

    var
        CopyrightSetup: Record "Copyright Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Cust: Record Customer;
        APDS: Record "Service Item";
        Item1: Record Item;
}
