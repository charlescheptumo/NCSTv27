#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50009 "DMS Management"
{

    // trigger OnRun()
    // begin
    // end;

    // var
    //     Docname: Text;
    //     FileName: Text;
    //     Filer: Codeunit "File Management";
    //     FileName2: Text;
    //     DocLink: Record "Record Link";
    //     FileDesc: Text;
    //     FileWriter: OutStream;
    //     File1: File;
    //     Xml1: label '"<?xml version=""1.0"" encoding=""utf-8""?>"'';';
    //     ConfigOpen: label '<Config>';
    //     Configclose: label '</Config>';
    //     FolderOpen: label '<Folder>';
    //     FolderClose: label '</Folder>';
    //     Fileopen: label '<Filename>';
    //     FileClose: label '</Filename>';
    //     ColumnsOpen: label '<Columns>';
    //     ColumnsClose: label '</Columns>';
    //     ColumnOpen: label '<Column>';
    //     ColumnClose: label '</Column>';
    //     TitleOpen: label '<Title>';
    //     TitleClose: label '</Title>';
    //     ValueOpen: label '<Value>';
    //     ValueClose: label '</Value>';
    //     XmlFileName: Text;
    //     CashManagementSetup: Record "Cash Management Setup";


    // procedure UploadDocument(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    //     CashManagementSetup: Record "Cash Management Setup";
    // begin
    //     DocType.Reset;
    //     DocType.SetRange(DocType."Document Type", DocType."document type"::"Purchase Invoices");
    //     if DocType.Find('-') then begin
    //         //Uploade File to folder
    //         FileName := '';
    //         FileName2 := '';
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         //Filer.CopyClientFile(FileName,FileName2,TRUE);
    //         // Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         DocLines.Reset;
    //         DocLines.SetRange("Document Type", DocType."document type"::"Purchase Invoices");
    //         if DocLines.Find('-') then begin
    //             XmlFileName := DocType."Document Path" + FileDesc + '.xml';
    //             FileName := DocType."Document Path" + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', DocType."Library Name");
    //             xmlWriter.WriteElementString('Directory', DocType."Library Name");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             // xmlWriter.WriteElementString('Title',DocLines."Column Name");
    //             //xmlWriter.WriteElementString('Value',DocLines."Region Code");
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             //xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             // xmlWriter.WriteElementString('Value',DocLines."Constituency Code");
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         // Filer.MoveFile(FileName,'X:\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');


    // end;

    // procedure UploadImprestDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Imprest Memo DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Imprest Memo DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadStaffClaimDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Reset;
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', region);
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;


    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadImprestSurrenderDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //       DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'
    //         //        +Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Reset;
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             // xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', region);
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;

    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadPettyCashDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', Region);
    //             //.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', Region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadPurchaseRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Region', Region);
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', Region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadStoreRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;
    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := 'C:\Data\' + FileDesc + '.xml';
    //             FileName := 'C:\Data\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', Region);
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', Region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadPettyCashSurrenderDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, 'X:\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := 'C:\Data\' + FileDesc + '.xml';
    //             FileName := 'C:\Data\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', Region);
    //             // xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', Region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadLeaveApplicationsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, 'X:\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Reset;
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := 'C:\Data\' + FileDesc + '.xml';
    //             FileName := 'C:\Data\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', Region);
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', Region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadFleetRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, 'X:\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := 'C:\Data\' + FileDesc + '.xml';
    //             FileName := 'C:\Data\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', Region);
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', Region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadTrainingRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, 'X:\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := 'C:\Data\' + FileDesc + '.xml';
    //             FileName := 'C:\Data\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', Region);
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', Region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, 'X:\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadICTHelpDeskDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         //Docname:=CONVERTSTR(Docname,' ','_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'
    //         //Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadPaymentsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\ERPSERVER\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\ERPSERVER\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\ERPSERVER\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\ERPSERVER\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\ERPSERVER\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadAIEAttchmentDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."AIE EDMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             // xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."AIE EDMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    //     //LPO/LSO
    // end;

    // procedure UploadPurchaseorderDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         // DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."LPO/LSO DMS Link"+'/'
    //         // +Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."LPO/LSO DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadStandardPRNDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         // DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."PRN(Goods & Services) DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."PRN(Goods & Services) DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadImprestrequisitionsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Imprest Requisition DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Imprest Requisition DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadRFQNDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."RFQ DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             // xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."RFQ DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadIFSDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."IFS DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             // xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."IFS DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadIFSCommitteeDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."IFS Tender Comm. DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             // xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             // xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."IFS Tender Comm. DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadIBTDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Upload File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."RFQ DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             // xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."RFQ DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadInterBankTransferDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Inter Bank Transfer DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if DocLines.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             xmlWriter.WriteElementString('Region', Region);
    //             // xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', Region);
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadEvalreportDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Evaluation Report DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Evaluation Report DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadProffessionalOpinionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Professional Opinion DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Professional Opinion DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadReceiptsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Receipts DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             // xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Receipts DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadProcurementLawsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Procurement Laws DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Procurement Laws DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadTenderopeningregisterDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Tender Opening Reg DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Tender Opening Reg DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadStandardContractDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Standard Contract DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Standard Contract DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadRoadLinkDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             // xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Document Uploaded Successffully');

    // end;

    // procedure UploadFunctionalProcurementPlanDocs(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         // DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Imprest Memo DMS Link"+'/'
    //         // +Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             // xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
    //             //  xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Imprest Memo DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadConsolidatedProcurementPlanDocs(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Procurement Laws DMS Link"+'/'
    //         // +Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Procurement Laws DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadProcurementManualDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         // DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Procurement Manual DMS Link"+'/'
    //         // +Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             //xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Procurement Manual DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadProcurementCircularDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Text)
    // var
    //     Procurementsetups: Record "Procurement Setup";
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin

    //     Procurementsetups.Get;
    //     if Procurementsetups.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\192.168.1.121\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         Filer.MoveFile(FileName2, '\\192.168.1.121\DocumentsPath\' + FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         //DocLink.URL1:=Procurementsetups."SharePoint Site Link"+'/'+Procurementsetups."SharePoint Site Main Library"+'/'+Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Procurement Circular DMS Link"+'/'
    //         //+Docname+'/'+FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         Procurementsetups.Get;
    //         if Procurementsetups.Find('-') then begin
    //             XmlFileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             FileName := '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             //xmlWriter.WriteElementString('Library',Procurementsetups."SharePoint Site Main Library");
    //             // xmlWriter.WriteElementString('Folder',Procurementsetups."SharePoint Document Library"+'/'+Region+'/'+Procurementsetups."Procurement Circular DMS Link"+'/'+Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements
    //             xmlWriter.WriteElementString('Title', 'Region');
    //             xmlWriter.WriteElementString('Value', '');
    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Constituency');
    //             xmlWriter.WriteElementString('Value', '');
    //             xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         Filer.MoveFile(FileName, '\\192.168.1.121\DocumentsPath\' + FileDesc + '.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadImprestsurrenderDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Imprest Surrender DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Imprest Surrender DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadPettyCashVoucherDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Petty Cash Voucher DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Petty Cash Voucher DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadPettyCashSurrenderDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Petty Cash Surrender DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Petty Cash Surrender DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadStaffclaimDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\41.89.63.253\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Staff Claim DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\41.89.63.253\DocumentsPath\' + Docname + '.xml';
    //             FileName := '\\41.89.63.253\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Staff Claim DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadLeaveApplicationDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Leave Application DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Leave Application DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadStoreReqDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Store Requisition DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Store Requisition DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadPRNDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Purchase Requisition" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Purchase Requisition");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadPaymentVoucherDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Payment Voucher DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Payment Voucher DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadInterBankDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := '\\41.89.63.253\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Inter Bank Transfer DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := '\\41.89.63.253\DocumentsPath\' + Docname + '.xml';
    //             FileName := '\\41.89.63.253\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Inter Bank Transfer DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadReceiptsDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Receipts DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Receipts DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadInterFundDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Inter Fund Transfer DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Inter Fund Transfer DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadFilesDoc(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Petty Cash Surrender DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Petty Cash Surrender DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadFilesDocFolio(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."General Files  DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."General Files  DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadFilesDocFolioTopSecret(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Top Secret Files  DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Top Secret Files  DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadFilesDocFolioConfidential(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."Confidential Files  DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."Confidential Files  DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;

    // procedure UploadFilesPrequalificationDocs(DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    // var
    //     DocType: Record "DMS Documents";
    //     DocLines: Record "DMS Document Lines";
    //     FileName: Text[250];
    //     xmlWriter: dotnet XmlTextWriter;
    //     EncodingText: dotnet Encoding;
    // begin
    //     CashManagementSetup.Get;
    //     if CashManagementSetup.Find('-') then begin
    //         //Uploade File to folder
    //         Docname := DocNo;
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, ':', '_');
    //         Docname := ConvertStr(Docname, '/', '_');
    //         FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
    //         FileName2 := 'C:\DocumentsPath\' + Docname + '_' + Filer.GetFileName(FileName);
    //         FileDesc := Docname + '_' + Filer.GetFileName(FileName);
    //         Filer.CopyClientFile(FileName, FileName2, true);
    //         //Filer.MoveFile(FileName2,'C:\DocumentsPath\'+FileDesc);
    //         // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
    //         //Insert Link
    //         DocLink.Init;
    //         DocLink."Link ID" := 0;
    //         DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + CashManagementSetup."IFP  DMS Link" + '/'
    //         + Docname + '/' + FileDesc;
    //         DocLink.Description := FileDesc;
    //         DocLink.Type := DocLink.Type::Link;
    //         DocLink.Company := COMPANYNAME;
    //         DocLink."User ID" := UserId;
    //         DocLink.Created := CreateDatetime(Today, Time);
    //         DocLink."Record ID" := TabID;
    //         DocLink.Insert;

    //         //Create Xml Document
    //         CashManagementSetup.Get;
    //         if CashManagementSetup.Find('-') then begin
    //             XmlFileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             FileName := 'C:\DocumentsPath\' + Docname + '.xml';
    //             //FileName :=Docname+'.xml';
    //             if IsNull(xmlWriter) then
    //                 xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
    //             xmlWriter.WriteStartDocument();
    //             //Create Parent element
    //             xmlWriter.WriteStartElement('Columns');
    //             xmlWriter.WriteStartElement('Params');
    //             xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Document Library");
    //             xmlWriter.WriteElementString('Directory', CashManagementSetup."IFP  DMS Link");
    //             xmlWriter.WriteElementString('Folder', Docname);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteStartElement('Files');
    //             xmlWriter.WriteElementString('Filename', FileDesc);
    //             xmlWriter.WriteEndElement();
    //             //Region Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             // REPEAT
    //             //Create Child elements

    //             // xmlWriter.WriteEndElement();
    //             // UNTIL DocLines.NEXT = 0;
    //             //End writing top element and XML document
    //             // xmlWriter.WriteEndElement();
    //             //Constituency Metadata
    //             //xmlWriter.WriteStartElement('Column');
    //             //xmlWriter.WriteElementString('Title','Constituency');
    //             //xmlWriter.WriteElementString('Value','');
    //             //xmlWriter.WriteEndElement();
    //             //Employee Metadata
    //             xmlWriter.WriteStartElement('Column');
    //             xmlWriter.WriteElementString('Title', 'Employee');
    //             xmlWriter.WriteElementString('Value', UserId);
    //             xmlWriter.WriteEndElement();
    //             xmlWriter.WriteEndDocument();
    //             xmlWriter.Close();
    //         end;
    //         // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
    //         //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+FileDesc+'.xml');
    //     end;
    //     Message('Documents Uploaded Successffully');

    // end;
}
