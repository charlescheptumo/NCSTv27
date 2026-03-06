#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70139 "Purchase Requisition Template"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Bid Req Template No. Series");
                    NoMgt.TestManual(ProcurementSetup."Bid Req Template No. Series");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(4; "Template Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard,BoQ';
            OptionMembers = Standard,BoQ;
        }
        field(6; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(8; "Primary Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(10; "Primary Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Department),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
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
        fieldgroup(DropDown; "Code", Description)
        {
        }
        fieldgroup(Brick; "Code", Description)
        {
        }
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("Bid Req Template No. Series");
           // NoMgt.InitSeries(ProcurementSetup."Bid Req Template No. Series", xRec."No. Series", 0D, Code, "No. Series");
            Code := NoMgt.GetNextNo(ProcurementSetup."Bid Req Template No. Series", WorkDate(), true);  
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
