#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50055 pageextension50055 extends "Employee Card"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Grounds for Term. Code"(Control 58)".


        //Unsupported feature: Property Modification (Name) on ""Grounds for Term. Code"(Control 58)".

        modify(Control13)
        {
            Visible = false;
        }
    
        addfirst("Address & Contact")
        {
            group(Control1367)
            {
            }
        }
        addafter("Salespers./Purch. Code")
        {
            field("Research Center"; Rec."Research Center")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Birth Date")
        {
            field("Incremental Month"; Rec."Incremental Month")
            {
                ApplicationArea = Basic;
            }
        }
       
    }
    actions
    {
        addafter(Attachments)
        {
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
        addafter(PayEmployee)
        {
            action("Create Customer Imprest A/C")
            {
                ApplicationArea = Basic;
                Enabled = ShowCust;
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    if Rec.CreateCustomer then
                        Message(Text000, 'Imprest A/C')
                    else
                        Message(Text001, 'Imprest A/C');
                end;
            }
            action("Create Resource A/C")
            {
                ApplicationArea = Basic;
                Enabled = ShowResource;
                Image = Resource;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.CreateResource then
                        Message(Text000, 'Resource')
                    else
                        Message(Text001, 'Resource');
                end;
            }
        }
    }


    //Unsupported feature: Property Modification (Id) on "FormatAddress(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //FormatAddress : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FormatAddress : 1553;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "IsCountyVisible(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //IsCountyVisible : 1002;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsCountyVisible : 1552;
    //Variable type has not been exported.

    var
        [InDataSet]
        ShowCust: Boolean;
        [InDataSet]
        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
}
