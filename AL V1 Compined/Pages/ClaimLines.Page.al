#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69274 "Claim Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Claim Line1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Claim No"; Rec."Claim No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    Visible = true;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                    ApplicationArea = Basic;
                }
                field("Visit Date"; Rec."Visit Date")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Policy Start Date"; Rec."Policy Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Patient Name"; Rec."Patient Name")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Dependant; Rec.Dependant)
                {
                    ApplicationArea = Basic;
                }
                field(Relationship; Rec.Relationship)
                {
                    ApplicationArea = Basic;
                }
                field("Hospital/Specialist"; Rec."Hospital/Specialist")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Claim Type"; Rec."Claim Type")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice Number"; Rec."Invoice Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Number/Receipt No';
                    NotBlank = true;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Settled; Rec.Settled)
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
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
        Rec."Claim Type" := Rec."claim type"::"Out Patient";
    end;
}
