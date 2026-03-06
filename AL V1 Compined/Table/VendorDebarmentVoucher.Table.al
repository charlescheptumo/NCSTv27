#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70116 "Vendor Debarment Voucher"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Vendor Debarment & Vendor Reinstatement Voucher No. Series';

            trigger OnValidate()
            begin
                if "Document No" <> '' then begin
                    if "Document Type" = "document type"::Debarment then begin
                        ProcurementSetup.TestField("Vendor Debarment No. series");
                        NoMgt.TestManual(ProcurementSetup."Vendor Debarment No. series");
                        "No. Series" := ''
                    end else begin
                        ProcurementSetup.TestField("Vendor Reinstatement Nos");
                        NoMgt.TestManual(ProcurementSetup."Vendor Reinstatement Nos");
                        "No. Series" := ''
                    end;
                end;
            end;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'This field shall have different captions on Debarment ("Blacklisted By") or Reinstatement ("Reinstated By) vouchers';
            OptionCaption = 'Debarment,Reinstatement';
            OptionMembers = Debarment,Reinstatement;
        }
        field(3; "Source Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Internal(Procuring Entity),Procurement Regulator,External 3rd Party';
            OptionMembers = ,"Internal(Procuring Entity)","Procurement Regulator","External 3rd Party";
        }
        field(4; Description; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "External Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'For external references such as Memo etc';
        }
        field(7; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(8; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(37; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(38; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';

            trigger OnValidate()
            begin
                Dimen := "Global Dimension 3 Code";
                Dimen := CopyStr(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Global Dimension 3 Code";
                Dimens := CopyStr(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            ProcurementSetup.Get;
            if "Document Type" = "document type"::Debarment then begin
                ProcurementSetup.TestField("Vendor Debarment No. series");
                //NoMgt.InitSeries(ProcurementSetup."Vendor Debarment No. series", xRec."No. Series", 0D, "Document No", "No. Series");
                "Document No" := NoMgt.GetNextNo(ProcurementSetup."Vendor Debarment No. series", Today, true);
            end else begin
                ProcurementSetup.TestField("Vendor Reinstatement Nos");
                //NoMgt.InitSeries(ProcurementSetup."Vendor Reinstatement Nos", xRec."No. Series", 0D, "Document No", "No. Series");
                "Document No" := NoMgt.GetNextNo(ProcurementSetup."Vendor Reinstatement Nos", Today, true);
            end;
        end;

        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit "No. Series";
        DimMgt: Codeunit DimensionManagement;
        Dimen: Text;
        Dimens: Text;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "Document No"),
            "Global Dimension 1 Code", "Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}
