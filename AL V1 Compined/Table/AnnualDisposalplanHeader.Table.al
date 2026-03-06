#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70043 "Annual Disposal plan Header"
{

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Time Created"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(9; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(10; "Budget Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Approved,Revised,Sublimentary';
            OptionMembers = Approved,Revised,Sublimentary;
        }
        field(11; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Budget Plan Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Echequer Job ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(15; "Financial Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
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

            PurchSetup.Get;
            PurchSetup.TestField("Procument Plan Nos");
          //  NoSeriesMgt.InitSeries(PurchSetup."Procument Plan Nos", xRec.No, 0D, No, "No. Series");
                No := NoSeriesMgt.GetNextNo(PurchSetup."Procument Plan Nos", Today, true);
        end;
        "Created By" := UserId;
        "Time Created" := Time;
        "Date Created" := Today;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
