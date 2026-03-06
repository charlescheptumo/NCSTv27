#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56059 "Project Meeting Registrer"
{

    fields
    {
        field(1; "Meeting ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Meeting Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pre-Kickoff,Analysis';
            OptionMembers = " ","Pre-Kickoff",Analysis;
        }
        field(3; "Project ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Project"."No.";
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Contractor ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(7; Region; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region));
        }
        field(8; "All Day Event"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Duration; Duration)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Venue/Location"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Project Manager"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(16; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(17; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "No.Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Steering Committee No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Steering Committee Meeting" = const(true)) "IFS Tender Committee"."Document No." where("Reference Number" = const('1'));
        }
        field(20; "Steering Committee Meeting"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Meeting ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Meeting ID" = '' then begin
            ICT.Get;
            ICT.TestField(ICT."Project Meeting Register Nos");
        //    NoSeriesMgt.InitSeries(ICT."Project Meeting Register Nos", xRec."No.Series", 0D, "Meeting ID", "No.Series");
            "Meeting ID" := NoSeriesMgt.GetNextNo(ICT."Project Meeting Register Nos", WorkDate(), true);
        end;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        ICT: Record "ICT Helpdesk Global Parameters";
}
