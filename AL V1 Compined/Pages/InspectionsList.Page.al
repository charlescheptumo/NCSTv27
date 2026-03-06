#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70055 "Inspections List"
{
    ApplicationArea = Basic;
    CardPageID = "Inspection Header";
    PageType = List;
    SourceTable = "Inspection Header1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Commitee Appointment No"; Rec."Commitee Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
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
}
