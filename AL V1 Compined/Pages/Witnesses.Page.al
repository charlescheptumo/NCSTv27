#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56054 Witnesses
{
    PageType = List;
    SourceTable = Witnesses;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case No"; Rec."Case No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Witnessness Name"; Rec."Witnessness Name")
                {
                    ApplicationArea = Basic;
                }
                field("Witnessness Address"; Rec."Witnessness Address")
                {
                    ApplicationArea = Basic;
                }
                field("Witnessness Phone"; Rec."Witnessness Phone")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
