#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 75001 "Procurement Officers"
{
    AdditionalSearchTerms = 'sales representative';
    ApplicationArea = Basic, Suite;
    Caption = 'Procurement Officers';
    CardPageID = "Procurement Officer Card";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Salesperson';
    SourceTable = "Salesperson/Purchaser";
    SourceTableView = where("Role Type" = const("Procurement Officer"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the record.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the name of the record.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    ToolTip = 'Specifies the salesperson''s or purchaser''s telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field("Role Type"; Rec."Role Type")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Status"; Rec."Employee Status")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                    Visible = false;
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
        area(navigation)
        {
            group("&Salesperson")
            {
                Caption = '&Salesperson';
                Image = SalesPerson;
                action("Tea&ms")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Tea&ms';
                    Image = TeamSales;
                    RunObject = Page "Salesperson Teams";
                    RunPageLink = "Salesperson Code" = field(Code);
                    RunPageView = sorting("Salesperson Code");
                    ToolTip = 'View or edit any teams that the salesperson/purchaser is a member of.';
                }
                action("Con&tacts")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Con&tacts';
                    Image = CustomerContact;
                    RunObject = Page "Contact List";
                    RunPageLink = "Salesperson Code" = field(Code);
                    RunPageView = sorting("Salesperson Code");
                    ToolTip = 'View a list of contacts that are associated with the salesperson/purchaser.';
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        Promoted = true;
                        PromotedCategory = Category4;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(13),
                                      "No." = field(Code);
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension = R;
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        Promoted = true;
                        PromotedCategory = Category4;
                        ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';

                        trigger OnAction()
                        var
                            SalespersonPurchaser: Record "Salesperson/Purchaser";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(SalespersonPurchaser);
                            DefaultDimMultiple.SetMultiRecord(SalespersonPurchaser, Rec.FieldNo(Rec.Code));
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(Statistics)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Salesperson Statistics";
                    RunPageLink = Code = field(Code);
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
                action("C&ampaigns")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'C&ampaigns';
                    Image = Campaign;
                    RunObject = Page "Campaign List";
                    RunPageLink = "Salesperson Code" = field(Code);
                    RunPageView = sorting("Salesperson Code");
                    ToolTip = 'View or edit any campaigns that the salesperson/purchaser is assigned to.';
                }
                action("S&egments")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'S&egments';
                    Image = Segment;
                    RunObject = Page "Segment List";
                    RunPageLink = "Salesperson Code" = field(Code);
                    RunPageView = sorting("Salesperson Code");
                    ToolTip = 'View a list of all segments.';
                }
                separator(Action22)
                {
                    Caption = '';
                }
                action("Interaction Log E&ntries")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Interaction Log E&ntries';
                    Image = InteractionLog;
                    RunObject = Page "Interaction Log Entries";
                    RunPageLink = "Salesperson Code" = field(Code);
                    RunPageView = sorting("Salesperson Code");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View a list of the interactions that you have logged, for example, when you create an interaction, print a cover sheet, a sales order, and so on.';
                }
                action("Postponed &Interactions")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Postponed &Interactions';
                    Image = PostponedInteractions;
                    RunObject = Page "Postponed Interactions";
                    RunPageLink = "Salesperson Code" = field(Code);
                    RunPageView = sorting("Salesperson Code");
                    ToolTip = 'View postponed interactions for the salesperson/purchaser.';
                }
                action("T&asks")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'T&asks';
                    Image = TaskList;
                    RunObject = Page "Task List";
                    RunPageLink = "Salesperson Code" = field(Code),
                                  "System To-do Type" = filter(Organizer | "Salesperson Attendee");
                    RunPageView = sorting("Salesperson Code");
                    ToolTip = 'View tasks for the salesperson/purchaser.';
                }
                action("Oppo&rtunities")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Oppo&rtunities';
                    Image = OpportunitiesList;
                    RunObject = Page "Opportunity List";
                    RunPageLink = "Salesperson Code" = field(Code);
                    RunPageView = sorting("Salesperson Code");
                    ToolTip = 'View opportunities for the salesperson/purchaser.';
                }
            }
            group(ActionGroupCRM)
            {
                Caption = 'Dynamics 365 for Sales';
                Visible = CRMIntegrationEnabled;
                action(CRMGotoSystemUser)
                {
                    ApplicationArea = Suite;
                    Caption = 'User';
                    Image = CoupledUser;
                    ToolTip = 'Open the coupled Dynamics 365 for Sales system user.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record" = IM;
                    ApplicationArea = Suite;
                    Caption = 'Synchronize';
                    Image = Refresh;
                    ToolTip = 'Send or get updated data to or from Dynamics 365 for Sales.';

                    trigger OnAction()
                    var
                        SalespersonPurchaser: Record "Salesperson/Purchaser";
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        SalespersonPurchaserRecordRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(SalespersonPurchaser);
                        SalespersonPurchaser.Next;

                        if SalespersonPurchaser.Count = 1 then
                            CRMIntegrationManagement.UpdateOneNow(SalespersonPurchaser.RecordId)
                        else begin
                            SalespersonPurchaserRecordRef.GetTable(SalespersonPurchaser);
                            CRMIntegrationManagement.UpdateMultipleNow(SalespersonPurchaserRecordRef);
                        end
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment = 'Coupling is a noun';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Dynamics 365 for Sales record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Set Up Coupling';
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Dynamics 365 for Sales user.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Delete Coupling';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Dynamics 365 for Sales user.';

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
                        end;
                    }
                }
                action(ShowLog)
                {
                    ApplicationArea = Suite;
                    Caption = 'Synchronization Log';
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the salesperson/purchaser table.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(Rec.RecordId);
                    end;
                }
            }
        }
        area(processing)
        {
            action(CreateInteraction)
            {
                AccessByPermission = TableData Attachment = R;
                ApplicationArea = All;
                Caption = 'Create &Interaction';
                Ellipsis = true;
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Use a batch job to help you create interactions for the involved salespeople or purchasers.';
                Visible = CreateInteractionVisible;

                trigger OnAction()
                begin
                    Rec.CreateInteraction;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        if CRMIntegrationEnabled then
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
    end;

    trigger OnInit()
    var
        SegmentLine: Record "Segment Line";
    begin
        CreateInteractionVisible := SegmentLine.ReadPermission;
    end;

    trigger OnOpenPage()
    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        [InDataSet]
        CreateInteractionVisible: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;

    procedure GetSelectionFilter(): Text
    var
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(SalespersonPurchaser);
        exit(SelectionFilterManagement.GetSelectionFilterForSalesPersonPurchaser(SalespersonPurchaser));
    end;
}
