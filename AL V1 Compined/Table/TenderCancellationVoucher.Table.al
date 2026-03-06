#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70212 "Tender Cancellation Voucher"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Invitation Notice No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                IFS.Reset;
                IFS.SetRange(Code, "Invitation Notice No");
                if IFS.FindSet then begin
                    "Tender No." := IFS."External Document No";
                    "Tender No." := IFS.Description;
                end;
            end;
        }
        field(4; "Tender No."; Code[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Tender Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Cancel Reason Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Cancel Reason Code".Code;
        }
        field(7; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Created by"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            Enabled = false;
            TableRelation = "No. Series";
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
            PurchSetup.Get;
            PurchSetup.TestField("Tender Cancellation Nos");
           // NoSeriesMgt.InitSeries(PurchSetup."Tender Cancellation Nos", xRec."Document No", 0D, "Document No", "No. Series");
            "Document No" := NoSeriesMgt.GetNextNo(PurchSetup."Tender Cancellation Nos", WorkDate(), true);

        end;


        "Created by" := UserId;
        "Created Date/Time" := CurrentDatetime;
    end;

    var
        IFS: Record "Standard Purchase Code";
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
