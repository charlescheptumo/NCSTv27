#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69161 "Leave Balances"
{
    PageType = List;
    SourceTable = Employee;
    SourceTableView = sorting("No.")
                      order(ascending)
                      where(Status = const(Active));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual Leave Balance';
                }
                field("Compassionate Leave Days"; Rec."Compassionate Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Maternity Leave Days"; Rec."Maternity Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Paternity Leave Days"; Rec."Paternity Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Study Leave Days"; Rec."Study Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaid Leave"; Rec."Unpaid Leave")
                {
                    ApplicationArea = Basic;
                }
                field("Sick Leave"; Rec."Sick Leave")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Leave Acc"; Rec."Examination Leave Acc")
                {
                    ApplicationArea = Basic;
                }
                field("Total Leave Days"; Rec."Total Leave Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000022; Notes)
            {
            }
            systempart(Control1000000023; MyNotes)
            {
            }
            systempart(Control1000000024; Links)
            {
            }
        }
    }

    actions
    {
    }
}
