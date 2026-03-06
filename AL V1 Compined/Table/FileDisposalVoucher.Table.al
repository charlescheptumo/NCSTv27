#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59078 "File Disposal Voucher"
{
    Caption = 'File Disposal ';

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    FileLocationsSetup.Get;
                    NoSeriesManagement.TestManual(FileLocationsSetup."File Disposal No. Series");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Disposal Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Preserve,Destroy';
            OptionMembers = " ",Preserve,Destroy;
        }
        field(3; "Source Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Internal(Procuring Entity),Procurement Regulator,External 3rd Party';
            OptionMembers = ,"Internal(Procuring Entity)","Procurement Regulator","External 3rd Party";
        }
        field(4; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "External Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(8; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "No. Series"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(13; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Submitted,Posted';
            OptionMembers = Open,Submitted,Posted;
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
            FileLocationsSetup.Get;
            FileLocationsSetup.TestField("File Disposal No. Series");
          //  NoSeriesManagement.InitSeries(FileLocationsSetup."File Disposal No. Series", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesManagement.GetNextNo(FileLocationsSetup."File Disposal No. Series", Today, true);
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        NoSeries: Record "No. Series";
        FileLocationsSetup: Record "File Locations Setup";
        NoSeriesManagement: Codeunit "No. Series";
}
