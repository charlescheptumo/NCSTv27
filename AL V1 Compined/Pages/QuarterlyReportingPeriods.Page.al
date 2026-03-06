#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80005 "Quarterly Reporting Periods"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Quarterly Reporting Periods";
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
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Reporting Start Date"; Rec."Reporting Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting End Date"; Rec."Reporting End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Current Year?"; Rec."Current Year?")
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
