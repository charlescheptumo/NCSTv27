#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65100 "Project Research Objectives"
{
    PageType = List;
    SourceTable = "Project Research Objectives";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Research Objective"; Rec."Research Objective")
                {
                    ApplicationArea = Basic;
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                }
                field("Project Area"; Rec."Project Area")
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
                var
                    Text0001: Integer;
                begin
                    ContractLines.Reset;
                    ContractLines.SetRange("Project Contract No.", Rec."Project No");
                    if ContractLines.Find('-') then begin
                        repeat
                            GrantResearchObjct.Reset;
                            GrantResearchObjct.SetRange("Grant Application ID", ContractLines."Grant ID");
                            if GrantResearchObjct.Find('-') then begin
                                repeat
                                    Rec.Init;
                                    Rec."Project No" := ContractLines."Job No";
                                    Rec."Research Objective" := GrantResearchObjct."Research Objective";
                                    Rec."Research Program" := GrantResearchObjct."Research Program";
                                    Rec."Project Area" := GrantResearchObjct."Project Area";
                                    Rec.Insert;
                                until GrantResearchObjct.Next = 0;
                            end;
                        until ContractLines.Next = 0;
                    end;
                    Message('Project Objective Updated Successfully');
                end;
            }
        }
    }

    var
        ContractLines: Record "Contract Funding Lines";
        GrantResearchObjct: Record "Grant Research Objectives";
}
