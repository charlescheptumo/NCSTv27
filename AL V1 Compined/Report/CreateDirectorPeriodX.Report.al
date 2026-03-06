#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69008 "Create Director PeriodX"
{
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(FiscalYearStartDate; FiscalYearStartDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Starting Date';
                }
                field(NoOfPeriods; NoOfPeriods)
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Periods';
                }
                field(PeriodLength; PeriodLength)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period Length';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        AccountingPeriod."Starting Date" := FiscalYearStartDate;
        AccountingPeriod.TestField("Starting Date");

        if AccountingPeriod.Find('-') then begin
            FirstPeriodStartDate := AccountingPeriod."Starting Date";
            FirstPeriodLocked := AccountingPeriod."Date Locked";
            if (FiscalYearStartDate < FirstPeriodStartDate) and FirstPeriodLocked then
                if not
                   Confirm(
                     Text000 +
                     Text001)
                then
                    exit;
            if AccountingPeriod.Find('+') then
                LastPeriodStartDate := AccountingPeriod."Starting Date";
        end else
            if not
               Confirm(
                 Text002 +
                 Text003)
            then
                exit;

        for i := 1 to NoOfPeriods + 1 do begin
            if (FiscalYearStartDate <= FirstPeriodStartDate) and (i = NoOfPeriods + 1) then
                exit;

            if (FirstPeriodStartDate <> 0D) then
                if (FiscalYearStartDate >= FirstPeriodStartDate) and (FiscalYearStartDate < LastPeriodStartDate) then
                    Error(Text004);
            AccountingPeriod.Init;
            AccountingPeriod."Starting Date" := FiscalYearStartDate;
            AccountingPeriod.Validate("Starting Date");
            if (i = 1) or (i = NoOfPeriods + 1) then
                AccountingPeriod."New Fiscal Year" := true;
            if (FirstPeriodStartDate = 0D) and (i = 1) then
                AccountingPeriod."Date Locked" := true;
            if (AccountingPeriod."Starting Date" < FirstPeriodStartDate) and FirstPeriodLocked then begin
                AccountingPeriod.Closed := true;
                AccountingPeriod."Date Locked" := true;
            end;
            if not AccountingPeriod.Find('=') then
                AccountingPeriod.Insert;
            FiscalYearStartDate := CalcDate(PeriodLength, FiscalYearStartDate);
        end;
    end;

    var
        AccountingPeriod: Record "Directorsl PeriodX";
        NoOfPeriods: Integer;
        PeriodLength: DateFormula;
        FiscalYearStartDate: Date;
        FirstPeriodStartDate: Date;
        LastPeriodStartDate: Date;
        FirstPeriodLocked: Boolean;
        i: Integer;
        Text000: label 'The new fiscal year begins before an existing fiscal year, so the new year will be closed automatically.\\';
        Text001: label 'Do you want to create and close the fiscal year?';
        Text002: label 'Once you create the new fiscal year you cannot change its starting date.\\';
        Text003: label 'Do you want to create the fiscal year?';
        Text004: label 'It is only possible to create new fiscal years before or after the existing ones.';
}
