#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50015 pageextension50015 extends "Purchase Order"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""Purchase Order"(Page 50)".


    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Purchase Order"(Page 50)".


    //Unsupported feature: Property Insertion (ModifyAllowed) on ""Purchase Order"(Page 50)".


    //Unsupported feature: Property Insertion (DelayedInsert) on ""Purchase Order"(Page 50)".

    layout
    {
        modify(Status)
        {
            Editable = true;
        }
        addafter("Order Address Code")
        {
            field("Procurement Type"; Rec."Procurement Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Status)
        {
            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Job Queue Status")
        {
            field("Posting No."; Rec."Posting No.")
            {
                ApplicationArea = Basic;
            }
            field("Inspection Team Setup?"; Rec."Inspection Team Setup?")
            {
                ApplicationArea = Basic;
            }
            field("Contract No."; Rec."Contract No.")
            {
                ApplicationArea = Basic;
            }
            field("Requisition No"; Rec."Requisition No")
            {
                ApplicationArea = Basic;
            }
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
            }
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "DocAttach(Action 107).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        RecRef.GETTABLE(Rec);
        DocumentAttachmentDetails.OpenForRecRef(RecRef);
        DocumentAttachmentDetails.RUNMODAL;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ////21.10.2019...Hunaina
        Purch.RESET;
        Purch.SETRANGE("No.","Requisition No");
        IF Purch.FINDSET THEN BEGIN
        RecRef.GETTABLE(Purch);
        DocumentAttachmentDetails.OpenForRecRef(RecRef);
        DocumentAttachmentDetails.RUN;
        END
        ELSE
        RecRef.GETTABLE(Rec);
        DocumentAttachmentDetails.OpenForRecRef(RecRef);
        DocumentAttachmentDetails.RUN;

        {RecRef.GETTABLE(Rec);
        DocumentAttachmentDetails.OpenForRecRef(RecRef);
        DocumentAttachmentDetails.RUNMODAL;}
        */
        //end;


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 57).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         purchLines.RESET;
        purchLines.SETRANGE("Document No.","No.");
        IF purchLines.FIND('-') THEN BEGIN
           REPEAT
             purchLines.TESTFIELD("No.");
             purchLines.TESTFIELD("Gen. Prod. Posting Group");
             //purchLines.TESTFIELD("Shortcut Dimension 2 Code");
             //purchLines.TESTFIELD("Shortcut Dimension 1 Code");
             purchLines.TESTFIELD("Department Code");
             purchLines.TESTFIELD("Directorate Code");
             purchLines.TESTFIELD("Procurement Plan Item");
             purchLines.TESTFIELD("Procurement Plan");
             purchLines.TESTFIELD("Job No.");
             purchLines.TESTFIELD("Job Task No.");
             purchLines.TESTFIELD(Quantity);
             purchLines.TESTFIELD("Direct Unit Cost Inc. VAT");
             purchLines.TESTFIELD(Comment);
             purchLines.TESTFIELD("VAT Prod. Posting Group");

                 UNTIL purchLines.NEXT=0;
          END;

        //cc//if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          //cc//ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;


        //Unsupported feature: Code Modification on "Post(Action 79).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Post(CODEUNIT::"Purch.-Post (Yes/No)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        purchLines.RESET;
        purchLines.SETRANGE("Document No.","No.");
        IF purchLines.FIND('-') THEN BEGIN
           REPEAT
                 purchLines.TESTFIELD(Comment);

             UNTIL purchLines.NEXT=0;
             END;

        Post(CODEUNIT::"Purch.-Post (Yes/No)");
        */
        //end;


        //Unsupported feature: Code Modification on "Preview(Action 21).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowPreview;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        ShowPreview;
        */
        //end;


        //Unsupported feature: Code Modification on ""&Print"(Action 82).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PurchaseHeader := Rec;
        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
        PurchaseHeader.PrintRecords(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PurchaseHeader := Rec;
        {CurrPage.SETSELECTIONFILTER(PurchaseHeader);
        PurchaseHeader.PrintRecords(TRUE);}

        IF "Order types" = "Order types"::LPO THEN BEGIN
        RESET;
        SETFILTER("No.","No.");
        REPORT.RUN(70033,TRUE,FALSE,Rec);
        END;

        IF "Order types" = "Order types"::LSO THEN BEGIN
        RESET;
        SETFILTER("No.","No.");
        REPORT.RUN(70029,TRUE,FALSE,Rec);
        END;
        */
        //end;
        addafter(DocAttach)
        {
            action(Comments)
            {
                ApplicationArea = Suite;
                Caption = 'Comments';
                Enabled = ShowRecCommentsEnabled;
                Image = ViewComments;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Approval Comments";
                Scope = Repeater;
                ToolTip = 'View or add comments for the record.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    RecRef: RecordRef;
                begin
                    /*RecRef.GET("Record ID to Approve");
                    CLEAR(ApprovalsMgmt);
                    ApprovalsMgmt.GetApprovalCommentForWorkflowStepInstanceID(RecRef,"Workflow Step Instance ID");*/

                end;
            }
        }
        addafter("F&unctions")
        {
            group(Committment)
            {
                Caption = 'Committment';
                action("Commit Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Commit Entries';
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        CommittmentMgt.LPOCommittment(Rec);
                    end;
                }
                action("Reverse Commit Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reverse Commit Entries';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //CommittmentMgt.ReverseLPOCommittment(Rec);
                    end;
                }
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        /*BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                           EXIT;*/

                        /*F NOT CheckforRequiredFields THEN
                           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');*/

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        /*IF SomeLinesCommitted THEN BEGIN
                           IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                          DeleteCommitment.RESET;
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                          DeleteCommitment.DELETEALL;
                        END;*/
                        CommittmentMgt.CheckLPOCommittment(Rec);

                        //MESSAGE('Commitments done Successfully for Doc. No %1',"No.");

                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.Reset;
                        DeleteCommitment.SetRange(DeleteCommitment."Commitment Type", DeleteCommitment."commitment type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll;
                        //Tag all the Purchase Line entries as Uncommitted
                        /*PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.","No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                           REPEAT
                              PurchLine.Committed:=FALSE;
                              PurchLine.MODIFY;
                           UNTIL PurchLine.NEXT=0;
                        END;*/

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");

                    end;
                }
            }
        }
    }

    var
        CommittmentMgt: Codeunit "Procurement Processing";
        DeleteCommitment: Record "Commitment Entries1";
        Purch: Record "Purchase Header";
        ShowRecCommentsEnabled: Boolean;
        purchLines: Record "Purchase Line";
}
