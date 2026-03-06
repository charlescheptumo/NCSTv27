#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70158 "RFP Finance Opening"
{
    ApplicationArea = Basic;
    CardPageID = "RFP Card";
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(RFP),
                            Status = filter(Released),
                            "Quotation Pending Opening" = const(true),
                            "In Technical?" = const(true),
                            "In Financial?" = const(true));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan No"; Rec."Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
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
