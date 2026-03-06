#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 57001 "Imprest Memo"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Memo.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Imprest Memo"; "Imprest Memo")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.", Project;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(Job_ImprestMemo; "Imprest Memo".Job)
            {
            }
            column(JobTask_ImprestMemo; "Imprest Memo"."Job  Task")
            {
            }
            column(JobName_ImprestMemo; "Imprest Memo"."Job Name")
            {
            }
            column(JobTaskName_ImprestMemo; "Imprest Memo"."Job Task Name")
            {
            }
            column(JobTaskBudget_ImprestMemo; "Imprest Memo"."Job Task Budget")
            {
            }
            column(JobTaskRemainingAmount_ImprestMemo; "Imprest Memo"."Job Task Remaining Amount")
            {
            }
            column(No_ImprestMemo; "Imprest Memo"."No.")
            {
            }
            column(Date_ImprestMemo; "Imprest Memo".Date)
            {
            }
            column(Project_ImprestMemo; "Imprest Memo".Project)
            {
            }
            column(ProjectDescription_ImprestMemo; "Imprest Memo"."Project Description")
            {
            }
            column(Objective_ImprestMemo; ObjText)
            {
            }
            column(TermsofReference_ImprestMemo; TORText)
            {
            }
            column(Requestor_ImprestMemo; "Imprest Memo".Requestor)
            {
            }
            column(RequestorName_ImprestMemo; "Imprest Memo"."Requestor Name")
            {
            }
            column(TotalSubsistenceAllowance_ImprestMemo; "Imprest Memo"."Total Subsistence Allowance")
            {
            }
            column(VoteItem_ImprestMemo; "Imprest Memo"."Vote Item")
            {
            }
            column(VoteAmount_ImprestMemo; "Imprest Memo"."Vote Amount")
            {
            }
            column(ActualtoDate_ImprestMemo; "Imprest Memo"."Actual to Date")
            {
            }
            column(Commitments_ImprestMemo; "Imprest Memo".Commitments)
            {
            }
            column(VoteItemDesc_ImprestMemo; "Imprest Memo"."Vote Item Desc.")
            {
            }
            column(TotalFuelCost_ImprestMemo; "Imprest Memo"."Total Fuel Costs")
            {
            }
            column(TotalMaintenanceCost_ImprestMemo; "Imprest Memo"."Total Maintenance Costs")
            {
            }
            column(TotalCasualsCost_ImprestMemo; "Imprest Memo"."Total Casuals Cost")
            {
            }
            column(TotalTransportCosts_ImprestMemo; "Imprest Memo"."Total Transport Costs")
            {
            }
            column(TotalOtherCosts_ImprestMemo; "Imprest Memo"."Total Other Costs")
            {
            }
            column(Subject_ImprestMemo; "Imprest Memo".Subject)
            {
            }
            column(Status_ImprestMemo; "Imprest Memo".Status)
            {
            }
            column(Posted_ImprestMemo; "Imprest Memo".Posted)
            {
            }
            column(GlobalDimension1Code_ImprestMemo; "Imprest Memo"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ImprestMemo; "Imprest Memo"."Global Dimension 2 Code")
            {
            }
            column(DatetimePosted_ImprestMemo; "Imprest Memo"."Datetime Posted")
            {
            }
            column(PostedBy_ImprestMemo; "Imprest Memo"."Posted By")
            {
            }
            column(NoSeries_ImprestMemo; "Imprest Memo"."No. Series")
            {
            }
            column(Currency_ImprestMemo; "Imprest Memo"."Currency Code")
            {
            }
            column(DateFilter_ImprestMemo; "Imprest Memo"."Date Filter")
            {
            }
            column(WorkTypeFilter_ImprestMemo; "Imprest Memo"."Work Type Filter")
            {
            }
            column(ProjectTask_ImprestMemo; "Imprest Memo"."Project Task")
            {
            }
            column(ProjectTaskDescription_ImprestMemo; "Imprest Memo"."Project Task Description")
            {
            }
            column(ProjectMaintenanceCosts_ImprestMemo; "Imprest Memo"."Project Maintenance Costs")
            {
            }
            column(ProjectLeadCosts_ImprestMemo; "Imprest Memo"."Project Lead Costs")
            {
            }
            column(ProjectBudget_ImprestMemo; "Imprest Memo"."Project Budget")
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(TotalProjectBudget_ImprestMemo; "Imprest Memo"."Project Budget")
            {
            }
            column(TotalUsageCosts_ImprestMemo; "Imprest Memo"."Actual Project Costs")
            {
            }
            column(BudgetCommitments_ImprestMemo; "Imprest Memo"."Total Budget Commitments")
            {
            }
            column(AvailableFunds_ImprestMemo; "Imprest Memo"."Available Funds")
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            column(Approved_By; UserSetup4."Employee Name")
            {
            }
            column(Date_Approved; ApproverDate[5])
            {
            }
            column(Approver_Signature; UserSetup4.Picture)
            {
            }
            dataitem(ProjectTeam; "Project Members")
            {
                DataItemLink = "Imprest Memo No." = field("No.");
                DataItemTableView = where(Type = const(Person));
                PrintOnlyIfDetail = false;
                column(ReportForNavId_1000000027; 1000000027)
                {
                }
                column(No_ProjectTeam; ProjectTeam."No.")
                {
                }
                column(Name_ProjectTeam; ProjectTeam.Name)
                {
                }
                column(JobGroup_ProjectTeam; ProjectTeam."Job Group")
                {
                }
                column(JobTitle_ProjectTeam; ProjectTeam."Job Title")
                {
                }
                column(TotalEntitlement_ProjectTeam; ProjectTeam."Total Entitlement")
                {
                }
                column(Entitlement_ProjectTeam; ProjectTeam.Entitlement)
                {
                }
                column(OutstandingAmount_ProjectTeam; ProjectTeam."Outstanding Amount")
                {
                }
                column(TaskstoCarryOut_ProjectTeam; ProjectTeam."Tasks to Carry Out")
                {
                }
                column(ExpectedOutput_ProjectTeam; ProjectTeam."Expected Output")
                {
                }
                column(UnitofMeasure_ProjectTeam; ProjectTeam."Unit of Measure")
                {
                }
                column(Delivery_ProjectTeam; ProjectTeam.Delivery)
                {
                }
                column(WorkType_ProjectTeam; ProjectTeam."Work Type")
                {
                }
                column(TimePeriod_ProjectTeam; ProjectTeam."Time Period")
                {
                }
                column(Type_ProjectTeam; ProjectTeam.Type)
                {
                }
                column(LastMaintenanceCost_ProjectTeam; ProjectTeam."Last Maintenance Cost")
                {
                }
                column(ExpectedMaintenanceCost_ProjectTeam; ProjectTeam."Expected Maintenance Cost")
                {
                }
                column(BankName_ProjectTeam; BankName)
                {
                }
                column(BankBranchName_ProjectTeam; BankBranch)
                {
                }
                column(BankAccountNumber_ProjectTeam; BankAccNo)
                {
                }
                column(ProjectLead_ProjectTeam; ProjectTeam."Project Lead")
                {
                }
                column(ProjectLeadCosts_ProjectTeam; ProjectTeam."Project Lead Costs")
                {
                }
                column(Posted_ProjectTeam; ProjectTeam.Posted)
                {
                }
                column(Linked_ProjectTeam; ProjectTeam.Linked)
                {
                }
                column(Project_ProjectTeam; ProjectTeam.Project)
                {
                }
                column(Task_ProjectTeam; ProjectTeam."Task No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    BankAccNo := '';
                    BankBranch := '';
                    BankName := '';

                    if Cust.Get(ProjectTeam."No.") then begin
                        Cust.CalcFields(Cust."Bank Branch Name", Cust."Bank Name");
                        BankAccNo := Cust."Bank Account Number";
                        BankBranch := Cust."Bank Branch Name";
                        BankName := Cust."Bank Name";



                    end;
                end;
            }
            dataitem(Fuel; "Project Members")
            {
                DataItemLink = "Imprest Memo No." = field("No.");
                DataItemTableView = where(Type = const(Machine), "Expense Type" = const(Fuel));
                PrintOnlyIfDetail = false;
                column(ReportForNavId_1000000052; 1000000052)
                {
                }
                column(No_Fuel; Fuel."No.")
                {
                }
                column(Name_Fuel; Fuel.Name)
                {
                }
                column(JobGroup_Fuel; Fuel."Job Group")
                {
                }
                column(JobTitle_Fuel; Fuel."Job Title")
                {
                }
                column(Entitlement_Fuel; Fuel.Entitlement)
                {
                }
                column(OutstandingAmount_Fuel; Fuel."Outstanding Amount")
                {
                }
                column(TaskstoCarryOut_Fuel; Fuel."Tasks to Carry Out")
                {
                }
                column(ExpectedOutput_Fuel; Fuel."Expected Output")
                {
                }
                column(UnitofMeasure_Fuel; Fuel."Unit of Measure")
                {
                }
                column(Delivery_Fuel; Fuel.Delivery)
                {
                }
                column(Tcosts; ProjectTeam."Transport Costs")
                {
                }
                column(WorkType_Fuel; Fuel."Work Type")
                {
                }
                column(Consumption_Rate; Fuel."Consumption Rate")
                {
                }
                column(TimePeriod_Fuel; Fuel."Time Period")
                {
                }
                column(Type_Fuel; Fuel.Type)
                {
                }
                column(LastMaintenanceCost_Fuel; Fuel."Last Maintenance Cost")
                {
                }
                column(ExpectedMaintenanceCost_Fuel; Fuel."Expected Maintenance Cost")
                {
                }
                column(BankCode_Fuel; Fuel."Bank Name")
                {
                }
                column(BankBranchCode_Fuel; Fuel."Bank Branch")
                {
                }
                column(BankAccountNumber_Fuel; Fuel."Bank Account Number")
                {
                }
                column(ProjectLead_Fuel; Fuel."Project Lead")
                {
                }
                column(ProjectLeadCosts_Fuel; Fuel."Project Lead Costs")
                {
                }
                column(Posted_Fuel; Fuel.Posted)
                {
                }
                column(Linked_Fuel; Fuel.Linked)
                {
                }
                column(Project_Fuel; Fuel.Project)
                {
                }
                column(Task_Fuel; Fuel."Task No.")
                {
                }
            }
            dataitem(Maintenance; "Project Members")
            {
                DataItemLink = "Imprest Memo No." = field("No.");
                DataItemTableView = where(Type = const(Machine), "Expense Type" = const(Maintenance));
                PrintOnlyIfDetail = false;
                column(ReportForNavId_1000000139; 1000000139)
                {
                }
                column(No_Maintenance; Maintenance."No.")
                {
                }
                column(Name_Maintenance; Maintenance.Name)
                {
                }
                column(WorkType_Maintenance; Maintenance."Work Type")
                {
                }
                column(TaskNo_Maintenance; Maintenance."Task No.")
                {
                }
                column(LastMaintenanceCost; Maintenance."Last Maintenance Cost")
                {
                }
                column(QtyMileage_Maintenance; Maintenance."Time Period")
                {
                }
                column(ExpectedmaintenanceCost; Maintenance."Expected Maintenance Cost")
                {
                }
            }
            dataitem(Casuals; Casuals)
            {
                DataItemLink = "Imprest Memo No." = field("No.");
                PrintOnlyIfDetail = false;
                column(ReportForNavId_1000000077; 1000000077)
                {
                }
                column(Type_Casuals; Casuals.Type)
                {
                }
                column(NoRequired_Casuals; Casuals."No. Required")
                {
                }
                column(WorkType_Casuals; Casuals."Work Type")
                {
                }
                column(NoofDays_Casuals; Casuals."No. of Days")
                {
                }
                column(Rate_Casuals; Casuals.Rate)
                {
                }
                column(Amount_Casuals; Casuals.Amount)
                {
                }
                column(Activity_Casuals; Casuals.Activity)
                {
                }
                column(ResourceNo_Casuals; Casuals."Resource No.")
                {
                }
                column(Posted_Casuals; Casuals.Posted)
                {
                }
                column(Linked_Casuals; Casuals.Linked)
                {
                }
                column(Project_Casuals; Casuals.Project)
                {
                }
                column(Task_Casuals; Casuals."Task No.")
                {
                }
            }
            dataitem("Other Costs"; "Other Costs")
            {
                DataItemLink = "Imprest Memo No." = field("No.");
                PrintOnlyIfDetail = false;
                column(ReportForNavId_1000000090; 1000000090)
                {
                }
                column(Description_OtherCosts; "Other Costs".Description)
                {
                }
                column(QuantityRequired_OtherCosts; "Other Costs"."Quantity Required")
                {
                }
                column(NoofDays_OtherCosts; "Other Costs"."No. of Days")
                {
                }
                column(UnitCost_OtherCosts; "Other Costs"."Unit Cost")
                {
                }
                column(RequiredFor_OtherCosts; "Other Costs"."Required For")
                {
                }
                column(LineAmount_OtherCosts; "Other Costs"."Line Amount")
                {
                }
                column(WorkType_OtherCosts; "Other Costs"."Work Type")
                {
                }
                column(No_OtherCosts; "Other Costs"."No.")
                {
                }
                column(Posted_OtherCosts; "Other Costs".Posted)
                {
                }
                column(Linked_OtherCosts; "Other Costs".Linked)
                {
                }
                column(Type_OtherCosts; "Other Costs".Type)
                {
                }
                column(Project_OtherCosts; "Other Costs".Project)
                {
                }
                column(Task_OtherCosts; "Other Costs"."Task No.")
                {
                }
            }
            dataitem("Execution Plan"; "Execution Plan")
            {
                DataItemLink = "Imprest Memo No." = field("No.");
                PrintOnlyIfDetail = false;
                column(ReportForNavId_1000000111; 1000000111)
                {
                }
                column(Day_Period_ExecutionPlan; "Execution Plan".Period)
                {
                }
                column(Activity_ExecutionPlan; "Execution Plan".Activity)
                {
                }
                column(Duration_ExecutionPlan; "Execution Plan".Duration)
                {
                }
                column(DailyOutputExecPlan; "Execution Plan".Output)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                "Imprest Memo".CalcFields("Imprest Memo"."Terms of Reference", "Imprest Memo".Objective);
                "Terms of Reference".CreateInstream(Instr);
                TOR.Read(Instr);
                TORText := Format(TOR);
                Objective.CreateInstream(ObjInstr);
                Obj.Read(ObjInstr);
                ObjText := Format(Obj);

                //Convert Project Objectives from BLOB to TXT
                "Imprest Memo".CalcFields("Imprest Memo".Objective);
                Objective.CreateInstream(ObjInstr);
                Obj.Read(ObjInstr);

                if ObjText <> Format(TOR) then begin
                    Clear("Imprest Memo".Objective);
                    Clear(Obj);
                    Obj.AddText(ObjText);
                    Objective.CreateOutstream(ObjOutStr);
                    Obj.Write(ObjOutStr);
                end;
                //End of conversion..Project Objectives

                //Convert Terms Of Reference from BLOB to TXT
                "Imprest Memo".CalcFields("Imprest Memo"."Terms of Reference");
                "Terms of Reference".CreateInstream(Instr);
                TOR.Read(Instr);

                if TORText <> Format(TOR) then begin
                    Clear("Imprest Memo"."Terms of Reference");
                    Clear(TOR);
                    TOR.AddText(TORText);
                    "Terms of Reference".CreateOutstream(OutStr);
                    TOR.Write(OutStr);
                end;
                //End of conversion...Terms Of refernce



                //Ushindi....12/07/16
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 57008);
                ApprovalEntries.SetRange("Document No.", "Imprest Memo"."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                        if i = 4 then begin
                            Approver[5] := ApprovalEntries."Approver ID";
                            ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup4.Get(Approver[5]) then
                                UserSetup4.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;

            trigger OnPreDataItem()
            begin
                "Imprest Memo".CalcFields("Imprest Memo"."Total Casuals Cost", "Imprest Memo"."Total Fuel Costs", "Imprest Memo"."Total Maintenance Costs",
                "Imprest Memo"."Total Other Costs", "Imprest Memo"."Total Subsistence Allowance");
                "Imprest Memo".CalcFields("Imprest Memo"."Vote Amount", "Imprest Memo".Commitments, "Imprest Memo"."Actual to Date");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        BankAccNo: Code[20];
        BankName: Text[100];
        BankBranch: Text[100];
        Cust: Record Customer;
        ConsumptionsRate: Decimal;
}
