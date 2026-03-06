#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56055 "CMO List"
{
    ApplicationArea = Basic;
    CardPageID = "CMO Registration";
    PageType = List;
    SourceTable = "CMO Registration";
    SourceTableView = where(Type = filter(Registration));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Name of society"; Rec."Name of society")
                {
                    ApplicationArea = Basic;
                }
                field("Address of society"; Rec."Address of society")
                {
                    ApplicationArea = Basic;
                }
                field("Physical address"; Rec."Physical address")
                {
                    ApplicationArea = Basic;
                }
                field(Class; Rec.Class)
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
