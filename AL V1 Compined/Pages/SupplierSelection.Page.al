#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70027 "Supplier Selection"
{
    PageType = List;
    SourceTable = "Supplier Selection1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Receiver; Rec.Receiver)
                {
                    ApplicationArea = Basic;
                }
                field(Awarded; Rec.Awarded)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
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
            group("Supplier Selection")
            {
                Caption = 'Supplier Selection';
                action("Generate Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Order';

                    trigger OnAction()
                    begin
                        Rec.CreateQuote(Rec);
                    end;
                }
            }
        }
    }
}
