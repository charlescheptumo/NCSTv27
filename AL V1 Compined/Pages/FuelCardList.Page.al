#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59027 "Fuel Card List"
{
    ApplicationArea = Basic;
    CardPageID = "Fuel Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Fuel Card";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Receipt No"; Rec."Receipt No")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Card Pin"; Rec."Fuel Card Pin")
                {
                    ApplicationArea = Basic;
                }
                field("vehicle Limit"; Rec."vehicle Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allocated Limit"; Rec."Total Allocated Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Total Balance"; Rec."Total Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Allocated vehicle Limit"; Rec."Allocated vehicle Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Balance"; Rec."Vehicle Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Spend"; Rec."Total Amount Spend")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amt Spend per Vehicle"; Rec."Total Amt Spend per Vehicle")
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
