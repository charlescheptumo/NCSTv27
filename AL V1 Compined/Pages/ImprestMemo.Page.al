#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57033 "Imprest Memo"
{
    DeleteAllowed = false;
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
                    Importance = Promoted;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field(Subject; Rec.Subject)
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
                    Visible = false;

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
                field("Imprest Naration"; Rec."Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Narations';
                    Editable = not OpenApprovalEntriesExist;
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
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                    Visible = false;
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Date';
                    Visible = true;
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    // Numeric = true;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Subsistence Allowance"; Rec."Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Transport Costs"; Rec."Total Transport Costs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Visible = true;
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Vote Amount"; Rec."Vote Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Actual to Date"; Rec."Actual to Date")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                    Visible = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PO Commitments"; Rec."PO Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Store Requisition Commitments"; Rec."Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Imprest Application Commitment"; Rec."Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Travel Details")
            {
                Visible = false;
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000020; "Safari Team")
            {
                Caption = 'Team';
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
                UpdatePropagation = Both;
            }
            part("Fuel/Maintenance"; Fuel)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
                UpdatePropagation = Both;
            }
            part(Control1000000021; "Execution Plan")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                UpdatePropagation = Both;
                Visible = false;
            }
            part(Control1000000022; Casuals)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                UpdatePropagation = Both;
                Visible = true;
            }
            part(Control1000000023; "Other Costs")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                UpdatePropagation = Both;
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
                    editTransport := false;
                    Rec.TestField(Rec.Status, Rec.Status::Open);//status must be open.
                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
                    Rec.TestField(Rec.Objective);
                    Rec.TestField(Rec.Subject);
                    Rec.TestField(Rec.Date);
                    Rec.TestField(Rec."Return Date");
                    Rec.TestField(Rec."Imprest Naration");
                    Rec.TestField(Rec.Job);
                    Rec.TestField(Rec."Job  Task");
                    Safari.Reset;
                    Safari.SetRange("Imprest Memo No.", Rec."No.");
                    if Safari.FindSet then begin
                        if Safari."Vote Item" = ''
                          then begin
                            //ERROR('Kindly fill in the Vote Item before Sending Document for Approval');
                        end
                    end;

                    //Check if employees under other cost are on the safari team
                    OtherCosts.Reset;
                    OtherCosts.SetRange("Imprest Memo No.", Rec."No.");
                    if OtherCosts.FindSet then begin
                        repeat
                            Safari.Reset;
                            Safari.SetRange("Imprest Memo No.", Rec."No.");
                            Safari.SetRange("No.", OtherCosts."Employee No.");
                            if not Safari.FindSet then begin
                                Error('Employee %1 under other cost must be included in the safari team', OtherCosts."Employee No.");

                            end;
                        until OtherCosts.Next = 0;
                    end;

                    //check if the requester is part of the team


                    //****Commented by Morris*****//
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."No.", Rec.Requestor);
                    if ProjectTeam.FindFirst = false then
                        Error(Text001);

                    //ensure at least one safari team exists to do the surrender

                    //

                    Rec.CalcFields(Rec."Total Subsistence Allowance", Rec."Total Fuel Costs", Rec."Total Maintenance Costs", Rec."Total Casuals Cost", Rec."Total Other Costs");
                    TotalImprestAmount := Rec."Total Subsistence Allowance" + Rec."Total Fuel Costs" + Rec."Total Maintenance Costs" + Rec."Total Casuals Cost" + Rec."Total Other Costs";
                    // CashMgmtSetup.GET;
                    // IF (CashMgmtSetup."Check Budget Vailability"=TRUE) THEN BEGIN
                    if (TotalImprestAmount > Rec."Job Task Remaining Amount") then
                        Error('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)', TotalImprestAmount, Rec."Job Task Remaining Amount");
                    // END;


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
                    Rec.TestField(Rec.Status, Rec.Status::"Pending Approval");//status must be open.
                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
                    //ApprovalsMgmt.OnCancelImpMemoApprovalRequest(Rec);
                end;
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.Run;
                    /*
                    ELSE
                    RecRef.GETTABLE(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RUN;
                    //*/
                    /*RecRef.GETTABLE(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RUNMODAL;
                    */

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
                Visible = false;

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
                Visible = true;

                trigger OnAction()
                begin

                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(57001, true, true, Rec);
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
                    ///Showing Approvals 16.10.2019 Hunaina
                    ApprovalEntries.SetRecordfilters(Database::"Imprest Memo", Rec."Document Type", Rec."No.");
                    ApprovalEntries.SetRecordfilters(Database::"Imprest Memo", 6, Rec."No.");
                    ApprovalEntries.Run;
                    ///End 16.10.2019 Hunaina

                    /*ApprovalEntries.SetRecordfilters(DATABASE::"Imprest Memo",6,"No.");
                    ApprovalEntries.RUN;*/
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);

                end;
            }
            action("Re&lease")
            {
                ApplicationArea = Basic;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                    ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Rec.TestField(Rec."Reason to Reopen");
                    usersetup.Get(UserId);
                    usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                    Rec.TestField(Rec."Reason to Reopen");
                    if not Confirm('Are you sure you want to Release this document?', true) then begin
                        Error('Document not Released!');
                    end;
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Message('Released Successfully!');
                    //Releasememo.PerformManualRelease(Rec);
                end;
            }
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(DocAttach1)
                {
                    ApplicationArea = All;
                    Caption = 'Attach Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        /*RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUN;*/
                        /*
                        ELSE
                        RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUN;
                        //*/
                        /*RecRef.GETTABLE(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RUNMODAL;
                        */
                        //DMSManagement.UploadImprestDocuments(Rec."No.", 'Imprest Applications', Rec.RecordId)

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

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
        Rec."Document Type" := Rec."document type"::"Imprest Memo";
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
        Text002: label 'The Imprest Memo must be fully approved before printing';
        Text003: label 'You do no have rights to post Imprest memo surrender. Please Seek Assistance from Accounts';
        usersetup: Record "User Setup";
        Releasememo: Codeunit "Imprest Memo";
        pteam: Record "Project Members";
        impmemo: Record "Imprest Memo";
        exeplan: Record "Execution Plan";
        editTransport: Boolean;
        safariteam: Page "Safari Team";
        TotalImprestAmount: Decimal;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        Purch: Record "Imprest Memo";
        Safari: Record "Project Members";
        CashMgmtSetup: Record "Cash Management Setup";
        DocumentServiceManagement: Codeunit "Document Service Management";
        DMSManagement: Codeunit "DMS Management";
        OtherCosts: Record "Other Costs";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}
