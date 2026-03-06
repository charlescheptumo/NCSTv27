#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56041 "Document registration"
{

    fields
    {
        field(1; "Entry No"; Code[10])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if RegistrationType = Registrationtype::Document then begin
                    if "Entry No" <> xRec."Entry No" then begin
                        NoSetup.Get;
                        NoSeriesMgt.TestManual(NoSetup."Document Registration Nos");
                        "No. Series" := '';
                    end;
                end else begin
                    if "Entry No" <> xRec."Entry No" then begin
                        NoSetup.Get;
                        NoSeriesMgt.TestManual(NoSetup."Court Attendance Nos");
                        "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2; "Document Type"; Code[20])
        {
            TableRelation = "Case Document Types".Code;
        }
        field(3; "Document Sub Type"; Code[20])
        {
            TableRelation = "Case Document Sub Types".Code where("Case Document Type" = field("Document Type"));
        }
        field(4; "Case ID"; Code[20])
        {
            TableRelation = "Case File"."Case ID";

            trigger OnValidate()
            begin
                if CaseD.Get("Case ID") then begin
                    "Case Title" := CaseD."Case Title";
                    "Accused Name" := CaseD."Accused Name";
                    "Assigned Investigator" := CaseD."Main Investigator No";
                    "Court Rank" := CaseD."Court Rank";
                    "Court Station" := CaseD."Court Station";
                end;
            end;
        }
        field(5; "Case Title"; Text[50])
        {
        }
        field(6; "Accused Name"; Text[50])
        {
        }
        field(7; "Document Date"; Date)
        {
        }
        field(8; "Document Description"; Text[60])
        {
        }
        field(9; "Document Origin"; Code[30])
        {
        }
        field(10; "Court Date"; Date)
        {
        }
        field(11; "Assigned Investigator"; Code[30])
        {
        }
        field(12; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
        }
        field(13; "Created By"; Code[30])
        {
            Editable = false;
            Enabled = true;
        }
        field(14; "Date Created"; Date)
        {
            Editable = false;
        }
        field(15; "Time Created"; Time)
        {
            Editable = false;
        }
        field(16; "No. Series"; Code[20])
        {
        }
        field(17; Blocked; Boolean)
        {
        }
        field(18; "Court Rank"; Code[30])
        {
            Editable = false;
        }
        field(19; "Court Station"; Code[30])
        {
            Editable = false;
        }
        field(20; "Registration Entry No"; Code[20])
        {
            TableRelation = "Document registration"."Entry No" where(RegistrationType = filter(Document));

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
        field(22; "Prosecutor No."; Code[20])
        {
            TableRelation = "Case Investigator"."Employee No" where("Case No" = field("Case ID"));
        }
        field(23; "Next Cause of Action"; Text[60])
        {
        }
        field(24; "Court Attendance Date"; Date)
        {
        }
        field(25; "Start time"; Time)
        {
        }
        field(26; "End Time"; Time)
        {
        }
        field(27; "Before Type"; Option)
        {
            OptionCaption = 'Judge,Magistrate,Arbitrator';
            OptionMembers = Judge,Magistrate,Arbitrator;
        }
        field(28; "Before Name"; Text[30])
        {
        }
        field(29; "Accused Counsel"; Text[50])
        {
        }
        field(30; "Intrested Party Counsel"; Text[50])
        {
        }
        field(31; "Nature Of Application"; Text[50])
        {
        }
        field(32; "Outcome of Proceedings"; Text[50])
        {
        }
        field(33; RegistrationType; Option)
        {
            OptionCaption = 'Document,Return';
            OptionMembers = Document,Return;
        }
        field(34; "Exhibit produced in court"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No", "Case Title")
        {
        }
    }

    trigger OnInsert()
    begin
        if RegistrationType = Registrationtype::Document then begin
            if "Entry No" = '' then begin
                NoSetup.Get;
                NoSetup.TestField(NoSetup."Document Registration Nos");
              //  NoSeriesMgt.InitSeries(NoSetup."Document Registration Nos", xRec."No. Series", 0D, "Entry No", "No. Series");
                "Entry No" := NoSeriesMgt.GetNextNo(NoSetup."Document Registration Nos", Today, true);
            end;
        end else begin
            if "Entry No" = '' then begin
                NoSetup.Get;
                NoSetup.TestField(NoSetup."Court Attendance Nos");
              //  NoSeriesMgt.InitSeries(NoSetup."Court Attendance Nos", xRec."No. Series", 0D, "Entry No", "No. Series");
                "Entry No" := NoSeriesMgt.GetNextNo(NoSetup."Court Attendance Nos", Today, true);
            end;
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Date Created" := Today;
        "Time Created" := Time;
    end;

    var
        CaseD: Record "Case File";
        NoSetup: Record "Copyright Setup";
        NoSeriesMgt: Codeunit "No. Series";
        DocReg: Record "Document registration";
}
