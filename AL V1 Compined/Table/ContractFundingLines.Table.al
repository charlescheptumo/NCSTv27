#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65031 "Contract Funding Lines"
{

    fields
    {
        field(1; "Project Contract No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Year Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes";

            trigger OnValidate()
            begin
                if FundingYear.Get("Year Code") then begin
                    Description := FundingYear.Description;
                end;
            end;
        }
        field(4; Description; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Budget Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Budget End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Funding Customer"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Funding Class" = const(Grant));
        }
        field(8; "Grant ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Funding Application" where("Application Status" = const(Won));
        }
        field(9; "Funding Currency"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(10; "Approved Funding Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Job No"; Code[50])
        {
            CalcFormula = lookup(Job."No." where("Project Funding Contract No" = field("Project Contract No."),
                                                  "Country Entry Code" = field("Year Code")));
            FieldClass = FlowField;
        }
        field(12; "Job Status"; Option)
        {
            CalcFormula = lookup(Job.Status where("Project Funding Contract No" = field("Project Contract No."),
                                                   "Country Entry Code" = field("Year Code")));
            FieldClass = FlowField;
            OptionCaption = 'Planning,Quote,Open,Completed';
            OptionMembers = Planning,Quote,Open,Completed;
        }
    }

    keys
    {
        key(Key1; "Project Contract No.", "Line No", "Year Code", "Funding Customer", "Grant ID", "Funding Currency")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FundingYear: Record "Funding Year Codes";
}
