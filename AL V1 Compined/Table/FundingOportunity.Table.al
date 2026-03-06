#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59050 "Funding Oportunity"
{

    fields
    {
        field(1; No; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Donor Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(4; "Donor No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Cust.Get("Donor No") then
                    "Donor Name" := Cust.Name;
            end;
        }
        field(5; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Date Awarded"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Total Amount Applied"; Decimal)
        {
            CalcFormula = sum("Internal Grants Application"."Amount Applied" where("Fund Opportunity" = field(No)));
            FieldClass = FlowField;
        }
        field(8; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Open; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending,Approved,Cancelled,Rejected';
            OptionMembers = Open,Pending,Approved,Cancelled,Rejected;
        }
        field(11; "Donor Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Eligibility Criteria"; Text[250])
        {
            DataClassification = ToBeClassified;
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

    var
        Cust: Record Customer;
}
