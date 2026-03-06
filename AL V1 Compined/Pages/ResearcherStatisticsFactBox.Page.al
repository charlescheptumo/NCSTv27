#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65075 "Researcher Statistics FactBox"
{
    Caption = 'Resource Statistics';
    PageType = CardPart;
    SourceTable = Resource;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = Jobs;
                Caption = 'Resource No.';
                ToolTip = 'Specifies a number for the resource.';

                trigger OnDrillDown()
                begin
                    ShowDetails;
                end;
            }
            field("No. of Awarded GFO"; Rec."No. of Awarded GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Awarded Grants';
            }
            field("No. of Lost Grant GFO"; Rec."No. of Lost Grant GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Lost Grant Grants';
            }
            field("No. of Ongoing RProjects"; Rec."No. of Ongoing RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Ongoing Projects';
            }
            field("No. of Completed RProjects"; Rec."No. of Completed RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Completed Projects';
            }
            field("No. of Research Outputs"; Rec."No. of Research Outputs")
            {
                ApplicationArea = Basic;
            }
            field("Total Amount Awarded(LCY)"; Rec."Total Amount Awarded(LCY)")
            {
                ApplicationArea = Basic;
            }
            field(UnitPrice; UnitPrice)
            {
                ApplicationArea = Jobs;
                AutoFormatType = 1;
                Caption = 'Invoiced';
                ToolTip = 'Specifies the unit prices of postings of the type sale. Sales can be posted in the resource group journal and the sales lines.';
            }
            field(InvoicedPct; InvoicedPct)
            {
                ApplicationArea = Jobs;
                Caption = 'Invoiced %';
                DecimalPlaces = 1 : 1;
                ToolTip = 'Specifies the percentage of invoiced amounts in unit prices. It is calculated as follows: Invoiced % = (Invoiced (LCY) / Usage(Unit Price)) x 100.';
            }
            field(ResUsageCost; ResUsageCost)
            {
                ApplicationArea = Jobs;
                AutoFormatType = 1;
                Caption = 'Usage (Cost)';
                ToolTip = 'Specifies values for job usage based on cost. Specifies, based on cost, how much the resources has been used.';
            }
            field(Profit; Profit)
            {
                ApplicationArea = Jobs;
                AutoFormatType = 1;
                Caption = 'Profit';
                ToolTip = 'Specifies the profit amounts.';
            }
            field(ResProfitPct; ResProfitPct)
            {
                ApplicationArea = Jobs;
                Caption = 'Profit %';
                DecimalPlaces = 1 : 1;
                ToolTip = 'Specifies the profit percentages.';
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if CurrentDate <> WorkDate then begin
            CurrentDate := WorkDate;
            DateFilterCalc.CreateFiscalYearFilter(ResDateFilter, ResDateName, CurrentDate, 0);
        end;

        Clear(TotalUsageUnits);

        Rec.SetFilter(Rec."Date Filter", ResDateFilter);
        Rec.SetRange(Rec."Chargeable Filter");
        Rec.CalcFields(Rec.Capacity, Rec."Usage (Cost)", Rec."Sales (Price)");

        ResCapacity := Rec.Capacity;
        ResUsageCost := Rec."Usage (Cost)";
        UnitPrice := Rec."Sales (Price)";

        for j := 1 to 2 do begin
            if j = 1 then
                Chargeable := false
            else
                Chargeable := true;
            Rec.SetRange(Rec."Chargeable Filter", Chargeable);
            Rec.CalcFields(Rec."Usage (Qty.)", Rec."Usage (Price)");
            ResUsagePrice := Rec."Usage (Price)";
            TotalUsageUnits := TotalUsageUnits + Rec."Usage (Qty.)";
        end;

        UnusedCapacity := ResCapacity - TotalUsageUnits;
        InvoicedPct := CalcPercentage(UnitPrice, ResUsagePrice);
        Profit := UnitPrice - ResUsageCost;
        ResProfitPct := CalcPercentage(Profit, UnitPrice);

        Rec.SetRange(Rec."Date Filter");
        Rec.SetRange(Rec."Chargeable Filter");
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        ResCapacity := 0;
        UnusedCapacity := 0;
        UnitPrice := 0;
        InvoicedPct := 0;
        ResUsageCost := 0;
        Profit := 0;
        ResProfitPct := 0;

        exit(Rec.Find(Which));
    end;

    var
        DateFilterCalc: Codeunit "DateFilter-Calc";
        CurrentDate: Date;
        ResCapacity: Decimal;
        UnusedCapacity: Decimal;
        UnitPrice: Decimal;
        InvoicedPct: Decimal;
        ResUsageCost: Decimal;
        Profit: Decimal;
        ResProfitPct: Decimal;
        ResDateFilter: Text[30];
        ResDateName: Text[30];
        Chargeable: Boolean;
        TotalUsageUnits: Decimal;
        ResUsagePrice: Decimal;
        j: Integer;

    local procedure ShowDetails()
    begin
        Page.Run(Page::"Resource Card", Rec);
    end;

    local procedure CalcPercentage(PartAmount: Decimal; Base: Decimal): Decimal
    begin
        if Base <> 0 then
            exit(100 * PartAmount / Base);

        exit(0);
    end;
}
