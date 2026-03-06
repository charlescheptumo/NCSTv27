#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80020 "Strategy Workplan Lines"
{

    fields
    {
        field(1; No; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Strategy Plan ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(3; "Activity ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Initiative".Code where("Strategic Plan ID" = field("Strategy Plan ID"));

            trigger OnValidate()
            begin
                StrategicInt.Reset;
                StrategicInt.SetRange(Code, "Activity ID");
                if StrategicInt.Find('-') then begin
                    Description := StrategicInt.Description;
                end;
            end;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Imported Annual Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Remainder := "Imported Annual Target Qty" MOD 4;
                "Q1 Target" := ("Imported Annual Target Qty" - Remainder) / 4 + Remainder;
                "Q2 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
                "Q3 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
                "Q4 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
            end;
        }
        field(6; "Imported Annual Budget Est."; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Q1 Budget" := ROUND("Imported Annual Budget Est." * ("Q1 Target" / "Imported Annual Target Qty"), 0.01, '=');
                "Q2 Budget" := ROUND("Imported Annual Budget Est." * ("Q2 Target" / "Imported Annual Target Qty"), 0.01, '=');
                "Q3 Budget" := ROUND("Imported Annual Budget Est." * ("Q3 Target" / "Imported Annual Target Qty"), 0.01, '=');
                "Q4 Budget" := ROUND("Imported Annual Budget Est." * ("Q4 Target" / "Imported Annual Target Qty"), 0.01, '=');
            end;
        }
        field(7; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(8; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Department));
        }
        field(9; "Q1 Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Q1 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Q2 Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Q2 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Q3 Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Q3 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Q4 Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Q4 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Entry Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planned,Actual';
            OptionMembers = Planned,Actual;
        }
        field(18; "Year Reporting Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;
        }
    }

    keys
    {
        key(Key1; No, "Strategy Plan ID", "Activity ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StrategicInt: Record "Strategic Initiative";
        QQuantity: Integer;
        Remainder: Integer;
}
