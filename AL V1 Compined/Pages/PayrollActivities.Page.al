#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69044 "Payroll Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(Employees)
            {
                Caption = 'Employees';
                field("Active Security Officers"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'Active Employees';
                    DrillDownPageID = "Employee List-P";
                }
                field("Terminated Employees"; Rec."Terminated Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'Terminated Employees';
                    DrillDownPageID = "Employee List-P";
                }
                field("Seconded Employees"; Rec."Seconded Employees")
                {
                    ApplicationArea = Basic;
                }
                field("Inactive Employees"; Rec."Inactive Employees")
                {
                    ApplicationArea = Basic;
                }

                actions
                {
                    action("New Employee")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Employee';
                        RunObject = Page "Employee Card-HR";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Documents Approvals")
            {
                Caption = 'Documents Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                }
                field("Posted Approved Leave"; Rec."Posted Approved Leave")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Posted Leave Applications";
                }
            }
            cuegroup("Salary Vouchers Processing")
            {
                Caption = 'Salary Vouchers Processing';
                field("Salary Vouchers"; Rec."Salary Vouchers")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Payroll Processing List";
                }
                field("Approved Salary Vouchers"; Rec."Approved Salary Vouchers")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Payroll Processing List";
                }
                field(Visitors; Rec.Visitors)
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Visitor Pass List";
                }
            }
            group(Registry)
            {
                field("Registry Files Assigned"; Rec."Registry Files Assigned")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter(Rec."Date Filter", '>=%1', WorkDate);
        Rec.SetFilter(Rec."User ID Filter", '=%1', UserId);
    end;
}
