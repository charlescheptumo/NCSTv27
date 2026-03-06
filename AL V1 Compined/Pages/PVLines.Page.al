#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 57004 "PV Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Applies to Doc. No"; Rec."Applies to Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = OpenEntries;
                    Enabled = true;

                    trigger OnValidate()
                    begin
                        //CurrPageIsEditable := CurrPage.EDITABLE;
                    end;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                        CurrPage.Update;
                    end;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Six % Rate"; Rec."VAT Six % Rate")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("VAT Withheld Amount"; Rec."VAT Withheld Amount")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Amount"; Rec."Vote Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Actual to Date"; Rec."Actual to Date")
                {
                    ApplicationArea = Basic;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Commitments';
                }
                field("Available Funds"; Rec."Available Funds")
                {
                    ApplicationArea = Basic;
                    Caption = 'Available Budget';
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("Budgetary Control A/C"; Rec."Budgetary Control A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Claim Doc No."; Rec."Claim Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Code"; Rec."W/Tax Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("W/T VAT Code"; Rec."W/T VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Amount"; Rec."W/Tax Amount")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                    end;
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
    }

    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::"Pending Approval" then
            OpenEntries := false
        else
            OpenEntries := true;
    end;

    trigger OnInit()
    begin
        if Rec.Status = Rec.Status::"Pending Approval" then
            OpenEntries := false
        else
            OpenEntries := true;
    end;

    var
        IsFoundation: Boolean;
        IsBlankNumber: Boolean;
        [InDataSet]
        CurrPageIsEditable: Boolean;
        OpenEntries: Boolean;
}
