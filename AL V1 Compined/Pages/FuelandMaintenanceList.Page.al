#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59008 "Fuel and Maintenance List"
{
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = order(ascending)
                      where(Status = filter(Approved));

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
                field("Vehicle Reg No"; Rec."Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor(Dealer)"; Rec."Vendor(Dealer)")
                {
                    ApplicationArea = Basic;
                }
                field("Odometer Reading"; Rec."Odometer Reading")
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
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Invoice No"; Rec."Vendor Invoice No")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date Taken for Maintenance"; Rec."Date Taken for Maintenance")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Type of Maintenance"; Rec."Type of Maintenance")
                {
                    ApplicationArea = Basic;
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset No"; Rec."Fixed Asset No")
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
