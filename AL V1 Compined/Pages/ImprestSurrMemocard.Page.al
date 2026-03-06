#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57077 "Imprest Surr Memo card"
{
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = filter(Open | "Pending Approval"),
                            Posted = const(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Rec.Objective);
                        Rec.Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec.Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec.Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                        Rec.CalcFields(Rec."Terms of Reference");
                        Rec."Terms of Reference".CreateInstream(Instr);
                        TOR.Read(Instr);

                        if TORText <> Format(TOR) then begin
                            Clear(Rec."Terms of Reference");
                            Clear(TOR);
                            TOR.AddText(TORText);
                            Rec."Terms of Reference".CreateOutstream(OutStr);
                            TOR.Write(OutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Subsistence Allowance"; Rec."Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Fuel Costs"; Rec."Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Maintenance Costs"; Rec."Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Casuals Cost"; Rec."Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                }
                field("PO Commitments"; Rec."PO Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Store Requisition Commitments"; Rec."Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Application Commitment"; Rec."Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget Commitments"; Rec."Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000020; "Safari Team")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
            }
            part("Fuel/Maintenance"; Fuel)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
            }
            part(Control1000000021; "Execution Plan")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000022; Casuals)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000023; "Other Costs")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                begin
                    //Daudi
                    //check if the requester is part of the team
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."No.", Rec.Requestor);
                    if ProjectTeam.FindFirst = false then
                        Error(Text001);

                    //cc//if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(Rec) then
                    //cc//ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelImpMemoApprovalRequest(Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PaymentPost.PostImprestMemo(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Ushindi changes

                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(57001, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalEntries.SetRecordfilters(Database::"Imprest Memo", 6, Rec."No.");
                    ApprovalEntries.Run;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        Rec.CalcFields(Rec."Terms of Reference", Rec.Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Imprest Surr Memo";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
