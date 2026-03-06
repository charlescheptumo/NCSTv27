#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70015 "Supplier Selection1"
{

    fields
    {
        field(1; "Reference No."; Code[50])
        {
            TableRelation = "Procurement Request";

            trigger OnValidate()
            begin
                if ProcurementRequest.Get("Reference No.") then begin
                    "Supplier Category" := ProcurementRequest."Supplier Category";
                end;
            end;
        }
        field(2; "Supplier Name"; Text[100])
        {
            TableRelation = "Prequalified Suppliers1".Name where(Category = field("Supplier Category"));
        }
        field(3; "Supplier Category"; Code[10])
        {
        }
        field(4; Awarded; Boolean)
        {

            trigger OnValidate()
            begin
                /*AwardedSuppliers.RESET;
                AwardedSuppliers.SETRANGE("Reference No.","Reference No.");
                AwardedSuppliers.SETRANGE(Awarded,TRUE);
                  IF AwardedSuppliers.FIND('-') THEN
                    ERROR(Text000,AwardedSuppliers."Supplier Name");
                 */

            end;
        }
        field(5; "Receipt No."; Code[50])
        {
            TableRelation = "Receipts Header1";
        }
        field(6; Date; Date)
        {
        }
        field(7; Receiver; Code[50])
        {
            TableRelation = User;
        }
        field(8; Comments; Text[250])
        {
        }
        field(9; Invited; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Physical Address"; Text[250])
        {
            CalcFormula = lookup("Prequalified Suppliers1"."Physical Address" where("Ref No." = field("Reference No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Reference No.", "Supplier Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementRequest: Record "Procurement Request";
        AwardedSuppliers: Record "Supplier Selection1";
        Text000: label 'You cannot award more than one Supplier, Supplier %1 has already been awarded';


    procedure CreateQuote(var SupplierSelection: Record "Supplier Selection1")
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseRequest: Record "Procurement Request";
        PreQualifiedList: Record "Prequalified Suppliers1";
        ProcurementRequestLine: Record "Procurement Request Lines";
    begin
        /* Create a supplier from the list of Pre-Qualified Suppliers */
        if Awarded then begin
            PreQualifiedList.Reset;
            PreQualifiedList.SetRange(PreQualifiedList.Name, SupplierSelection."Supplier Name");
            PreQualifiedList.SetRange(PreQualifiedList.Category, SupplierSelection."Supplier Category");
            if PreQualifiedList.Find('-') then begin
                if PreQualifiedList."Vendor No" = '' then
                    if Confirm('The system will create Vendor %1 Do you want to continue?', true, SupplierSelection."Supplier Name") then begin
                        PreQualifiedList.CreateVend(PreQualifiedList);

                    end;

                PurchaseHeader.Init;
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::Quote;
                PurchaseHeader."No." := '';
                PurchaseHeader."Buy-from Vendor No." := PreQualifiedList."Vendor No";
                PurchaseHeader.Validate(PurchaseHeader."Buy-from Vendor No.");
                if PurchaseRequest.Get(SupplierSelection."Reference No.") then begin
                    PurchaseHeader."Procurement Plan Item" := PurchaseRequest."Procurement Method";
                    PurchaseHeader."No." := PurchaseRequest."Requisition No";
                    PurchaseHeader."Request Ref No" := PurchaseRequest.No;

                end;
                PurchaseHeader.Insert(true);

                ProcurementRequestLine.Reset;
                ProcurementRequestLine.SetRange(ProcurementRequestLine."Requisition No", SupplierSelection."Reference No.");
                if ProcurementRequestLine.Find('-') then
                    repeat

                        PurchaseLine.Init;
                        PurchaseLine."Document Type" := PurchaseHeader."Document Type";
                        PurchaseLine."Document No." := PurchaseHeader."No.";
                        PurchaseLine."Line No." := ProcurementRequestLine."Line No";
                        PurchaseLine.Type := ProcurementRequestLine.Type;
                        PurchaseLine."No." := ProcurementRequestLine.No;
                        //MESSAGE('pURCHASE nO. %1',PurchaseLine."No.");
                        PurchaseLine.Validate(PurchaseLine."No.");
                        PurchaseLine.Description := ProcurementRequestLine.Description;
                        PurchaseLine."Unit of Measure" := ProcurementRequestLine."Unit of Measure";
                        PurchaseLine.Quantity := ProcurementRequestLine.Quantity;
                        PurchaseLine.Validate(Quantity);
                        PurchaseLine."Direct Unit Cost" := ProcurementRequestLine."Unit Price";
                        PurchaseLine.Validate("Direct Unit Cost");
                        PurchaseLine.Insert;


                    until ProcurementRequestLine.Next = 0;
            end;
            Codeunit.Run(Codeunit::"Purch.-Quote to Order (Yes/No)", PurchaseHeader);
        end;

    end;
}
