#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69265 "HR Medical Scheme Members Card"
{
    PageType = Card;
    SourceTable = "HR Insurance Scheme Members";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Scheme Join Date"; Rec."Scheme Join Date")
                {
                    ApplicationArea = Basic;
                }
                field("Scheme Anniversary"; Rec."Scheme Anniversary")
                {
                    ApplicationArea = Basic;
                }
                field("Out-Patient Limit"; Rec."Out-Patient Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Cumm.Amount Spent Out"; Rec."Cumm.Amount Spent Out")
                {
                    ApplicationArea = Basic;
                }
                field("Balance Out- Patient"; Rec."Balance Out- Patient")
                {
                    ApplicationArea = Basic;
                }
                field("In-patient Limit"; Rec."In-patient Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Cumm.Amount Spent"; Rec."Cumm.Amount Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Balance In- Patient"; Rec."Balance In- Patient")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Cover"; Rec."Maximum Cover")
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
            group("&Functions")
            {
                Caption = '&Functions';
                action("Medical Claims")
                {
                    ApplicationArea = Basic;
                    Caption = 'Medical Claims';
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Category4;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Medscheme.Reset;
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    trigger OnInit()
    begin

        Medscheme.Reset;
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    trigger OnOpenPage()
    begin
        Medscheme.Reset;
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    var
        objSchMembers: Record "HR Insurance Scheme Members";
        objScmDetails: Record "HR Medical Schemes";
        decInPatientBal: Decimal;
        Medscheme: Record "HR Medical Schemes";
}
