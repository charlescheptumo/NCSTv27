#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69014 "Loan Products Setup"
{
    Editable = true;
    RefreshOnActivate = true;
    SourceTable = 69010;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("Code"; Rec.Code)
            {
                ApplicationArea = Basic;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = Basic;
            }
            field("Interest Rate"; Rec."Interest Rate")
            {
                ApplicationArea = Basic;
            }
            field("Interest Calculation Method"; Rec."Interest Calculation Method")
            {
                ApplicationArea = Basic;
            }
            field("No Series"; Rec."No Series")
            {
                ApplicationArea = Basic;
            }
            field("No of Instalment"; Rec."No of Instalment")
            {
                ApplicationArea = Basic;
            }
            field("Loan No Series"; Rec."Loan No Series")
            {
                ApplicationArea = Basic;
            }
            field(Rounding; Rec.Rounding)
            {
                ApplicationArea = Basic;
            }
            field("Rounding Precision"; Rec."Rounding Precision")
            {
                ApplicationArea = Basic;
            }
            field("Loan Category"; Rec."Loan Category")
            {
                ApplicationArea = Basic;
            }
            field("Calculate Interest"; Rec."Calculate Interest")
            {
                ApplicationArea = Basic;
            }
            field("Interest Deduction Code"; Rec."Interest Deduction Code")
            {
                ApplicationArea = Basic;
            }
            field("Deduction Code"; Rec."Deduction Code")
            {
                ApplicationArea = Basic;
            }
            field(Internal; Rec.Internal)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    var
    //WshShell: Automation WshShell;
}

