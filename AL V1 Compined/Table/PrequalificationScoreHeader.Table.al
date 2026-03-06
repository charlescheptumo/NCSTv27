#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70195 "Prequalification Score Header"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.Get;
                    ProcurementSetup.TestField("Prequalification Score Header");
                    NoMgt.TestManual(ProcurementSetup."Prequalification Score Header");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(3; "Prequalification Evaluation Te"; Code[20])
        {
            Caption = 'Prequalification Evaluation Template ID';
            DataClassification = ToBeClassified;
            Description = 'Prequalification Evaluation Template ID';
            TableRelation = "Supplier Rating Template".Code where("Template Type" = const("Prequalification Scoring"));
        }
        field(4; "Evaluation Lead"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Resource Table (To handle both staff and non-staff evaluation committee members)';
            TableRelation = Resource."No.";

            trigger OnValidate()
            var
                Resources: Record Resource;
            begin
                Resources.Get;
                Resources.SetRange("No.", "Evaluation Lead");
                if Resources.FindSet then begin
                    "Evaluation Lead Name" := Resources.Name;

                end;
            end;
        }
        field(5; "Evaluation Lead Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Prequalification Response No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Prequalification Response No.';
            TableRelation = "RFI Response"."Document No." where("Document Type" = const("IFP Response"),
                                                                 "Document Status" = const(Evaluation));

            trigger OnValidate()
            begin
                RFIResponse.Reset;
                RFIResponse.SetRange("Document No.", "Prequalification Response No.");
                if RFIResponse.FindSet then begin
                    "Vendor No." := RFIResponse."Vendor No.";
                    "Vendor Name" := RFIResponse."Vendor Name";
                    "IFP No." := RFIResponse."RFI Document No.";
                    Description := RFIResponse."Document No." + ' Prequalification evaluation';
                    "Primary Responsibility Center" := RFIResponse.County;
                end;
            end;
        }
        field(7; "Vendor No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Vendor Name"; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "IFP No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Procurement Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFP Response Line"."Procurement Category" where("Document Type" = const("IFP Response"),
                                                                              "Document No." = field("Prequalification Response No."));
        }
        field(11; "Category Name"; Text[60])
        {
            CalcFormula = lookup("IFP Response Line"."Category Description" where("Procurement Category" = field("Procurement Category")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Primary Responsibility Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(14; "System Evaluation Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'The total percentage score that is assigned to this evaluation by the system (It is based on sum calcfield for the Score % field for each of the eva)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(15; "Final Evaluation Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'The final percentage score that is assigned to this evaluation by the committee. This field shall by default be set to default value equal to the System Evaluation Score %. This score is posted to the IFP Response Line when the Close IFP function is executed.';
            MaxValue = 100;
            MinValue = 0;
        }
        field(16; "Final Evaluation Decision"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Final evaluation verdict by the Procurement function';
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(17; "Evaluation Committee Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Created Time"; Time)
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
    }

    trigger OnInsert()
    begin
        if Code = '' then begin

            ProcurementSetup.Get;
            ProcurementSetup.TestField("Prequalification Score Header");
            //NoMgt.InitSeries(ProcurementSetup."Prequalification Score Header", xRec."No. Series", 0D, Code, "No. Series");
            Code := NoMgt.GetNextNo(ProcurementSetup."Prequalification Score Header", WorkDate(), true);

        end;
        "Document Date" := Today;
        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
        PostCode: Record "Post Code";
        Vend: Record Vendor;
        RFIResponse: Record "RFI Response";
}
