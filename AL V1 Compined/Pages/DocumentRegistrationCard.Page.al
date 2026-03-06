#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56048 "Document Registration Card"
{
    PageType = Card;
    SourceTable = "Document registration";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if DocType.Get(Rec."Document Type") then begin
                            if DocType."Require Court Date?" = true then
                                Court := true
                            else
                                Court := false
                        end;
                    end;
                }
                group(".")
                {
                    Caption = '.';
                    Visible = Court;
                    field("Court Date"; Rec."Court Date")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field("Document Sub Type"; Rec."Document Sub Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Description"; Rec."Document Description")
                {
                    ApplicationArea = Basic;
                }
                field("Document Origin"; Rec."Document Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Accused Name"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Assigned Investigator"; Rec."Assigned Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Court Rank"; Rec."Court Rank")
                {
                    ApplicationArea = Basic;
                }
                field("Court Station"; Rec."Court Station")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
            }
            systempart(Control20; Notes)
            {
            }
            systempart(Control21; MyNotes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        Court := false;
    end;

    trigger OnInit()
    begin
        Court := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.RegistrationType := Rec.Registrationtype::Document;
    end;

    trigger OnOpenPage()
    begin
        Court := false;
    end;

    var
        Court: Boolean;
        DocType: Record "Case Document Types";
}
