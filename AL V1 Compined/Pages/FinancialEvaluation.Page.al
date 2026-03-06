#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70067 "Financial Evaluation"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Quotations Evaluation";
    SourceTableView = where("Passes Technical?" = const(true),
                            "Item Description" = filter(<> ''),
                            created = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Amount"; Rec."Financial Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Proceed to Award?")
            {
                ApplicationArea = Basic;
                Image = WorkCenterLoad;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    rec5: Record "Procurement Request";
                begin
                    rec5.Reset;
                    rec5.Get(Rec."Ref No.");
                    if rec5."In Award?" = true then begin
                        Error('The Quotation is already in award stage!');
                    end;

                    Rec.SetFilter("Financial Amount", '<>%1', 0);
                    if Rec.FindSet then begin
                        rec5.Reset;
                        rec5.Get(Rec."Ref No.");
                        rec5."In Award?" := true;
                        rec5.Modify;
                        Message('Please Proceed in a separate Window');
                        CurrPage.Close;
                    end;
                    if not Rec.FindSet then begin
                        Error('Please Fill in the Financial Amount(s).!!!');
                    end;
                end;
            }
        }
    }
}
