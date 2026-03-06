#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65104 "Closed Project Card"
{
    Caption = 'Closed Project Card';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Prices';
    RefreshOnActivate = true;
    SourceTable = Job;
    SourceTableView = where(Status = const(Completed));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Project No.';
                    Importance = Additional;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = NoFieldVisible;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Project Funding Contract No"; Rec."Project Funding Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Country Entry Code"; Rec."Country Entry Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Project Title Description';
                    ToolTip = 'Specifies a short description of the job.';
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Research Program"; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                }
                field("Research Project Area"; Rec."Research Project Area")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Bill-to Grantor No';
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the number of the customer who pays for the job.';

                    trigger OnValidate()
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the posting group that links transactions made for the job with the appropriate general ledger accounts according to the general posting setup.';
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = Basic;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date on which the job actually starts.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date on which the job is expected to be completed.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies a current status of the job. You can change the status for the job as it progresses. Final calculations can be made on completed jobs.';

                    trigger OnValidate()
                    begin
                        if (Rec.Status = Rec.Status::Completed) and Rec.Complete then begin
                            Rec.RecalculateJobWIP;
                            CurrPage.Update(false);
                        end;
                    end;
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the currency code you want to apply when creating invoices for a job. By default, the invoice currency code for a job is based on what currency code is defined on the customer card.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Principle Invistigator';
                    Importance = Promoted;
                    ToolTip = 'Specifies the person at your company who is responsible for the job.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Project Manager';
                    ToolTip = 'Specifies the person who is assigned to manage the job.';
                    Visible = JobSimplificationAvailable;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies when the job card was last modified.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Award Setup")
            {
                field("Project Type"; Rec."Project Type")
                {
                    ApplicationArea = Basic;
                }
                field("Assistance Type"; Rec."Assistance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Award Type"; Rec."Award Type")
                {
                    ApplicationArea = Basic;
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                }
                field("CFDA No."; Rec."CFDA No.")
                {
                    ApplicationArea = Basic;
                }
                field("Award Date"; Rec."Award Date")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Start Date"; Rec."Budget Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Budget End Date"; Rec."Budget End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Funding Sponsor ID"; Rec."Primary Funding Sponsor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Sponsor Name"; Rec."Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Grantor Details")
            {
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Grantor Name';
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the customer who pays for the job.';
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Grantor Contacts';
                    ToolTip = 'Specifies the number of the contact person at the customer''s billing address.';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Grantor Address';
                    Importance = Additional;
                    ToolTip = 'Specifies the address of the customer to whom you will send the invoice.';
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = Basic;
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Admin Contact ID"; Rec."Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Admin Name"; Rec."Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Financial Contact ID"; Rec."Grantor Financial Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Financial Contact Name"; Rec."Grantor Financial Contact Name")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Authorized Official ID"; Rec."Grantor Authorized Official ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Authorized Official"; Rec."Grantor Authorized Official")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Grantee Details")
            {
                field("Grantee Name"; Rec."Grantee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Address"; Rec."Grantee Address")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Address 2"; Rec."Grantee Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Post Code"; Rec."Grantee Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee City"; Rec."Grantee City")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Country/Region"; Rec."Grantee Country/Region")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Admin Contact ID"; Rec."Grantee Admin Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Admin Contact Name"; Rec."Grantee Admin Contact Name")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Financial Contact ID"; Rec."Grantee Financial Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Financial Contact Name"; Rec."Grantee Financial Contact Name")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Authorized Official ID"; Rec."Grantee Authorized Official ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantee Authorized Official"; Rec."Grantee Authorized Official")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Finance Metrics")
            {
                field("Total Approved Direct Costs"; Rec."Total Approved Direct Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Approved Indirect Costs"; Rec."Total Approved Indirect Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Indirect Cost (%)"; Rec."Indirect Cost (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Approved Budget"; Rec."Total Approved Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Total Actual Costs"; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Billable Amount"; Rec."Total Billable Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Invoiced Amount"; Rec."Total Invoiced Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Completed (%)"; Rec."Completed (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Invoiced (%)"; Rec."Invoiced (%)")
                {
                    ApplicationArea = Basic;
                }
            }
            part(JobTaskLines; "Job Task Lines Subform")
            {
                ApplicationArea = Jobs;
                Caption = 'Tasks';
                SubPageLink = "Job No." = field("No.");
                SubPageView = sorting("Job Task No.")
                              order(ascending);
            }
            group("WIP and Recognition")
            {
                Caption = 'WIP and Recognition';
                Visible = false;
                group("To Post")
                {
                    Caption = 'To Post';
                    field("WIP Posting Date"; Rec."WIP Posting Date")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the posting date that was entered when the Job Calculate WIP batch job was last run.';
                    }
                    field("Total WIP Sales Amount"; Rec."Total WIP Sales Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total WIP sales amount that was last calculated for the job. The WIP sales amount is the value in the WIP Sales Job WIP Entries window minus the value of the Recognized Sales Job WIP Entries window. For jobs with the Cost Value or Cost of Sales WIP methods, the WIP sales amount is normally 0.';
                    }
                    field("Applied Sales G/L Amount"; Rec."Applied Sales G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of all applied sales in the general ledger that are related to the job.';
                        Visible = false;
                    }
                    field("Total WIP Cost Amount"; Rec."Total WIP Cost Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total WIP cost amount that was last calculated for the job. The WIP cost amount is the value in the WIP Cost Job WIP Entries window minus the value of the Recognized Cost Job WIP Entries window. For jobs with Sales Value or Percentage of Completion WIP methods, the WIP cost amount is normally 0.';
                    }
                    field("Applied Costs G/L Amount"; Rec."Applied Costs G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of all applied costs that is based on to the selected job in the general ledger.';
                        Visible = false;
                    }
                    field("Recog. Sales Amount"; Rec."Recog. Sales Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the recognized sales amount that was last calculated for the job, which is the sum of the Recognized Sales Job WIP Entries.';
                    }
                    field("Recog. Costs Amount"; Rec."Recog. Costs Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the recognized cost amount that was last calculated for the job. The value is the sum of the entries in the Recognized Cost Job WIP Entries window.';
                    }
                    field("Recog. Profit Amount"; Rec.CalcRecognizedProfitAmount)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Recog. Profit Amount';
                        ToolTip = 'Specifies the recognized profit amount for the job.';
                    }
                    field("Recog. Profit %"; Rec.CalcRecognizedProfitPercentage)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Recog. Profit %';
                        ToolTip = 'Specifies the recognized profit percentage for the job.';
                    }
                    field("Acc. WIP Costs Amount"; Rec.CalcAccWIPCostsAmount)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Acc. WIP Costs Amount';
                        ToolTip = 'Specifies the total WIP costs for the job.';
                        Visible = false;
                    }
                    field("Acc. WIP Sales Amount"; Rec.CalcAccWIPSalesAmount)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Acc. WIP Sales Amount';
                        ToolTip = 'Specifies the total WIP sales for the job.';
                        Visible = false;
                    }
                    field("Calc. Recog. Sales Amount"; Rec."Calc. Recog. Sales Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of the recognized sales amount that is associated with job tasks for the job.';
                        Visible = false;
                    }
                    field("Calc. Recog. Costs Amount"; Rec."Calc. Recog. Costs Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of the recognized costs amount that is associated with job tasks for the job.';
                        Visible = false;
                    }
                }
                group(Posted)
                {
                    Caption = 'Posted';
                    field("WIP G/L Posting Date"; Rec."WIP G/L Posting Date")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the posting date that was entered when the Job Post WIP to General Ledger batch job was last run.';
                    }
                    field("Total WIP Sales G/L Amount"; Rec."Total WIP Sales G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total WIP sales amount that was last posted to the general ledger for the job. The WIP sales amount is the value in the WIP Sales Job WIP G/L Entries window minus the value in the Recognized Sales Job WIP G/L Entries window. For jobs with the Cost Value or Cost of Sales WIP methods, the WIP sales amount is normally 0.';
                    }
                    field("Total WIP Cost G/L Amount"; Rec."Total WIP Cost G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total WIP Cost amount that was last posted to the G/L for the job. The WIP Cost Amount for the job is the value WIP Cost Job WIP G/L Entries less the value of the Recognized Cost Job WIP G/L Entries. For jobs with WIP Methods of Sales Value or Percentage of Completion, the WIP Cost Amount is normally 0.';
                    }
                    field("Recog. Sales G/L Amount"; Rec."Recog. Sales G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total recognized sales amount that was last posted to the general ledger for the job. The recognized sales G/L amount for the job is the sum of the entries in the Recognized Sales Job WIP G/L Entries window.';
                    }
                    field("Recog. Costs G/L Amount"; Rec."Recog. Costs G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the total Recognized Cost amount that was last posted to the general ledger for the job. The Recognized Cost G/L amount for the job is the sum of the Recognized Cost Job WIP G/L Entries.';
                    }
                    field("Recog. Profit G/L Amount"; Rec.CalcRecognizedProfitGLAmount)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Recog. Profit G/L Amount';
                        ToolTip = 'Specifies the profit amount that is recognized with the general ledger for the job.';
                    }
                    field("Recog. Profit G/L %"; Rec.CalcRecognProfitGLPercentage)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Recog. Profit G/L %';
                        ToolTip = 'Specifies the profit percentage that is recognized with the general ledger for the job.';
                    }
                    field("Calc. Recog. Sales G/L Amount"; Rec."Calc. Recog. Sales G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of the recognized sales general ledger amount that is associated with job tasks for the job.';
                        Visible = false;
                    }
                    field("Calc. Recog. Costs G/L Amount"; Rec."Calc. Recog. Costs G/L Amount")
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies the sum of the recognized costs general ledger amount that is associated with job tasks for the job.';
                        Visible = false;
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Control1902018507; "Customer Statistics FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = false;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(167),
                              "No." = field("No.");
            }
            part(Control1902136407; "Job No. of Prices FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("No."),
                              "Resource Filter" = field("Resource Filter"),
                              "Posting Date Filter" = field("Posting Date Filter"),
                              "Resource Gr. Filter" = field("Resource Gr. Filter"),
                              "Planning Date Filter" = field("Planning Date Filter");
                Visible = true;
            }
            part(Control1905650007; "Job WIP/Recognition FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("No."),
                              "Resource Filter" = field("Resource Filter"),
                              "Posting Date Filter" = field("Posting Date Filter"),
                              "Resource Gr. Filter" = field("Resource Gr. Filter"),
                              "Planning Date Filter" = field("Planning Date Filter");
                Visible = false;
            }
            part(Control44; "Job Cost Factbox")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Details';
                SubPageLink = "No." = field("No.");
                Visible = JobSimplificationAvailable;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action(JobPlanningLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Project &Planning Lines';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (Budget) or you can specify what you actually agreed with your customer that he should pay for the job (Billable).';

                    trigger OnAction()
                    var
                        ProjectPlanningLine: Record "Job Planning Line";
                        ProjectPlanningLines: Page "Project Contract Lines";
                    begin
                        Rec.TestField(Rec."No.");
                        ProjectPlanningLine.FilterGroup(2);
                        ProjectPlanningLine.SetRange("Job No.", Rec."No.");
                        ProjectPlanningLine.FilterGroup(0);
                        ProjectPlanningLines.SetJobTaskNoVisible(true);
                        ProjectPlanningLines.SetTableview(ProjectPlanningLine);
                        ProjectPlanningLines.Editable := true;
                        ProjectPlanningLines.Run;
                    end;
                }
                action("&Dimensions")
                {
                    ApplicationArea = Dimensions;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(167),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to journal lines to distribute costs and analyze transaction history.';
                }
                action("&Statistics")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View this Project Contract''s statistics.';
                }
                separator(Action64)
                {
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Job),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action("&Online Map")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Online Map';
                    Image = Map;
                    ToolTip = 'View online map for addresses assigned to this job.';

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
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
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                action("&WIP Entries")
                {
                    ApplicationArea = Jobs;
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = Page "Job WIP Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Posting Group", "WIP Posting Date")
                                  order(descending);
                    ToolTip = 'View entries for the job that are posted as work in process.';
                }
                action("WIP &G/L Entries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = Page "Job WIP G/L Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.")
                                  order(descending);
                    ToolTip = 'View the job''s WIP G/L entries.';
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                action("&Resource")
                {
                    ApplicationArea = Suite;
                    Caption = '&Resource';
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job Resource Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s resource prices.';
                }
                action("&Item")
                {
                    ApplicationArea = Suite;
                    Caption = '&Item';
                    Image = Item;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s item prices.';
                }
                action("&G/L Account")
                {
                    ApplicationArea = Suite;
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Job G/L Account Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s G/L account prices.';
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action("Resource &Allocated per Job")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = Page "Resource Allocated per Job";
                    ToolTip = 'View this job''s resource allocation.';
                }
                action("Res. Gr. All&ocated per Job")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Res. Gr. All&ocated per Job';
                    Image = ResourceGroup;
                    RunObject = Page "Res. Gr. Allocated per Job";
                    ToolTip = 'View the job''s resource group allocation.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Ledger E&ntries';
                    Image = JobLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Task No.", "Entry Type", "Posting Date")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
            group("Research Project")
            {
                action("Project Research Team List")
                {
                    ApplicationArea = Basic;
                    Image = Group;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Project Research Team List";
                    RunPageLink = "Job No" = field("No.");
                }
                action("Project Research Objectives")
                {
                    ApplicationArea = Basic;
                    Image = Questionaire;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Project Research Objectives";
                    RunPageLink = "Project No" = field("No.");
                }
                action("Effort & Payroll Matrix list")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Effort & Payroll Matrix list';
                    Image = PayrollStatistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Effort & Payroll Matrix list";
                    RunPageLink = "Project No" = field("No.");
                }
            }
        }
        area(processing)
        {
            group("&Copy")
            {
                Caption = '&Copy';
                Image = Copy;
                action("Copy Job Tasks &from...")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Copy Job Tasks &from...';
                    Ellipsis = true;
                    Image = CopyToTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Open the Copy Job Tasks page.';

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetToJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
                action("Copy Job Tasks &to...")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Copy Job Tasks &to...';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Open the Copy Jobs To page.';

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetFromJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
            }
            group(ActionGroup26)
            {
                Caption = 'W&IP';
                Image = WIP;
                action("<Action82>")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Calculate WIP';
                    Ellipsis = true;
                    Image = CalculateWIP;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Run the Job Calculate WIP batch job.';

                    trigger OnAction()
                    var
                        Job: Record Job;
                    begin
                        Rec.TestField(Rec."No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        Report.RunModal(Report::"Job Calculate WIP", true, false, Job);
                    end;
                }
                action("<Action83>")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Post WIP to G/L';
                    Ellipsis = true;
                    Image = PostOrder;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ShortCutKey = 'F9';
                    ToolTip = 'Run the Job Post WIP to G/L batch job.';

                    trigger OnAction()
                    var
                        Job: Record Job;
                    begin
                        Rec.TestField(Rec."No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        Report.RunModal(Report::"Job Post WIP to G/L", true, false, Job);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Job Actual to Budget")
            {
                ApplicationArea = Suite;
                Caption = 'Job Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Actual To Budget";
                ToolTip = 'Compare budgeted and usage amounts for selected jobs. All lines of the selected job show quantity, total cost, and line amount.';
            }
            action("Job Analysis")
            {
                ApplicationArea = Suite;
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Analysis";
                ToolTip = 'Analyze the job, such as the budgeted prices, usage prices, and billable prices, and then compares the three sets of prices.';
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = Suite;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job - Planning Lines";
                ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';
            }
            action("Job - Suggested Billing")
            {
                ApplicationArea = Suite;
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Suggested Billing";
                ToolTip = 'View a list of all jobs, grouped by customer, how much the customer has already been invoiced, and how much remains to be invoiced, that is, the suggested billing.';
            }
            action("Report Job Quote")
            {
                ApplicationArea = Suite;
                Caption = 'Preview Job Quote';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTip = 'Open the Job Quote report.';

                trigger OnAction()
                var
                    Job: Record Job;
                begin
                    Job.SetCurrentkey("No.");
                    Job.SetFilter("No.", Rec."No.");
                    Report.Run(Report::"Job Quote", true, false, Job);
                end;
            }
            action("Send Job Quote")
            {
                ApplicationArea = Suite;
                Caption = 'Send Job Quote';
                Image = SendTo;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTip = 'Send the job quote to the customer. You can change the way that the document is sent in the window that appears.';

                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Jobs-Send", Rec);
                end;
            }
        }
    }

    trigger OnInit()
    begin
       //cc//   JobSimplificationAvailable := Rec.IsJobSimplificationAvailable;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Project;
    end;

    trigger OnOpenPage()
    begin
        Rec.FnMetricsComputation();
        //Ushindi
        Rec.CalcFields(Rec."Project Budget", Rec."Actual Project Costs", Rec."PO Commitments", Rec."PRN Commitments", Rec."Store Requisition Commitments", Rec."Imprest Application Commitment");
        TotalBudgetCommitments := Rec."PO Commitments" + Rec."PRN Commitments" + Rec."Store Requisition Commitments" + Rec."Imprest Application Commitment";
        AvailableFunds := Rec."Project Budget" - Rec."Actual Project Costs" - TotalBudgetCommitments;
        //Ushindi

        SetNoFieldVisible;
        IsCountyVisible := FormatAddress.UseCounty(Rec."Bill-to Country/Region Code");

        Rec."Document Type" := Rec."document type"::Project;
    end;

    var
        FormatAddress: Codeunit "Format Address";
        JobSimplificationAvailable: Boolean;
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;
        NoFieldVisible: Boolean;
        IsCountyVisible: Boolean;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.Update;
    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.JobNoIsVisible;
    end;
}
