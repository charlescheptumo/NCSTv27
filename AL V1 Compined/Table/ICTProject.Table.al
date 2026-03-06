#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56058 "ICT Project"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Job No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";// where("Test CC" = const(4),
                                      //      Blocked = const(" "));

            trigger OnValidate()

            begin
                Job.Reset;
                Job.SetRange("No.", "Job No");
                if Job.FindSet then begin
                    "Internal PM" := Job."Project Manager";
                    "Contractor No." := Job."Bill-to Name";
                    "Contractor Name" := Job."Bill-to Customer No.";
                end;
            end;
        }
        field(3; "Primary Purchase Contract ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"),
                                                           "Contract Status" = const(Signed));

            trigger OnValidate()
            begin
                contract.Reset;
                contract.SetRange("No.", "Primary Purchase Contract ID");
                if contract.FindSet then begin
                    "IFS Code" := contract."IFS Code";
                    "Notice of Award No." := contract."Notice of Award No.";
                    "External Contract Reference" := contract."Your Reference";
                    "Awarded Bid No" := contract."Awarded Bid No";
                    "Contract Amount Inc Taxes" := contract."Award Tender Sum Inc Taxes";
                    "Contract Start Date" := contract."Contract Start Date";
                    "Contract End Date" := contract."Contract End Date";
                    Description := contract."Contract Description";
                    Noticeofaward.Reset;
                    Noticeofaward.SetRange(Code, contract."Notice of Award No.");
                    if Noticeofaward.FindSet then begin
                        "Notice of Award Date" := Noticeofaward."Document Date";
                    end;
                end;
            end;
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Internal PM"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(6; "Contracting Project Manager"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Client PM Phone No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Client PM email Address"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Responsible ICT Lead"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(11; "External Contract Reference"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Contractor No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(13; "Contractor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Contract Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Contract End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Notice of Award No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header".Code where("Document Type" = const("Notice of Award"));
        }
        field(17; "Notice of Award Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Awarded Bid No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote));
        }
        field(19; "Contract Amount Inc Taxes"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "IFS Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(21; "No. of Filed Project Meetings"; Integer)
        {
            CalcFormula = count("Project Meeting Registrer" where("Project ID" = field("No.")));
            FieldClass = FlowField;
        }
        field(22; "No. of Daily Work Records"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "No. of Inspections"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "No.Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Steering Committee"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No." where("Reference Number" = const('1'));
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
            ICT.Get;
            ICT.TestField(ICT."ICT Project Nos");
         //   NoSeriesMgt.InitSeries(ICT."ICT Project Nos", xRec."No.Series", 0D, "No.", "No.Series");
            "No." := NoSeriesMgt.GetNextNo(ICT."ICT Project Nos", Today, true); 
        end;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        ICT: Record "ICT Helpdesk Global Parameters";
        Job: Record Job;
        contract: Record "Purchase Header";
        Noticeofaward: Record "Bid Tabulation Header";
}
