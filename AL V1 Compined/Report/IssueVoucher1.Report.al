#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70027 "Issue Voucher1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Issue Voucher1.rdlc';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(StoreNo_PurchaseHeader; "Purchase Header"."Store No")
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
            column(StoreRequisitionNo_PurchaseHeader; "Purchase Header"."Store Requisition No.")
            {
            }
            column(DepartmentCode_PurchaseHeader; "Purchase Header"."Department Code")
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
            column(AuthorisingOfficer; UserSetup2."Employee Name")
            {
            }
            column(DateAuthorisingOfficer; ApproverDate[2])
            {
            }
            column(AuthorisingOfficer_Signature; UserSetup2.Picture)
            {
            }
            column(IssuedBy; UserSetup3."Employee Name")
            {
            }
            column(DateIssuedBy; ApproverDate[3])
            {
            }
            column(IssuedBy_Signature; UserSetup3.Picture)
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
            column(DirectorateCode_PurchaseHeader; "Purchase Header"."Directorate Code")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                column(ReportForNavId_14; 14)
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
                    column(ReportForNavId_16; 16)
                    {
                    }
                    column(Picture_CompanyInformation; "Company Information".Picture)
                    {
                    }
                }
            }
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
        Designation: Code[50];
        JOBID: Record "Company Jobs";
        Approver1: array[10] of Code[50];
}
