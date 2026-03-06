#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70154 "IFS Prebid Register"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("IFS Prebid Register");
                    NoMgt.TestManual(ProcurementSetup."IFS Prebid Register");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "IFS Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";

            trigger OnValidate()
            begin
                IFS.Reset;
                IFS.SetRange(Code, "IFS Code");
                if IFS.FindSet then begin
                    Description := "IFS Code" + '_' + 'Prepid Meeting';
                    "Tender Description" := IFS."Tender Name";
                    "Pre-bid Purchaser Code" := IFS."Purchaser Code";
                    "Primary Region" := IFS."Requesting Region";
                    "Pre-bid Visit Date" := IFS."Mandatory Pre-bid Visit Date";
                    "Prebid Meeting Venue" := IFS."Prebid Meeting Address";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Tender Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Pre-bid Visit Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Pre-bid Visit Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Pre-bid Visit End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Pre-bid Visit End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Pre-bid Purchaser Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
        field(10; "No. of Bidders"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No. of Prebid Attendees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Tender External Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Responsibility Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(19; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(20; "Prebid Meeting Venue"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("IFS Prebid Register");
          //  NoMgt.InitSeries(ProcurementSetup."IFS Prebid Register", xRec."No. Series", 0D, Code, "No. Series");
            Code := NoMgt.GetNextNo(ProcurementSetup."IFS Prebid Register", Today, true);   
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
