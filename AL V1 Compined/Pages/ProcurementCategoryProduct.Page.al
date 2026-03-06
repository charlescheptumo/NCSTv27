#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75029 "Procurement Category Product"
{
    PageType = List;
    SourceTable = "Procurement Category Product";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
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
