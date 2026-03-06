#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50006 pageextension50006 extends "Customer Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Customer Card"(Page 21)".

    layout
    {
        addafter(Name)
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ApplicationArea = Basic;
                Caption = 'Customer Type';
                Visible = false;
            }
        }
        addafter(Blocked)
        {
            field("Funding Class"; Rec."Funding Class")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Preferred Bank Account Code")
        {
            field("Customer's Bank"; Rec."Employee's Bank")
            {
                ApplicationArea = Basic;
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = Basic;
            }
            field("Bank Branch"; Rec."Bank Branch")
            {
                ApplicationArea = Basic;
            }
            field("Bank Branch Name"; Rec."Bank Branch Name")
            {
                ApplicationArea = Basic;
            }
            field("Bank Account Number"; Rec."Bank Account Number")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
       
        addafter(NewSalesQuoteAddin)
        {
            action(NEWACTION)
            {
                AccessByPermission = TableData "Sales Header" = RIM;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                ToolTip = 'Create a sales invoice for the customer.';
                Visible = IsOfficeAddin;

                trigger OnAction()
                begin
                    Rec.CreateAndShowNewInvoice;
                end;
            }
        }
       
    }

    //Unsupported feature: Property Deletion (RefreshOnActivate).

}
