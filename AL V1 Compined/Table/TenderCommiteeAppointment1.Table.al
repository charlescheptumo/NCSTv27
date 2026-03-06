#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70026 "Tender Commitee Appointment1"
{
    DrillDownPageID = "Commitee Creation";
    LookupPageID = "Commitee Creation";

    fields
    {
        field(1; "Tender/Quotation No"; Code[50])
        {
            TableRelation = "Procurement Request";

            trigger OnValidate()
            begin
                if TenderRec.Get("Tender/Quotation No") then begin
                    Title := TenderRec.Title;
                end;
            end;
        }
        field(2; "Committee ID"; Code[20])
        {
            TableRelation = "Procurement Committee";

            trigger OnValidate()
            begin
                if ProcurementComittee.Get("Committee ID") then begin
                    "Committee Name" := ProcurementComittee.Description;

                end;
            end;
        }
        field(3; "Committee Name"; Text[30])
        {
            Editable = false;
        }
        field(4; "Creation Date"; Date)
        {
        }
        field(5; "User ID"; Code[70])
        {
        }
        field(6; Title; Text[250])
        {
        }
        field(7; "Appointment No"; Code[20])
        {
        }
        field(8; "No. Series"; Code[10])
        {
        }
        field(9; Status; Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(10; "No of Members"; Integer)
        {
            CalcFormula = count("Commitee Members" where("Appointment No" = field("Appointment No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; Location; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50000; "Deadline For Report Submission"; Date)
        {
        }
        field(50001; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Appointment No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        PurchSetup.Get;
        PurchSetup.TestField(PurchSetup."Appointment Nos.");
      //  NoSeriesMgt.InitSeries(PurchSetup."Appointment Nos.", xRec."No. Series", 0D, "Appointment No", "No. Series");
        "Appointment No" := NoSeriesMgt.GetNextNo(PurchSetup."Appointment Nos.", WorkDate(), true);


        "Creation Date" := Today;
        "User ID" := UserId;
    end;

    var
        ProcurementComittee: Record "Procurement Committee";
        TenderRec: Record "Procurement Request";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
