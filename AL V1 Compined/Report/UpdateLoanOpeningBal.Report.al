#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69017 "Update Loan Opening Bal"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Loan Opening Bal.rdlc';

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No") order(ascending) where(Type = const(Deduction), Closed = const(false));
            RequestFilterFields = "Code", "Payroll Period", "Employee No";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Ded.Get("Assignment Matrix-X".Code) then begin
                    if Ded."Balance Type" = Ded."balance type"::Decreasing then
                        "Assignment Matrix-X"."Opening Balance" := "Assignment Matrix-X"."Closing Balance" - "Assignment Matrix-X".Amount;
                    if Ded."Balance Type" = Ded."balance type"::Increasing then
                        "Assignment Matrix-X"."Opening Balance" := "Assignment Matrix-X"."Closing Balance" + "Assignment Matrix-X".Amount;
                end;
                "Assignment Matrix-X".Modify;
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
        Ded: Record DeductionsX;
}
