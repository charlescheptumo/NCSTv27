#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70040 "Tender Opening Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Tender Opening Summary.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Bid Opening Register"; "Bid Opening Register")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(Code_BidOpeningRegister; "Bid Opening Register".Code)
            {
            }
            column(IFSCode_BidOpeningRegister; "Bid Opening Register"."IFS Code")
            {
            }
            column(Description_BidOpeningRegister; "Bid Opening Register".Description)
            {
            }
            column(TenderName_BidOpeningRegister; "Bid Opening Register"."Tender Name")
            {
            }
            column(BidOpeningDate_BidOpeningRegister; "Bid Opening Register"."Bid Opening Date")
            {
            }
            column(BidOpeningStartTime_BidOpeningRegister; "Bid Opening Register"."Bid Opening Start Time")
            {
            }
            column(BidOpeningEndDate_BidOpeningRegister; "Bid Opening Register"."Bid Opening End Date")
            {
            }
            column(BidOpeningEndTime_BidOpeningRegister; "Bid Opening Register"."Bid Opening End Time")
            {
            }
            column(PrebidPurchaserCode_BidOpeningRegister; "Bid Opening Register"."Pre-bid Purchaser Code")
            {
            }
            column(NoofIntentionToBidVendor_BidOpeningRegister; "Bid Opening Register"."No. of Intention To Bid Vendor")
            {
            }
            column(NoofSubmittedBids_BidOpeningRegister; "Bid Opening Register"."No. of Submitted Bids")
            {
            }
            column(NoSeries_BidOpeningRegister; "Bid Opening Register"."No. Series")
            {
            }
            column(CreatedBy_BidOpeningRegister; "Bid Opening Register"."Created By")
            {
            }
            column(CreatedDate_BidOpeningRegister; "Bid Opening Register"."Created Date")
            {
            }
            column(CreatedTime_BidOpeningRegister; "Bid Opening Register"."Created Time")
            {
            }
            column(PrimaryRegion_BidOpeningRegister; "Bid Opening Register"."Primary Region")
            {
            }
            column(AppointedBidOpeningCom_BidOpeningRegister; "Bid Opening Register"."Appointed Bid Opening Com")
            {
            }
            column(BidEnvelopType_BidOpeningRegister; "Bid Opening Register"."Bid Envelop Type")
            {
            }
            column(BidUnsealingType_BidOpeningRegister; "Bid Opening Register"."Bid Unsealing Type")
            {
            }
            column(FinalOpeningDone_BidOpeningRegister; "Bid Opening Register"."Final Opening Done")
            {
            }
            column(TenderEvaluationDeadline_BidOpeningRegister; "Bid Opening Register"."Tender Evaluation Deadline")
            {
            }
            column(BidRegisterNo_BidOpeningRegister; "Bid Opening Register"."Bid Register No.")
            {
            }
            column(RequiredBidSecurityAmount_BidOpeningRegister; "Bid Opening Register"."Required Bid Security Amount")
            {
            }
            column(BidOpeningVenue_BidOpeningRegister; "Bid Opening Register"."Bid Opening Venue")
            {
            }
            column(DocumentStatus_BidOpeningRegister; "Bid Opening Register"."Document Status")
            {
            }
            dataitem("Bid Opening Register Line"; "Bid Opening Register Line")
            {
                DataItemLink = Code = field(Code);
                column(ReportForNavId_27; 27)
                {
                }
                column(Code_BidOpeningRegisterLine; "Bid Opening Register Line".Code)
                {
                }
                column(VendorNo_BidOpeningRegisterLine; "Bid Opening Register Line"."Vendor No.")
                {
                }
                column(IFSCode_BidOpeningRegisterLine; "Bid Opening Register Line"."IFS Code")
                {
                }
                column(BidderName_BidOpeningRegisterLine; "Bid Opening Register Line"."Bidder Name")
                {
                }
                column(BidNo_BidOpeningRegisterLine; "Bid Opening Register Line"."Bid No.")
                {
                }
                column(ExternalBidReferenceNo_BidOpeningRegisterLine; "Bid Opening Register Line"."External Bid Reference No")
                {
                }
                column(ValidBidSecurityProvided_BidOpeningRegisterLine; "Bid Opening Register Line"."Valid Bid Security Provided")
                {
                }
                column(BidSecurityIssuer_BidOpeningRegisterLine; "Bid Opening Register Line"."Bid Security Issuer")
                {
                }
                column(BidSecurityAmountLCY_BidOpeningRegisterLine; "Bid Opening Register Line"."Bid Security Amount (LCY)")
                {
                }
                column(BidSecurityAmountPass_BidOpeningRegisterLine; "Bid Opening Register Line"."Bid Security Amount Pass")
                {
                }
                column(TotalTenderPriceLCY_BidOpeningRegisterLine; "Bid Opening Register Line"."Total Tender Price (LCY)")
                {
                }
                column(CompleteBidDocSubmitted_BidOpeningRegisterLine; "Bid Opening Register Line"."Complete Bid Doc Submitted")
                {
                }
                column(LateBid_BidOpeningRegisterLine; "Bid Opening Register Line"."Late Bid")
                {
                }
                column(LateBidSubmissionTime_BidOpeningRegisterLine; "Bid Opening Register Line"."Late Bid Submission Time")
                {
                }
                column(BidWithdrawalNoticeNo_BidOpeningRegisterLine; "Bid Opening Register Line"."Bid Withdrawal Notice No.")
                {
                }
                column(BidModificationNoticeNo_BidOpeningRegisterLine; "Bid Opening Register Line"."Bid Modification Notice No.")
                {
                }
                column(BidWithdrawalExists_BidOpeningRegisterLine; "Bid Opening Register Line"."Bid Withdrawal Exists")
                {
                }
                column(BidModificationExists_BidOpeningRegisterLine; "Bid Opening Register Line"."Bid Modification Exists")
                {
                }
                column(FinalBidOpeningResult_BidOpeningRegisterLine; "Bid Opening Register Line"."Final Bid Opening Result")
                {
                }
                column(TenderOpeningComRemarks_BidOpeningRegisterLine; "Bid Opening Register Line"."Tender Opening Com Remarks")
                {
                }
                column(NoofRepresentatives_BidOpeningRegisterLine; "Bid Opening Register Line"."No. of Representatives")
                {
                }
                column(Notified_BidOpeningRegisterLine; "Bid Opening Register Line".Notified)
                {
                }
            }
            dataitem("Bid Opening Bidder Attendance"; "Bid Opening Bidder Attendance")
            {
                DataItemLink = Code = field(Code);
                column(ReportForNavId_50; 50)
                {
                }
                column(Code_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance".Code)
                {
                }
                column(IFSCode_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance"."IFS Code")
                {
                }
                column(VendorNo_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance"."Vendor No.")
                {
                }
                column(BidderRepresentativeName_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance"."Bidder Representative Name")
                {
                }
                column(RepresentativeEmail_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance"."Representative Email")
                {
                }
                column(RepresentativeTelNo_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance"."Representative Tel No")
                {
                }
                column(DateTimeNotified_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance"."Date/Time Notified")
                {
                }
                column(EntryNo_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance"."Entry No")
                {
                }
                column(Designation_BidOpeningBidderAttendance; "Bid Opening Bidder Attendance".Designation)
                {
                }
                dataitem("Tender Opening Summary Note"; "Tender Opening Summary Note")
                {
                    DataItemLink = "Register ID" = field(Code);
                    column(ReportForNavId_60; 60)
                    {
                    }
                    column(RegisterID_TenderOpeningSummaryNote; "Tender Opening Summary Note"."Register ID")
                    {
                    }
                    column(AgendaCode_TenderOpeningSummaryNote; "Tender Opening Summary Note"."Agenda Code")
                    {
                    }
                    column(LineNo_TenderOpeningSummaryNote; "Tender Opening Summary Note"."Line No.")
                    {
                    }
                    column(ItemDiscussed_TenderOpeningSummaryNote; "Tender Opening Summary Note"."Item Discussed")
                    {
                    }
                    column(SummaryNotes_TenderOpeningSummaryNote; "Tender Opening Summary Note"."Summary Notes")
                    {
                    }
                    column(ReferencedSectionofTender_TenderOpeningSummaryNote; "Tender Opening Summary Note"."Referenced Section of Tender")
                    {
                    }
                    column(ReferencedClauseofTender_TenderOpeningSummaryNote; "Tender Opening Summary Note"."Referenced Clause of Tender")
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
}
