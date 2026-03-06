#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65042 "Project Billable Header"
{

    fields
    {
        field(1; "Project Billable ID"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                if "Project Billable ID" <> xRec."Project Billable ID" then begin
                    JobsSetup.Get;
                    NoSeriesMgt.TestManual(JobsSetup."Billable Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(3; "Project ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Project Type" = const("Fixed Price Billing")) Job."No." where("Project Type" = const("Fixed-Price"))
            else if ("Project Type" = const("Time & Material")) Job."No." where("Project Type" = const("Time and Material"));

            trigger OnValidate()
            begin
                if Jobs.Get("Project ID") then begin
                    "Currency Code" := Jobs."Currency Code";
                    Description := Jobs.Description;
                end;
            end;
        }
        field(4; "Financial Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
        }
        field(5; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(7; "Currency Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(8; "External Document No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Total billable Amount"; Decimal)
        {
            CalcFormula = sum("Billable Project Lines"."Billing Price" where("Project Billable ID" = field("Project Billable ID")));
            FieldClass = FlowField;
        }
        field(19; "Total billable Amount(LCY)"; Decimal)
        {
            CalcFormula = sum("Billable Project Lines"."Billing Price(LCY)" where("Project Billable ID" = field("Project Billable ID")));
            FieldClass = FlowField;
        }
        field(20; "Project Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Fixed Price Billing,Time & Material';
            OptionMembers = "Fixed Price Billing","Time & Material";
        }
    }

    keys
    {
        key(Key1; "Project Billable ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        JobsSetup.Get();
        if "Project Billable ID" = '' then begin
            JobsSetup.TestField("Billable Nos");
            // NoSeriesMgt.InitSeries(JobsSetup."Billable Nos", xRec."No. Series", 0D, "Project Billable ID", "No. Series");
            "Project Billable ID" := NoSeriesMgt.GetNextNo(JobsSetup."Billable Nos", WorkDate(), true);
        end;

        "Created By" := UserId;
        "Created On" := Today;
        "External Document No." := "Project Billable ID";
    end;

    var
        JobsSetup: Record "Jobs Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Jobs: Record Job;
}
