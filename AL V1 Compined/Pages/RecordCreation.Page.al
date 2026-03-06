#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59095 "Record Creation"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Record Creation";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = CorecOpen;
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("File Classification"; Rec."File Classification")
                {
                    ApplicationArea = Basic;
                }
                field("File Location"; Rec."File Location")
                {
                    ApplicationArea = Basic;
                }
                field("Registry Code"; Rec."Registry Code")
                {
                    ApplicationArea = Basic;
                }
                field("Creation date"; Rec."Creation date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Allocation Details")
            {
                Caption = 'Allocation Details';
                Visible = corec1;
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Custody; Rec.Custody)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Employee"; Rec."Assigned Employee")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Notes)
            {
            }
            systempart(Control15; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(DocAttach1)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Documents';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Visible = true;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    //DMSManagement.UploadFilesDoc(Rec."File No", 'File', Rec.RecordId);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = CorecOpen;

                trigger OnAction()
                begin

                    Rec.TestField(Rec.Status, Rec.Status::Open);
                    Rec.Status := Rec.Status::Submitted;
                    Message('File Submitted');
                end;
            }
            action(Assign)
            {
                ApplicationArea = Basic;
                Image = AllocatedCapacity;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = corec2;

                trigger OnAction()
                begin
                    if Confirm('Proceed to issue File ?', true) then begin
                        RegistryFileEntry.Reset;
                        RegistryFileEntry.SetRange("File No", Rec."File No");
                        RegistryFileEntry.SetRange(Posted, false);
                        if RegistryFileEntry.FindFirst then begin
                            Page.Run(59120, RegistryFileEntry);
                        end else begin
                            RegistryFileEntry.Init;
                            RegistryFileEntry."Entry No" := RegistryFileEntry."Entry No" + 1;
                            RegistryFileEntry."File No" := Rec."File No";
                            if RegistryFileEntry.Insert(true) then begin
                                Page.Run(59120, RegistryFileEntry);
                            end;
                        end;
                    end;
                    //59120
                    // TESTFIELD(Status,Status::Submitted);
                    // Status:=Status::Assigned;
                    // MESSAGE('File Assigned Successfully');
                end;
            }
            action("View Folio")
            {
                ApplicationArea = Basic;
                Image = ViewWorksheet;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "File Folio Registry";
                RunPageLink = "File No" = field("File No");
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        corec := false;
        if (Rec.Status = Rec.Status::Submitted) then begin
            corec := true;
        end;
        corec1 := false;
        if (Rec.Status = Rec.Status::Assigned) then begin
            corec1 := true;
        end;
        CorecOpen := false;
        if (Rec.Status = Rec.Status::Open) then begin
            CorecOpen := true;
        end;
        corec2 := false;
        if (Rec.Status <> Rec.Status::Open) then begin
            corec2 := true;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Created By" := UserId;
        Rec."Creation date" := Today;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Open;
    end;

    trigger OnOpenPage()
    begin
        corec := false;
        if (Rec.Status = Rec.Status::Submitted) then begin
            corec := true;
        end;
        corec1 := false;
        if (Rec.Status = Rec.Status::Assigned) then begin
            corec1 := true;
        end;
        CorecOpen := false;
        if (Rec.Status = Rec.Status::Open) then begin
            CorecOpen := true;
        end;
        corec2 := false;
        if (Rec.Status <> Rec.Status::Open) then begin
            corec2 := true;
        end;
    end;

    var
        DMSManagement: Codeunit "DMS Management";
        corec: Boolean;
        RegistryFileEntry: Record "Registry File  Entry";
        corec1: Boolean;
        corec2: Boolean;
        CorecOpen: Boolean;
}
