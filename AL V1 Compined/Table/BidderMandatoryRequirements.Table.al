#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70021 "Bidder Mandatory Requirements"
{

    fields
    {
        field(1; "Tender No"; Code[20])
        {
        }
        field(2; "Company Name"; Text[50])
        {
        }
        field(3; Specification; Text[250])
        {
        }
        field(4; Complied; Boolean)
        {
        }
        field(5; Type; Option)
        {
            OptionCaption = ' ,Non Stock Item,Item,,Fixed Asset';
            OptionMembers = " ","Non Stock Item",Item,,"Fixed Asset";
        }
        field(6; No; Code[30])
        {
            TableRelation = if (Type = const("Non Stock Item")) "G/L Account"
            else if (Type = const(Item)) Item
            else if (Type = const("Fixed Asset")) "Fixed Asset";
        }
        field(7; Description; Text[100])
        {
        }
        field(8; Remarks; Text[250])
        {
        }
        field(9; "Evaluater User Id"; Code[80])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(10; Technical; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Technical name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Technical score"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Technical score" > "Technical Maximum Score" then begin
                    Error('Score MUST not Exceed Maximum Score of %1', "Technical Maximum Score");
                end;
                if "Technical score" < 0 then begin
                    Error('Score MUST be between 0 and %1', "Technical Maximum Score");
                end;

                procrec.Reset;
                procrec.Get("Tender No");
                "System Score" := ROUND((("Technical score" / "Technical Maximum Score") * procrec."Technical Score"), 0.01);
            end;
        }
        field(13; "Technical Maximum Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Finacial; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Financial name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Financial Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Technical Remarks"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18; Entryno; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(19; "Quoted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "System Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Tender No", "Company Name", Specification)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        procrec: Record "Procurement Request";
}
