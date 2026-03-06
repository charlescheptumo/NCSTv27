#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56241 "ICT Helpdesk All Issues"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Helpdesk All Issues.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("ICT Helpdesk"; "ICT Helpdesk")
        {
            RequestFilterFields = Status, "Assigned To";
            column(ReportForNavId_1; 1)
            {
            }
            column(company; CompanyInfo.Name)
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(JobNo_ICTHelpdesk; "ICT Helpdesk"."Job No.")
            {
            }
            column(AssignedTo_ICTHelpdesk; "ICT Helpdesk"."Assigned To")
            {
            }
            column(AssignedDate_ICTHelpdesk; "ICT Helpdesk"."Assigned Date")
            {
            }
            column(AssignedTime_ICTHelpdesk; "ICT Helpdesk"."Assigned Time")
            {
            }
            column(Department_ICTHelpdesk; "ICT Helpdesk".Department)
            {
            }
            column(DepartmentName_ICTHelpdesk; "ICT Helpdesk"."Department Name")
            {
            }
            column(PhysicalStation_ICTHelpdesk; "ICT Helpdesk"."Physical Station")
            {
            }
            column(NatureofService_ICTHelpdesk; "ICT Helpdesk"."Nature of Service")
            {
            }
            column(EXT_ICTHelpdesk; "ICT Helpdesk".EXT)
            {
            }
            column(RequestingOfficer_ICTHelpdesk; "ICT Helpdesk"."Requesting Officer")
            {
            }
            column(RequestingOfficerName_ICTHelpdesk; "ICT Helpdesk"."Requesting Officer Name")
            {
            }
            column(Phone_ICTHelpdesk; "ICT Helpdesk".Phone)
            {
            }
            column(Email_ICTHelpdesk; "ICT Helpdesk".Email)
            {
            }
            column(RequestDate_ICTHelpdesk; Format("ICT Helpdesk"."Request Date"))
            {
            }
            column(RequestTime_ICTHelpdesk; Format("ICT Helpdesk"."Request Time"))
            {
            }
            column(ComputernotStartingup_ICTHelpdesk; "ICT Helpdesk"."Computer not Starting up")
            {
            }
            column(KeyboardMouseFailure_ICTHelpdesk; "ICT Helpdesk"."Keyboard, Mouse Failure")
            {
            }
            column(PrinterFailure_ICTHelpdesk; "ICT Helpdesk"."Printer Failure")
            {
            }
            column(UPSFailure_ICTHelpdesk; "ICT Helpdesk"."UPS Failure")
            {
            }
            column(LCDMonitorFailure_ICTHelpdesk; "ICT Helpdesk"."LCD /Monitor Failure")
            {
            }
            column(StorageDeviceFailure_ICTHelpdesk; "ICT Helpdesk"."Storage Device Failure")
            {
            }
            column(HardwareInstallation_ICTHelpdesk; "ICT Helpdesk"."Hardware Installation")
            {
            }
            column(OthersspecifyHW_ICTHelpdesk; "ICT Helpdesk"."Others, specify HW")
            {
            }
            column(ComputerRunningLoadingSlow_ICTHelpdesk; "ICT Helpdesk"."Computer Running /Loading Slow")
            {
            }
            column(NetworkAccessProblems_ICTHelpdesk; "ICT Helpdesk"."Network Access Problems")
            {
            }
            column(AntivirusInefficiency_ICTHelpdesk; "ICT Helpdesk"."Antivirus Inefficiency")
            {
            }
            column(Applications_ICTHelpdesk; "ICT Helpdesk".Applications)
            {
            }
            column(SoftwareInstallation_ICTHelpdesk; "ICT Helpdesk"."Software Installation")
            {
            }
            column(OthersspecifySW_ICTHelpdesk; "ICT Helpdesk"."Others, specify SW")
            {
            }
            column(Diagnosis_ICTHelpdesk; "ICT Helpdesk".Diagnosis)
            {
            }
            column(ActionTaken_ICTHelpdesk; "ICT Helpdesk"."Action Taken")
            {
            }
            column(AttendedBy_ICTHelpdesk; "ICT Helpdesk"."Attended By")
            {
            }
            column(AttendedDate_ICTHelpdesk; "ICT Helpdesk"."Attended Date")
            {
            }
            column(AttendedTime_ICTHelpdesk; "ICT Helpdesk"."Attended Time")
            {
            }
            column(TechnicalStaffRemarks_ICTHelpdesk; "ICT Helpdesk"."Technical Staff Remarks")
            {
            }
            column(RequestingOfficerRemarks_ICTHelpdesk; "ICT Helpdesk"."Requesting Officer Remarks")
            {
            }
            column(AttendedbyName_ICTHelpdesk; "ICT Helpdesk"."Attended by Name")
            {
            }
            column(Status_ICTHelpdesk; "ICT Helpdesk".Status)
            {
            }
            column(NoSeries_ICTHelpdesk; "ICT Helpdesk"."No. Series")
            {
            }
            column(ICTIssueCategory_ICTHelpdesk; "ICT Helpdesk"."ICT Issue Category")
            {
            }
            column(EscalatedTo_ICTHelpdesk; "ICT Helpdesk"."Escalated To")
            {
            }
            column(EscalatedBy_ICTHelpdesk; "ICT Helpdesk"."Escalated By")
            {
            }
            column(EscalatedDate_ICTHelpdesk; "ICT Helpdesk"."Escalated Date")
            {
            }
            column(EscalatedTime_ICTHelpdesk; "ICT Helpdesk"."Escalated Time")
            {
            }
            column(RequesterFeedback_ICTHelpdesk; "ICT Helpdesk"."Requester Feedback")
            {
            }
            column(Reopened_ICTHelpdesk; "ICT Helpdesk".Reopened)
            {
            }
            column(ReopenedBy_ICTHelpdesk; "ICT Helpdesk"."Reopened By")
            {
            }
            column(FeedBackGiven_ICTHelpdesk; "ICT Helpdesk"."Feed Back Given")
            {
            }
            column(GlobalDimension1Code_ICTHelpdesk; "ICT Helpdesk"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ICTHelpdesk; "ICT Helpdesk"."Global Dimension 2 Code")
            {
            }
            column(ShortcutDimension1Code_ICTHelpdesk; "ICT Helpdesk"."Shortcut Dimension 1 Code")
            {
            }
            column(RegionName_ICTHelpdesk; "ICT Helpdesk"."Region Name")
            {
            }
            column(ConstituencyName_ICTHelpdesk; "ICT Helpdesk"."Constituency Name")
            {
            }
            column(Descriptionoftheissue_ICTHelpdesk; "ICT Helpdesk"."Description of the issue")
            {
            }
            column(EmployeeNo_ICTHelpdesk; "ICT Helpdesk"."Employee No")
            {
            }
            column(AscalationDetails_ICTHelpdesk; "ICT Helpdesk"."Ascalation Details")
            {
            }
            column(ICTInventory_ICTHelpdesk; "ICT Helpdesk"."ICT Inventory")
            {
            }
            column(ClosedDate_ICTHelpdesk; "ICT Helpdesk"."Closed Date")
            {
            }
            column(ClosedTime_ICTHelpdesk; "ICT Helpdesk"."Closed Time")
            {
            }
            column(ICTInventoryName_ICTHelpdesk; "ICT Helpdesk"."ICT Inventory Name")
            {
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}
