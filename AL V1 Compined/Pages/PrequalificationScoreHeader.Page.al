#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75186 "Prequalification Score Header"
{
    ApplicationArea = Basic;
    CardPageID = "Prequalification Score Card";
    Editable = false;
    PageType = List;
    SourceTable = "Prequalification Score Header";
    UsageCategory = Documents;

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Evaluation Te"; Rec."Prequalification Evaluation Te")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead"; Rec."Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name"; Rec."Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Response No."; Rec."Prequalification Response No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("IFP No."; Rec."IFP No.")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("System Evaluation Score %"; Rec."System Evaluation Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Score %"; Rec."Final Evaluation Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Final Evaluation Decision"; Rec."Final Evaluation Decision")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Committee Remarks"; Rec."Evaluation Committee Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
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
