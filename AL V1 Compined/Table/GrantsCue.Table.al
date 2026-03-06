#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65047 "Grants Cue"
{

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(3; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
        field(4; "Grant Proposal-Approved"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Approval Status" = const(Released),
                                                                   "Document Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(5; "Grant Proposal-InProgress"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Approval Status" = filter(Open | "Pending Approval"),
                                                                   "Document Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(6; "Grant Proposal-Succesful"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Application Status" = const(Won),
                                                                   "Document Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(7; "Grant Proposal-NotSuccesful"; Integer)
        {
            CalcFormula = count("Grant Funding Application" where("Application Status" = const(Lost),
                                                                   "Document Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(8; "Project-Ongoing"; Integer)
        {
            CalcFormula = count(Job where("Document Type" = const(Project),
                                           Status = const(Open)));
            FieldClass = FlowField;
        }
        field(9; "Project Closed"; Integer)
        {
            CalcFormula = count(Job where("Document Type" = const(Project),
                                           Status = const(Completed)));
            FieldClass = FlowField;
        }
        field(10; "Funding Accouncement-Open"; Integer)
        {
            CalcFormula = count("Funding Opportunity" where(Status = const(Open),
                                                             "Application date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(11; "Funding Accouncement-Closed"; Integer)
        {
            CalcFormula = count("Funding Opportunity" where(Status = const(Closed),
                                                             "Application date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(12; "Anouncement Amount(LCY)"; Decimal)
        {
            CalcFormula = sum("Funding Opportunity"."Opportunity Amount(LCY)" where("Application date" = field("Date Filter"),
                                                                                     Status = const(Open)));
            FieldClass = FlowField;
        }
        field(13; "Successfull Proposals(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Awarded Grant Amount (LCY)" where("Application Status" = const(Won),
                                                                                              "Document Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(14; "UnSuccessful Proposals(LCY)"; Decimal)
        {
            CalcFormula = sum("Grant Funding Application"."Requested Grant Amount(LCY)" where("Application Status" = const(Lost),
                                                                                               "Document Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(15; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
