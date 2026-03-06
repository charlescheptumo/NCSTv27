#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57041 "Posted Imprest Memo"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = filter(Released),
                            Posted = const(true));

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
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Rec.Objective);
                        Rec.Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(TOR) then begin
                            Clear(Rec.Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec.Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                        end;
                    end;
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
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
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
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
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
            }
            part("Fuel/Maintenance"; Fuel)
            {
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
            }
            part(Control1000000021; "Execution Plan")
            {
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000022; Casuals)
            {
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000023; "Other Costs")
            {
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

                trigger OnAction()
                begin
                    //Ushindi changes

                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(57001, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    ////21.10.2019...Hunaina
                    Purch.Reset;
                    Purch.SetRange("No.", Rec."No.");
                    if Purch.FindSet then begin
                        RecRef.GetTable(Purch);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.Run;
                    end
                    else
                        RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.Run;

                    /*RecRef.GETTABLE(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RUNMODAL;*/

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
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released) and not Rec.Posted);

        Rec.CalcFields(Rec."Terms of Reference", Rec.Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);
        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released) and not Rec.Posted);
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
        Purch: Record Payments;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
