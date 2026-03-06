#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70017 "Procurement Plan Header"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Procurement Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Budget Type"; Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Plan Posted"; Rec."Budget Plan Posted")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control21; "Procurement Plan Items")
            {
                SubPageLink = "Plan Year" = field(No);
            }
        }
        area(factboxes)
        {
            part(Control15; "Purchase Order Subform")
            {
            }
            part(Control16; "Purch. Invoice Subform")
            {
            }
            systempart(Control17; Outlook)
            {
            }
            systempart(Control18; Notes)
            {
            }
            systempart(Control19; MyNotes)
            {
            }
            systempart(Control20; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
        area(navigation)
        {
            group("Procurement Plan")
            {
                Caption = 'Procurement Plan';
                action("Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Approval';
                    Visible = true;

                    trigger OnAction()
                    begin
                        //SendForApproval() ;
                    end;
                }
                action("<Action1000000041>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        // IF ApprovalMgt.SendPrcmntPlanApprovalRequest(Rec) THEN;
                    end;
                }
                action("<Action1000000042>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalMgt.CancelPrcmntPlaApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Copy Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Procurement Plan';
                    //RunObject =Report UnknownReport57022;
                }
                action("Import Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = XMLport "Import Procurement Plan";
                }
                action("Update Budget Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Budget Entries';
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        ProcPlanItem.Reset;
                        ProcPlanItem.SetRange(ProcPlanItem."Plan Year", Rec.No);
                        //ProcPlanItem.SETRANGE(Type,ProcPlanItem.Type::"G/L Account");
                        ProcPlanItem.SetFilter(ProcPlanItem."Estimated Cost", '<>%1', 0);
                        if ProcPlanItem.Find('-') then begin

                            repeat
                                BudgetEntries.Reset;
                                BudgetEntries.SetRange("Budget Name", ProcPlanItem."Plan Year");
                                BudgetEntries.SetRange("Procurement Item", ProcPlanItem."Plan Item No");
                                //BudgetEntries.SETRANGE("G/L Account No.",ProcPlanItem."No.");
                                if BudgetEntries.FindSet then begin
                                    BudgetEntries.Date := Rec."Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.Get(ProcPlanItem."No.") then begin
                                            GenPostingSetup.Reset;
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.Find('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.Reset;
                                        FADepreciation.SetRange(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.Find('-') then
                                            if FAPostingGp.Get(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";

                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    //BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";
                                    if BudgetEntries.Amount <> 0 then
                                        BudgetEntries.Modify(true);
                                end else begin

                                    BudgetEntries.Init;
                                    BudgetEntries."Entry No." := 0;
                                    BudgetEntries.Date := Rec."Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";
                                    BudgetEntries."G/L Account No." := ProcPlanItem."No.";
                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    // BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.Get(ProcPlanItem."No.") then begin
                                            GenPostingSetup.Reset;
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.Find('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.Reset;
                                        FADepreciation.SetRange(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.Find('-') then
                                            if FAPostingGp.Get(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";


                                    BudgetEntries.Insert(true);
                                end;


                            until ProcPlanItem.Next = 0;

                            Message('Update Complete!');

                        end;
                    end;
                }
            }
        }
    }

    var
        ProcPlanItem: Record "Procurement Plan 1";
        BudgetEntries: Record "Procurement Plan Entry1";
        GenPostingSetup: Record "General Posting Setup";
        FAPostingGp: Record "FA Posting Group";
        FADepreciation: Record "FA Depreciation Book";
        ItemRec: Record Item;
        Window: Dialog;
}
