#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56044 "CMO Registration"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
        }
        field(2; "Creation Date"; Date)
        {
            Editable = false;
        }
        field(3; "Creation Time"; Time)
        {
            Editable = false;
        }
        field(4; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(5; "Name of society"; Text[250])
        {
        }
        field(6; "Address of society"; Text[250])
        {
        }
        field(7; "Physical address"; Text[250])
        {
        }
        field(8; "Name of Agent"; Text[250])
        {
        }
        field(9; "Address of agent"; Text[250])
        {
        }
        field(10; "Date of registration"; Date)
        {
        }
        field(11; "Number of registration"; Code[50])
        {
        }
        field(12; "Number of members"; Decimal)
        {
        }
        field(13; Class; Code[20])
        {
            TableRelation = "Copyright Works Categories";

            trigger OnValidate()
            begin
                if "Works Categories".Get(Class) then begin
                    "Class of copyright owners" := "Works Categories".Description;
                end;
            end;
        }
        field(14; "Reasons for making the request"; Text[250])
        {
        }
        field(15; "Submission Date"; Date)
        {
            Editable = false;
        }
        field(16; "Submission Time"; Time)
        {
            Editable = false;
        }
        field(17; "Submitted By"; Code[100])
        {
            Editable = false;
        }
        field(18; Type; Option)
        {
            OptionCaption = ' ,Registration,Renewal';
            OptionMembers = " ",Registration,Renewal;
        }
        field(19; "Application number"; Code[20])
        {
        }
        field(20; "Registration number"; Code[50])
        {
        }
        field(21; "Any change which occurred"; Text[250])
        {
        }
        field(22; "Renewal Period"; Code[20])
        {
        }
        field(23; "Year of audited accounts"; Code[10])
        {
        }
        field(24; "Document Date"; Date)
        {
        }
        field(25; "No. Series"; Code[20])
        {
        }
        field(26; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval';
            OptionMembers = Open,Released,"Pending Approval";
        }
        field(27; "Class of copyright owners"; Text[250])
        {
        }
        field(28; "Date of expiry"; Date)
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

        if "No." = '' then begin
            if Type = Type::Registration then begin
                NoSetup.Get;
                NoSetup.TestField(NoSetup."CMO Registration Nos");
              //          NoSeriesMgt.InitSeries(NoSetup."CMO Registration Nos", xRec."No. Series", 0D, "No.", "No. Series");
                "No.":= NoSeriesMgt.GetNextNo(NoSetup."CMO Registration Nos", Today, true);
            end else
                if Type = Type::Renewal then begin
                    NoSetup.Get;
                    NoSetup.TestField(NoSetup."CMO Renewal Nos");
                  //          NoSeriesMgt.InitSeries(NoSetup."CMO Renewal Nos", xRec."No. Series", 0D, "No.", "No. Series");
                    "No.":= NoSeriesMgt.GetNextNo(NoSetup."CMO Renewal Nos", Today, true);
                end;
        end;

        "Creation Date" := Today;
        "Created By" := UserId;
        "Creation Time" := Time;
        "Document Date" := Today;
    end;

    var
        NoSetup: Record "Copyright Setup";
        NoSeriesMgt: Codeunit "No. Series";
        "Works Categories": Record "Copyright Works Categories";
}
