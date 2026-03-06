#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 80000 "Import Workplan Lines"
{
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem(ExcelBuffer; "Excel Buffer")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnPreDataItem()
            begin
                ExcelBuffer.LockTable;
                //cc  ExcelBuffer.OpenBook(ServerFileName, SheetName);
                ExcelBuffer.ReadSheet;
                //getlastRowandColumnId;

                ExcelBuffer.Reset;
                ExcelBuffer.SetRange("Column No.", 1);
                if ExcelBuffer.FindSet then
                    Totalrows := ExcelBuffer.Count;

                for I := 1 to Totalrows do
                    InsertData(I);

                ExcelBuffer.DeleteAll;
                Message('Import is Completed');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(ExcelExt; ExcelExt)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }

        actions
        {
        }

        trigger OnQueryClosePage(CloseAction: action): Boolean
        var
            Text001: label 'Do you want to upload?';
        begin
            if CloseAction = Action::OK then begin
                // ServerFileName := FIleManagement.UploadFile(Text001, ExcelExt);
                if ServerFileName = '' then
                    exit(false);
                //   SheetName := ExcelBuffer.SelectSheetsName(ServerFileName);
                if SheetName = '' then
                    exit(true);
            end;
        end;
    }

    labels
    {
    }

    var
        ServerFileName: Text;
        SheetName: Text;
        I: Integer;
        Totalrows: Integer;
        FIleManagement: Codeunit "File Management";
        ExcelExt: Text;


    procedure InsertData(RowNo: Integer)
    var
        WpLines: Record "Strategy Workplan Lines";
    begin
        WpLines.Init;
        WpLines.SetRange(WpLines.No, GetValueAtCell(RowNo, 1));
        WpLines.SetRange(WpLines."Strategy Plan ID", GetValueAtCell(RowNo, 2));
        if WpLines.FindSet then begin
            repeat
                Evaluate(WpLines.No, GetValueAtCell(RowNo, 1));
                Evaluate(WpLines."Strategy Plan ID", GetValueAtCell(RowNo, 2));
                Evaluate(WpLines."Activity ID", GetValueAtCell(RowNo, 3));
                Evaluate(WpLines.Description, GetValueAtCell(RowNo, 4));
                Evaluate(WpLines."Imported Annual Target Qty", GetValueAtCell(RowNo, 5));
                Evaluate(WpLines."Imported Annual Budget Est.", GetValueAtCell(RowNo, 6));
                Evaluate(WpLines."Primary Directorate", GetValueAtCell(RowNo, 7));
                Evaluate(WpLines."Primary Department", GetValueAtCell(RowNo, 8));
            until WpLines.Next = 0;
        end;
    end;


    procedure GetValueAtCell(RowNo: Integer; ColNo: Integer) Text: Text
    var
        ExcelBuffer1: Record "Excel Buffer";
    begin
    end;
}
