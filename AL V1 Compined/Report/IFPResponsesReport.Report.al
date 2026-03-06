#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70049 "IFP Responses Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/IFP Responses Report.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(HD; "RFI Response")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(DocumentType_HD; HD."Document Type")
            {
            }
            column(DocumentNo_HD; HD."Document No.")
            {
            }
            column(DocumentDate_HD; HD."Document Date")
            {
            }
            column(VendorNo_HD; HD."Vendor No.")
            {
            }
            column(VendorName_HD; HD."Vendor Name")
            {
            }
            column(RFIDocumentNo_HD; HD."RFI Document No.")
            {
            }
            column(VendorRepresentativeName_HD; HD."Vendor Representative Name")
            {
            }
            column(VendorReprDesignation_HD; HD."Vendor Repr Designation")
            {
            }
            column(VendorAddress_HD; HD."Vendor Address")
            {
            }
            column(VendorAddress2_HD; HD."Vendor Address 2")
            {
            }
            column(City_HD; HD.City)
            {
            }
            column(PhoneNo_HD; HD."Phone No.")
            {
            }
            column(CountryRegionCode_HD; HD."Country/Region Code")
            {
            }
            column(PostCode_HD; HD."Post Code")
            {
            }
            column(County_HD; HD.County)
            {
            }
            column(EMail_HD; HD."E-Mail")
            {
            }
            column(SpecialGroupVendor_HD; HD."Special Group Vendor")
            {
            }
            column(SpecialGroupCategory_HD; HD."Special Group Category")
            {
            }
            column(FinalEvaluationScore_HD; HD."Final Evaluation Score")
            {
            }
            column(DocumentStatus_HD; HD."Document Status")
            {
            }
            column(DateSubmitted_HD; HD."Date Submitted")
            {
            }
            column(NoSeries_HD; HD."No. Series")
            {
            }
            column(CreatedBy_HD; HD."Created By")
            {
            }
            column(CreatedDate_HD; HD."Created Date")
            {
            }
            column(CreatedTime_HD; HD."Created Time")
            {
            }
            dataitem(LN; "IFP Response Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("Document No.");
                column(ReportForNavId_27; 27)
                {
                }
                column(DocumentType_LN; LN."Document Type")
                {
                }
                column(DocumentNo_LN; LN."Document No.")
                {
                }
                column(ProcurementCategory_LN; LN."Procurement Category")
                {
                }
                column(CategoryDescription_LN; LN."Category Description")
                {
                }
                column(RFIDocumentNo_LN; LN."RFI Document No.")
                {
                }
                column(VendorNo_LN; LN."Vendor No.")
                {
                }
                column(SpecialGroupReservation_LN; LN."Special Group Reservation")
                {
                }
                column(UniqueCategoryRequirements_LN; LN."Unique Category Requirements")
                {
                }
                column(GlobalRCPrequalification_LN; LN."Global RC Prequalification")
                {
                }
                column(RestrictedResponsbilityCente_LN; LN."Restricted Responsbility Cente")
                {
                }
                column(RestrictedRCID_LN; LN."Restricted RC ID")
                {
                }
                column(PrequalificationStartDate_LN; LN."Prequalification Start Date")
                {
                }
                column(PrequalificationEndDate_LN; LN."Prequalification End Date")
                {
                }
                column(EvaluationDecision_LN; LN."Evaluation Decision")
                {
                }
                column(EvaluationScore_LN; LN."Evaluation Score %")
                {
                }
                column(VendorName_LN; LN."Vendor Name")
                {
                }
                column(ResponseStage_LN; LN."Response Stage")
                {
                }
                column(IFPOpeningRegisterNo_LN; LN."IFP Opening Register No")
                {
                }
                column(EvaluationVoucherNo_LN; LN."Evaluation Voucher No")
                {
                }
                column(EvaluationReportNo_LN; LN."Evaluation Report No")
                {
                }
                column(ProfessionalOpinionNo_LN; LN."Professional Opinion No")
                {
                }
                column(NoticeOfAwardNo_LN; LN."Notice Of Award No")
                {
                }
                column(ResponsibilityCenterID_LN; LN."Responsibility Center ID")
                {
                }
                column(Description_LN; LN.Description)
                {
                }
                column(ConstituencyCode_LN; LN."Constituency Code")
                {
                }
                column(Constituency_LN; LN.Constituency)
                {
                }
                column(Remarks_LN; LN.Remarks)
                {
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
}
