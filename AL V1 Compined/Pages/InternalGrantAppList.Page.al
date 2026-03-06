#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59052 "Internal Grant App List"
{
    ApplicationArea = Basic;
    CardPageID = "Internal Grant App Card";
    Editable = false;
    PageType = List;
    SourceTable = "Internal Grants Application";
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
                field("Fund Opportunity"; Rec."Fund Opportunity")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Name"; Rec."Fund Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PI No"; Rec."PI No")
                {
                    ApplicationArea = Basic;
                }
                field("PI Name"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount Applied"; Rec."Amount Applied")
                {
                    ApplicationArea = Basic;
                }
                field("Application Send"; Rec."Application Send")
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
