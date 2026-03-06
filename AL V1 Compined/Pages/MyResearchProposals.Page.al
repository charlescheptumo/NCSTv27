#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65089 "My Research Proposals"
{
    ApplicationArea = Basic;
    CardPageID = "Grant Funding Application Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Grant Funding Application";
    SourceTableView = where("Application Status" = const("Not Started"),
                            "Approval Status" = filter(Open | "Pending Approval"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("FOA ID"; Rec."FOA ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Opportunity  Title"; Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field("Justification for Application"; Rec."Justification for Application")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Program ID"; Rec."Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Area"; Rec."Primary Research Area")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Grant Amount(LCY)"; Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Grant Amount (LCY)"; Rec."Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Team Code"; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange(Rec."Created By", UserId);
    end;
}
