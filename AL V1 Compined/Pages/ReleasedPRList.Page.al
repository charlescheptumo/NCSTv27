#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70019 "Released PR List"
{
    CardPageID = "Released Purchase Requisition";
    PageType = List;
    SourceTable = "Requisition Header1";
    SourceTableView = where("Requisition Type" = const("Purchase Requisition"),
                            Posted = const(false),
                            Status = const(Released));
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
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Raised by"; Rec."Raised by")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase?"; Rec."Purchase?")
                {
                    ApplicationArea = Basic;
                }
                field("MA Approval"; Rec."MA Approval")
                {
                    ApplicationArea = Basic;
                }
                field(Rejected; Rec.Rejected)
                {
                    ApplicationArea = Basic;
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Ordered; Rec.Ordered)
                {
                    ApplicationArea = Basic;
                }
                field(User; Rec.User)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Use"; Rec."Date of Use")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No of Approvals"; Rec."No of Approvals")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Requisition Type" := Rec."requisition type"::"Purchase Requisition";
    end;

    trigger OnOpenPage()
    begin
        Rec.SetRange(Rec."Raised by", UserId);
        /*
           IF UserSetup.GET(USERID) THEN
           BEGIN
        
           IF UserSetup."Approver ID"=USERID THEN
           SETRANGE("Raised by");
           ApprovalTemplate.RESET;
           ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
           ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
           IF ApprovalTemplate.FIND('-') THEN
           BEGIN
           AdditionalApprovers.RESET;
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approver ID",USERID);
           IF AdditionalApprovers.FIND('+') THEN
           SETRANGE("Raised by");
           END;
           IF ApprovalSetup.GET THEN
           IF ApprovalSetup."Approval Administrator"=USERID THEN
           SETRANGE("Raised by");
        
        
           ApprovalTemplate.RESET;
           ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
           ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
           IF ApprovalTemplate.FIND('-') THEN
           BEGIN
           AdditionalApprovers.RESET;
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
           IF AdditionalApprovers.FIND('-') THEN
           REPEAT
        
            UserSetupRec.RESET;
            UserSetupRec.SETRANGE(UserSetupRec.Substitute,AdditionalApprovers."Approver ID");
            IF UserSetupRec.FIND('-') THEN
            SETRANGE("Raised by");
           UNTIL AdditionalApprovers.NEXT=0;
        
           END;
        
        
        
        
           END;
           */

    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
}
