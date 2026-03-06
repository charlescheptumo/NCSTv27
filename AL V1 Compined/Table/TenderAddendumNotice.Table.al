#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70203 "Tender Addendum Notice"
{

    fields
    {
        field(1; "Addendum Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Invitation Notice No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                IFS.Reset;
                IFS.SetRange(Code, "Invitation Notice No.");
                if IFS.FindSet then begin
                    Description := "Invitation Notice No." + '_' + 'Tender Addendum Notice';
                    "Tender No" := IFS."External Document No";
                    "Document Date" := Today;
                    "Tender Description" := IFS."Tender Name";
                    "Responsibility Center" := IFS."Responsibility Center";
                    "Original Submission Start Date" := IFS."Submission Start Date";
                    "Original Submission Start Time" := IFS."Submission Start Time";
                    "Original Submission End Date" := IFS."Submission End Date";
                    "Original Submission End Time" := IFS."Submission End Time";
                    "Original Bid Opening Date" := IFS."Bid Opening Date";
                    "Original Bid Opening Time" := IFS."Bid Opening Time";
                    "Original Prebid Meeting Date" := IFS."Mandatory Pre-bid Visit Date";

                    /*Description:="IFS Code"+'_'+'Prepid Meeting';
                    "Tender Description":=IFS."Tender Name";
                    "Pre-bid Purchaser Code":=IFS."Purchaser Code";
                    "Primary Region":=IFS."Requesting Region";
                    "Pre-bid Visit Date":=IFS."Mandatory Pre-bid Visit Date";
                    "Prebid Meeting Venue":=IFS."Prebid Meeting Address";*/
                end;

            end;
        }
        field(4; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Addendum Instructions"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Primary Addendum Type ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Addendum Type".Code;

            trigger OnValidate()
            begin
                Taddendum.Reset;
                Taddendum.SetRange(Code, "Primary Addendum Type ID");
                if Taddendum.FindSet then begin
                    "Addendum Type Description" := Taddendum.Description;
                end;
            end;
        }
        field(7; "Addendum Type Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Tender No"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Tender Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Responsibility Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(11; "New Submission Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Original Submission Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "New Submission Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Original Submission Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "New Submission End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Original Submission End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "New Submission End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Original Submission End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Original Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "New Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Original Bid Opening Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "New Bid Opening Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Original Prebid Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "New Prebid Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled;
        }
        field(26; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(27; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Created by"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; "No. Series"; Code[10])
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
        key(Key1; "Addendum Notice No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Addendum Notice No." = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField("Tender Addendum Notice");
           // NoSeriesMgt.InitSeries(PurchSetup."Tender Addendum Notice", xRec."Addendum Notice No.", 0D, "Addendum Notice No.", "No. Series");
            "Addendum Notice No." := NoSeriesMgt.GetNextNo(PurchSetup."Tender Addendum Notice", WorkDate(), true);
    
        end;


        "Created by" := UserId;
        "Created Date/Time" := CurrentDatetime;
    end;

    var
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit "No. Series";
        IFS: Record "Standard Purchase Code";
        Taddendum: Record "Tender Addendum Type";
}
