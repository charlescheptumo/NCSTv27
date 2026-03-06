#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69126 "Bonded Staff Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bonded Staff Report.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("HR Employees"; Employee)
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(EmpCode; "HR Employees"."No.")
            {
            }
            column(FirstName; "HR Employees"."First Name")
            {
            }
            column(MiddleName; "HR Employees"."Middle Name")
            {
            }
            column(LastName; "HR Employees"."Last Name")
            {
            }
            column(BondageEndDate; BondageEndDate)
            {
            }
            column(CourseTaken; TempTrainingTable."Course Title")
            {
            }
            column(CourseDescription; TempTrainingTable.Description)
            {
            }
            column(ActualStartDateforBonding; BondageStartDate)
            {
            }
            column(ActualEndDateforBonding; BondageEndDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //Find employees records in Tranining participants
                Participants.Reset;
                Participants.SetRange(Participants."Employee Code", "HR Employees"."No.");    //list of training records with this employees no.
                Participants.SetRange(Participants.Bonded, true);
                if Participants.Find('-') then begin

                    TempTrainingTable.Reset;
                    TempTrainingTable.DeleteAll;


                    //populate temporary table with trainings attended
                    Trainings.Reset;
                    Trainings.SetRange(Trainings."Course Title", Participants."Training Code");

                    Trainings.Find('-');

                    repeat

                        TempTrainingTable.TransferFields(Trainings);
                        TempTrainingTable.Insert;

                    until Trainings.Next = 0;
                    //sort temporary table
                    TempTrainingTable.SetCurrentkey(TempTrainingTable."Actual End Date");
                    TempTrainingTable.Find('+');

                    BondageStartDate := TempTrainingTable."Actual End Date";
                    BondageEndDate := CalcDate(TempTrainingTable."Bondage Period", BondageStartDate);
                    startDate := TempTrainingTable."Actual Start Date";
                    endDate := TempTrainingTable."Actual End Date";


                    //start processing to check if bondage date exceeds policy
                    //IF (TODAY > (CALCDATE('+2Y',BondageStartDate))) THEN CurrReport.SKIP;   //SKIP if employee does not meet bondage criteria
                end else
                    CurrReport.Skip;
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
        Participants: Record "Training Participants";
        Trainings: Record "Training Request";
        BondageStartDate: Date;
        BondageEndDate: Date;
        TempTrainingTable: Record "Training Requests" temporary;
        startDate: Date;
        endDate: Date;
}
