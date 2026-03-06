#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70222 "Bid Security Closure Voucher"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin


                if "Document No" <> '' then begin
                    if "Document Type" = "document type"::"Claim/Forfeiture" then begin
                        ProcurementSetup.TestField("Bid Security Claim Nos");
                        NoMgt.TestManual(ProcurementSetup."Bid Security Claim Nos");
                    end;
                    if "Document Type" = "document type"::"Released/Returned" then begin
                        ProcurementSetup.TestField("Bid Security Returned Nos");
                        NoMgt.TestManual(ProcurementSetup."Bid Security Returned Nos");
                    end;
                end;
            end;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Claim/Forfeiture,Released/Returned';
            OptionMembers = "Claim/Forfeiture","Released/Returned";
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Tender Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Closed Securities Total Value"; Decimal)
        {
            Caption = 'Closed Securities Total Value (LCY)';
            Description = 'Closed Securities Total Value (LCY)';
            FieldClass = FlowField;
        }
        field(8; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Posted Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            ProcurementSetup.Get;
            if "Document Type" = "document type"::"Claim/Forfeiture" then begin
                ProcurementSetup.TestField("Bid Security Claim Nos");
          //      NoMgt.InitSeries(ProcurementSetup."Bid Security Claim Nos", xRec."No. Series", 0D, "Document No", "No. Series");
                "Document No" := NoMgt.GetNextNo(ProcurementSetup."Bid Security Claim Nos", Today, true);
            end;
            if "Document Type" = "document type"::"Released/Returned" then begin
                ProcurementSetup.TestField("Bid Security Returned Nos");
            //    NoMgt.InitSeries(ProcurementSetup."Bid Security Returned Nos", xRec."No. Series", 0D, "Document No", "No. Series");
                "Document No" := NoMgt.GetNextNo(ProcurementSetup."Bid Security Returned Nos", Today, true);
            end;

        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
        IFS: Record "Standard Purchase Code";
}
