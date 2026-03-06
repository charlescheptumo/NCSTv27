#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65020 "Grants Setup Card"
{
    ApplicationArea = Basic;
    Caption = 'Grants Management Setup';
    PageType = Card;
    SourceTable = "Grants Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Role"; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Email Notification Path"; Rec."Email Notification Path")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                field("Research Iinfrastructure Nos"; Rec."Research Iinfrastructure Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output Nos"; Rec."Research Output Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher Nos"; Rec."Researcher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Nos"; Rec."Grantor Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Opportunity Nos"; Rec."Funding Opportunity Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Proposal Nos"; Rec."Grant Proposal Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Nos"; Rec."Grant Admin Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Admin Nos"; Rec."Project Admin Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Research Project Nos"; Rec."Research Project Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Contract Nos"; Rec."Project Contract Nos")
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
