#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75061 "Supplier Contacts"
{
    ApplicationArea = Basic;
    Caption = 'Supplier Contacts';
    DataCaptionFields = "Business Relation Code";
    PageType = List;
    SourceTable = "Contact Business Relation";
    SourceTableView = where("Link to Table" = filter(Vendor));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the contact number of the company you are assigning a business relation.';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = RelationshipMgmt;
                    DrillDown = false;
                    ToolTip = 'Specifies the name of the contact company to which you assign a business relation. This field is not editable.';
                }
                field("Link to Table"; Rec."Link to Table")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the name of the table to which the contact is linked. There are four possible options: &lt;blank&gt;, Vendor, Customer, and Bank Account.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    var
        Contact: Record Contact;
    begin
        Contact.TouchContact(Rec."Contact No.")
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Contact: Record Contact;
    begin
        Contact.TouchContact(Rec."Contact No.")
    end;

    trigger OnModifyRecord(): Boolean
    var
        Contact: Record Contact;
    begin
        Contact.TouchContact(Rec."Contact No.")
    end;
}
