#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50041 pageextension50041 extends "Purchases & Payables Setup"
{
    layout
    {
        

        //Unsupported feature: Property Deletion (CaptionML) on ""Background Posting"(Control 7)".


        //Unsupported feature: Property Deletion (GroupType) on ""Background Posting"(Control 7)".

        addafter("Copy Cmts Ret.Ord. to Cr. Memo")
        {
            field("Prequalification start"; Rec."Prequalification start")
            {
                ApplicationArea = Basic;
            }
            field("Prequalification end"; Rec."Prequalification end")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Ignore Updated Addresses")
        {
            field("Current Year"; Rec."Current Year")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Manager Email"; Rec."Procurement Manager Email")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("Store Requisition Nos."; Rec."Store Requisition Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Appointment Nos."; Rec."Appointment Nos.")
            {
                ApplicationArea = Basic;
            }
            group(Procurement)
            {
                Caption = 'Procurement';
                field("Procument Plan Nos"; Rec."Procument Plan Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procument Plan Nos';
                }
                field("Request for Quotation Nos."; Rec."Request for Quotation Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Request for Proposals Nos."; Rec."Request for Proposals Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Tenders Nos"; Rec."Tenders Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Expression of Interest Nos."; Rec."Expression of Interest Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Prcmnt Nos"; Rec."Direct Prcmnt Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Low Value Prcmnt Nos"; Rec."Low Value Prcmnt Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        addafter("Notify On Success")
        {
            field("Contract Nos"; Rec."Contract Nos")
            {
                ApplicationArea = Basic;
            }
            field("Inspection Nos"; Rec."Inspection Nos")
            {
                ApplicationArea = Basic;
            }
            field("Purchase Requisition Nos."; Rec."Purchase Requisition Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Asset Disposal Nos"; Rec."Asset Disposal Nos")
            {
                ApplicationArea = Basic;
            }
            field("RFP Documents Path"; Rec."RFP Documents Path")
            {
                ApplicationArea = Basic;
            }
            field("RFQ Documents Path"; Rec."RFQ Documents Path")
            {
                ApplicationArea = Basic;
            }
            field("Direct Documents Path"; Rec."Direct Documents Path")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        OrderConditions: BigText;
        Instr: InStream;
        OutStr: OutStream;
        OrderConditionsTxt: Text;
}
