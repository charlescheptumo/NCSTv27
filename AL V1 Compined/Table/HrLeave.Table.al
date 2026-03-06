#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69028 "Hr Leave"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,Leave Application,Imprest Memo';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition","Leave Application","Imprest Memo";
        }
        field(3; "Leave Type"; Code[20])
        {
            TableRelation = "Leave Types";

            trigger OnValidate()
            begin

                if LeaveTypes.Get("Leave Type") then begin
                    Description := LeaveTypes.Description;

                    Empl.Get("Request-By No.");

                    Empl.SetRange(Empl."Date Filter", 0D, Date);
                    if "Leave Type" = 'ANNUAL' then
                        Empl.CalcFields(Empl."Annual Leave Days");
                    //MESSAGE('%1',Empl."Annual Leave Days");

                    "Balance Brought Foward" := Empl."Annual Leave Days";

                end;
            end;
        }
        field(4; "No. Of Days"; Decimal)
        {
            MinValue = 0;

            trigger OnValidate()
            begin
                if "No. Of Days" > "Balance Brought Foward" then
                    Error('You cannot request Leave days exceeding your Leave Balance.Please Check or confirm your balance with HR!');
                "Balance Carried Foward" := "Balance Brought Foward" - "No. Of Days";
            end;
        }
        field(5; "From Date"; Date)
        {
        }
        field(6; "To Date"; Date)
        {
        }
        field(7; "Balance Brought Foward"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(8; "Balance Carried Foward"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(9; "Leave Posted"; Boolean)
        {
        }
        field(10; "Leave Posted By"; Code[50])
        {
        }
        field(11; "Leave Posting Date"; Date)
        {
        }
        field(12; "Leave Posting Time"; Time)
        {
        }
        field(13; Description; Text[30])
        {
        }
        field(14; "Request-By No."; Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin


                //CAW 240908 EALAYER
                RecEmp.Get("Request-By No.");
                "Request-By Name" := RecEmp.FullName;
                "Shortcut Dimension 1 Code" := RecEmp."Global Dimension 1 Code";
                "Shortcut Dimension 2 Code" := RecEmp."Global Dimension 2 Code";


                TestField(Status, Status::Open);
            end;
        }
        field(15; "Request-By Name"; Text[50])
        {
            Editable = false;
        }
        field(16; "Requester ID"; Code[50])
        {
            Editable = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(17; Status; Option)
        {
            Caption = 'Status';
            Editable = true;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(18; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                TestField(Status, Status::Open);
            end;
        }
        field(19; Date; Date)
        {
        }
        field(20; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(21; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;
        }
        field(3978; Test; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        "......New Var............": Integer;
        RecEmp: Record Employee;
        Users: Record User;
        DefDim: Record "Default Dimension";
        TempDimensionSetEntry: Record "Dimension Set Entry";
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        BeneficiaryRec: Record Customer;
        LeaveTypes: Record "Leave Types";
        Empl: Record Employee;
        Jobs: Record Job;
        DimMgt: Codeunit DimensionManagement;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        UserSetupMgt: Codeunit "User Setup Management";

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "No." <> '' then
            Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            //IF PurchLinesExist THEN
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "No."),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify;
            //IF PurchLinesExist THEN
            //UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;
}
