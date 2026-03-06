#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75124 "IFS Tender Committee Member"
{
    PageType = ListPart;
    SourceTable = "IFS Tender Committee Member";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                }
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("ID/Passport No"; Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Tax Registration (PIN) No."; Rec."Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Member Email"; Rec."Member Email")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Staff  No."; Rec."Staff  No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Previous Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Previous Appointments line";
                    RunPageLink = "Member No." = field("Member No.");

                    trigger OnAction()
                    var
                        CommitteMember: Record "IFS Tender Committee Member";
                        CommitteMembers: Page "Previous Appointments line";
                    begin
                        Rec.TestField(Rec."Member No.");

                        CommitteMember.FilterGroup(2);
                        CommitteMember.SetRange("Member No.", Rec."Member No.");
                        CommitteMember.SetFilter("Document No.", '%1<>', Rec."Document No.");
                        CommitteMember.FilterGroup(0);
                        CommitteMembers.SetTableview(CommitteMember);
                        CommitteMembers.Editable := false;
                        CommitteMembers.Run;
                    end;
                }
            }
        }
    }
}
