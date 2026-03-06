#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69124 "Training Planner"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Training Planner.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Training Needs"; "Training Needs")
        {
            DataItemTableView = where(Status = const(Approved));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Name; "HR Training Needs"."No.")
            {
            }
            column(TrainingCourse; "HR Training Needs".Description)
            {
            }
            column(Participants; "HR Training Needs"."Training Applicants")
            {
            }
            column(Duration; "HR Training Needs".Duration)
            {
            }
            column(January; Jan)
            {
            }
            column(February; Feb)
            {
            }
            column(March; March)
            {
            }
            column(April; Apr)
            {
            }
            column(May; May)
            {
            }
            column(June; June)
            {
            }
            column(July; July)
            {
            }
            column(August; Aug)
            {
            }
            column(September; Sept)
            {
            }
            column(October; Oct)
            {
            }
            column(November; Nov)
            {
            }
            column(December; Dec)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Jan := 0;
                Feb := 0;
                March := 0;
                Apr := 0;
                May := 0;
                June := 0;
                July := 0;
                Aug := 0;
                Sept := 0;
                Oct := 0;
                Nov := 0;
                Dec := 0;

                Needs.Reset;
                Needs.SetRange(Needs."No.", "HR Training Needs"."No.");
                if Needs.Find('-') then begin
                    if Needs."Start Date" <> 0D then begin
                        Month := Date2dmy(Needs."Start Date", 2);
                        if Month = 1 then Jan := 1;
                        if Month = 2 then Feb := 1;
                        if Month = 3 then March := 1;
                        if Month = 4 then Apr := 1;
                        if Month = 5 then May := 1;
                        if Month = 6 then June := 1;
                        if Month = 7 then July := 1;
                        if Month = 8 then Aug := 1;
                        if Month = 9 then Sept := 1;
                        if Month = 10 then Oct := 1;
                        if Month = 11 then Nov := 1;
                        if Month = 12 then Dec := 1;
                        //END;

                        if Needs."End Date" - Needs."Start Date" > 30 then
                            MOnths := (Needs."End Date" - Needs."Start Date") / 29;
                        MOnths := MOnths - 1;
                        while MOnths > 0 do begin
                            //MESSAGE('%1,%2',MOnths,Needs."Start Date");
                            //Needs.RESET;
                            //Needs.SETRANGE(Needs.Code,"HR Training Needs".Code);
                            //IF Needs.FIND('-') THEN BEGIN
                            //IF Needs."Start Date"<>0D THEN BEGIN
                            Month := Date2dmy(Needs."Start Date", 2);
                            if Month = 1 then Jan := 1;
                            if Month = 2 then Feb := 1;
                            if Month = 3 then March := 1;
                            if Month = 4 then Apr := 1;
                            if Month = 5 then May := 1;
                            if Month = 6 then June := 1;
                            if Month = 7 then July := 1;
                            if Month = 8 then Aug := 1;
                            if Month = 9 then Sept := 1;
                            if Month = 10 then Oct := 1;
                            if Month = 11 then Nov := 1;
                            if Month = 12 then Dec := 1;
                            Needs."Start Date" := CalcDate('1M', Needs."Start Date");
                            MOnths := MOnths - 1;
                        end
                    end;
                end
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Jan: Integer;
        Feb: Integer;
        March: Integer;
        Apr: Integer;
        May: Integer;
        June: Integer;
        July: Integer;
        Aug: Integer;
        Sept: Integer;
        Oct: Integer;
        Nov: Integer;
        Dec: Integer;
        Needs: Record "Training Needs";
        Month: Integer;
        MOnths: Decimal;


    procedure Calc()
    begin
    end;


    procedure Test()
    begin
    end;
}
