#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56238 "ICT Helpdesk Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Helpdesk Report.rdlc';
    PreviewMode = PrintLayout;
    ApplicationArea = All;

    dataset
    {
        dataitem("ICT Helpdesk"; "ICT Helpdesk")
        {
            DataItemTableView = sorting("Job No.");
            RequestFilterFields = "Job No.";
            column(ReportForNavId_1; 1)
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
            column(RequestingOfficer_ICTHelpdesk; "ICT Helpdesk"."Requesting Officer")
            {
            }
            column(RequestingOfficerName_ICTHelpdesk; "ICT Helpdesk"."Requesting Officer Name")
            {
            }
            column(DepartmentName_ICTHelpdesk; "ICT Helpdesk"."Department Name")
            {
            }
            column(NatureofService_ICTHelpdesk; "ICT Helpdesk"."Nature of Service")
            {
            }
            column(EXT_ICTHelpdesk; "ICT Helpdesk".EXT)
            {
            }
            column(Email_ICTHelpdesk; "ICT Helpdesk".Email)
            {
            }
            column(Phone_ICTHelpdesk; "ICT Helpdesk".Phone)
            {
            }
            column(RequestDate_ICTHelpdesk; "ICT Helpdesk"."Request Date")
            {
            }
            column(RequestTime_ICTHelpdesk; "ICT Helpdesk"."Request Time")
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
            column(Diagnosis_ICTHelpdesk; "ICT Helpdesk".Diagnosis)
            {
            }
            column(ActionTaken_ICTHelpdesk; "ICT Helpdesk"."Action Taken")
            {
            }
            column(AttendedbyName_ICTHelpdesk; "ICT Helpdesk"."Attended by Name")
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
            column(AttendedDate_ICTHelpdesk; "ICT Helpdesk"."Attended Date")
            {
            }
            column(AttendedTime_ICTHelpdesk; "ICT Helpdesk"."Attended Time")
            {
            }
            column(Company_name; companyinfo.Name)
            {
            }
            column(logo; companyinfo.Picture)
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

        if companyinfo.Get() then
            companyinfo.CalcFields(companyinfo.Picture);
    end;

    var
        companyinfo: Record "Company Information";
}
