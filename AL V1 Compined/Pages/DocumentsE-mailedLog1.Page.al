#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69080 "Documents E-mailed Log1"
{
    Editable = false;
    PageType = List;
    SourceTable = "Document E-mail Log";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("S/no"; Rec."S/no")
                {
                    ApplicationArea = Basic;
                }
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("E-mailed To"; Rec."E-mailed To")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = Basic;
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                }
                field("Profit Centre"; Rec."Profit Centre")
                {
                    ApplicationArea = Basic;
                }
                field("Branch code"; Rec."Branch code")
                {
                    ApplicationArea = Basic;
                }
                field("Sender ID"; Rec."Sender ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        //
    end;
}
