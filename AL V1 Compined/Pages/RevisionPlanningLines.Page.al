#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65119 "Revision Planning Lines"
{
    Caption = 'Budget Planning Lines';
    DataCaptionExpression = Rec.Caption;
    PageType = ListPart;
    PromotedActionCategories = 'New,Process,Report,Outlook';
    SourceTable = "Project Budget Planning Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Project Budget ID"; Rec."Project Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the type of planning line.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    Caption = 'Source Job Task No.';
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Source Quantity';
                    ToolTip = 'Specifies the number of units of the resource, item, or general ledger account that should be specified on the planning line. If you later change the No., the quantity you have entered remains on the line.';
                }
                field("Destination job Task No."; Rec."Destination job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination job Task No.';
                }
                field("Destination Quantity"; Rec."Destination Quantity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Quantity';
                }
                field("Budget Type"; Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                }
                field("Job Budget Templates"; Rec."Job Budget Templates")
                {
                    ApplicationArea = Basic;
                }
                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the total cost for the planning line. The amount is in the local currency.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    var
        // SMTPMailSetup: Record "SMTP Mail Setup";
        MailManagement: Codeunit "Mail Management";
    begin
    end;

    trigger OnOpenPage()
    var
        Job: Record Job;
    begin
    end;
}
