#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69005 "Leave Application Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Leave Application Form.rdlc';

    dataset
    {
        dataitem("HR Leave Application"; "HR Leave Application")
        {
            RequestFilterFields = "Application Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(C_Name; CompInfo.Name)
            {
            }
            column(C_Address; CompInfo.Address)
            {
            }
            column(C_Address2; CompInfo."Address 2")
            {
            }
            column(C_PostCode; CompInfo."Post Code")
            {
            }
            column(C_City; CompInfo.City)
            {
            }
            column(C_Picture; CompInfo.Picture)
            {
            }
            column(C_Country; CompInfo."Country/Region Code")
            {
            }
            column(C_Phone; CompInfo."Phone No.")
            {
            }
            column(dEarnd; dEarnd)
            {
            }
            column(dTaken; dTaken)
            {
            }
            column(dLeft; dLeft)
            {
            }
            column(ApplicationCode_HRLeaveApplication; "HR Leave Application"."Application Code")
            {
            }
            column(LeaveType_HRLeaveApplication; "HR Leave Application"."Leave Type")
            {
            }
            column(DaysApplied_HRLeaveApplication; "HR Leave Application"."Days Applied")
            {
            }
            column(StartDate_HRLeaveApplication; "HR Leave Application"."Start Date")
            {
            }
            column(ReturnDate_HRLeaveApplication; "HR Leave Application"."Return Date")
            {
            }
            column(ApplicationDate_HRLeaveApplication; "HR Leave Application"."Application Date")
            {
            }
            column(Status_HRLeaveApplication; "HR Leave Application".Status)
            {
            }
            column(test_HRLeaveApplication; "HR Leave Application".test)
            {
            }
            column(ApplicantComments_HRLeaveApplication; "HR Leave Application"."Applicant Comments")
            {
            }
            column(Noseries_HRLeaveApplication; "HR Leave Application"."No series")
            {
            }
            column(Selected_HRLeaveApplication; "HR Leave Application".Selected)
            {
            }
            column(tes_HRLeaveApplication; "HR Leave Application".tes)
            {
            }
            column(CurrentBalance_HRLeaveApplication; "HR Leave Application"."Current Balance")
            {
            }
            column(EndDate_HRLeaveApplication; "HR Leave Application"."End Date")
            {
            }
            column(TotalTaken_HRLeaveApplication; "HR Leave Application"."Total Taken")
            {
            }
            column(EmailAddress_HRLeaveApplication; "HR Leave Application"."E-mail Address")
            {
            }
            column(EntryNo_HRLeaveApplication; "HR Leave Application"."Entry No")
            {
            }
            column(StartDateFilter_HRLeaveApplication; "HR Leave Application"."Start Date Filter")
            {
            }
            column(CellPhoneNumber_HRLeaveApplication; "HR Leave Application"."Cell Phone Number")
            {
            }
            column(RequestLeaveAllowance_HRLeaveApplication; "HR Leave Application"."Request Leave Allowance")
            {
            }
            column(Picture_HRLeaveApplication; "HR Leave Application".Picture)
            {
            }
            column(Names_HRLeaveApplication; "HR Leave Application".Names)
            {
            }
            column(LeaveAllowanceEntittlement_HRLeaveApplication; "HR Leave Application"."Leave Allowance Entittlement")
            {
            }
            column(LeaveAllowanceAmount_HRLeaveApplication; "HR Leave Application"."Leave Allowance Amount")
            {
            }
            column(DetailsofExamination_HRLeaveApplication; "HR Leave Application"."Details of Examination")
            {
            }
            column(DateofExam_HRLeaveApplication; "HR Leave Application"."Date of Exam")
            {
            }
            column(Reliever_HRLeaveApplication; "HR Leave Application".Reliever)
            {
            }
            column(RelieverName_HRLeaveApplication; "HR Leave Application"."Reliever Name")
            {
            }
            column(Description_HRLeaveApplication; "HR Leave Application".Description)
            {
            }
            column(SupervisorEmail_HRLeaveApplication; "HR Leave Application".testss)
            {
            }
            column(NumberofPreviousAttempts_HRLeaveApplication; "HR Leave Application"."Number of Previous Attempts")
            {
            }
            column(JobTittle_HRLeaveApplication; "HR Leave Application"."Job Tittle")
            {
            }
            column(UserID_HRLeaveApplication; "HR Leave Application"."User ID")
            {
            }
            column(EmployeeNo_HRLeaveApplication; "HR Leave Application"."Employee No")
            {
            }
            column(Supervisor_HRLeaveApplication; "HR Leave Application".Tests)
            {
            }
            column(ResponsibilityCenter_HRLeaveApplication; "HR Leave Application"."Responsibility Center")
            {
            }
            column(Approveddays_HRLeaveApplication; "HR Leave Application"."Approved days")
            {
            }
            column(Attachments_HRLeaveApplication; "HR Leave Application".Attachments)
            {
            }
            column(Emergency_HRLeaveApplication; "HR Leave Application".Emergency)
            {
            }
            column(ApproverComments_HRLeaveApplication; "HR Leave Application"."Approver Comments")
            {
            }
            column(RelieverAddress_HRLeaveApplication; "HR Leave Application".RelieverAddress)
            {
            }
            column(Grade_HRLeaveApplication; "HR Leave Application".Grade)
            {
            }
            column(Reason_HRLeaveApplication; "HR Leave Application".Reason)
            {
            }
            column(Department_HRLeaveApplication; "HR Leave Application".Department)
            {
            }
            column(Posted_HRLeaveApplication; "HR Leave Application".Posted)
            {
            }
            column(EmployeeName_HRLeaveApplication; "HR Leave Application"."Employee Name")
            {
            }
            column(ResumptionDate_HRLeaveApplication; "HR Leave Application"."Resumption Date")
            {
            }
            column(DepartmentName_HRLeaveApplication; "HR Leave Application"."Department Name")
            {
            }
            column(JobID_HRLeaveApplication; "HR Leave Application"."Job ID")
            {
            }
            column(Designation_HRLeaveApplication; "HR Leave Application".Designation)
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
            column(Supervisor; UserSetup2."Employee Name")
            {
            }
            column(DateExamined; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(HRApproval; UserSetup2."Employee Name")
            {
            }
            column(HRApprovalDate; ApproverDate[3])
            {
            }
            column(HRSignature; UserSetup2.Picture)
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

            trigger OnAfterGetRecord()
            begin
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69205);
                ApprovalEntries.SetRange("Approval Code", "HR Leave Application"."Application Code");
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
                    until
                   ApprovalEntries.Next = 0;

                end;

                dAlloc := 0;
                dEarnd := 0;
                dTaken := 0;
                dLeft := 0;
                cReimbsd := 0;
                cPerDay := 0;
                cbf := 0;
                if HREmp.Get("HR Leave Application"."Employee No") then begin
                    HREmp.SetFilter(HREmp."Leave Type Filter", "HR Leave Application"."Leave Type");
                    HREmp.CalcFields(HREmp."Allocated Leave Days");
                    dAlloc := HREmp."Allocated Leave Days";
                    HREmp.Validate(HREmp."Allocated Leave Days");
                    dEarnd := HREmp."Total (Leave Days)";
                    HREmp.CalcFields(HREmp."Total Leave Taken");
                    dTaken := HREmp."Total Leave Taken";
                    HREmp.CalcFields(HREmp."Leave Outstanding Bal");
                    dLeft := HREmp."Leave Outstanding Bal";
                    cReimbsd := HREmp."Cash - Leave Earned";
                    cPerDay := HREmp."Cash per Leave Day";
                    HREmp.CalcFields(HREmp."Reimbursed Leave Days");
                    cbf := HREmp."Reimbursed Leave Days";
                end;
            end;

            trigger OnPreDataItem()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
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

    trigger OnPreReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture);
    end;

    var
        CompInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        HREmp: Record Employee;
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRLeaveTypes: Record "HR Leave Types";
}
