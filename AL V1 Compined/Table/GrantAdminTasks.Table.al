#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65023 "Grant Admin Tasks"
{

    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Source Document Type" = "source document type"::"Grant Application" then begin
                    if "No." <> xRec."No." then begin
                        GrantsSetup.Get;
                        NoSeriesMgt.TestManual(GrantsSetup."Grant Admin Nos");
                        "No. Series" := '';
                    end;
                end;

                if "Source Document Type" = "source document type"::Project then begin
                    if "No." <> xRec."No." then begin
                        GrantsSetup.Get;
                        NoSeriesMgt.TestManual(GrantsSetup."Project Admin Nos");
                        "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2; "Source Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Grant Application,Project';
            OptionMembers = "Grant Application",Project;
        }
        field(3; "Sourec Document No."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Source Document Type" = const("Grant Application")) "Grant Funding Application"
            else if ("Source Document Type" = const(Project)) Job;
        }
        field(4; "Grant Admin Team Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Team Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Researcher No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(7; "Researcher Name"; Code[50])
        {
            DataClassification = ToBeClassified;
            Enabled = false;
        }
        field(8; "Research Center"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Center";
        }
        field(9; "Contact No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Task Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Internal Task,Phone Call,Meeting,Other';
            OptionMembers = "Internal Task","Phone Call",Meeting,Other;
        }
        field(11; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,InProgress,Completed';
            OptionMembers = Open,InProgress,Completed;
        }
        field(13; Priority; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Low,Medium,High';
            OptionMembers = Low,Medium,High;
        }
        field(14; "Research Program"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Program";
        }
        field(15; "Contact Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Date Closed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; Comment; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Research Center Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Program Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Contact Company No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Contact Company Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25; Recurring; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Recurring Date Interval"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Calc. Due Date From"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Application Title"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(30; Duration; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Last Time Modified"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "All Day Event"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; Location; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Unit Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Completed By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Reminder Due Date Formular"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Reminder Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.", "Sourec Document No.", "Researcher No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Source Document Type" = "source document type"::"Grant Application" then begin
            if "No." = '' then begin
                GrantsSetup.Get;
                GrantsSetup.TestField("Grant Admin Nos");
               // NoSeriesMgt.InitSeries(GrantsSetup."Grant Admin Nos", xRec."No. Series", 0D, "No.", "No. Series");
                "No.":= NoSeriesMgt.GetNextNo(GrantsSetup."Grant Admin Nos", Today, true);
            end;
        end;

        if "Source Document Type" = "source document type"::Project then begin
            if "No." = '' then begin
                GrantsSetup.Get;
                GrantsSetup.TestField("Project Admin Nos");
              //  NoSeriesMgt.InitSeries(GrantsSetup."Project Admin Nos", xRec."No. Series", 0D, "No.", "No. Series");
                "No.":= NoSeriesMgt.GetNextNo(GrantsSetup."Project Admin Nos", Today, true);
            end;
        end;
    end;

    var
        GrantsSetup: Record "Grants Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
