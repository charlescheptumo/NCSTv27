#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65077 "Projects List"
{
    ApplicationArea = Basic;
    Caption = 'Project  Funding Contracts';
    CardPageID = "Project Contract Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Contract Header";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Contract No"; Rec."Project Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Application ID"; Rec."Grant Application ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contract Customer No"; Rec."Primary Contract Customer No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Administrator"; Rec."Grant Administrator")
                {
                    ApplicationArea = Basic;
                }
                field("Award Type"; Rec."Award Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Funding Sponsor ID"; Rec."Primary Funding Sponsor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Sponsor Name"; Rec."Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; Rec."Contract Status")
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
