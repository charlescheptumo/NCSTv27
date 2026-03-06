#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56047 "Document Registration List"
{
    ApplicationArea = Basic;
    CardPageID = "Document Registration Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Document registration";
    SourceTableView = where(RegistrationType = const(Document));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Sub Type"; Rec."Document Sub Type")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Name"; Rec."Accused Name")
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
                field("Court Date"; Rec."Court Date")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Investigator"; Rec."Assigned Investigator")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
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
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.RegistrationType := Rec.Registrationtype::Document;
    end;
}
