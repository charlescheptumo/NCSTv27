#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56134 "ICT Inventory List"
{
    ApplicationArea = Basic;
    CardPageID = "ICT Inventory";
    Editable = false;
    PageType = List;
    SourceTable = "ICT Inventory";
    UsageCategory = Lists;

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Sub-Type"; Rec."Sub-Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Category';
                }
                field("Current Assigned Division/Unit"; Rec."Current Assigned Division/Unit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field("ICT Asset Category"; Rec."ICT Asset Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Subcategory';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
            }
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
    }
}
