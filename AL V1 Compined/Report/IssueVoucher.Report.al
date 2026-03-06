#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70009 "Issue Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Issue Voucher.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = where("Document Type" = const("Store Requisition"));
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(DocumentType_PurchaseHeader; "Purchase Header"."Document Type")
            {
            }
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(LocationCode_PurchaseHeader; "Purchase Header"."Location Code")
            {
            }
            column(ShortcutDimension1Code_PurchaseHeader; "Purchase Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PurchaseHeader; "Purchase Header"."Shortcut Dimension 2 Code")
            {
            }
            column(PurchaserCode_PurchaseHeader; "Purchase Header"."Purchaser Code")
            {
            }
            column(Comment_PurchaseHeader; "Purchase Header".Comment)
            {
            }
            column(NoPrinted_PurchaseHeader; "Purchase Header"."No. Printed")
            {
            }
            column(DocumentDate_PurchaseHeader; "Purchase Header"."Document Date")
            {
            }
            column(Area_PurchaseHeader; "Purchase Header".Area)
            {
            }
            column(NoofArchivedVersions_PurchaseHeader; "Purchase Header"."No. of Archived Versions")
            {
            }
            column(StoreNo_PurchaseHeader; "Purchase Header"."Store No")
            {
            }
            column(Description_PurchaseHeader; "Purchase Header".Description)
            {
            }
            column(RequisitionType_PurchaseHeader; "Purchase Header"."Requisition Type")
            {
            }
            column(TakenBy_PurchaseHeader; "Purchase Header"."Taken By")
            {
            }
            column(DepartmentName_PurchaseHeader; "Purchase Header"."Department Name")
            {
            }
            column(ProjectName_PurchaseHeader; "Purchase Header"."Project Name")
            {
            }
            column(ValidtoDate_PurchaseHeader; "Purchase Header"."Valid to Date")
            {
            }
            column(RequestByNo_PurchaseHeader; "Purchase Header"."Request-By No.")
            {
            }
            column(RequestByName_PurchaseHeader; "Purchase Header"."Request-By Name")
            {
            }
            column(RequesterID_PurchaseHeader; "Purchase Header"."Requester ID")
            {
            }
            column(PurchaseRequisitionNo_PurchaseHeader; "Purchase Header"."Purchase Requisition No.")
            {
            }
            column(CreatedQuotes_PurchaseHeader; "Purchase Header"."Created Quotes")
            {
            }
            column(StoreRequisitionNo_PurchaseHeader; "Purchase Header"."Store Requisition No.")
            {
            }
            column(BudgetedName_PurchaseHeader; "Purchase Header"."Budgeted  Name")
            {
            }
            column(RequisitionExpenseGroup_PurchaseHeader; "Purchase Header"."Requisition Expense Group")
            {
            }
            column(ChargeToWork_PurchaseHeader; "Purchase Header"."ChargeToWork?")
            {
            }
            column(BeneficiaryName_PurchaseHeader; "Purchase Header"."Beneficiary Name")
            {
            }
            column(BeneficiaryAddress_PurchaseHeader; "Purchase Header"."Beneficiary Address")
            {
            }
            column(BeneficiaryAddress2_PurchaseHeader; "Purchase Header"."Beneficiary Address 2")
            {
            }
            column(BeneficiaryCity_PurchaseHeader; "Purchase Header"."Beneficiary City")
            {
            }
            column(IRExternalDocumentNo_PurchaseHeader; "Purchase Header"."IR External Document No")
            {
            }
            column(POType_PurchaseHeader; "Purchase Header"."PO Type")
            {
            }
            column(VoteItem_PurchaseHeader; "Purchase Header"."Vote Item")
            {
            }
            column(VoteAmount_PurchaseHeader; "Purchase Header"."Vote Amount")
            {
            }
            column(BudgetCommitments_PurchaseHeader; "Purchase Header"."Budget Commitments")
            {
            }
            column(InspectionTeamSetup_PurchaseHeader; "Purchase Header"."Inspection Team Setup?")
            {
            }
            column(InspectionCompleted_PurchaseHeader; "Purchase Header"."Inspection Completed?")
            {
            }
            column(ContractNo_PurchaseHeader; "Purchase Header"."Contract No.")
            {
            }
            column(ContractName_PurchaseHeader; "Purchase Header"."Contract Name")
            {
            }
            column(SendingTime_PurchaseHeader; "Purchase Header"."Sending Time")
            {
            }
            column(JobTaskNo_PurchaseHeader; "Purchase Header"."Job Task No.")
            {
            }
            column(BudgetItem_PurchaseHeader; "Purchase Header"."Budget Item")
            {
            }
            column(BugetDesc_PurchaseHeader; "Purchase Header"."Buget Desc")
            {
            }
            column(BudgetedAmount_PurchaseHeader; "Purchase Header"."Budgeted Amount")
            {
            }
            column(ActualBudgetCosts_PurchaseHeader; "Purchase Header"."Actual Budget Costs")
            {
            }
            column(AvailableFunds_PurchaseHeader; "Purchase Header"."Available Funds")
            {
            }
            column(RequisitionAmount_PurchaseHeader; "Purchase Header"."Requisition Amount")
            {
            }
            column(RemainingBudget_PurchaseHeader; "Purchase Header"."Remaining Budget")
            {
            }
            column(RequiredDate_PurchaseHeader; "Purchase Header"."Required Date")
            {
            }
            column(FunctionName_PurchaseHeader; "Purchase Header"."Function Name")
            {
            }
            column(BudgetCenterName_PurchaseHeader; "Purchase Header"."Budget Center Name")
            {
            }
            column(StoreRequisitionType_PurchaseHeader; "Purchase Header"."Store Requisition Type")
            {
            }
            column(ShortcutDimension3Code_PurchaseHeader; "Purchase Header"."Shortcut Dimension 3 Code")
            {
            }
            column(UnitName_PurchaseHeader; "Purchase Header"."Unit  Name")
            {
            }
            column(TotalProjectCost_PurchaseHeader; "Purchase Header"."Total Project Cost")
            {
            }
            column(Harvest_PurchaseHeader; "Purchase Header".Harvest)
            {
            }
            column(ProcurementType_PurchaseHeader; "Purchase Header"."Procurement Type")
            {
            }
            column(ContractNumber_PurchaseHeader; "Purchase Header"."Contract Number")
            {
            }
            column(Datereceived_PurchaseHeader; "Purchase Header"."Date received")
            {
            }
            column(ApprovedRequisitionAmount_PurchaseHeader; "Purchase Header"."Approved Requisition Amount")
            {
            }
            column(Ordertypes_PurchaseHeader; "Purchase Header"."Order types")
            {
            }
            column(Reasontoreopen_PurchaseHeader; "Purchase Header"."Reason to reopen")
            {
            }
            column(ReasontoCancel_PurchaseHeader; "Purchase Header"."Reason to Cancel")
            {
            }
            column(OrderNumber_PurchaseHeader; "Purchase Header"."Order Number")
            {
            }
            column(Committed_PurchaseHeader; "Purchase Header".Committed)
            {
            }
            column(CommittedBy_PurchaseHeader; "Purchase Header".CommittedBy)
            {
            }
            column(ProcurementPlan_PurchaseHeader; "Purchase Header"."Procurement Plan")
            {
            }
            column(ProcurementPlanYear_PurchaseHeader; "Purchase Header"."Procurement Plan Item")
            {
            }
            column(RequestRefNo_PurchaseHeader; "Purchase Header"."Request Ref No")
            {
            }
            column(SupplierType_PurchaseHeader; "Purchase Header"."Supplier Type")
            {
            }
            column(ProcessType_PurchaseHeader; "Purchase Header"."Process Type")
            {
            }
            column(PurchaseType_PurchaseHeader; "Purchase Header"."Purchase Type")
            {
            }
            column(RequisitionNo_PurchaseHeader; "Purchase Header"."Requisition No")
            {
            }
            column(Ordered_PurchaseHeader; "Purchase Header".Ordered)
            {
            }
            column(Test_PurchaseHeader; "Purchase Header".Test)
            {
            }
            column(RequisitionOfficer; UserSetup."Employee Name")
            {
            }
            column(DateRequisitionOfficer; ApproverDate[1])
            {
            }
            column(RequisitionOfficer_Signature; UserSetup.Picture)
            {
            }
            column(AuthorisingOfficer; UserSetup1."Employee Name")
            {
            }
            column(DateAuthorisingOfficer; ApproverDate[2])
            {
            }
            column(AuthorisingOfficer_Signature; UserSetup1.Picture)
            {
            }
            column(IssuedBy; UserSetup2."Employee Name")
            {
            }
            column(DateIssuedBy; ApproverDate[3])
            {
            }
            column(IssuedBy_Signature; UserSetup2.Picture)
            {
            }
            column(AuthorizedBy; UserSetup4."Employee Name")
            {
            }
            column(DateAuthorizedBy; ApproverDate[4])
            {
            }
            column(AuthorizedBy_Signature; UserSetup4.Picture)
            {
            }
            column(Designation; Designation)
            {
            }
            column(Designation1; Designation1)
            {
            }
            column(Designation2; Designation2)
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where("Document Type" = const("Store Requisition"));
                column(ReportForNavId_227; 227)
                {
                }
                column(DocumentType_PurchaseLine; "Purchase Line"."Document Type")
                {
                }
                column(DocumentNo_PurchaseLine; "Purchase Line"."Document No.")
                {
                }
                column(LineNo_PurchaseLine; "Purchase Line"."Line No.")
                {
                }
                column(Type_PurchaseLine; "Purchase Line".Type)
                {
                }
                column(No_PurchaseLine; "Purchase Line"."No.")
                {
                }
                column(LocationCode_PurchaseLine; "Purchase Line"."Location Code")
                {
                }
                column(Description_PurchaseLine; "Purchase Line".Description)
                {
                }
                column(Description2_PurchaseLine; "Purchase Line"."Description 2")
                {
                }
                column(UnitofMeasure_PurchaseLine; "Purchase Line"."Unit of Measure")
                {
                }
                column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                {
                }
                column(Amount_PurchaseLine; "Purchase Line".Amount)
                {
                }
                column(AmountIncludingVAT_PurchaseLine; "Purchase Line"."Amount Including VAT")
                {
                }
                column(ShortcutDimension1Code_PurchaseLine; "Purchase Line"."Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_PurchaseLine; "Purchase Line"."Shortcut Dimension 2 Code")
                {
                }
                column(JobNo_PurchaseLine; "Purchase Line"."Job No.")
                {
                }
                column(IndirectCost_PurchaseLine; "Purchase Line"."Indirect Cost %")
                {
                }
                column(LineAmount_PurchaseLine; "Purchase Line"."Line Amount")
                {
                }
                column(PrepaymentTaxLiable_PurchaseLine; "Purchase Line"."Prepayment Tax Liable")
                {
                }
                column(QtyperUnitofMeasure_PurchaseLine; "Purchase Line"."Qty. per Unit of Measure")
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Purchase Line"."Unit of Measure Code")
                {
                }
                column(QuantityBase_PurchaseLine; "Purchase Line"."Quantity (Base)")
                {
                }
                column(OutstandingQtyBase_PurchaseLine; "Purchase Line"."Outstanding Qty. (Base)")
                {
                }
                column(QtytoInvoiceBase_PurchaseLine; "Purchase Line"."Qty. to Invoice (Base)")
                {
                }
                column(QtytoReceiveBase_PurchaseLine; "Purchase Line"."Qty. to Receive (Base)")
                {
                }
                column(QtyRcdNotInvoicedBase_PurchaseLine; "Purchase Line"."Qty. Rcd. Not Invoiced (Base)")
                {
                }
                column(QtyReceivedBase_PurchaseLine; "Purchase Line"."Qty. Received (Base)")
                {
                }
                column(QtyInvoicedBase_PurchaseLine; "Purchase Line"."Qty. Invoiced (Base)")
                {
                }
                column(Quantityissued_PurchaseLine; "Purchase Line"."Quantity  issued")
                {
                }
                column(QtyRequested_PurchaseLine; "Purchase Line"."Qty. Requested")
                {
                }
                column(IncludeinPurchOrder_PurchaseLine; "Purchase Line"."Include in Purch. Order")
                {
                }
                column(RequestByNo_PurchaseLine; "Purchase Line"."Request-By No.")
                {
                }
                column(RequestByName_PurchaseLine; "Purchase Line"."Request-By Name")
                {
                }
                column(QuantityRejected_PurchaseLine; "Purchase Line"."Quantity Rejected")
                {
                }
                column(QuantityReturned_PurchaseLine; "Purchase Line"."Quantity Returned")
                {
                }
                column(RequestorID_PurchaseLine; "Purchase Line"."Requestor ID")
                {
                }
                column(RequisitionHeaderType_PurchaseLine; "Purchase Line"."Requisition Header Type")
                {
                }
                column(ProjectDescription_PurchaseLine; "Purchase Line"."Project Description")
                {
                }
                dataitem("Company Information"; "Company Information")
                {
                    column(ReportForNavId_6; 6)
                    {
                    }
                    column(Picture_CompanyInformation; "Company Information".Picture)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                //Approvals Signatures
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 38);
                ApprovalEntries.SetRange("Document No.", "Purchase Header"."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver1[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver1[1]) then
                                UserSetup.CalcFields(Picture);
                            ENo := UserSetup."Employee No.";
                            if Emp.Get(ENo) then
                                DesignationID := Emp."Job ID";
                            if JOBID.Get(DesignationID) then
                                Designation := JOBID."Job Description";
                            //MESSAGE('%1|%2|%3|%4', ENo, UserSetup."Employee Name", DesignationID, Designation);

                            Approver1[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver1[2]) then
                                UserSetup1.CalcFields(Picture);

                            ENo := UserSetup1."Employee No.";
                            if Emp.Get(ENo) then
                                DesignationID := Emp."Job ID";
                            if JOBID.Get(DesignationID) then
                                Designation1 := JOBID."Job Description";
                            //MESSAGE('%1|%2|%3|%4', ENo, UserSetup1."Employee Name", DesignationID, Designation1);
                        end;
                        if i = 2 then begin
                            Approver1[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver1[3]) then
                                UserSetup2.CalcFields(Picture);

                            ENo := UserSetup2."Employee No.";
                            if Emp.Get(ENo) then
                                DesignationID := Emp."Job ID";
                            if JOBID.Get(DesignationID) then
                                Designation2 := JOBID."Job Description";
                            //MESSAGE('%1|%2|%3|%4', ENo, UserSetup2."Employee Name", DesignationID, Designation2);
                        end;
                        if i = 3 then begin
                            Approver1[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver1[4]) then
                                UserSetup3.CalcFields(Picture);
                            //MESSAGE('Test C %1',UserSetup1.Picture);
                            ENo := UserSetup3."Employee No.";
                            if Emp.Get(ENo) then
                                DesignationID := Emp."Job ID";
                            if JOBID.Get(DesignationID) then
                                Designation := JOBID."Job Description";
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
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

    var
        ApprovalEntries: Record "Approval Entry";
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        Emp: Record Employee;
        DesignationID: Code[50];
        USetup: Record "User Setup";
        ENo: Code[10];
        Designation: Code[80];
        JOBID: Record "Company Jobs";
        Approver1: array[10] of Code[50];
        Designation1: Code[50];
        Designation2: Code[50];
}
