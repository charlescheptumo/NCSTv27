#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65051 "Funding Decision Reasons List"
{
    ApplicationArea = Basic;
    Caption = 'Funding Decision Reasons';
    CardPageID = "Funding Decision Reason Card";
    Editable = false;
    PageType = List;
    SourceTable = "Funding Decision Reasons";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Grant Applications"; Rec."No. of Grant Applications")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Funding Decision Details")
            {
                ApplicationArea = Basic;
                Image = SetPriorities;
                Promoted = true;
                RunObject = Page "Funding Decision List";
                RunPageLink = Code = field(Code);
            }
        }
    }
}
