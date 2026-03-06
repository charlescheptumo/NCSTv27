#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70007 "Prequalification Category"
{
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem("Procurement Category Header"; "Procurement Category Header")
        {
            DataItemTableView = sorting("Fiscal Year", Category);
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin

                SupplierCategory.Reset;
                if SupplierCategory.Find('-') then
                    repeat
                        ProcCategory.Init;
                        ProcCategory."Fiscal Year" := FiscalYear;
                        ProcCategory.Category := SupplierCategory."Category Code";
                        ProcCategory.Validate(Category);
                        if not ProcCategory.Get(ProcCategory."Fiscal Year", ProcCategory.Category) then
                            ProcCategory.Insert;
                    until
                     SupplierCategory.Next = 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("Specify Fiscal Year")
                {
                    field("Fiscal Year"; FiscalYear)
                    {
                        ApplicationArea = Basic;
                        TableRelation = "G/L Budget Name";
                    }
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
        if FiscalYear = '' then
            Error(Text000);
    end;

    var
        SupplierCategory: Record "Supplier Category";
        ProcCategory: Record "Procurement Category Header";
        Text000: label 'Please specify the fiscal year';
        FiscalYear: Code[20];
}
