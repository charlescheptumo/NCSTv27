#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70035 "Contract Interaction Language"
{
    Caption = 'Segment Interaction Language';
    LookupPageID = "Segment Interaction Languages";

    fields
    {
        field(1; "Segment No."; Code[20])
        {
            Caption = 'Segment No.';
            TableRelation = "Contract Management Header";
        }
        field(2; "Segment Line No."; Integer)
        {
            Caption = 'Segment Line No.';
            TableRelation = "Segment Line"."Line No." where("Segment No." = field("Segment No."));
        }
        field(3; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(4; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(5; "Attachment No."; Integer)
        {
            Caption = 'Attachment No.';
        }
        field(6; Subject; Text[50])
        {
            Caption = 'Subject';

            trigger OnValidate()
            var
                SegHeader: Record "Segment Header";
                SegLine: Record "Segment Line";
                UpdateLines: Boolean;
            begin
                SegHeader.Get("Segment No.");
                if "Segment Line No." = 0 then
                    if SegHeader.SegLinesExist('') then
                        UpdateLines := Confirm(StrSubstNo(Text005, FieldCaption(Subject)), true);

                if SegHeader."Language Code (Default)" = "Language Code" then
                    if SegHeader."Subject (Default)" = xRec.Subject then begin
                        SegHeader."Subject (Default)" := Subject;
                        SegHeader.Modify;
                        Modify;
                    end;

                if not UpdateLines then
                    exit;

                SegLine.SetRange("Segment No.", "Segment No.");
                if "Segment Line No." = 0 then
                    SegLine.SetRange("Interaction Template Code", SegHeader."Interaction Template Code")
                else begin
                    SegLine.Get("Segment No.", "Segment Line No.");
                    SegLine.SetRange("Interaction Template Code", SegLine."Interaction Template Code");
                end;
                SegLine.SetRange("Language Code", "Language Code");
                SegLine.SetRange(Subject, xRec.Subject);
                SegLine.ModifyAll(Subject, Subject);
            end;
        }
    }

    keys
    {
        key(Key1; "Segment No.", "Language Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        SegHeader: Record "Segment Header";
        SegLine: Record "Segment Line";
        Cont: Record Contact;
        SegInteractLanguage: Record "Segment Interaction Language";
    begin
        SegHeader.Get("Segment No.");
        if ("Segment Line No." = 0) and
           ("Language Code" = SegHeader."Language Code (Default)")
        then begin
            SegInteractLanguage.SetRange("Segment No.", "Segment No.");
            SegInteractLanguage.SetRange("Segment Line No.", 0);
            SegInteractLanguage.SetFilter("Language Code", '<>%1', "Language Code");
            if SegInteractLanguage.FindFirst then begin
                SegHeader."Language Code (Default)" := SegInteractLanguage."Language Code";
                SegHeader."Subject (Default)" := SegInteractLanguage.Subject;
            end else begin
                SegHeader."Language Code (Default)" := '';
                SegHeader."Subject (Default)" := '';
            end;
            SegHeader.Modify;
        end;
        SegHeader.CalcFields("Attachment No.");

        if "Segment Line No." = 0 then begin
            SegLine.SetRange("Segment No.", "Segment No.");
            SegLine.SetRange("Attachment No.", "Attachment No.");
            if SegLine.Find('-') then
                repeat
                    if Cont.Get(SegLine."Contact No.") then begin
                        if (Cont."Language Code" <> "Language Code") and
                           SegInteractLanguage.Get("Segment No.", 0, Cont."Language Code")
                        then begin
                            SegLine."Language Code" := Cont."Language Code";
                            SegLine.Subject := SegInteractLanguage.Subject;
                            SegLine."Attachment No." := SegInteractLanguage."Attachment No.";
                        end else begin
                            SegLine."Language Code" := SegHeader."Language Code (Default)";
                            SegLine.Subject := SegHeader."Subject (Default)";
                            SegLine."Attachment No." := SegHeader."Attachment No.";
                        end;
                        SegLine.Modify;
                    end;
                until SegLine.Next = 0;
        end else begin // UNIQUE Attachment
            SegLine.Get("Segment No.", "Segment Line No.");
            if SegLine."Attachment No." = "Attachment No." then begin
                SegInteractLanguage.SetRange("Segment No.", "Segment No.");
                SegInteractLanguage.SetRange("Segment Line No.", "Segment Line No.");
                SegInteractLanguage.SetFilter("Language Code", '<>%1', "Language Code");
                if SegInteractLanguage.FindFirst then begin
                    SegLine."Language Code" := SegInteractLanguage."Language Code";
                    SegLine.Subject := SegInteractLanguage.Subject;
                    SegLine."Attachment No." := SegInteractLanguage."Attachment No.";
                end else
                    if SegLine."Interaction Template Code" = SegHeader."Interaction Template Code" then begin
                        Cont.Get(SegLine."Contact No.");
                        if SegInteractLanguage.Get("Segment No.", 0, Cont."Language Code") then begin
                            SegLine."Language Code" := Cont."Language Code";
                            SegLine.Subject := SegInteractLanguage.Subject;
                            SegLine."Attachment No." := SegInteractLanguage."Attachment No.";
                        end else begin
                            SegLine."Language Code" := SegHeader."Language Code (Default)";
                            SegLine.Subject := SegHeader."Subject (Default)";
                            SegLine."Attachment No." := SegHeader."Attachment No.";
                        end;
                    end else begin
                        SegLine."Language Code" := '';
                        SegLine.Subject := '';
                        SegLine."Attachment No." := 0;
                    end;
                SegLine.Modify;
            end;
        end;

        RemoveAttachment(false);
    end;

    trigger OnInsert()
    var
        Cont: Record Contact;
        SegHeader: Record "Segment Header";
        SegLine: Record "Segment Line";
        SegInteractLanguage: Record "Segment Interaction Language";
        FirstSegIntLanguage: Boolean;
    begin
        /*IF "Segment Line No." = 0 THEN BEGIN
          SegInteractLanguage.SETRANGE("Segment No.","Segment No.");
          SegInteractLanguage.SETRANGE("Segment Line No.",0);
          FirstSegIntLanguage := NOT SegInteractLanguage.FINDFIRST;
        
          SegLine.SETRANGE("Segment No.","Segment No.");
          SegHeader.GET("Segment No.");
          SegLine.SETRANGE("Interaction Template Code",SegHeader."Interaction Template Code");
          IF SegLine.FIND('-') THEN
            REPEAT
              IF FirstSegIntLanguage THEN BEGIN
                IF SegLine.AttachmentInherited OR
                   (SegLine."Attachment No." = 0)
                THEN BEGIN
                  SegLine."Language Code" := "Language Code";
                  SegLine.Subject := Subject;
                  SegLine."Attachment No." := "Attachment No.";
                  SegLine.MODIFY;
                END
              END ELSE
                IF SegLine.AttachmentInherited OR (SegLine."Attachment No." = 0) THEN
                  IF Cont.GET(SegLine."Contact No.") THEN
                    IF Cont."Language Code" = "Language Code" THEN BEGIN
                      SegLine."Language Code" := "Language Code";
                      SegLine.Subject := Subject;
                      SegLine."Attachment No." := "Attachment No.";
                      SegLine.MODIFY;
                    END;
            UNTIL SegLine.NEXT = 0;
        END ELSE BEGIN
          SegLine.GET("Segment No.","Segment Line No.");
          SegLine."Language Code" := "Language Code";
          SegLine.Subject := Subject;
          SegLine."Attachment No." := "Attachment No.";
          SegLine.MODIFY;
        END;
        */

    end;

    trigger OnRename()
    var
        SegHeader: Record "Segment Header";
        SegLine: Record "Segment Line";
        Cont: Record Contact;
    begin
        SegHeader.Get("Segment No.");
        SegHeader.CalcFields("Attachment No.");
        if ("Segment Line No." = 0) and
           (SegHeader."Language Code (Default)" = xRec."Language Code")
        then begin
            SegHeader."Language Code (Default)" := "Language Code";
            SegHeader.Modify;
        end;

        if "Segment Line No." = 0 then begin
            SegLine.SetRange("Segment No.", "Segment No.");
            SegLine.SetRange("Attachment No.", "Attachment No.");
            if SegLine.Find('-') then
                repeat
                    SegLine."Language Code" := SegHeader."Language Code (Default)";
                    SegLine."Attachment No." := SegHeader."Attachment No.";
                    SegLine.Modify;
                until SegLine.Next = 0;

            SegLine.Reset;
            SegLine.SetRange("Segment No.", "Segment No.");
            SegLine.SetRange("Interaction Template Code", SegHeader."Interaction Template Code");
            if SegLine.Find('-') then
                repeat
                    if SegLine.AttachmentInherited or (SegLine."Attachment No." = 0) then
                        if Cont.Get(SegLine."Contact No.") then
                            if Cont."Language Code" = "Language Code" then begin
                                SegLine."Language Code" := "Language Code";
                                SegLine.Subject := Subject;
                                SegLine."Attachment No." := "Attachment No.";
                                SegLine.Modify;
                            end;
                until SegLine.Next = 0;
        end else begin
            SegLine.Get("Segment No.", "Segment Line No.");
            if SegLine."Language Code" = xRec."Language Code" then begin
                SegLine."Language Code" := "Language Code";
                SegLine."Attachment No." := "Attachment No.";
                SegLine.Modify;
            end;
        end;
    end;

    var
        Text000: label 'You have canceled the create process.';
        Text001: label 'Replace existing attachment?';
        Text002: label 'The import was canceled or the specified file could not be accessed. The import failed.';
        Text003: label 'Inherited';
        Text004: label 'Unique';
        Text005: label 'You have modified %1.\\Do you want to update the segment lines with the same Interaction Template Code and Language Code?';


    procedure CreateAttachment()
    var
        SegInteractLanguage: Record "Segment Interaction Language";
        //cc//  WordManagement: Codeunit WordManagement;
        NewAttachmentNo: Integer;
    begin
        if "Attachment No." <> 0 then begin
            if not Confirm(Text001, false) then
                exit;
            RemoveAttachment(false);
        end;

        //cc// NewAttachmentNo := WordManagement.CreateWordAttachment("Segment No." + ' ' + Description, "Language Code");
        if NewAttachmentNo <> 0 then begin
            "Attachment No." := NewAttachmentNo;
            if SegInteractLanguage.Get("Segment No.", "Segment Line No.", "Language Code") then
                Modify
            else
                Insert(true);
            UpdateSegLineAttachment(0);
        end else
            Error(Text000);
    end;


    procedure OpenAttachment()
    var
        Attachment: Record Attachment;
    begin
        if "Attachment No." = 0 then
            exit;
        Attachment.Get("Attachment No.");
        Attachment.OpenAttachment("Segment No." + ' ' + Description, false, "Language Code");
    end;


    procedure CopyFromAttachment()
    var
        SegInteractLanguage: Record "Segment Interaction Language";
        AttachmentManagement: Codeunit AttachmentManagement;
        NewAttachNo: Integer;
    begin
        if "Attachment No." <> 0 then begin
            if not Confirm(Text001, false) then
                exit;
            RemoveAttachment(false);
            Commit;
        end;

        SegInteractLanguage.SetRange("Segment No.", "Segment No.");
        SegInteractLanguage.SetFilter("Attachment No.", '<>%1&<>%2', 0, "Attachment No.");
        if Page.RunModal(0, SegInteractLanguage) = Action::LookupOK then begin
         //   NewAttachNo := AttachmentManagement.InsertAttachment(SegInteractLanguage."Attachment No.");
            if NewAttachNo <> 0 then begin
                "Attachment No." := NewAttachNo;
                Modify;
                UpdateSegLineAttachment(0);
            end;
        end;
    end;


    procedure ImportAttachment()
    var
        Attachment: Record Attachment;
    begin
        if "Attachment No." <> 0 then begin
            if not Confirm(Text001, false) then
                exit;
            RemoveAttachment(false);
        end;

        // if Attachment.ImportAttachmentFromClientFile('', false, false) then begin
        //     "Attachment No." := Attachment."No.";
        //     Modify;
        //     UpdateSegLineAttachment(0);
        // end else
        //     Error(Text002);
    end;


    procedure ExportAttachment()
    var
        Attachment: Record Attachment;
        FileName: Text[1024];
    begin
        if Attachment.Get("Attachment No.") then begin
            if Attachment."Storage Type" = Attachment."storage type"::Embedded then
                Attachment.CalcFields("Attachment File");
            // Attachment.ExportAttachmentToClientFile(FileName);
        end;
    end;


    procedure RemoveAttachment(Prompt: Boolean)
    var
        Attachment: Record Attachment;
        OldAttachmentNo: Integer;
    begin
        OldAttachmentNo := "Attachment No.";
        if Attachment.Get("Attachment No.") and (not Attachment."Read Only") then
            // if Attachment.RemoveAttachment(Prompt) then begin
            //     "Attachment No." := 0;
            //     Modify;
            // end;
        UpdateSegLineAttachment(OldAttachmentNo);
    end;


    procedure UpdateSegLineAttachment(OldAttachmentNo: Integer)
    var
        SegLine: Record "Segment Line";
        SegHeader: Record "Segment Header";
    begin
        /*IF "Segment Line No." = 0 THEN BEGIN
          SegHeader.GET("Segment No.");
          SegLine.SETRANGE("Segment No.","Segment No.");
          SegLine.SETRANGE("Interaction Template Code",SegHeader."Interaction Template Code");
          SegLine.SETRANGE("Language Code","Language Code");
          SegLine.SETRANGE("Attachment No.",OldAttachmentNo);
          SegLine.MODIFYALL("Attachment No.","Attachment No.");
        END ELSE BEGIN
          SegLine.SETRANGE("Segment No.","Segment No.");
          SegLine.SETRANGE("Line No.","Segment Line No.");
          SegLine.SETRANGE("Attachment No.",OldAttachmentNo);
          IF SegLine.FINDFIRST THEN BEGIN
            SegLine."Attachment No." := "Attachment No.";
            SegLine.MODIFY;
          END;
        END;
        */

    end;


    procedure AttachmentText(): Text[30]
    begin
        if "Attachment No." = 0 then
            exit('');

        if "Segment Line No." = 0 then
            exit(Text003);

        exit(Text004);
    end;


    procedure Caption() CaptionText: Text[260]
    var
        SegHeader: Record "Segment Header";
        SegLine: Record "Segment Line";
        Cont: Record Contact;
    begin
        SegHeader.Get("Segment No.");
        CaptionText := Format("Segment No.") + ' ' + SegHeader.Description;
        if "Segment Line No." <> 0 then begin
            SegLine.Get("Segment No.", "Segment Line No.");
            if Cont.Get(SegLine."Contact No.") then;
            CaptionText := CaptionText + ' ' + Format(SegLine."Contact No.") + ' ' + Cont.Name;
        end;
    end;
}
