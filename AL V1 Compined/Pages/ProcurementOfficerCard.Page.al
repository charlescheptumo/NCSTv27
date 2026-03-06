#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75002 "Procurement Officer Card"
{
    Caption = 'Salesperson/Purchaser Card';
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Navigate,Salesperson';
    SourceTable = "Salesperson/Purchaser";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code for the salesperson or purchaser.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the salesperson or purchaser.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = RelationshipMgmt;
                    Editable = false;
                    ToolTip = 'Specifies the salesperson''s job title.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Status"; Rec."Employee Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = RelationshipMgmt;
                    Editable = false;
                    ToolTip = 'Specifies the salesperson''s telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = RelationshipMgmt;
                    Editable = false;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the salesperson''s email address.';
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    Editable = false;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    Editable = false;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
            }
        }
        area(factboxes)
        {
            part(Control3; "Salesperson/Purchaser Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = Code = field(Code);
            }
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
        area(navigation)
        {
            group("&Salesperson")
            {
                Caption = '&Salesperson';
                Image = SalesPerson;
                action("Assigned RFIs")
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Request For Information";
                    RunPageLink = "Assigned Procurement Officer" = field(Code);
                }
                action("Assigned Invitation For Supply")
                {
                    ApplicationArea = Basic;
                    Image = InwardEntry;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Assigned Procurement Officer" = field(Code);
                }
                action("Assigned Quotes")
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Quotes";
                    RunPageLink = "Purchaser Code" = field(Code);
                }
                action("Assigned Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Order List";
                    RunPageLink = "Purchaser Code" = field(Code);
                }
                action("Assigned Purchase Agreements")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Blanket Purchase Orders";
                    RunPageLink = "Purchaser Code" = field(Code);
                }
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(13),
                                  "No." = field(Code);
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action(Statistics)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Salesperson Statistics";
                    RunPageLink = Code = field(Code);
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        if CRMIntegrationEnabled then begin
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
            if Rec.Code <> xRec.Code then
                CRMIntegrationManagement.SendResultNotification(Rec);
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if xRec.Code = '' then
            Rec.Reset;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Role Type" := Rec."role type"::"Procurement Officer";
    end;

    trigger OnOpenPage()
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
}
