#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65129 "Cost Reimbursement Card"
{
    PageType = Card;
    SourceTable = "Project Billable Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project Billable ID"; Rec."Project Billable ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Type"; Rec."Project Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
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
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total billable Amount"; Rec."Total billable Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total billable Amount(LCY)"; Rec."Total billable Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control15; "Cost Reimbursement Lines")
            {
                SubPageLink = "Project Billable ID" = field("Project Billable ID"),
                              "Project Type" = field("Project Type"),
                              "Job No." = field("Project ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Rec."Approval Status", Rec."approval status"::Open);//status must be open.
                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                         //cc//if ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                          //cc//ApprovalsMgmt.OnSendGFAForApproval(Rec);*/

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //ApprovalsMgmt.OnCancelGFAApprovalRequest(Rec);*/

                    end;
                }
                separator(Action7)
                {
                }
                action("Suggest Billing Lines")
                {
                    ApplicationArea = Basic;
                    Image = SuggestLines;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        JobLedgerEntry.Reset;
                        JobLedgerEntry.SetRange("Job No.", Rec."Project ID");
                        JobLedgerEntry.SetRange("Entry Type", JobLedgerEntry."entry type"::Usage);
                        if JobLedgerEntry.Find('-') then begin
                            repeat
                                BillableLines.Init;
                                BillableLines."Project Billable ID" := Rec."Project Billable ID";
                                BillableLines."Line Number" := FnGetLastLineNo() + 1;
                                BillableLines."Job No." := JobLedgerEntry."Job No.";
                                BillableLines."Job Task No." := JobLedgerEntry."Job Task No.";
                                BillableLines."Project Type" := BillableLines."project type"::"Time & Material";
                                BillableLines."Original Line Type" := BillableLines."original line type"::Budget;
                                BillableLines."Original Type" := BillableLines."original type"::Resource;
                                BillableLines."Billing Line Type" := BillableLines."billing line type"::Billable;
                                BillableLines."Billing Type" := BillableLines."billing type"::"G/L Account";
                                BillableLines.Qty := JobLedgerEntry.Quantity;
                                BillableLines."Unit Price" := JobLedgerEntry."Total Cost";
                                BillableLines."Unit Price (LCY)" := JobLedgerEntry."Total Cost (LCY)";
                                BillableLines."Billing Price" := JobLedgerEntry."Total Cost";
                                BillableLines."Billing Price(LCY)" := JobLedgerEntry."Total Cost (LCY)";
                                BillableLines."Original Description" := JobLedgerEntry.Description;
                                BillableLines.Insert(true);
                            until JobLedgerEntry.Next = 0;
                        end;
                        Message('Billing lines populated successfully');
                    end;
                }
                action("Post Billable")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Billable';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin

                        LineN := 0;
                        BillableLines.Reset;
                        BillableLines.SetRange("Project Billable ID", Rec."Project Billable ID");
                        BillableLines.SetRange("Job No.", Rec."Project ID");
                        //BillableLines.SETRANGE(Transferred,FALSE);
                        if BillableLines.Find('-') then begin
                            repeat
                                BillableLines.TestField(Qty);
                                BillableLines.TestField("No.");
                                BillableLines.TestField("Billing Price");
                                BillableLines.TestField("Billing Price(LCY)");

                                JobPlanningLines.Init;
                                JobPlanningLines."Line No." := FnGetLastjbLineNo() + 1;
                                JobPlanningLines."Job No." := BillableLines."Job No.";
                                JobPlanningLines."Job Task No." := BillableLines."Job Task No.";
                                JobPlanningLines.Type := BillableLines."Billing Type";
                                JobPlanningLines."No." := BillableLines."No.";
                                JobPlanningLines.Validate(JobPlanningLines."No.");
                                JobPlanningLines."Document No." := Rec."Project Billable ID";
                                JobPlanningLines.Quantity := BillableLines.Qty;
                                JobPlanningLines.Validate(JobPlanningLines.Quantity);
                                JobPlanningLines."Line Type" := JobPlanningLines."line type"::Billable;
                                JobPlanningLines."Unit Price" := BillableLines."Billing Price";
                                JobPlanningLines."Unit Price (LCY)" := BillableLines."Billing Price(LCY)";
                                JobPlanningLines."Job Budget Templates" := BillableLines."Job Budget Templates";
                                JobPlanningLines.Description := BillableLines."Billing Description";
                                JobPlanningLines.Insert(true);
                            //BillableLines.Transferred:=TRUE;
                            until BillableLines.Next = 0;
                        end;

                        Message('Billing Posted Successfully');
                    end;
                }
            }
            group(ActionGroup25)
            {
                Caption = '&Job';
                Image = Job;
            }
            group("Research Project")
            {
                action(MilestonesLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Milestone Lines';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (Budget) or you can specify what you actually agreed with your customer that he should pay for the job (Billable).';

                    trigger OnAction()
                    var
                        MilestoneLine: Record "Milestones Lines";
                        MilestoneLines: Page "Milestones Lines";
                    begin
                        Rec.TestField(Rec."Project ID");
                        MilestoneLine.FilterGroup(2);
                        MilestoneLine.SetRange("Project No", Rec."Project ID");
                        MilestoneLine.FilterGroup(0);
                        //MilestoneLines.SetJobTaskNoVisible(TRUE);
                        MilestoneLines.SetTableview(MilestoneLine);
                        MilestoneLines.Editable := true;
                        MilestoneLines.Run;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Project Type" := Rec."project type"::"Time & Material";
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        LineN: Integer;
        BillableLines: Record "Billable Project Lines";
        JobPlanningLines: Record "Job Planning Line";
        JobLedgerEntry: Record "Job Ledger Entry";

    local procedure FnGetLastLineNo() LineNumber: Integer
    var
        Billable: Record "Billable Project Lines";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line Number"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastjbLineNo() LineN: Integer
    var
        JBBillable: Record "Job Planning Line";
    begin
        JBBillable.Reset;
        if JBBillable.Find('+') then
            LineN := JBBillable."Line No."
        else
            LineN := 1;
        exit(LineN);
    end;
}
