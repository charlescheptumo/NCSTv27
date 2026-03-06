#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65018 "Research Output Register List"
{
    ApplicationArea = Basic;
    CardPageID = "Research Output Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Register";
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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Research Project Id"; Rec."Research Project Id")
                {
                    ApplicationArea = Basic;
                }
                field("Research Program Id"; Rec."Research Program Id")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output Category"; Rec."Research Output Category")
                {
                    ApplicationArea = Basic;
                }
                field("Principle Investigator"; Rec."Principle Investigator")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output SubCategory"; Rec."Research Output SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output Title"; Rec."Research Output Title")
                {
                    ApplicationArea = Basic;
                }
                field(Abstract; Rec.Abstract)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Publication Status"; Rec."Publication Status")
                {
                    ApplicationArea = Basic;
                }
                field("Visibilty Category"; Rec."Visibilty Category")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
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
