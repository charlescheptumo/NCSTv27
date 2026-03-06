#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70098 "Procurement Plan"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(2; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Corporate Strategic Plan ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Financial Budget ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(5; "Financial Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";

            trigger OnValidate()
            begin
                YearCodes.Reset;
                YearCodes.SetRange(Code, "Financial Year Code");
                if YearCodes.FindSet then begin
                    "Start Date" := YearCodes."Starting Date";
                    "End Date" := YearCodes."Ending Date";
                end;
            end;
        }
        field(6; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Time Created"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Functional,Consolidated';
            OptionMembers = Functional,Consolidated;
        }
        field(12; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            Enabled = true;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(13; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Echequer Job ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(15; "Total Budget (Goods)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Type" = const('GOODS'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Total Budget (Works)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('WORKS'),
                                                                                 "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Total Budget (Services)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Type" = const('SERVICES'),
                                                                                 "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Total Budgeted Spend"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Total Actual (Works)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Type" = const('WORKS'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Total Actual (Services)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Type" = const('SERVICES'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21; "Total Actual Spend"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Spend %"; Decimal)
        {
            CalcFormula = average("Procurement Plan Entry"."Total Actual Costs" where("Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(24; "Budget Plan Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Total Actual (Goods)"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Total Actual Costs" where("Procurement Type" = const('GOODS'),
                                                                                   "Procurement Plan ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            DataClassification = ToBeClassified;
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
            DataClassification = ToBeClassified;
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
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                Dimen := "Global Dimension 3 Code";
                Dimen := CopyStr(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Global Dimension 3 Code";
                Dimens := CopyStr(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(39; "Consolidated Procurement Plan"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code where("Plan Type" = const(Consolidated));

            trigger OnValidate()
            begin
                plan.Reset;
                plan.SetRange("Consolidated Procurement Plan", plan.Code);
                if plan.Find('-') then
                    "Corporate Strategic Plan ID" := plan."Corporate Strategic Plan ID";
                "Document Date" := Today;
                "Date Created" := Today;
                "Financial Budget ID" := plan."Financial Budget ID";
                "Financial Year Code" := plan."Financial Year Code";
                "Start Date" := plan."Start Date";
                "End Date" := plan."End Date";
                "Time Created" := Time;



            end;
        }
        field(40; "Planning Responsibility Center"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(41; "Total PRN Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const("Purchase Requisition"),
                                                            Status = const(Released),
                                                            Comment = const('No'),
                                                            "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(42; "Total Contract Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const("Blanket Order"),
                                                            Status = const(Released),
                                                            "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(43; "Total PO Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = const(Order),
                                                            Status = const(Released),
                                                            "Procurement Plan ID" = field(Code),
                                                            "Blanket Order No." = const('')));
            FieldClass = FlowField;
        }
        field(44; "Total Purchase Commitments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Document Type" = filter("Purchase Requisition" | Order | "Blanket Order"),
                                                            Status = const(Released),
                                                            "Procurement Plan ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(45; "Total Purchase Invoices"; Decimal)
        {
            CalcFormula = sum("Purch. Inv. Line".Amount where("Procurement Plan" = field(Code)));
            FieldClass = FlowField;
        }
        field(46; "Total Purchase Credit Memos"; Decimal)
        {
            //CC//    CalcFormula = sum("Purch. Cr. Memo Line".Amount where("Procurement Plan" = field(Code)));
            FieldClass = FlowField;
        }
        field(47; "Total Actual Costs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Available Procurement Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
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
        field(481; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if Code = '' then begin

            PurchSetup.Get;
            PurchSetup.TestField("Procument Plan Nos");
            //NoSeriesMgt.InitSeries(PurchSetup."Procument Plan Nos", xRec.Code, 0D, Code, "No. Series");
            Code := NoSeriesMgt.GetNextNo(PurchSetup."Procument Plan Nos", WorkDate(), true);
        end;
        "Created By" := UserId;
        "Date Created" := Today;
        "Time Created" := Time;
        "Document Date" := Today;

        /*"End Date":=TIME;
        "Start Date":=TODAY;*/

    end;

    var
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit "No. Series";
        YearCodes: Record "Financial Year Code";
        Dimen: Text;
        Dimens: Text;
        PostCode: Record "Post Code";
        DimMgt: Codeunit DimensionManagement;
        plan: Record "Procurement Plan";

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', '', Code),
            "Global Dimension 1 Code", "Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}
