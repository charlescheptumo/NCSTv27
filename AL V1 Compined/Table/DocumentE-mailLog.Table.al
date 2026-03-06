#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50004 "Document E-mail Log"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Customer No"; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                //
            end;
        }
        field(3; Document; Blob)
        {
        }
        field(4; "E-mailed To"; Text[80])
        {
        }
        field(5; Date; Date)
        {
        }
        field(6; "Document Type"; Option)
        {
            OptionCaption = ' ,Customer Statement,Sales Invoice,Credit Memo,Vendor Invoice,Letter,Payslip';
            OptionMembers = " ","Customer Statement","Sales Invoice","Credit Memo","Vendor Invoice",Letter,Payslip;
        }
        field(7; "File Extension"; Text[250])
        {
            Caption = 'File Extension';
        }
        field(8; "Document No"; Code[20])
        {
        }
        field(9; Time; Time)
        {
        }
        field(10; "S/no"; Integer)
        {
        }
        field(11; "Vendor No"; Code[10])
        {
        }
        field(12; "Profit Centre"; Code[50])
        {
        }
        field(13; "Branch code"; Code[50])
        {
        }
        field(14; "Sender ID"; Code[50])
        {
        }
        field(15; "Customer Name"; Text[250])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text002: label 'The attachment is empty.';
        Text003: label 'Attachment is already in use on this machine.';
        Text004: label 'When you have saved your document, click Yes to import the document.';
        Text005: label 'Export Attachment';
        Text006: label 'Import Attachment';
        Text007: label 'All Files (*.*)|*.*';
        Text008: label 'Error during copying file.';
        Text009: label 'Do you want to remove %1?';
        Text010: label 'External file could not be removed.';
        Text012: label '\Doc';
        Text013: label 'You can only print Microsoft Word documents.';
        Text014: label 'You can only fax Microsoft Word documents.';
        Text015: label 'The e-mail has been deleted.';
        Text016: label 'When you have finished working with a document, you should delete the associated temporary file. Please note that this will not delete the document.\\Do you want to delete the temporary file?';


    procedure ExportAttachment(ExportToFile: Text[260]): Boolean
    var
        FileName: Text[260];
        FileFilter: Text[260];
    begin
        /*CALCFIELDS(Document);
        IF Document.HASVALUE THEN BEGIN
          IF ExportToFile = '' THEN BEGIN
            FileFilter := UPPERCASE("File Extension") + ' ';
            FileFilter := FileFilter + '(*.' + "File Extension" + ')|*.' + "File Extension";
            FileName := CommonDialogMgt.OpenFile(Text005,'',4,FileFilter,1);
          END ELSE
            FileName := ExportToFile;
          IF FileName <> '' THEN BEGIN
            Document.EXPORT(FileName);
            EXIT(TRUE);
          END ELSE
            EXIT(FALSE)
        END ELSE
          EXIT(FALSE)
         */

    end;


    procedure DeleteFile(FileName: Text[260]): Boolean
    var
        I: Integer;
    begin
        /*IF FileName = '' THEN
          EXIT(FALSE);
        
        IF NOT EXISTS(FileName) THEN
          EXIT(TRUE);
        
        REPEAT
          SLEEP(250);
          I := I + 1;
        UNTIL ERASE(FileName) OR (I = 25);
        EXIT(NOT EXISTS(FileName));
         */

    end;


    procedure ConstFilename() FileName: Text[260]
    var
        I: Integer;
        DocNo: Text[30];
    begin
        /*REPEAT
          IF I <> 0 THEN
            DocNo := FORMAT(I);
          FileName := ENVIRON('TEMP') + Text012 + DocNo + '.' + "File Extension";
          IF NOT EXISTS(FileName) THEN
            EXIT;
          I := I +1;
        UNTIL I=999;
        */

    end;
}
