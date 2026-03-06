#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 69004 LoansManagement
{

    trigger OnRun()
    begin
    end;

    var
        RepaymentSchedule: Record "Loan Repayment Schedule";
        NewSchedule: Record "Loan Repayment Schedule";
        RemainingPrincipal: Decimal;
        RepaymentStartDate: Date;
        i: Integer;
        PrevousRepaymentDate: Date;
        MonthlyRate: Decimal;


    procedure GenerateRepaymentSchedule(var LoanDetails: Record "Loan Application")
    begin
        begin


            //Reducing Balance Schedule

            if LoanDetails."Interest Calculation Method" = LoanDetails."interest calculation method"::"Reducing Balance" then begin
                RemainingPrincipal := LoanDetails."Approved Amount";

                PrevousRepaymentDate := LoanDetails."Issued Date";
                //RepaymentStartDate:=CALCDATE("Grace Period","Issued Date");
                RepaymentStartDate := LoanDetails."Issued Date";
                for i := 1 to LoanDetails.Instalment do begin

                    NewSchedule.Init;

                    NewSchedule."Loan No." := LoanDetails."Loan No";
                    NewSchedule."Employee No." := LoanDetails."Employee No";
                    NewSchedule."Loan Product Type" := LoanDetails."Loan Product Type";
                    NewSchedule."Repayment Date" := RepaymentStartDate;
                    NewSchedule."Instalment No" := i;
                    NewSchedule."Loan Amount" := LoanDetails."Approved Amount";
                    NewSchedule."Interest Rate" := LoanDetails."Interest Rate";

                    //if "Interest Frequency Period"=1M then
                    NewSchedule."Monthly Interest" := ((NewSchedule."Interest Rate" / 100) / 12) * RemainingPrincipal;
                    NewSchedule."Monthly Repayment" := LoanDetails.Repayment + NewSchedule."Monthly Interest";

                    //else
                    //NewSchedule."Monthly Interest":=((NewSchedule."Interest Rate"/100))*RemainingPrincipal*((RepaymentStartDate-PrevousRepaymentDate)
                    ///365);
                    NewSchedule."Principal Repayment" := LoanDetails.Repayment;
                    NewSchedule."Balance B/F" := RemainingPrincipal;
                    NewSchedule."Balance C/F" := RemainingPrincipal - NewSchedule."Principal Repayment";
                    if NewSchedule."Principal Repayment" > NewSchedule."Balance B/F" then begin
                        NewSchedule."Principal Repayment" := NewSchedule."Balance B/F";
                        NewSchedule."Balance C/F" := NewSchedule."Balance B/F" - NewSchedule."Principal Repayment";
                        NewSchedule."Monthly Repayment" := NewSchedule."Principal Repayment" + NewSchedule."Monthly Interest";
                    end;


                    //IF NOT NewSchedule.GET("Loan No.",RepaymentSchedule."Expected Interest Date") THEN
                    NewSchedule.Insert;
                    PrevousRepaymentDate := RepaymentStartDate;
                    RepaymentStartDate := CalcDate('1M', RepaymentStartDate);
                    RemainingPrincipal := RemainingPrincipal - NewSchedule."Principal Repayment";
                end;


            end;
            //end reducing balance

            /*

            //Fixed Rate Schedule

            IF "Interest Calculation Method"="Interest Calculation Method"::"Flat Rate" THEN BEGIN
            RemainingPrincipal:="Loan Amount";

            RepaymentStartDate:=CALCDATE("Grace Period","Issued Date");
            FOR i:=1 TO Term DO BEGIN

            NewSchedule.INIT;

            NewSchedule."Loan No.":="Loan  No.";
            NewSchedule."Client No.":="Client Code";
            NewSchedule."Repayment Date":=RepaymentStartDate;
            NewSchedule."Loan Product Type":="Loan product type";
            NewSchedule."Instalment No":=i;
            NewSchedule."Loan Amount":="Loan Amount";
            NewSchedule."Interest Rate":="Interest Rate";
            NewSchedule."Monthly Repayment":="Periodic Repayment";
            NewSchedule."Monthly Interest":=((NewSchedule."Interest Rate"/100)/12)*"Gross Loan Amount";
            NewSchedule."Principal Repayment":="Periodic Repayment"-NewSchedule."Monthly Interest";


            //IF NOT NewSchedule.GET("Loan No.",RepaymentSchedule."Expected Interest Date") THEN
            NewSchedule.INSERT;

            RepaymentStartDate:=CALCDATE("Interest Frequency Period",RepaymentStartDate);
            //RemainingPrincipal:=RemainingPrincipal-NewSchedule."Principal Repayment";
            END;


            END;
            //end Fixed Rate

            */

        end;

    end;


    procedure DeleteRepaymentSchedule(var LoanDetails: Record "Loan Application")
    begin
        begin


            if Confirm('Are you sure you want to delete the repayment schedule?') = true then begin

                NewSchedule.Reset;
                NewSchedule.SetRange(NewSchedule."Loan No.", LoanDetails."Loan No");
                NewSchedule.DeleteAll;

            end;
            //END ELSE BEGIN
            //ERROR('Loan Status Must Be Open!');
            //END;


        end;
    end;
}
