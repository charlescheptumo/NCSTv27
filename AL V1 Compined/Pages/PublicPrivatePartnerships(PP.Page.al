#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75209 "Public Private Partnerships(PP"
{
    ApplicationArea = Basic;
    Caption = 'Public Private Partnerships(PPP)';
    CardPageID = "Request For Quotation (RFQ)";
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = where("Procurement Method" = const("Public Private Partnership"));
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
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category ID"; Rec."Procurement Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Procurement Officer"; Rec."Assigned Procurement Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Notes)
            {
            }
            systempart(Control9; MyNotes)
            {
            }
            systempart(Control10; Links)
            {
            }
        }
    }

    actions
    {
    }
}
