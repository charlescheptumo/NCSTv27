#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70112 "Disposal Bidders"
{
    PageType = List;
    SourceTable = "Disposal Bidders";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = Editable;
                field("Disposal No."; Rec."Disposal No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Physical Addess"; Rec."Physical Addess")
                {
                    ApplicationArea = Basic;
                }
                field(Award; Rec.Award)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        DisposalBidders.Reset;
                        DisposalBidders.SetRange("Disposal No.", Rec."Disposal No.");
                        DisposalBidders.SetRange(Award, true);
                        if DisposalBidders.FindFirst then
                            if DisposalBidders.Count = 1 then
                                AwardEditable := false;
                    end;
                }
            }
        }
    }


    var
        DisposalBidders: record "Disposal Bidders";
        AwardEditable: boolean;
 
}