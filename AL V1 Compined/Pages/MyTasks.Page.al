#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65132 "My Tasks"
{
    CardPageID = "Grant Admin Tasks Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Admin Tasks";
    SourceTableView = where("Source Document Type" = const("Grant Application"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("No. Series"; Rec."No. Series")
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
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //cc///   Rec.SetRange("Assigned to", UserId);
    end;
}
