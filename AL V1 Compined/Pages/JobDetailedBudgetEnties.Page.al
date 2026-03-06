#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65110 "Job Detailed Budget Enties"
{
    ApplicationArea = Basic;
    Caption = 'Job Detailed Budget Enties';
    DataCaptionFields = "Job No.";
    Editable = false;
    PageType = List;
    SaveValues = true;
    SourceTable = "Job Task";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                IndentationColumn = DescriptionIndent;
                IndentationControls = Description;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the number of the related job.';
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    Style = Strong;
                    StyleExpr = StyleIsStrong;
                    ToolTip = 'Specifies a description of the job task. You can enter anything that is meaningful in describing the task. The description is copied and used in descriptions on the job planning line.';
                }
                field("Schedule (Total Cost)"; Rec."Schedule (Total Cost)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies, in the local currency, the total budgeted cost for the job task during the time period in the Planning Date Filter field.';
                }
                field("Usage (Total Cost)"; Rec."Usage (Total Cost)")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Actual (Total Cost)';
                    ToolTip = 'Specifies, in local currency, the total cost of the usage of items, resources and general ledger expenses posted on the job task during the time period in the Posting Date Filter field.';
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
            group("&Job Task")
            {
                Caption = '&Job Task';
                Image = Task;
                action(JobPlanningLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job &Planning Lines';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that they should pay for the job (billable).';

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        Rec.TestField(Rec."Job Task Type", Rec."job task type"::Posting);
                        Rec.TestField(Rec."Job No.");
                        Rec.TestField(Rec."Job Task No.");
                        JobPlanningLine.FilterGroup(2);
                        JobPlanningLine.SetRange("Job No.", Rec."Job No.");
                        JobPlanningLine.SetRange("Job Task No.", Rec."Job Task No.");
                        JobPlanningLine.FilterGroup(0);
                        JobPlanningLines.SetJobTaskNoVisible(false);
                        JobPlanningLines.SetTableview(JobPlanningLine);
                        JobPlanningLines.Run;
                    end;
                }
                action(JobTaskStatistics)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job Task &Statistics';
                    Image = StatisticsDocument;
                    RunObject = Page "Job Task Statistics";
                    RunPageLink = "Job No." = field("Job No."),
                                  "Job Task No." = field("Job Task No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistics for the job task.';
                }
                action("Job &Task Card")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job &Task Card';
                    Image = Task;
                    RunObject = Page "Job Task Card";
                    RunPageLink = "Job No." = field("Job No."),
                                  "Job Task No." = field("Job Task No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View detailed information about a job task, such as the description of the task and the type, which can be either a heading, a posting, a begin-total, an end-total, or a total.';
                }
                separator(Action65)
                {
                    Caption = '-';
                }
                group("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    action("Dimensions-&Single")
                    {
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-&Single';
                        Image = Dimensions;
                        RunObject = Page "Job Task Dimensions";
                        RunPageLink = "Job No." = field("Job No."),
                                      "Job Task No." = field("Job Task No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension = R;
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';

                        trigger OnAction()
                        var
                            JobTask: Record "Job Task";
                            JobTaskDimensionsMultiple: Page "Job Task Dimensions Multiple";
                        begin
                            CurrPage.SetSelectionFilter(JobTask);
                            JobTaskDimensionsMultiple.SetMultiJobTask(JobTask);
                            JobTaskDimensionsMultiple.RunModal;
                        end;
                    }
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Job Ledger E&ntries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job Ledger E&ntries';
                    Image = JobLedger;
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = field("Job No."),
                                  "Job Task No." = field("Job Task No.");
                    RunPageView = sorting("Job No.", "Job Task No.");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the job ledger entries.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DescriptionIndent := Rec.Indentation;
        StyleIsStrong := Rec."Job Task Type" <> Rec."job task type"::Posting;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.ClearTempDim;
    end;

    var
        [InDataSet]
        DescriptionIndent: Integer;
        [InDataSet]
        StyleIsStrong: Boolean;

    procedure SetPurchLineFilters(var PurchLine: Record "Purchase Line"; JobNo: Code[20]; JobTaskNo: Code[20])
    begin
        Rec.ApplyPurchaseLineFilters(PurchLine, JobNo, JobTaskNo);
    end;
}
