#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 56202 "Quarterly Appraisal List"
{
    CardPageID = "Quartlerly Appraisal";
    Editable = false;
    PageType = List;
    SourceTable = "Quarterly Appraisal";

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
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Quartely score"; Rec."Overall Quartely score")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Designation"; Rec."Supervisor Designation")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Notes)
            {
            }
        }
    }

    actions
    {
    }
}
