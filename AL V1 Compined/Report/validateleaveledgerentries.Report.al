#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50000 "validate leave ledger entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/validate leave ledger entries.rdlc';

    dataset
    {
        dataitem("HR Leave Ledger Entries"; "HR Leave Ledger Entries")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                HrLeavePeriods.Reset;
                HrLeavePeriods.SetRange(Closed, false);
                if HrLeavePeriods.FindSet then begin
                    if "HR Leave Ledger Entries"."Posting Date" >= HrLeavePeriods.Starts then begin
                        "HR Leave Ledger Entries"."Current Period" := true;
                        "HR Leave Ledger Entries".Modify;
                    end;


                end;
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
        HrLeavePeriods: Record "HR Leave Periods";
}
