#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57040 "Posted Imprest Memos"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Imprest Memo";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = filter(Released),
                            Posted = const(true));
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
                field(Date; Rec.Date)
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
        }
        area(factboxes)
        {
            systempart(Control1000000012; Notes)
            {
            }
            systempart(Control1000000013; MyNotes)
            {
            }
            systempart(Control1000000014; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
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
        }
    }

    trigger OnAfterGetRecord()
    begin
        /*
        CALCFIELDS("Terms of Reference");
        Rec."Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                Rec.SetRange(Rec."User ID", UserId);
        end

    end;

    trigger OnOpenPage()
    begin
        /*
        CALCFIELDS("Terms of Reference");
        Rec."Terms of Reference".CREATEINSTREAM(Instr);
        TOR.READ(Instr);
        TOR.GETSUBTEXT(TermsText,1) ;
        */
        if UserSetup.Get(UserId) then begin
            if UserSetup."Accounts User" = false then
                Rec.SetRange(Rec."User ID", UserId);
        end

    end;

    var
        TOR: BigText;
        TermsText: Text;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SalesRec: Record "Sales Header";
        OpenApprovalEntriesExist: Boolean;
        UserSetup: Record "User Setup";
        ObjText: Text;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        Obj: BigText;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
