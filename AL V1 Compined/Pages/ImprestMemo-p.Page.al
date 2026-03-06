#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57042 "Imprest Memo-p"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = const(Released),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                Editable = true;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
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
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
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
                field("Imprest Naration"; Rec."Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Narations';
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel date';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
                    Editable = false;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
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
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
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
                field("Total Budget Commitments"; Rec."Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group(Reasons)
            {
                Caption = 'Reasons';
                field("Reason to Reopen"; Rec."Reason to Reopen")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Reopened by"; Rec."Reopened by")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Travel Details")
            {
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
                Visible = false;
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
                Visible = false;

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
                Visible = false;

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

                trigger OnAction()
                begin
                    //Ushindi changes
                    if Rec.Status <> Rec.Status::Released then
                        Error(Text002);
                    if Rec.Status = Rec.Status::Released then begin
                        Rec.SetRange(Rec."No.", Rec."No.");
                        Report.Run(57001, true, true, Rec);
                        Rec.Reset;
                    end;
                end;
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attach Scope of Work';
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
                    DocumentAttachmentDetails.RunModal;
                end;
            }
            action("Create Voucher")
            {
                ApplicationArea = Basic;
                Caption = 'Create Voucher';
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    CashMgt.Get();
                    if Confirm(Text004, false, Rec."No.") then begin
                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", Rec."No.");
                        if Memoheaders.Find('-') then begin
                            Noseries := CashMgt."Imprest Voucher Nos";
                            LineNo := 1000;
                            Imprestheaders.Init;
                            Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                            Imprestheaders.Date := Today;
                            Imprestheaders."Created By" := UserId;
                            Imprestheaders."Payment Type" := Imprestheaders."payment type"::"Warrant Voucher";
                            Imprestheaders."Document Type" := Imprestheaders."document type"::"Warrant Voucher";
                            Imprestheaders."Travel Date" := Imprestheaders."Travel Date";
                            Imprestheaders."Imprest Memo No" := Rec."No.";
                            Imprestheaders."Payment Narration" := Rec.Subject;
                            Imprestheaders.Status := Imprestheaders.Status::Open;
                            Imprestheaders."Directorate Code" := Rec."Directorate Code";
                            Imprestheaders."Department Code" := Rec."Department Code";
                            //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 1 Code","Global Dimension 1 Code");
                            //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code","Global Dimension 2 Code");
                            //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code","Shortcut Dimension 3 Code");
                            //          Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code","Shortcut Dimension 4 Code");
                            Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                            Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
                            Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 3 Code");
                            Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                            Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 4 Code");

                            //JOBS
                            Imprestheaders.Job := Memoheaders.Job;
                            Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                            Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                            Imprestheaders."Job Task Name" := Memoheaders."Job Task Name";
                            //Imprestheaders.VALIDATE("Job Task No");
                            Imprestheaders.Insert;
                            SafariMembers.Reset;
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            if SafariMembers.FindSet then begin
                                repeat//Start of Imprest lines
                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                                    Imprestlines.No := Imprestheaders."No.";
                                    Imprestlines."Account Type" := Imprestlines."account type"::Employee;
                                    Imprestlines."Account No." := SafariMembers."No.";

                                    Imprestlines.Purpose := Memoheaders.Subject;
                                    Imprestlines."Imprest Subsistence" := SafariMembers.Entitlement;
                                    if SafariMembers."Transport Costs" <> 0 then
                                        Imprestlines."Imprest Transport" := SafariMembers."Transport Costs";
                                    if SafariMembers."Project Lead" = true then begin
                                        FuelAmount := 0.0;
                                        ProjectTeam.Reset;
                                        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
                                        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                                        //fuel
                                        if ProjectTeam.FindSet then begin
                                            repeat
                                                FuelAmount += ProjectTeam."Expected Maintenance Cost";
                                            until ProjectTeam.Next = 0;
                                            Imprestlines."Imprest Fuel" := FuelAmount;
                                        end;
                                        //Casuals
                                        Casual.Reset;
                                        Casual.SetRange("Imprest Memo No.", Rec."No.");
                                        if Casual.FindSet then begin
                                            repeat
                                                CasualsAmount += Casual.Amount;
                                            until Casual.Next = 0;
                                            Imprestlines."Imprest Casuals" := CasualsAmount;
                                        end;
                                        //Other Costs
                                        /*Othercost.RESET;
                                        Othercost.SETRANGE(Othercost."Imprest Memo No.","No.");
                                        Costs:=0.0;
                                        IF Othercost.FINDSET THEN
                                          BEGIN
                                            REPEAT
                                              Costs:=Costs+Othercost."Line Amount";
                                            UNTIL Othercost.NEXT=0;
                                          Imprestlines."Imprest Other Costs":=Costs;
                                        END;*/

                                    end;
                                    Othercost.Reset;
                                    Othercost.SetRange("Employee No.", SafariMembers."No.");
                                    Othercost.SetRange(Othercost."Imprest Memo No.", Rec."No.");
                                    Costs := 0.0;
                                    if Othercost.FindSet then begin
                                        repeat

                                            Costs := Costs + Othercost."Line Amount";
                                        until Othercost.Next = 0;
                                        //Imprestlines."Imprest Other Costs":=Costs;
                                    end;




                                    Imprestlines.Validate("Account No.");
                                    Imprestlines.Insert;
                                until SafariMembers.Next = 0;
                            end;
                            Othercost.Reset;
                            Othercost.SetRange(Othercost."Imprest Memo No.", Rec."No.");
                            if Othercost.Find('-') then begin
                                repeat
                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo + Imprestlines."Line No";
                                    Imprestlines.No := Imprestheaders."No.";
                                    // Imprestlines."Account Type":= Imprestlines."Account Type"::"G/L Account";
                                    Imprestlines."Account Type" := Imprestlines."account type"::Employee;
                                    // Othercost.CALCFIELDS("No.");
                                    Imprestlines."Account No." := Othercost."Employee No.";
                                    Imprestlines.Validate("Account No.");
                                    Imprestlines."Account Name" := Othercost."Required For";

                                    Imprestlines."Imprest Other Costs" := Othercost."Line Amount";
                                    Imprestlines.Amount := Othercost."Line Amount";
                                    Imprestlines.Insert;
                                until Othercost.Next = 0;
                            end;
                            Memoheaders."Imprest Created" := true;
                            Memoheaders."Date converted" := Today;
                            Memoheaders."Time converted" := Time;
                            Memoheaders."Converted By" := UserId;
                            Memoheaders.Posted := true;
                            Imprestheaders.Validate("Imprest Memo No");
                            Memoheaders.Modify;
                            Message('The Warrant Voucher has been created,kindly fill in the details and post it');

                        end;
                        Page.Run(57049, Imprestheaders);
                    end;

                    //Commit Budget
                    /*ProcurementProcessing.FnCommitImprestMemoProjectMembers(Rec);
                    ProcurementProcessing.FnCommitImprestMemoOtherCosts(Rec);*/

                end;
            }
            action("Create Imprest")
            {
                ApplicationArea = Basic;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    //add pv from claims
                    //added on 27/04/2017
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    if Confirm(Text004, false, Rec."No.") then begin
                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", Rec."No.");
                        if Memoheaders.Find('-') then begin

                            SafariMembers.Reset;
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            if SafariMembers.Find('-') then
                            //BEGIN
                            //IF SafariMembers.Type = SafariMembers.Type::Person THEN
                            begin
                                repeat
                                    //get the no. series
                                    CashMgt.Reset;
                                    if CashMgt.Find('-') then begin
                                        Noseries := CashMgt."Imprest Nos";
                                        Email2 := CashMgt."Imprest Email";
                                    end;

                                    LineNo := 1000;
                                    Imprestheaders.Init;
                                    Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                                    Imprestheaders.Date := Today;
                                    Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                                    Imprestheaders."Account No." := SafariMembers."No.";
                                    Imprestheaders."Account Name" := SafariMembers.Name;
                                    Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;
                                    Imprestheaders.Payee := SafariMembers.Name;
                                    Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                                    Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                                    Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                                    Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                                    Imprestheaders.Job := Memoheaders.Job;
                                    Imprestheaders.Status := Imprestheaders.Status::Released;
                                    Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                                    Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                                    Imprestheaders."Currency Code" := SafariMembers."Currency Code";
                                    Imprestheaders."Job Name" := Memoheaders."Job Name";
                                    Imprestheaders."Job Task Name" := Memoheaders."Job Task Name";
                                    //Imprestheaders."Reference No.":="No.";

                                    Email1 := '';
                                    //add the userid of the safari members
                                    /*Usersetup.RESET;
                                    Usersetup.SETRANGE("Resource No",Imprestheaders."Account No.");
                                    IF Usersetup.FIND('-') THEN
                                    BEGIN
                                    //  Usersetup.CALCFIELDS("E-Mail");
                                      //MESSAGE('%1',Usersetup."E-Mail");
                                      Imprestheaders."Created By":=Usersetup."User ID";
                                      Email1 := Usersetup."E-Mail";
                                    END;*/
                                    EMp.Reset;
                                    EMp.SetRange("No.", Imprestheaders."Account No.");
                                    if EMp.FindSet then begin
                                        Imprestheaders."Created By" := UserId;
                                        Email1 := EMp."Company E-Mail";
                                    end;


                                    Imprestheaders."Travel Date" := Memoheaders."Start Date";
                                    Imprestheaders."Payment Narration" := Memoheaders.Subject;
                                    Imprestheaders.Validate(Imprestheaders."Travel Date");
                                    Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
                                    Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                                    Imprestheaders."On behalf of" := SafariMembers.Name;
                                    Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                    Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                                    Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                    Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");

                                    // Imprestheaders."Shortcut Dimension 1 Code":=Memoheaders."Global Dimension 1 Code"; commented by Morris
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 1 Code");
                                    // Imprestheaders."Shortcut Dimension 2 Code":=Memoheaders."Global Dimension 2 Code"; commented by Morris
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");
                                    Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                                    Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                                    Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
                                    Imprestheaders.Insert;


                                    //Start of Imprest lines
                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo;
                                    Imprestlines.No := Imprestheaders."No.";
                                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                    SafariMembers.CalcFields("G/L Account");
                                    Imprestlines."Account No." := SafariMembers."G/L Account";
                                    Imprestlines.Validate(Imprestlines."Account No.");
                                    Imprestlines.Purpose := SafariMembers."Work Type";
                                    Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                    Imprestlines."No. of Days" := SafariMembers."Time Period";
                                    Imprestlines.Amount := SafariMembers.Entitlement;
                                    Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                    Imprestlines.Insert;
                                    LineNo := LineNo + 10;
                                    if SafariMembers."Transport Costs" <> 0 then begin
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := SafariMembers."G/L Account";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := 'Transport Allowance';
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := SafariMembers."Transport Costs";
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");


                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;
                                    end;

                                    if SafariMembers."Project Lead" = true then begin
                                        ProjectTeam.Reset;
                                        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
                                        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                                        if ProjectTeam.Find('-') then
                                        //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                                        begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";
                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                SafariMembers.CalcFields("G/L Account");
                                                Imprestlines."Account No." := SafariMembers."G/L Account";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := ProjectTeam."Work Type";
                                                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                                Imprestlines."No. of Days" := SafariMembers."Time Period";
                                                Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";

                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until ProjectTeam.Next = 0;
                                        end;


                                        Othercost.Reset;
                                        Othercost.SetRange(Othercost."Imprest Memo No.", Rec."No.");
                                        if Othercost.Find('-') then begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";

                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                Othercost.CalcFields("No.");
                                                Imprestlines."Account No." := Othercost."No.";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := Othercost."Required For";
                                                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                                Imprestlines."No. of Days" := SafariMembers."Time Period";
                                                Imprestlines.Amount := Othercost."Line Amount";
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until Othercost.Next = 0;
                                        end;


                                        Casual.Reset;
                                        Casual.SetRange(Casual."Imprest Memo No.", Rec."No.");
                                        if Casual.Find('-') then begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";

                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                Imprestlines."Account No." := Casual."G/L Account";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := Casual.Activity;
                                                Imprestlines."Daily Rate" := Casual.Rate;
                                                Imprestlines."No. of Days" := Casual."No. of Days";
                                                Imprestlines.Amount := Casual.Amount;
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until Casual.Next = 0;
                                        end;
                                    end;

                                    Imprestheaders.Validate(Imprestheaders.Status);
                                //commented on 01/07/19
                                /*
                                          //Function Create Transport Request..
                                            IF (From<>'') AND (Destination<>'') THEN BEGIN
                                            TransSetup.GET;
                                            TravelNo:=NoSeriesMgt.GetNextNo(TransSetup."Transport Req No",TODAY,TRUE);
                                            TransportReq.INIT;
                                            TransportReq."Transport Requisition No":=TravelNo;
                                            TransportReq.Commencement:=From;
                                            TransportReq.Destination:=Destination;
                                            TransportReq."Requested By":="User ID";
                                            TransportReq.Department:="Responsibility Center";
                                            TransportReq."Date of Request":=Date;
                                            TransportReq."Date of Trip":="Start Date";
                                            TransportReq."Time Requested":=TIME;
                                            TransportReq."Time out":="Time Out";
                                            TransportReq."Journey Route":="Journey Route";
                                            TransportReq."Purpose of Trip":=Subject;
                                            TransportReq.INSERT(TRUE);

                                            SafariMembers.RESET;
                                            SafariMembers.SETRANGE("Imprest Memo No.",Memoheaders."No.");
                                            SafariMembers.SETRANGE(SafariMembers.Type,SafariMembers.Type::Person);
                                            IF SafariMembers.FIND('-') THEN BEGIN
                                              REPEAT
                                               TravelStaff.INIT;
                                               TravelStaff."Req No":=TravelNo;
                                               TravelStaff."Employee No":=SafariMembers."No.";
                                               TravelStaff."Employee Name":=SafariMembers.Name;
                                               TravelStaff.Position:=SafariMembers."Job Title";
                                               TravelStaff.INSERT(TRUE);
                                              UNTIL SafariMembers.NEXT=0;
                                            END;
                                            END;

                                           */



                                //End Create Transport Request


                                //send email to participants
                                /*IF EMp.GET(EMp."No.") THEN
                                Email1:=EMp."Company E-Mail";
                                Email2:='D365@nacosti.go.ke';
                                IF Email1<>'' THEN BEGIN
                                CashMgt.GET;
                                IF CashMgt."Send Email Notification" = TRUE THEN
                                BEGIN
                                  Body:='Your imprest application no. '+ Imprestheaders."No." + ' has been created from memo no. '+"No."+
                                  ' Kindly login to Microsoft Dynamics NAV to confirm and send it for approval.';

                                  SMTP.CreateMessage('NACOSTI',Email2,
                                  Email1,'Imprest '+'No: '+Imprestheaders."No.",
                                  'Dear '+Imprestheaders.Payee+',<BR><BR>'+
                                  'Your imprest application no. '+ Imprestheaders."No." + 'of amount '+FORMAT(SafariMembers.Entitlement)+''' has been created from memo no. '+"No."+
                                  ' and has been fowarded to finance for processing.<BR><BR>',TRUE);

                                  SMTP.AppendBody('<BR><BR>Kind Regards,'+'<BR><BR>Finance Department.<BR>'+'<BR>');
                                  SMTP.Send();

                                END;
                                END;*/

                                until SafariMembers.Next = 0;
                            end;




                            Memoheaders."Imprest Created" := true;
                            Memoheaders."Date converted" := Today;
                            Memoheaders."Time converted" := Time;
                            Memoheaders."Converted By" := UserId;
                            Memoheaders.Posted := true;
                            Memoheaders.Modify;

                        end;
                        Message('Imprest (s) for the imprest memo No. %1 has been processed, Kindly send for approval', Rec."No.");
                    end else
                        Error('The payment for claim No. %1 has already been processed.', Memoheaders."No.");
                    //END;

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

                    // ApprovalEntries.SetRecordfilters(DATABASE::"Imprest Memo",6,"No.");
                    // ApprovalEntries.RUN;

                    ApprovalEntries.SetRecordfilters(Database::"Imprest Memo", 5, Rec."No.");
                    ApprovalEntries.Run;
                end;
            }
        }
        area(navigation)
        {
            action("Re&lease")
            {
                ApplicationArea = Basic;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                    ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Releasememo.PerformManualRelease(Rec);
                end;
            }
            action("Re&open")
            {
                ApplicationArea = Basic;
                Caption = 'Re&open';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    //added on 20/04/2016
                    if not Confirm('Are you sure you want to Re-Open this Document?', true) then begin
                        Error('Document not Re-Opened');
                    end;
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                    Rec.TestField(Rec."Reason to Reopen");
                    ReopenMemo.PerformManualReopen(Rec);
                    Message('Re-Opened Successfully');
                    //added on 20/04/2016
                    //increase frequency of reopening to be only once
                    if Rec."Frequency of Reopen" > 0 then begin
                        Error('The memo already reopened you can only reopen once');
                    end else begin
                        Rec."Frequency of Reopen" := 1;
                        Rec."Reopened by" := UserId;
                        Rec."Reopened Date" := CurrentDatetime;
                        Rec.Modify;
                    end;
                end;
            }
            action("Co&mments")
            {
                ApplicationArea = Basic;
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page "Comment Sheet";
                RunPageLink = "Table Name" = const(56000),
                              "No." = field("No.");
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
        ReopenMemo: Codeunit "Imprest Memo";
        memo: Record "Imprest Memo";
        Releasememo: Codeunit "Imprest Memo";
        Usersetup: Record "User Setup";
        Imprestlines: Record "Imprest Voucher Lines";
        Imprestheaders: Record Payments;
        Memolines: Record "PV Lines";
        Memoheaders: Record "Imprest Memo";
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        Text004: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
        SafariMembers: Record "Project Members";
        Othercost: Record "Other Costs";
        LineNo: Integer;
        Text005: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
        // SMTP: Codeunit "SMTP Mail";
        Body: Text[1024];
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Text006: label 'your imprest No %1 of Amount %2 has been created,and is being processed';
        ImprestMessage: Text[80];
        TransportReq: Record "Transport Requisition";
        TransSetup: Record "Fleet Management Setup";
        TravelStaff: Record "Travel Requisition Staff";
        TravelNo: Code[50];
        EMp: Record Employee;
        Casual: Record Casuals;
        WorkType: Record "Work Type";
        ImprestOther: Decimal;
        Costs: Decimal;
        CasualsAmount: Decimal;
        FuelAmount: Decimal;
        ProcurementProcessing: Codeunit "Procurement Processing";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;


    procedure FnSendimprestEmail(EmpNo: Code[50]; ImprestAmount: Decimal)
    var
        //cc//  SMTPMail: Codeunit "SMTP Mail";
        //cc//  SMTPSetup: Record "SMTP Mail Setup";
        FileName: Text[100];
        EMAILSNED: Codeunit EMAIL;
        EMAILMESSAGE: Codeunit "Email Message";
        BODY: Text[1024];
        Attachment: Text[250];
        CompanyInfo: Record "Company Information";
        Email: Text[50];
        EmpRec: Record Employee;
    begin
        //cc//  SMTPSetup.Get();

        EmpRec.Reset;
        EmpRec.SetRange(EmpRec."No.", EmpNo);
        if EmpRec.Find('-') then begin

            if EmpRec."E-Mail" <> '' then begin
                ImprestMessage := Text006;
                Email := EmpRec."E-Mail";

                //cc//  SMTPMail.CreateMessage(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address", Email, 'Imprest Application', '', true);
                //cc//  SMTPMail.AppendBody(StrSubstNo(ImprestMessage, Rec."No.", ImprestAmount, UserId));
                //cc//  SMTPMail.AppendBody(SMTPSetup."Email Sender Name");
                //cc//  SMTPMail.AppendBody('<br><br>');
                //cc//  SMTPMail.AddAttachment(FileName, Attachment);
                //cc//  SMTPMail.Send;
                BODY := StrSubstNo(ImprestMessage, Rec."No.", ImprestAmount);
                EMAILMESSAGE.Create(Email, 'Imprest Application', BODY);
                EMAILSNED.Send(EMAILMESSAGE, Enum::"Email Scenario"::Default);
            end;
        end;
    end;
}
