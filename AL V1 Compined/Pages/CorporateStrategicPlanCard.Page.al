#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80012 "Corporate Strategic Plan Card"
{
    PageType = Card;
    SourceTable = "Corporate Strategic Plans";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Theme"; Rec."Primary Theme")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Framework"; Rec."Strategy Framework")
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
                field("Duration (Years)"; Rec."Duration (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Implementation Status"; Rec."Implementation Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Vision & Mission")
            {
                field("Vision Statement"; Rec."Vision Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Mission Statement"; Rec."Mission Statement")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Activities)
            {
            }
            part(Control14; "Strategic Initiatives")
            {
                SubPageLink = "Strategic Plan ID" = field(Code);
            }
        }
    }

    actions
    {
        area(creation)
        {
            group("Strategy Formulation")
            {
                Caption = 'Strategy Formulation';
                action("SWOT Matrix")
                {
                    ApplicationArea = Basic;
                }
                action("Risk Matrix")
                {
                    ApplicationArea = Basic;
                }
                action("Stakeholder Matrix")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Strategy Elements")
            {
                action("Core Values")
                {
                    ApplicationArea = Basic;
                    Image = ValueLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Strategy Core Value";
                    RunPageLink = "Strategic Plan ID" = field(Code);
                }
                action("Strategic Theme")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Strategic Theme";
                    RunPageLink = "Strategic Plan ID" = field(Code);
                }
                action("Strategic Objectives")
                {
                    ApplicationArea = Basic;
                    Image = Route;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Strategic Objectives";
                    RunPageLink = "Strategic Plan ID" = field(Code);
                }
                action(Strategies)
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page Strategies;
                    RunPageLink = "Strategic Plan ID" = field(Code);
                }
                action("Annual Implementation Plans")
                {
                    ApplicationArea = Basic;
                    Image = CalculatePlan;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Annual Strategy Workplans";
                    RunPageLink = "Strategy Plan ID" = field(Code);
                }
            }
            group("Performance Contracts")
            {
                Caption = 'Performance Contracts';
                action("Directorate Per. Contracts")
                {
                    ApplicationArea = Basic;
                }
                action("Department Per. Contracts")
                {
                    ApplicationArea = Basic;
                }
                action("Individual Per. Contracts")
                {
                    ApplicationArea = Basic;
                }
                action("Print Strategic Plan")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    begin
                        Rec.SetRange(Rec.Code, Rec.Code);
                        Report.Run(80001, true, true, Rec)
                    end;
                }
            }
        }
    }
}
