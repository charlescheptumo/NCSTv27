#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70052 "Contract Management Header"
{
    PageType = Card;
    SourceTable = "Contract Management Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Vol No"; Rec."Contract Vol No")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No"; Rec."Serial No")
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
                field("Requires Milestone"; Rec."Requires Milestone")
                {
                    ApplicationArea = Basic;
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Currency"; Rec."Contract Currency")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Price Amt(Words)"; Rec."Contract Price Amt(Words)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Amount in Words';
                    Editable = false;
                }
                field("Contract Award Date"; Rec."Contract Award Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expirery Notice Date"; Rec."Expirery Notice Date")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Ordered; Rec.Ordered)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Total Sum LPO Posted"; Rec."Total Sum LPO Posted")
                {
                    ApplicationArea = Basic;
                    Caption = 'LPOs Posted:';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Expired; Rec.Expired)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Assigned User"; Rec."Assigned User")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount in LPO"; Rec."Amount in LPO")
                {
                    ApplicationArea = Basic;
                    Caption = 'LPOs Not Posted';
                    Editable = false;
                }
            }
            group(Interaction)
            {
                Caption = 'Interaction';
                field("Language Code (Default)"; Rec."Language Code (Default)")
                {
                    ApplicationArea = Basic;
                }
                field("Subject (Default)"; Rec."Subject (Default)")
                {
                    ApplicationArea = Basic;
                }
                field("Attachment No."; Rec."Attachment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Interaction Template Code"; Rec."Interaction Template Code")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9; "Contract Manangement Lines")
            {
                SubPageLink = "Contract Header" = field(Code);
                Visible = false;
            }
        }
        area(factboxes)
        {
            systempart(Control11; Links)
            {
                Visible = true;
            }
            systempart(Control10; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Contract Milestones")
            {
                ApplicationArea = Basic;
                Caption = 'Contract Milestones';
                Enabled = MilestoneEditable;
                Image = MaintenanceRegistrations;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Contract Milestones";
                RunPageLink = "Contract Header" = field(Code);
            }
            group(Attachment)
            {
                Caption = 'Attachment';
                Image = Attachments;
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    Image = Edit;
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Interaction Template Code");
                        Rec.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Image = New;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Interaction Template Code");
                        Rec.CreateAttachment;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Image = Import;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Interaction Template Code");
                        Rec.ImportAttachment;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'Export';
                    Image = Export;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Interaction Template Code");
                        Rec.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Image = Cancel;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Interaction Template Code");
                        Rec.RemoveAttachment(false);
                    end;
                }
                action("E&xport File2")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport File2';
                    Image = ExportFile;
                    Visible = false;

                    trigger OnAction()
                    var
                        SegLineLocal: Record "Segment Line";
                    begin
                        SegLineLocal.SetRange("Segment No.", Rec.Code);
                        Xmlport.Run(Xmlport::"Export Segment Contact", false, false, SegLineLocal);
                    end;
                }
                action("Assign Users")
                {
                    ApplicationArea = Basic;
                    Caption = '&Assign Users';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        PurchRec: Record "Contract Management Header";
                        Text001: label 'Are you sure you want to assign the selected requisition to a procurement officer';
                    begin
                        PurchSetup.Get;
                        //PurchSetup.TESTFIELD("DIRECTOR LEGAL");
                        ///IF (USERID = PurchSetup."DIRECTOR LEGAL") THEN BEGIN
                        if Confirm(Text005) = true then begin
                            //ProcPage.RUN;
                            //ProcPage.SETSELECTIONFILTER(UserSetup);
                            if Page.RunModal(51511952, UserSetup) = Action::LookupOK then begin
                                UserRecID := UserSetup."User ID";
                            end;
                            if UserRecID <> '' then begin
                                contractrec.Reset;
                                contractrec.Get(Rec.Code);
                                contractrec."Assigned User" := UserRecID;
                                contractrec.Modify;
                                Message('%1  Successfully Assigned', UserRecID);
                            end;
                        end;
                        //END;
                        /*
                        IF (USERID <> PurchSetup."DIRECTOR LEGAL") THEN BEGIN
                           ERROR ('You do not have the right to this function');
                        END;*/

                    end;
                }
                action("Open RFP/Tender Documents")
                {
                    ApplicationArea = Basic;
                    Image = DocumentsMaturity;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        rfprec.Reset;
                        rfprec.SetFilter(rfprec.No, Rec."Tender No");
                        if rfprec.FindSet then begin
                            Filerec2.Reset;
                            Filerec2.SetFilter(Filerec2.No, Rec."Tender No");
                            Filerec2.SetFilter(Filerec2.Path, '%1', rfprec.minutesbeforeproceedtoaward);
                            if not Filerec2.FindSet then begin
                                Filerec.Reset;
                                Filerec.SetFilter(Filerec.No, Rec."Tender No");
                                if Filerec.FindLast then begin
                                    Filerec2.Init;
                                    Filerec2.No := Rec."Tender No";
                                    Filerec2."Line No" := Filerec2."Line No" + 1;
                                    Filerec2.Path := rfprec.minutesbeforeproceedtoaward;
                                    Filerec2.Insert;

                                    Filerec2.Init;
                                    Filerec2.No := Rec."Tender No";
                                    Filerec2."Line No" := Filerec2."Line No" + 2;
                                    Filerec2.Path := rfprec.minutesafterproceedtoaward;
                                    Filerec2.Insert;
                                end;
                                if not Filerec.FindLast then begin
                                    Filerec2.Init;
                                    Filerec2.No := Rec."Tender No";
                                    Filerec2."Line No" := 1;
                                    Filerec2.Path := rfprec.minutesbeforeproceedtoaward;
                                    Filerec2.Insert;

                                    Filerec2.Init;
                                    Filerec2.No := Rec."Tender No";
                                    Filerec2."Line No" := 2;
                                    Filerec2.Path := rfprec.minutesafterproceedtoaward;
                                    Filerec2.Insert;
                                end;
                            end;

                        end;

                        Filerec.Reset;
                        Filerec.SetFilter(Filerec.No, Rec."Tender No");
                        if Filerec.FindSet then begin
                            Page.Run(51511143, Filerec);
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Requires Milestone" then begin
            MilestoneEditable := true;
            GenerateEditable := false;
        end else begin
            MilestoneEditable := false;
            GenerateEditable := true;
        end;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec."Assigned User" <> '' then begin
            Error('You cannot Delete this Record!!!');
        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Requires Milestone" then begin
            MilestoneEditable := true;
            GenerateEditable := false;
        end else begin
            MilestoneEditable := false;
            GenerateEditable := true;
        end;

        PPSetup.Get;
        PPSetup.TestField("Legal Dept Code");

        if UserRec.Get(UserId) then
            if Emp.Get(UserRec."Employee No.") then
                if UserRec."Global Dimension 1 Code" <> PPSetup."Legal Dept Code" then
                    Error('You are not allowed to modify this record');

        /*IF "Assigned User ID" <> USERID THEN
        ERROR('You have not been assigned to work on this Contract');*/

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec."Requires Milestone" then begin
            MilestoneEditable := true;
            GenerateEditable := false;
        end else begin
            MilestoneEditable := false;
            GenerateEditable := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Requires Milestone" then begin
            MilestoneEditable := true;
            GenerateEditable := false;
        end else begin
            MilestoneEditable := false;
            GenerateEditable := true;
        end;
    end;

    var
        MilestoneEditable: Boolean;
        GenerateEditable: Boolean;
        PurchReq: Record "Requisition Header1";
        TenderRec: Record "Procurement Request";
        Text000: label 'The Status has to be Released';
        Text001: label 'A Purchase Order has already been created for this Requisition';
        Path: Text;
        ServerFileName: Text;
        // [RunOnClient]
        // FileInfo: dotnet FileInfo;
        PPSetup: Record "Purchases & Payables Setup";
        Emp: Record Employee;
        UserRec: Record "User Setup";
        Text002: label 'The total LPO amount of %1 exceeds the contract amount %2 by %3, therefore the another LPO cannot be generated';
        AmnttobePaidtext: Text;
        AmnttobePaid: Decimal;
        // [RunOnClient]
        // Window: dotnet Interaction;
        Descriptiontext: Text[50];
        PurchSetup: Record "Purchases & Payables Setup";
        UserRecID: Code[70];
        UserSetup: Record "User Setup";
        Text005: label 'Are you sure you want to Assign this Contract to a Legal Officer?';
        contractrec: Record "Contract Management Header";
        Filerec: Record "Files Path Management";
        rfprec: Record "Procurement Request";
        Filerec2: Record "Files Path Management";
        seedelete: Boolean;
}
