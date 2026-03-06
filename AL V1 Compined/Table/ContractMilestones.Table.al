#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70034 "Contract Milestones"
{

    fields
    {
        field(1; "Contract Header"; Code[20])
        {
            TableRelation = "Contract Management Header";
        }
        field(2; "Line No"; Integer)
        {
        }
        field(4; "Milestone Description"; Text[30])
        {
        }
        field(5; "Milestone No"; Code[30])
        {
        }
        field(6; Status; Option)
        {
            OptionCaption = 'Open,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
        }
        field(7; "Date of Approval"; Date)
        {
        }
        field(8; "Approved By"; Code[80])
        {
        }
        field(9; "LPO Generated"; Boolean)
        {
        }
        field(50000; "Milestone Amount"; Decimal)
        {
        }
        field(50001; "Approval Path"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Document No." = field("Contract Header")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Contract Header", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        milestoneheader.Reset;
        milestoneheader.SetFilter(milestoneheader."Contract Header", "Contract Header");
        if milestoneheader.FindLast then begin
            "Line No" := milestoneheader."Line No" + 10;
        end;
    end;

    var
        milestoneheader: Record "Contract Milestones";
}
