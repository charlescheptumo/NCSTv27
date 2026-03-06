#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65040 "Project Research Team List"
{
    Caption = 'Project Research Team';
    CardPageID = "Project Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Research Team";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher ID"; Rec."Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Role"; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Role Description"; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Default Payment Mentod"; Rec."Default Payment Mentod")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Copy From Grant Document")
            {
                ApplicationArea = Basic;
                Image = CopyDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ContractLines.Reset;
                    ContractLines.SetRange("Project Contract No.", Rec."Job No");
                    if ContractLines.Find('-') then begin
                        repeat
                            GrantResearchTeam.Reset;
                            GrantResearchTeam.SetRange("Grant Opportunity ID", ContractLines."Grant ID");
                            if GrantResearchTeam.Find('-') then begin
                                repeat
                                    Rec.Init;
                                    Rec."Job No" := ContractLines."Job No";
                                    Rec."Researcher ID" := GrantResearchTeam."Researcher ID";
                                    Rec.Name := GrantResearchTeam.Name;
                                    Rec."Primary Role" := GrantResearchTeam."Primary Role";
                                    Rec."Role Description" := GrantResearchTeam."Role Description";
                                    Rec.Insert;
                                until GrantResearchTeam.Next = 0;
                            end;
                        until ContractLines.Next = 0;
                    end;
                    Message(Text0001);
                end;
            }
        }
    }

    var
        GrantResearchTeam: Record "Grant Research Team";
        ContractLines: Record "Contract Funding Lines";
        Text0001: label 'Project team copied successfully';
}
