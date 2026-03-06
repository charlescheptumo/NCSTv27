#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59123 "File Disposal Card"
{
    PageType = Card;
    SourceTable = "File Disposal Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control14; "File Disposal Lines")
            {
                SubPageLink = "Document No" = field(No);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Submit Request';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Document Status", Rec."document status"::Open);
                    Rec."Document Status" := Rec."document status"::Submitted;
                    Rec.Modify(true);
                    Message('Document %1 has been submitted Successfully', Rec.No);
                end;
            }
            action("Process Disposal")
            {
                ApplicationArea = Basic;
                Caption = 'Process Disposal';
                Image = ExecuteBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = corec;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Document Status", Rec."document status"::Submitted);
                    FileDisposalLines.Reset;
                    FileDisposalLines.SetRange("Document No", Rec.No);
                    if FileDisposalLines.Find('-') then begin
                        repeat
                            RegistryFileCreation.Reset;
                            RegistryFileCreation.SetRange("File No", FileDisposalLines."File System No");
                            if RegistryFileCreation.Find('-') then begin
                                RegistryFileCreation.Disposed := true;
                                RegistryFileCreation."Disposed By" := UserId;
                                RegistryFileCreation."Disposed Date" := Today;
                                RegistryFileCreation."Disposed Time" := Time;
                                RegistryFileCreation.Modify;
                            end;
                        until FileDisposalLines.Next = 0;
                    end;

                    Rec.Posted := true;
                    Rec."Document Status" := Rec."document status"::Posted;
                    Rec.Modify(true);
                    Message('Disposal for Document No %1, Processed Successfully', Rec.No);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        corec := false;
        if Rec."Document Status" <> Rec."document status"::Open then begin
            corec := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        corec := false;
        if Rec."Document Status" <> Rec."document status"::Open then begin
            corec := true;
        end;
    end;

    var
        FileDisposalLines: Record "File Disposal Lines";
        RegistryFileCreation: Record "Record Creation";
        corec: Boolean;
}
