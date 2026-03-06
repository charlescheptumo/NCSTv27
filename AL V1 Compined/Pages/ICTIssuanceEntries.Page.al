#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56142 "ICT Issuance Entries"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "ICT Issuance Entries";
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
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Duration of Use start date"; Rec."Duration of Use start date")
                {
                    ApplicationArea = Basic;
                }
                field("Duration of Use end date"; Rec."Duration of Use end date")
                {
                    ApplicationArea = Basic;
                }
                field("Duration of Use"; Rec."Duration of Use")
                {
                    ApplicationArea = Basic;
                }
                field("FA No"; Rec."FA No")
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Movement"; Rec."Reason For Movement")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field("Branches Code"; Rec."Branches Code")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Division/Unit"; Rec."Division/Unit")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Previously Assigned To"; Rec."Previously Assigned To")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previously Assigned Employee';
                }
                field("Previously Assigned Dpt"; Rec."Previously Assigned Dpt")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previously Assigned Department';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
            }
            systempart(Control27; Notes)
            {
            }
            systempart(Control28; MyNotes)
            {
            }
            systempart(Control29; Links)
            {
            }
        }
    }

    actions
    {
    }
}
