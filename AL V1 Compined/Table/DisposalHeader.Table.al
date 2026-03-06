#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70047 "Disposal Header"
{
    DrillDownPageID = "Disposal List";
    LookupPageID = "Disposal List";

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> '' then begin
                    SalessSetup.TestField("Disposal No.");
                    NoMgt.TestManual(SalessSetup."Disposal No.");
                    "No Series" := ''
                end;
            end;
        }
        field(2; Title; Text[100])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Title := Lowercase(Title);
            end;
        }
        field(3; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Closing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
        }
        field(7; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Rejected By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Rejected Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12; "Reason For Disposal"; Text[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Reason For Disposal" := UpperCase("Reason For Disposal");
            end;
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1),
                                                          Blocked = const(false),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
        }
        field(15; "Select Customer"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if xRec."Select Customer" <> Rec."Select Customer" then begin
                    "Customer Name" := '';
                end;
                if Customer.Get("Select Customer") then
                    "Customer Name" := Customer.Name;
            end;
        }
        field(16; "Customer Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Sales Order Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Disposal Plan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Disposal plan Header".No;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            SalessSetup.Get;
            SalessSetup.TestField("Disposal No.");
          //  NoMgt.InitSeries(SalessSetup."Disposal No.", xRec."No Series", 0D, No, "No Series");
            No := NoMgt.GetNextNo(SalessSetup."Disposal No.", Today, true);
        end;
        "No Series" := SalessSetup."Disposal No.";
        "Created By" := UserId;
        "Created Date" := Today;
    end;

    var
        NoMgt: Codeunit "No. Series";
        SalessSetup: Record "Sales & Receivables Setup";
        DisposalLines: Record "Disposal Lines";
        Customer: Record Customer;


    procedure FnCheckLines("DocumentNo.": Code[20]): Boolean
    var
        DisposalLines: Record "Disposal Lines";
    begin
        DisposalLines.Reset;
        DisposalLines.SetRange("Document No.", "DocumentNo.");
        exit(DisposalLines.FindFirst);
    end;
}
