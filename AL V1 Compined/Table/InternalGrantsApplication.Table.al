#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59051 "Internal Grants Application"
{

    fields
    {
        field(1; No; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Fund Opportunity"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Oportunity";

            trigger OnValidate()
            begin
                if FundOp.Get("Fund Opportunity") then
                    "Fund Name" := FundOp.Name;
            end;
        }
        field(3; "Fund Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "PI No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if emp.Get("PI No") then
                    "PI Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
            end;
        }
        field(5; "PI Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Amount Applied"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Application Send"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending,Approved,Cancelled,Rejected';
            OptionMembers = Open,Pending,Approved,Cancelled,Rejected;
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
        emp: Record Employee;
        FundOp: Record "Funding Oportunity";
}
