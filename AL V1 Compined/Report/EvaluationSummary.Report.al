#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70041 "Evaluation Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Evaluation Summary.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Bid Evaluation Register"; "Bid Evaluation Register")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(logo; corec.Picture)
            {
            }
            column(Code_BidEvaluationRegister; "Bid Evaluation Register".Code)
            {
            }
            column(EvaluationType_BidEvaluationRegister; "Bid Evaluation Register"."Evaluation Type")
            {
            }
            column(EvaluatorCategory_BidEvaluationRegister; "Bid Evaluation Register"."Evaluator Category")
            {
            }
            column(EvaluationLead_BidEvaluationRegister; "Bid Evaluation Register"."Evaluation Lead")
            {
            }
            column(EvaluationLeadName_BidEvaluationRegister; "Bid Evaluation Register"."Evaluation Lead Name")
            {
            }
            column(BidNo_BidEvaluationRegister; "Bid Evaluation Register"."Bid No.")
            {
            }
            column(VendorNo_BidEvaluationRegister; "Bid Evaluation Register"."Vendor No.")
            {
            }
            column(BidderName_BidEvaluationRegister; "Bid Evaluation Register"."Bidder Name")
            {
            }
            column(Description_BidEvaluationRegister; "Bid Evaluation Register".Description)
            {
            }
            column(EvaluationDate_BidEvaluationRegister; "Bid Evaluation Register"."Evaluation Date")
            {
            }
            column(EvaluationVenue_BidEvaluationRegister; "Bid Evaluation Register"."Evaluation Venue")
            {
            }
            column(IFSCode_BidEvaluationRegister; "Bid Evaluation Register"."IFS Code")
            {
            }
            column(BidScoringDocumentNo_BidEvaluationRegister; "Bid Evaluation Register"."Bid Scoring Document No.")
            {
            }
            column(BidScoringDocumentType_BidEvaluationRegister; "Bid Evaluation Register"."Bid Scoring Document Type")
            {
            }
            column(BidOpeningRegisterNo_BidEvaluationRegister; "Bid Evaluation Register"."Bid Opening Register No.")
            {
            }
            column(BidOpeningDate_BidEvaluationRegister; "Bid Evaluation Register"."Bid Opening Date")
            {
            }
            column(TenderEvaluationDeadline_BidEvaluationRegister; "Bid Evaluation Register"."Tender Evaluation Deadline")
            {
            }
            column(AppointedBidEvaluationCommi_BidEvaluationRegister; "Bid Evaluation Register"."Appointed Bid Evaluation Commi")
            {
            }
            column(PrimaryRegion_BidEvaluationRegister; "Bid Evaluation Register"."Primary Region")
            {
            }
            column(BidEnvelopType_BidEvaluationRegister; "Bid Evaluation Register"."Bid Envelop Type")
            {
            }
            column(FinalOpeningDone_BidEvaluationRegister; "Bid Evaluation Register"."Final Opening Done")
            {
            }
            column(PurchaserCode_BidEvaluationRegister; "Bid Evaluation Register"."Purchaser Code")
            {
            }
            column(PreliminaryEvaluationScore_BidEvaluationRegister; "Bid Evaluation Register"."Preliminary Evaluation Score")
            {
            }
            column(WeightedTechnicalEvalScore_BidEvaluationRegister; "Bid Evaluation Register"."Weighted Technical Eval Score")
            {
            }
            column(TechnicalEvaluationDecision_BidEvaluationRegister; "Bid Evaluation Register"."Technical Evaluation  Decision")
            {
            }
            column(WeightedFinancialEvalScore_BidEvaluationRegister; "Bid Evaluation Register"."Weighted Financial Eval Score")
            {
            }
            column(AwardDecision_BidEvaluationRegister; "Bid Evaluation Register"."Award Decision")
            {
            }
            column(TenderEvaluationCommRemarks_BidEvaluationRegister; "Bid Evaluation Register"."Tender Evaluation Comm Remarks")
            {
            }
            column(DocumentStatus_BidEvaluationRegister; "Bid Evaluation Register"."Document Status")
            {
            }
            column(NoSeries_BidEvaluationRegister; "Bid Evaluation Register"."No. Series")
            {
            }
            column(CreatedBy_BidEvaluationRegister; "Bid Evaluation Register"."Created By")
            {
            }
            column(CreatedDate_BidEvaluationRegister; "Bid Evaluation Register"."Created Date")
            {
            }
            column(CreatedTime_BidEvaluationRegister; "Bid Evaluation Register"."Created Time")
            {
            }
            column(Posted_BidEvaluationRegister; "Bid Evaluation Register".Posted)
            {
            }
            column(PostedBy_BidEvaluationRegister; "Bid Evaluation Register"."Posted By")
            {
            }
            column(PostedDate_BidEvaluationRegister; "Bid Evaluation Register"."Posted Date")
            {
            }
            dataitem("Bid Evaluation Committee"; "Bid Evaluation Committee")
            {
                DataItemLink = "Document No." = field(Code);
                column(ReportForNavId_38; 38)
                {
                }
                column(DocumentNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Document No.")
                {
                }
                column(LineNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Line No")
                {
                }
                column(AppointedBidOpeningCom_BidEvaluationCommittee; "Bid Evaluation Committee"."Appointed Bid Opening Com")
                {
                }
                column(RoleType_BidEvaluationCommittee; "Bid Evaluation Committee"."Role Type")
                {
                }
                column(MemberNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Member No.")
                {
                }
                column(MemberName_BidEvaluationCommittee; "Bid Evaluation Committee"."Member Name")
                {
                }
                column(Designation_BidEvaluationCommittee; "Bid Evaluation Committee".Designation)
                {
                }
                column(IDPassportNo_BidEvaluationCommittee; "Bid Evaluation Committee"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Tax Registration (PIN) No.")
                {
                }
                column(Email_BidEvaluationCommittee; "Bid Evaluation Committee".Email)
                {
                }
                column(TelephoneNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Telephone No.")
                {
                }
                column(StaffNo_BidEvaluationCommittee; "Bid Evaluation Committee"."Staff  No.")
                {
                }
                column(IFSCode_BidEvaluationCommittee; "Bid Evaluation Committee"."IFS Code")
                {
                }
            }
            dataitem("Bid Evaluation Score Entry"; "Bid Evaluation Score Entry")
            {
                DataItemLink = Code = field(Code);
                column(ReportForNavId_52; 52)
                {
                }
                column(Code_BidEvaluationScoreEntry; "Bid Evaluation Score Entry".Code)
                {
                }
                column(LineNo_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Line No")
                {
                }
                column(BidNo_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Bid No.")
                {
                }
                column(VendorNo_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Vendor No.")
                {
                }
                column(CriteriaGroup_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Criteria Group")
                {
                }
                column(RequirementID_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Requirement ID")
                {
                }
                column(EvaluationRequirement_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Evaluation Requirement")
                {
                }
                column(RatingType_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Rating Type")
                {
                }
                column(TargetValueKPI_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Target Value/KPI")
                {
                }
                column(UnitofMeasure_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Unit of Measure")
                {
                }
                column(TargetQty_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Target Qty")
                {
                }
                column(ResponseValue_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Response Value")
                {
                }
                column(BidResponseActualQty_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Bid Response Actual Qty")
                {
                }
                column(Score_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Score %")
                {
                }
                column(AssignedWeight_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Assigned Weight %")
                {
                }
                column(WeightedLineScore_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Weighted Line Score")
                {
                }
                column(EquipmentType_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Equipment Type")
                {
                }
                column(DesiredPerfomanceDirection_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Desired Perfomance Direction")
                {
                }
                column(BidScoringDocumentNo_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Bid Scoring Document No.")
                {
                }
                column(BidScoringDocumentType_BidEvaluationScoreEntry; "Bid Evaluation Score Entry"."Bid Scoring Document Type")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                corec.CalcFields(corec.Picture);
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
        corec: Record "Company Information";
}
