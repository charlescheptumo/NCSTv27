#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80034 "Annual Strategy Workplan Card"
{
    PageType = Card;
    SourceTable = "Annual Strategy Workplan";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
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
            }
            part(Control9; "Strategy Workplan Lines")
            {
                SubPageLink = No = field(No);
                ToolTip = '<>';
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Activity Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    StrategicAct.Reset;
                    StrategicAct.SetRange("Strategic Plan ID", Rec."Strategy Plan ID");
                    if StrategicAct.Find('-') then begin
                        repeat
                            WPLines.Init;
                            WPLines.No := Rec.No;
                            WPLines."Strategy Plan ID" := StrategicAct."Strategic Plan ID";
                            WPLines."Activity ID" := StrategicAct.Code;
                            WPLines."Year Reporting Code" := Rec."Year Reporting Code";
                            WPLines.Description := StrategicAct.Description;
                            // WPLines."Imported Annual Target Qty":=StrategicAct."Strategy Planned Target";
                            // WPLines.VALIDATE( WPLines."Imported Annual Target Qty");
                            //WPLines."Imported Annual Budget Est.":=StrategicAct."Planned Budget";
                            // WPLines.VALIDATE( WPLines."Imported Annual Budget Est.");
                            WPLines.Insert(true);
                        until StrategicAct.Next = 0;
                    end;
                    Message('Work Plan Lines Populated Successfully');
                end;
            }
            separator(Action15)
            {
            }
            action("Export To Excel")
            {
                ApplicationArea = Basic;
                Image = ExportToExcel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    AnnualWorkPlan.Reset;
                    AnnualWorkPlan.SetRange(No, Rec.No);
                    if AnnualWorkPlan.Find('-') then begin
                        Xmlport.Run(80000, true, false, AnnualWorkPlan);
                    end;
                end;
            }
            separator(Action16)
            {
            }
            action("Import To Excel")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    Xmlport.Run(80001);
                end;
            }
            action("Import From Excel_TobeUsed")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Import Workplan Lines";
                Visible = false;
            }
            separator(Action17)
            {
            }
            action("Post Targets")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    WPlanLines.Reset;
                    WPlanLines.SetRange(No, Rec.No);
                    if WPlanLines.Find('-') then begin
                        repeat
                            fnPostPlanEntry(WPlanLines);
                        until WPlanLines.Next = 0;
                    end;
                    Message('Targets Posted Successfully');
                end;
            }
            separator(Action19)
            {
            }
            action("Print Annual Plan")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec.No, Rec.No);
                    Report.Run(80002, true, true, Rec)
                end;
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: action): Boolean
    var
        ExcelBuffer: Record "Excel Buffer";
    begin
    end;

    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        SheetName: Text;
        FIleManagement: Codeunit "File Management";
        Text0001: label 'testing';
        ExcelExt: Text;
        AnnualWorkPlan: Record "Strategy Workplan Lines";
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        WPlanLines: Record "Strategy Workplan Lines";
        I: Integer;
        ThemeID: Code[50];
        ObjectiveID: Code[50];
        StrategicInt: Record "Strategic Initiative";
        SourceType: Option "Strategic Plan","Perfomance Contract";
        YearCode: Record "Annual Reporting Codes";
        QYearCode: Record "Quarterly Reporting Periods";
        QCount: Integer;
        Q1: Code[20];
        Q1date: Date;
        Q2: Code[20];
        Q2date: Date;
        Q3: Code[20];
        Q3date: Date;
        Q4: Code[20];
        Q4date: Date;


    procedure fnPostPlanEntry(WPlanLines: Record "Strategy Workplan Lines")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, WPlanLines."Activity ID");
        if StrategicInt.Find('-') then begin
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        QYearCode.Reset;
        QYearCode.SetRange("Year Code", WPlanLines."Year Reporting Code");
        if QYearCode.Find('-') then begin
            repeat
                QCount := QCount + 1;
                if (QCount = 1) then begin
                    Q1 := QYearCode.Code;
                    Q1date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 2) then begin
                    Q2 := QYearCode.Code;
                    Q2date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 3) then begin
                    Q3 := QYearCode.Code;
                    Q3date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 4) then begin
                    Q4 := QYearCode.Code;
                    Q4date := QYearCode."Reporting Start Date";
                end;
            until QYearCode.Next = 0;
        end;


        // I:=0;
        for I := 1 to 4 do begin

            if (I = 1) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                Rec."Year Reporting Code", Q1, Q1date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q1 Target", WPlanLines."Q1 Budget",
                Rec.No, Sourcetype::"Strategic Plan");
            end;
            if (I = 2) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                Rec."Year Reporting Code", Q2, Q2date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q2 Target", WPlanLines."Q2 Budget",
                Rec.No, Sourcetype::"Strategic Plan");
            end;

            if (I = 3) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                Rec."Year Reporting Code", Q3, Q3date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q3 Target", WPlanLines."Q3 Budget",
                Rec.No, Sourcetype::"Strategic Plan");

            end;
            if (I = 4) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                Rec."Year Reporting Code", Q4, Q4date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q4 Target", WPlanLines."Q4 Budget",
                Rec.No, Sourcetype::"Strategic Plan");
            end;
        end;
    end;


    procedure FnInsertEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry.Insert(true);
    end;
}
