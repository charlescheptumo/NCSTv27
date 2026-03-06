#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69208 "Employee Leave Balances"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Employee;
    SourceTableView = where(Status = const(Active));
    UsageCategory = Lists;

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
                    Caption = 'Total Annual Leave Taken';
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual Leave Outstanding Bal';
                }
                field("Other Leave Types Allocated"; Rec."Other Leave Types Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Other Leave Types"; Rec."Other Leave Types")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Notes)
            {
            }
            systempart(Control10; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Leave Balance report")
            {
                ApplicationArea = Basic;
                Image = "report";
                Promoted = true;
                RunObject = Report "Leave Balance";
            }
        }
    }
}
