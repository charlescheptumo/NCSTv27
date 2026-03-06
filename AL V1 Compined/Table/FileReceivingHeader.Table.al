#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59080 "File Receiving Header"
{

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; Date; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Received From/Sent To"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Existing File"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "File No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Existing File" = const(true)) "Record Creation"."File No";

            trigger OnValidate()
            begin
                //IF "Existing File"=TRUE THEN BEGIN
                if FileMovementHeader.Get("File No") then
                    "File Name" := FileMovementHeader."File Name";
                "File Type" := FileMovementHeader."File Type";
                "File Classification" := FileMovementHeader."File Classification";

                //END;
            end;
        }
        field(6; "File Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Folio No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Folio Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Assigned To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(12; "Assigned To Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Assigned,Filed';
            OptionMembers = New,Assigned,Filed;
        }
        field(14; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Assigned to Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee;
        }
        field(16; "Assigned Employee Email"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "File Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "File Types SetUp".Code;
        }
        field(18; "File Classification"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,General File,Top Secret File,Confidential File';
            OptionMembers = " ","General File","Top Secret File","Confidential File";
        }
        field(19; Remarks; Text[2000])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
            FileSetup.Get;
            FileSetup.TestField(FileSetup."File Receiving Nos");
           //  NoSeriesMgt.InitSeries(FileSetup."File Receiving Nos", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(FileSetup."File Receiving Nos", Today, true);
        end;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Assigned To" := UserId;
        Date := Today;
    end;

    var
        FileSetup: Record "File Locations Setup";
        NoSeriesMgt: Codeunit "No. Series";
        FileMovementHeader: Record "Record Creation";
}
