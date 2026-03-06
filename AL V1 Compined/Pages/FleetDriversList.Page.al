#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59010 "Fleet Drivers List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Driver Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Vehicle Drivers";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Driver License Number"; Rec."Driver License Number")
                {
                    ApplicationArea = Basic;
                }
                field("Last License Renewal"; Rec."Last License Renewal")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Interval"; Rec."Renewal Interval")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Interval Value"; Rec."Renewal Interval Value")
                {
                    ApplicationArea = Basic;
                }
                field("Next License Renewal"; Rec."Next License Renewal")
                {
                    ApplicationArea = Basic;
                }
                field("Year Of Experience"; Rec."Year Of Experience")
                {
                    ApplicationArea = Basic;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                }
                field(Active; Rec.Active)
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
