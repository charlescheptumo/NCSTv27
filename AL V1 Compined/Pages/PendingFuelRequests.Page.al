#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59030 "Pending Fuel Requests"
{
    ApplicationArea = Basic;
    CardPageID = "Pending Fuel Requests Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = where(Status = filter("Pending Approval"),
                            Type = filter(Fuel));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity of Fuel(Litres)"; Rec."Quantity of Fuel(Litres)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Price of Fuel"; Rec."Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Taken for Fueling"; Rec."Date Taken for Fueling")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By"; Rec."Prepared By")
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
