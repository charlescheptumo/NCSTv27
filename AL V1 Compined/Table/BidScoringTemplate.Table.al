#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70068 "Bid Scoring Template"
{
    LookupPageID = "Bid Evaluation Template";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to No. Series setup in the E-Procurement Setup WIndow';

            trigger OnValidate()
            begin
                if Code <> '' then begin

                    ProcurementSetup.TestField("Bid Req Template No. Series");
                    NoMgt.TestManual(ProcurementSetup."Bid Req Template No. Series");
                    "No. Series" := ''

                end;
            end;
        }
        field(2; "Template type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Vendor Due Diligence,Bid Score Template,Supplier Performance Review,Prequalification Scoring';
            OptionMembers = "Vendor Due Diligence","Bid Score Template","Supplier Performance Review","Prequalification Scoring";
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Document No"; Code[20])
        {
            Description = 'This field shall only be available on the Bid Score Voucher (Templates are global and are thus not tied to a given IFS)';
        }
        field(5; "Default Procurement Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(6; "Total Preliminary Checks Score"; Decimal)
        {
            Caption = 'Total Preliminary Checks Score %';
            DataClassification = ToBeClassified;
            Description = 'Total Preliminary Checks Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Total Technical Evaluation %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Total Technical Evaluation Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(8; "Total Financial Evaluation"; Decimal)
        {
            Caption = 'Total Financial Evaluation Score %';
            DataClassification = ToBeClassified;
            Description = 'Total Financial Evaluation Score %';
            MaxValue = 100;
            MinValue = 0;
        }
        field(9; "Total Assigned Score/Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(10; "Default YES Bid Rating Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Default YES Bid Rating Score %';
            Enabled = true;
            MaxValue = 100;
            MinValue = 0;
        }
        field(11; "NO Bid Rating Response Value"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Default NO Text that is suggested by the system for YES/NO Response values in the bid scoring criteria table. When an evaluator selects this value during the scoring process, the system shall assign the Default NO Rating Score %';
        }
        field(12; "Default NO Bid Rating Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(13; "1-POOR Option Text Bid Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Default Score % that shall be assigned when an evaluator selects the POOR Response value during bid scoring';
            MaxValue = 100;
            MinValue = 0;
        }
        field(14; "2-FAIR Option Text Bid Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(15; "3-GOOD Option Text Bid Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(16; "4-VERY GOOD  Text Bid Score %"; Decimal)
        {
            Caption = '4-VERY GOOD Option Text Bid Score %';
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(17; "5-EXCELLENT Text Bid Score %"; Decimal)
        {
            Caption = '5-EXCELLENT Option Text Bid Score %';
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(18; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Solicitation Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Prequalification,RFQ,ITT';
            OptionMembers = ,Prequalification,RFQ,ITT;
        }
        field(24; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Suggest Likert Values for"; Boolean)
        {
            Caption = 'Suggest Likert Values for Options-Text';
            DataClassification = ToBeClassified;
            Description = 'Suggest Likert Values for Options-Text';
        }
        field(26; Released; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "YES Bid Rating Response Value"; Code[30])
        {
            Caption = 'Default YES Bid Rating Response Value';
            DataClassification = ToBeClassified;
            Description = 'Default YES Bid Rating Response Value';
        }
        field(28; "Max Bid Value Limit"; Decimal)
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
            ProcurementSetup.TestField("Bid Req Template No. Series");
          //  NoMgt.InitSeries(ProcurementSetup."Bid Req Template No. Series", xRec."No. Series", 0D, Code, "No. Series");
            Code := NoMgt.GetNextNo(ProcurementSetup."Bid Req Template No. Series", Today, true);
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
        ProcurementSetup.Get;
        "Default YES Bid Rating Score %" := ProcurementSetup."Default YES Bid Rating Score %";
        "Default NO Bid Rating Score %" := ProcurementSetup."Default NO Bid Rating Score %";
        "YES Bid Rating Response Value" := ProcurementSetup."YES Bid Rating Response Value";
        "NO Bid Rating Response Value" := ProcurementSetup."NO Bid Rating Response Value";
        "Max Bid Value Limit" := ProcurementSetup."Infinite Bid Value Limit";
        "1-POOR Option Text Bid Score %" := ProcurementSetup."1-POOR Option Text Bid Score %";
        "2-FAIR Option Text Bid Score %" := ProcurementSetup."2-FAIR Option Text Bid Score %";
        "3-GOOD Option Text Bid Score %" := ProcurementSetup."3-GOOD Option Text Bid Score %";
        "4-VERY GOOD  Text Bid Score %" := ProcurementSetup."4-VERY GOOD  Text Bid Score %";
        "5-EXCELLENT Text Bid Score %" := ProcurementSetup."5-EXCELLENT Text Bid Score %";
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
}
