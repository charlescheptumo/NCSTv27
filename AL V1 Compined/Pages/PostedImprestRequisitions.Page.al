#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57055 "Posted Imprest Requisitions"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Imprest Requisition";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released),
                            Posted = const(True));
    UsageCategory = History;

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
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Paying Bank';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        /*
        
        IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        SETRANGE("Created By",USERID);
        END;
        
        */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        /*
        IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        SETRANGE("Created By",USERID);
        END;
        
        */


    end;

    var
        UserSetup: Record "User Setup";
}
