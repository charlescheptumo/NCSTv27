#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70103 "Asset Disposal Card"
{
    PageType = Card;
    SourceTable = "Asset Disposal";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Disposal No"; Rec."Disposal No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Item/Fixed Asset"; Rec."Item/Fixed Asset")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Code"; Rec."Asset Code")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Name"; Rec."Asset Name")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Code"; Rec."Committee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Recommendations"; Rec."Committee Recommendations")
                {
                    ApplicationArea = Basic;
                }
                field("Valuation Amount"; Rec."Valuation Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("<Action1000000024>")
            {
                Caption = 'Disposal Committee Minutes';
                Visible = true;
                action("<Action1000000025>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action("<Action1000000026>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."Disposal No";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Description;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Rec.Attachement := Rec.Attachement::Yes;
                        Rec.Modify;
                    end;
                }
                action("<Action1000000027>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."Disposal No";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Description;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Rec.Attachement := Rec.Attachement::Yes;
                        Rec.Modify;
                    end;
                }
                action("<Action1000000028>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := Rec."Disposal No";
                            InteractTemplLanguage."Language Code" := Rec."Language Code (Default)";
                            InteractTemplLanguage.Description := Rec.Description;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Rec.Attachement := Rec.Attachement::Yes;
                        Rec.Modify;
                    end;
                }
                action("<Action1000000029>")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action("<Action1000000030>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get(Rec."Disposal No", Rec."Language Code (Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Rec.Attachement := Rec.Attachement::No;
                            Rec.Modify;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("<Action1000000041>")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    //IF ApprovalMgt.SendDisposalApprovalRequest(Rec) THEN;
                end;
            }
            action("<Action1000000042>")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    //IF ApprovalMgt.CancelDisposalApprovalRequest(Rec,TRUE,TRUE) THEN;
                end;
            }
        }
    }
}
