#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69270 "HR Shortlisting Oral List"
{
    ApplicationArea = Basic;
    Caption = 'HR Shortlisting for Oral Interview';
    CardPageID = "HR Shortlisting Card-Oral";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Employee Requisitions";
    SourceTableView = where(Status = const(Approved),
                            Closed = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755006; "HR Jobs Factbox")
            {
                SubPageLink = "Job ID" = field("Job ID");
            }
            systempart(Control1102755005; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}
