#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69077 "HR Manager Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";

    layout
    {
        area(content)
        {
            cuegroup("Employees By Category")
            {
                Caption = 'Employees By Category';
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Employee List-HR";
                }
                field("Inactive Employees"; Rec."Inactive Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Employee List-HR";
                }
                field("Suspended Employees"; Rec."Suspended Employees")
                {
                    ApplicationArea = Basic;
                }
                field("Seconded Employees"; Rec."Seconded Employees")
                {
                    ApplicationArea = Basic;
                }
                field("Terminated Employees"; Rec."Terminated Employees")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Employee List-HR";
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
            cuegroup("Employee Leave Applications")
            {
                Caption = 'Employee Leave Applications';
                field("Posted Approved Leave"; Rec."Posted Approved Leave")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Posted Leave Applications";
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

        //SETFILTER("Date Filter",'>=%1',WORKDATE);
    end;
}
