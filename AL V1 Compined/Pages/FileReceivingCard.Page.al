#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 59129 "File Receiving Card"
{
    PageType = Document;
    SourceTable = "File Receiving Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Received From/Sent To"; Rec."Received From/Sent To")
                {
                    ApplicationArea = Basic;
                }
                field("Existing File"; Rec."Existing File")
                {
                    ApplicationArea = Basic;
                }
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                }
                field("File Classification"; Rec."File Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Folio Name"; Rec."Folio Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Allocation Details")
            {
                Editable = false;
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To Name"; Rec."Assigned To Name")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned to Employee No"; Rec."Assigned to Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Employee Email"; Rec."Assigned Employee Email")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
            }
            systempart(Control21; Notes)
            {
            }
            systempart(Control22; MyNotes)
            {
            }
            systempart(Control23; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Allocate File")
            {
                ApplicationArea = Suite;
                Image = ReceiveLoaner;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Approve the requested changes.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    if Rec.Status = Rec.Status::Filed then begin
                        Error('ERROR!, This file has been filed, Kindly request it from the Registry')

                    end;
                    if Dialog.Confirm('Are you sure you want to Allocate this File?', true) then begin
                        //Status := Status::Ongoing;
                        FileAllocationEntries.Reset;
                        FileAllocationEntries.SetFilter("Entry No", '<>%1', 0);
                        FileAllocationEntries.SetRange("Document No", Rec.No);
                        FileAllocationEntries.SetRange(Posted, false);
                        if FileAllocationEntries.FindFirst then begin
                            Page.Run(59131, FileAllocationEntries);
                        end else begin
                            FileAllocationEntries1.Init;
                            FileAllocationEntries1."Entry No" := FileAllocationEntries1."Entry No" + 1;
                            FileAllocationEntries1."Document No" := Rec.No;
                            FileAllocationEntries1."File No" := Rec."File No";
                            FileAllocationEntries1."File Name" := Rec."File Name";
                            FileAllocationEntries1."Folio No" := Rec."Folio No";
                            FileAllocationEntries1."Folio Name" := Rec."Folio Name";
                            if FileAllocationEntries1.Insert(true) then begin
                                Page.Run(59131, FileAllocationEntries1);
                            end;
                        end;
                    end;
                end;
            }
            action("View File")
            {
                ApplicationArea = Basic;
                Image = ViewPage;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Registry Files List";
                RunPageLink = "File No" = field("File No");
            }
            action("Archive File")
            {
                ApplicationArea = Basic;
                Enabled = Rec.Status = Rec.Status::Assigned;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Assigned);
                    if Confirm('Are you sure you want to file this File?', true) then begin
                        if Rec."Existing File" = true then begin
                            RecordCreation.Reset;
                            RecordCreation.SetRange("File No", Rec."File No");
                            if RecordCreation.FindSet then
                                SNO := RecordCreation."Last Folio No" + 1;
                            FileFolioRegistry.Init;
                            FileFolioRegistry."Folio No" := RecordCreation."File No" + '/' + Format(SNO);
                            FileFolioRegistry."File No" := Rec."File No";
                            FileFolioRegistry."File Name" := Rec."File Name";
                            FileFolioRegistry."Folio Name" := Rec."Folio Name";
                            FileFolioRegistry."Document No" := Rec.No;
                            if FileFolioRegistry.Insert(true) then begin
                                RecordLink.Reset;
                                RecordLink.SetRange("Record ID", Rec.RecordId);
                                if RecordLink.FindSet then begin
                                    repeat
                                        RecordLink2.Init;
                                        RecordLink2.TransferFields(RecordLink);
                                        RecordLink3.Reset;
                                        if RecordLink3.FindLast then
                                            RecordLink2."Link ID" := RecordLink3."Link ID" + 1;
                                        RecordLink2."Record ID" := FileFolioRegistry.RecordId;
                                        RecordLink2.URL1 := RecordLink.URL1;
                                        // RecordLink2.URL2 := RecordLink.URL2;
                                        // RecordLink2.URL3 := RecordLink.URL3;
                                        // RecordLink2.URL4 := RecordLink.URL4;
                                        RecordLink2.Description := RecordLink.Description;
                                        RecordLink2.Type := RecordLink.Type;
                                        RecordLink2.Company := RecordLink.Company;
                                        RecordLink2."User ID" := UserId;
                                        RecordLink2.Insert(true);
                                    until RecordLink.Next = 0;
                                end;
                                RecordCreation."Last Folio No" := SNO;
                                RecordCreation.Modify(true);
                                Rec.Status := Rec.Status::Filed;
                                Message('Folio Added to File Successfully');

                            end;
                        end;
                        if Rec."Existing File" = false then begin
                            RecordCreation.Init;
                            RecordCreation."File No" := RecordCreation."File No";
                            RecordCreation."File Name" := Rec."File Name";
                            RecordCreation."File Type" := Rec."File Type";
                            RecordCreation."File Classification" := Rec."File Classification";
                            RecordCreation."Last Folio No" := 1;
                            if RecordCreation.Insert(true) then begin
                                FileFolioRegistry.Init;
                                FileFolioRegistry."Folio No" := RecordCreation."File No" + '/1';
                                FileFolioRegistry."File No" := Rec."File No";
                                FileFolioRegistry."File Name" := Rec."File Name";
                                FileFolioRegistry."Folio Name" := Rec."Folio Name";
                                FileFolioRegistry."Document No" := Rec.No;
                                if FileFolioRegistry.Insert(true) then begin
                                    RecordLink.Reset;
                                    RecordLink.SetRange("Record ID", Rec.RecordId);
                                    if RecordLink.FindSet then begin
                                        repeat
                                            RecordLink2.Init;
                                            // RecordLink2.TRANSFERFIELDS(RecordLink);
                                            RecordLink3.Reset;
                                            if RecordLink3.FindLast then
                                                RecordLink2."Link ID" := RecordLink3."Link ID" + 1;
                                            RecordLink2."Record ID" := FileFolioRegistry.RecordId;
                                            RecordLink2.URL1 := RecordLink.URL1;
                                            // RecordLink2.URL2 := RecordLink.URL2;
                                            // RecordLink2.URL3 := RecordLink.URL3;
                                            // RecordLink2.URL4 := RecordLink.URL4;
                                            RecordLink2.Description := RecordLink.Description;
                                            RecordLink2.Type := RecordLink.Type;
                                            RecordLink2.Company := RecordLink.Company;
                                            RecordLink2."User ID" := UserId;
                                            RecordLink2.Insert(true);
                                        until RecordLink.Next = 0;
                                    end;
                                    Rec.Status := Rec.Status::Filed;
                                    Message('File and Folio Added Successfully');

                                end;


                            end;

                        end;
                    end;
                end;
            }
            action(DocAttach1)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Documents';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Visible = true;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    if Rec."File Classification" = Rec."file classification"::"Confidential File" then begin
                        //DMSManagement.UploadFilesDocFolioConfidential(Rec."File No", 'File', Rec.RecordId);
                    end;
                    if Rec."File Classification" = Rec."file classification"::"Top Secret File" then begin
                        //DMSManagement.UploadFilesDocFolioTopSecret(Rec."File No", 'File', Rec.RecordId);
                    end;
                    if Rec."File Classification" = Rec."file classification"::"General File" then begin
                        //DMSManagement.UploadFilesDocFolio(Rec."File No", 'File', Rec.RecordId);
                    end;
                    if Rec."File Classification" = Rec."file classification"::" " then begin
                        Error('ERROR!, You have not specified the File Classification');
                    end;
                end;
            }
            action("View File Allocation Entries")
            {
                ApplicationArea = Basic;
                Image = JobLines;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "File Allocation Entries Lst";
                RunPageLink = "Document No" = field(No);
            }
        }
    }

    var
        CrmGeneralSetup: Record "Crm General Setup.";
        legalEmail: Text;
        Email2: Text;
        CompanyInformation: Record "Company Information";
        UserSetup: Record "User Setup";
        Body: Text;
        //cc//  SMTP: Codeunit "SMTP Mail";
        FileAllocationEntries: Record "File Allocation Entries";
        FileAllocationEntries1: Record "File Allocation Entries";
        FileFolioRegistry: Record "File Folio Registry";
        RecordCreation: Record "Record Creation";
        SNO: Integer;
        DMSManagement: Codeunit "DMS Management";
        RecordLink: Record "Record Link";
        RecordLink2: Record "Record Link";
        RecordLink3: Record "Record Link";
}
