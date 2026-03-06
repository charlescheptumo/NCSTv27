#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56038 "Court Attendance Return"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    NoSetup.Get;
                    NoSeriesMgt.TestManual(NoSetup."Court Attendance Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Registration Entry No"; Code[20])
        {
            TableRelation = "Document registration"."Entry No";

            trigger OnValidate()
            begin
                if DocReg.Get("Registration Entry No") then begin
                    "Case ID" := DocReg."Case ID";
                    "Accused Name" := DocReg."Accused Name";
                    "Case Title" := DocReg."Case Title";
                    "Court Station" := DocReg."Court Station";
                    "Court Rank" := DocReg."Court Rank";
                end;
            end;
        }
        field(3; "Case ID"; Code[20])
        {
            Editable = false;
        }
        field(4; "Document Date"; Date)
        {
        }
        field(5; Verdict; Text[30])
        {
        }
        field(6; "Next Court Date"; Date)
        {
        }
        field(7; "Prosecutor No."; Code[20])
        {
            TableRelation = "Case Investigator"."Employee No" where("Case No" = field("Case ID"));
        }
        field(8; "Next Cause of Action"; Text[60])
        {
        }
        field(9; "Court Attendance Date"; Date)
        {
        }
        field(10; "Start time"; Time)
        {
        }
        field(11; "End Time"; Time)
        {
        }
        field(12; "Before Type"; Option)
        {
            OptionCaption = 'Judge,Magistrate,Arbitrator';
            OptionMembers = Judge,Magistrate,Arbitrator;
        }
        field(13; "Before Name"; Text[30])
        {
        }
        field(14; "Date Created"; Date)
        {
            Editable = false;
        }
        field(15; "Time Created"; Time)
        {
            Editable = false;
        }
        field(16; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(17; "No. Series"; Code[20])
        {
        }
        field(18; "Case Title"; Text[60])
        {
            Editable = false;
        }
        field(19; "Accused Name"; Text[50])
        {
            Editable = false;
        }
        field(20; "Accused Counsel"; Text[50])
        {
        }
        field(21; "Intrested Party Counsel"; Text[50])
        {
        }
        field(22; "Nature Of Application"; Text[50])
        {
        }
        field(23; "Outcome of Proceedings"; Text[50])
        {
        }
        field(24; "Court Rank"; Code[30])
        {
            Editable = false;
        }
        field(25; "Court Station"; Code[30])
        {
            Editable = false;
        }
        field(26; RegistrationType; Option)
        {
            OptionCaption = 'Document,Return';
            OptionMembers = Document,Return;
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
        if "No." = '' then begin
            NoSetup.Get;
            NoSetup.TestField(NoSetup."Court Attendance Nos");
         //   NoSeriesMgt.InitSeries(NoSetup."Court Attendance Nos", xRec."No. Series", 0D, "No.", "No. Series");
            "No." := NoSeriesMgt.GetNextNo(NoSetup."Court Attendance Nos", Today, true);    
        end;

        "Date Created" := Today;
        "Created By" := UserId;
        "Time Created" := Time;
        "Document Date" := Today;
    end;

    var
        NoSetup: Record "Copyright Setup";
        NoSeriesMgt: Codeunit "No. Series";
        proceed: Record "Case Document Types";
        DocReg: Record "Document registration";
}
