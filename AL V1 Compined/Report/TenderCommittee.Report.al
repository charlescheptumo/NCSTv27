#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70047 "Tender Committee"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Tender Committee.rdlc';

    dataset
    {
        dataitem("IFS Tender Committee"; "IFS Tender Committee")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(logo; corec.Picture)
            {
            }
            column(DocumentNo_IFSTenderCommittee; "IFS Tender Committee"."Document No.")
            {
            }
            column(CommitteeType_IFSTenderCommittee; "IFS Tender Committee"."Committee Type")
            {
            }
            column(Description_IFSTenderCommittee; "IFS Tender Committee".Description)
            {
            }
            column(AppointmentEffectiveDate_IFSTenderCommittee; "IFS Tender Committee"."Appointment Effective Date")
            {
            }
            column(AppointingAuthority_IFSTenderCommittee; "IFS Tender Committee"."Appointing Authority")
            {
            }
            column(TenderName_IFSTenderCommittee; "IFS Tender Committee"."Tender Name")
            {
            }
            column(ApprovalStatus_IFSTenderCommittee; "IFS Tender Committee"."Approval Status")
            {
            }
            column(PrimaryRegion_IFSTenderCommittee; "IFS Tender Committee"."Primary Region")
            {
            }
            column(PrimaryDirectorate_IFSTenderCommittee; "IFS Tender Committee"."Primary Directorate")
            {
            }
            column(PrimaryDepartment_IFSTenderCommittee; "IFS Tender Committee"."Primary Department")
            {
            }
            column(Blocked_IFSTenderCommittee; "IFS Tender Committee".Blocked)
            {
            }
            column(NoSeries_IFSTenderCommittee; "IFS Tender Committee"."No. Series")
            {
            }
            column(CreatedBy_IFSTenderCommittee; "IFS Tender Committee"."Created By")
            {
            }
            column(CreatedDate_IFSTenderCommittee; "IFS Tender Committee"."Created Date")
            {
            }
            column(CreatedTime_IFSTenderCommittee; "IFS Tender Committee"."Created Time")
            {
            }
            column(IFSCode_IFSTenderCommittee; "IFS Tender Committee"."IFS Code")
            {
            }
            column(DocumentDate_IFSTenderCommittee; "IFS Tender Committee"."Document Date")
            {
            }
            column(DocumentStatus_IFSTenderCommittee; "IFS Tender Committee"."Document Status")
            {
            }
            column(ContractNo_IFSTenderCommittee; "IFS Tender Committee"."Contract No.")
            {
            }
            column(ExternalDocumentNo_IFSTenderCommittee; "IFS Tender Committee"."External Document No")
            {
            }
            column(RaisedBy_IFSTenderCommittee; "IFS Tender Committee"."Raised By")
            {
            }
            column(Name_IFSTenderCommittee; "IFS Tender Committee".Name)
            {
            }
            column(StaffId_IFSTenderCommittee; "IFS Tender Committee"."Staff Id")
            {
            }
            column(Designation_IFSTenderCommittee; "IFS Tender Committee".Designation)
            {
            }
            column(MinRequiredNoofMembers_IFSTenderCommittee; "IFS Tender Committee"."Min Required No. of Members")
            {
            }
            column(ActualNoofCommitteeMemb_IFSTenderCommittee; "IFS Tender Committee"."Actual No. of Committee Memb")
            {
            }
            dataitem("IFS Tender Committee Member"; "IFS Tender Committee Member")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(ReportForNavId_28; 28)
                {
                }
                column(DocumentNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Document No.")
                {
                }
                column(CommitteeType_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Committee Type")
                {
                }
                column(LineNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Line No")
                {
                }
                column(Role_IFSTenderCommitteeMember; "IFS Tender Committee Member".Role)
                {
                }
                column(MemberNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Member No.")
                {
                }
                column(MemberName_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Member Name")
                {
                }
                column(Designation_IFSTenderCommitteeMember; "IFS Tender Committee Member".Designation)
                {
                }
                column(IDPassportNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Tax Registration (PIN) No.")
                {
                }
                column(MemberEmail_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Member Email")
                {
                }
                column(TelephoneNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Telephone No.")
                {
                }
                column(StaffNo_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Staff  No.")
                {
                }
                column(IFSCode_IFSTenderCommitteeMember; "IFS Tender Committee Member"."IFS Code")
                {
                }
                column(NotifiedonEmail_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Notified on Email")
                {
                }
                column(DateTimeNotified_IFSTenderCommitteeMember; "IFS Tender Committee Member"."Date/Time Notified")
                {
                }
            }
            dataitem("Procurement Committee Function"; "Procurement Committee Function")
            {
                DataItemLink = "Committee Type" = field("Committee Type");
                column(ReportForNavId_44; 44)
                {
                }
                column(CommitteeType_ProcurementCommitteeFunction; "Procurement Committee Function"."Committee Type")
                {
                }
                column(EntryNo_ProcurementCommitteeFunction; "Procurement Committee Function"."Entry No.")
                {
                }
                column(Description_ProcurementCommitteeFunction; "Procurement Committee Function".Description)
                {
                }
                column(SerialNo; SerialNo)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    SerialNo += 1;
                end;
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
        SerialNo: Integer;
}
