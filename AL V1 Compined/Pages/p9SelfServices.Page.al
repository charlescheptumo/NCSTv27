#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69047 "p9 Self Services"
{
    ApplicationArea = Basic;
    CardPageID = "P9 Self Service";
    Editable = false;
    PageType = List;
    SourceTable = "Payroll PeriodX";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("P9 Start Date"; Rec."P9 Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("P9 End Date"; Rec."P9 End Date")
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
