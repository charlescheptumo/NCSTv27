#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50029 tableextension50029 extends "Purchases & Payables Setup"
{
    fields
    {
        field(6603; "Board Resolution No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50001; "Requisition No"; Code[10])
        {
            Caption = 'Requisition No';
            TableRelation = "No. Series";
        }
        field(50002; "Quatation Request No"; Code[10])
        {
            Caption = 'Quatation Request No';
            TableRelation = "No. Series";
        }
        field(50003; "Stores Requisition No"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50004; "Max. Purchase Requisition"; Decimal)
        {
        }
        field(50005; "Tender Request No"; Code[10])
        {
            Caption = 'Tender Request No';
            TableRelation = "No. Series";
        }
        field(50006; "Stores Issue No"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50007; "Requisition Default Vendor"; Code[10])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                /*     Vendor.RESET;
                     IF Vendor.GET(xRec."Requisition Default Vendor") THEN BEGIN
                       Vendor."Requisition Default Vendor":=FALSE;
                       Vendor.MODIFY;
                     END;
                
                      Vendor.RESET;
                      IF Vendor.GET("Requisition Default Vendor") THEN BEGIN
                       Vendor."Requisition Default Vendor":=TRUE;
                       Vendor.MODIFY;
                     END;
                     */

            end;
        }
        field(50008; "Use Procurement Limits"; Boolean)
        {
        }
        field(50010; "Purchase Requisition Nos."; Code[10])
        {
            Caption = 'Purchase Requisition Nos.';
            TableRelation = "No. Series";
        }
        field(50011; "Archive Requisition on Quote"; Boolean)
        {
            Caption = 'Archive Requisition on Quote';
        }
        field(50012; "Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50013; "Store Req Item Jnl Template"; Code[10])
        {
            TableRelation = "Item Journal Template";
        }
        field(50014; "Store Req Item Jnl Batch"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Store Req Item Jnl Template"));
        }
        field(50015; "Posted Inv. Revaln Template"; Code[10])
        {
            TableRelation = "Item Journal Template".Name where(Type = const(Revaluation));
        }
        field(50016; "Posted Inv. Revaln Batch"; Code[10])
        {
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Posted Inv. Revaln Template"));
        }
        field(51000; "Inspection Before Posting?"; Boolean)
        {
        }
        field(56003; "PV Nos."; Code[10])
        {
            Caption = 'PV Nos.';
            TableRelation = "No. Series";
        }
        field(59001; "Procurement/Stores E-mail"; Text[100])
        {
        }
        field(59002; "PM E-mail"; Text[100])
        {
        }
        field(59003; "LPO Validity Period"; DateFormula)
        {
        }
        field(59004; "Quote Validity Period"; DateFormula)
        {
        }
        field(59005; "Store Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(59006; "Archive Store Requisition"; Boolean)
        {
        }
        field(59007; "Copy Remitance E-mail"; Boolean)
        {
        }
        field(59008; "Copy e-mail to User"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(59009; "EFT Mail Folder"; Text[250])
        {
        }
        field(59010; "Order Conditions"; Blob)
        {
            SubType = Memo;
        }
        field(59011; "LSO Nos."; Code[10])
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'LSO Nos.';
            TableRelation = "No. Series";
        }
        field(59012; "Transport Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(70000; "Procurement Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Classes".Code;
        }
        field(70001; "Procument Plan Nos"; Code[10])
        {
            Caption = 'Requisition No';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70002; "Request for Quotation Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70003; "Request for Proposals Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70004; "Tenders Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70005; "Expression of Interest Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70006; "Direct Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70007; "Low Value Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70008; "Specially Permitted Prcmnt Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70009; "Purchase Req No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70010; "Effective Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(70011; "Appointment Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70012; "Contract Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70013; "Legal Dept Code"; Code[50])
        {
            Caption = 'Legal Department Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(70014; "Tender Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70015; "RFP Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70016; "RFQ Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70018; "Direct Documents Path"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70019; "Inspection Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70020; "Current Year"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(70021; "Asset Disposal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(70022; "Procurement Manager Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Prequalification start"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
        }
        field(70024; "Prequalification end"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
        }
    }
}
