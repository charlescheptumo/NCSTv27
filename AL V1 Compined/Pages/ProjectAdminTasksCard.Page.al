#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65050 "Project Admin Tasks Card"
{
    PageType = Card;
    SourceTable = "Grant Admin Tasks";
    SourceTableView = where("Source Document Type" = const("Grant Application"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Sourec Document No."; Rec."Sourec Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Team Code"; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                }
                field("Team Name"; Rec."Team Name")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher No"; Rec."Researcher No")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task Type"; Rec."Task Type")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Research Center Description"; Rec."Research Center Description")
                {
                    ApplicationArea = Basic;
                }
                field("Program Description"; Rec."Program Description")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Company No"; Rec."Contact Company No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Company Name"; Rec."Contact Company Name")
                {
                    ApplicationArea = Basic;
                }
                field(Recurring; Rec.Recurring)
                {
                    ApplicationArea = Basic;
                }
                field("Recurring Date Interval"; Rec."Recurring Date Interval")
                {
                    ApplicationArea = Basic;
                }
                field("Calc. Due Date From"; Rec."Calc. Due Date From")
                {
                    ApplicationArea = Basic;
                }
                field("Application Title"; Rec."Application Title")
                {
                    ApplicationArea = Basic;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Last Time Modified"; Rec."Last Time Modified")
                {
                    ApplicationArea = Basic;
                }
                field("All Day Event"; Rec."All Day Event")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Completed By"; Rec."Completed By")
                {
                    ApplicationArea = Basic;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reminder Due Date Formular"; Rec."Reminder Due Date Formular")
                {
                    ApplicationArea = Basic;
                }
                field("Reminder Due Date"; Rec."Reminder Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control42; Outlook)
            {
            }
            systempart(Control43; Notes)
            {
            }
            systempart(Control44; MyNotes)
            {
            }
            systempart(Control45; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Source Document Type" := Rec."source document type"::Project;
    end;

    trigger OnOpenPage()
    begin
        Rec."Source Document Type" := Rec."source document type"::Project;
    end;
}
