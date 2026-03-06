#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65009 "Research Output Register"
{

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GrantsSetup.Get;
                    NoSeriesMgt.TestManual(GrantsSetup."Research Output Nos");
                    "No. Series" := '';
                end;

                "Created By" := UserId;
            end;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Created By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Research Project Id"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if Jobs.Get("Research Project Id") then begin
                    "Principle Investigator" := Jobs."Person Responsible";
                    "Research Program Id" := Jobs."Research Program";
                end;
            end;
        }
        field(5; "Research Program Id"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Research Output Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Output Categories";
        }
        field(7; "Principle Investigator"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Research Output SubCategory"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Output Categories" where(code = field("Research Output Category"));
        }
        field(9; "Research Output Title"; Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Abstract; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Comments; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Publication Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,In Preparation,Submitted,Accepted/In-Press,E-Pub,Published,UnPublished,N/A';
            OptionMembers = " ","In Preparation",Submitted,"Accepted/In-Press","E-Pub",Published,UnPublished,"N/A";
        }
        field(13; "Visibilty Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Public-No Restricition,Backend-Scientists,Confidential-Authors,Editors Only';
            OptionMembers = " ","Public-No Restricition","Backend-Scientists","Confidential-Authors","Editors Only";
        }
        field(14; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
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
            GrantsSetup.Get;
            GrantsSetup.TestField("Research Output Nos");
           // NoSeriesMgt.InitSeries(GrantsSetup."Research Output Nos", xRec."No. Series", 0D, No, "No. Series");
            No := NoSeriesMgt.GetNextNo(GrantsSetup."Research Output Nos", WorkDate(), true);   
        end;

        "Document Date" := Today;
        "Created By" := UserId;
    end;

    var
        GrantsSetup: Record "Grants Setup";
        NoSeriesMgt: Codeunit "No. Series";
        Jobs: Record Job;
        ROCategory: Record "Research Output Categories";


    procedure SetWorkDescription(NewWorkDescription: Text)
    var
    //CC//    TempBlob: Record TempBlob temporary;
    begin
        Clear(Comments);
        if NewWorkDescription = '' then
            exit;
        //CC//   TempBlob.Blob := Comments;
        //CC//    TempBlob.WriteAsText(NewWorkDescription, Textencoding::Windows);
        //CC//    Comments := TempBlob.Blob;
        Modify;
    end;


    procedure GetWorkDescription(): Text
    var
        //CC//       TempBlob: Record TempBlob temporary;
        CR: Text[1];
    begin
        CalcFields(Comments);
        if not Comments.Hasvalue then
            exit('');
        CR[1] := 10;
        //CC//   TempBlob.Blob := Comments;
        //CC//    exit(TempBlob.ReadAsText(CR, Textencoding::Windows));
    end;
}
