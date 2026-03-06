#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 58001 "Copyright Applicant Profile"
{
    ApplicationArea = All;
    // DefaultLayout = RDLC;
    // RDLCLayout = './Layouts/Copyright Applicant Profile.rdlc';

    // dataset
    // {
    //     dataitem(UnknownTable58003; 58003)
    //     {
    //         PrintOnlyIfDetail = false;
    //         RequestFilterFields = Field1;
    //         column(ReportForNavId_1000000000; 1000000000)
    //         {
    //         }
    //         column(CompanyLogo; CompanyInfo.Picture)
    //         {
    //         }
    //         column(CompanyName; CompanyInfo.Name)
    //         {
    //         }
    //         column(CompanyAddress; CompanyInfo.Address)
    //         {
    //         }
    //         column(CompanyAddress2; CompanyInfo."Address 2")
    //         {
    //         }
    //         column(CompanyPostCode; CompanyInfo."Post Code")
    //         {
    //         }
    //         column(CompanyCity; CompanyInfo.City)
    //         {
    //         }
    //         column(CompanyPhone; CompanyInfo."Phone No.")
    //         {
    //         }
    //         column(CompanyFax; CompanyInfo."Fax No.")
    //         {
    //         }
    //         column(CompanyEmail; CompanyInfo."E-Mail")
    //         {
    //         }
    //         column(CompanyWebsite; CompanyInfo."Home Page")
    //         {
    //         }
    //         column(No_Applicant; Table58003."No.")
    //         {
    //         }
    //         column(Name_Applicant; Table58003.Name)
    //         {
    //         }
    //         column(Address_Applicant; Table58003.Address)
    //         {
    //         }
    //         column(Address2_Applicant; Table58003."Address 2")
    //         {
    //         }
    //         column(PostCode_Applicant; Table58003."Post Code")
    //         {
    //         }
    //         column(City_Applicant; Table58003.City)
    //         {
    //         }
    //         column(Country_Applicant; Table58003."Country/Region Code")
    //         {
    //         }
    //         column(PhoneNo_Applicant; Table58003."Phone No.")
    //         {
    //         }
    //         column(Email_Applicant; Table58003."E-Mail")
    //         {
    //         }
    //         column(PIN_Applicant; Table58003."P.I.N")
    //         {
    //         }
    //         column(IDNO_Applicant; Table58003."ID. No.")
    //         {
    //         }
    //         column(CompanyRegNo_Applicant; Table58003."Company Reg No")
    //         {
    //         }
    //         column(Type_Applicant; Table58003.Type)
    //         {
    //         }
    //         column(ApplicantCategory_Applicant; Table58003."Customer Category")
    //         {
    //         }

    //         trigger OnAfterGetRecord()
    //         begin
    //             //Ushindi
    //             /*
    //             CheckReport.InitTextVariable();
    //             CheckReport.FormatNoText(NumberText,TTotal,'');
    //             */

    //             //Approvals
    //             ApprovalEntries.Reset;
    //             ApprovalEntries.SetRange("Table ID", 58003);
    //             ApprovalEntries.SetRange("Document No.", Table58003."No.");
    //             ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
    //             if ApprovalEntries.Find('-') then begin
    //                 i := 0;
    //                 repeat
    //                     i := i + 1;
    //                     if i = 1 then begin
    //                         Approver[1] := ApprovalEntries."Sender ID";
    //                         ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
    //                         if UserSetup.Get(Approver[1]) then
    //                             UserSetup.CalcFields(Picture);

    //                         Approver[2] := ApprovalEntries."Approver ID";
    //                         ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
    //                         if UserSetup1.Get(Approver[2]) then
    //                             UserSetup1.CalcFields(Picture);
    //                     end;
    //                     if i = 2 then begin
    //                         Approver[3] := ApprovalEntries."Approver ID";
    //                         ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
    //                         if UserSetup2.Get(Approver[3]) then
    //                             UserSetup2.CalcFields(Picture);
    //                     end;
    //                     if i = 3 then begin
    //                         Approver[4] := ApprovalEntries."Approver ID";
    //                         ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
    //                         if UserSetup3.Get(Approver[4]) then
    //                             UserSetup3.CalcFields(Picture);
    //                     end;
    //                 until
    //                ApprovalEntries.Next = 0;

    //             end;

    //         end;

    //         trigger OnPreDataItem()
    //         begin
    //             //Payments.CALCFIELDS(Payments."Bank Name",Payments."Project Description");
    //         end;
    //     }
    // }

    // requestpage
    // {

    //     layout
    //     {
    //     }

    //     actions
    //     {
    //     }
    // }

    // labels
    // {
    // }

    // trigger OnInitReport()
    // begin
    //     //Ushindi Changes
    //     //Indicate Logo
    //     CompanyInfo.Get;
    //     CompanyInfo.CalcFields(CompanyInfo.Picture);
    // end;

    // trigger OnPreReport()
    // begin
    //     //Ushindi Changes
    //     //Indicate Logo
    //     CompanyInfo.Get;
    //     CompanyInfo.CalcFields(CompanyInfo.Picture);
    // end;

    // var
    //     CompanyInfo: Record "Company Information";
    //     CheckReport: Report Check;
    //     NumberText: array[2] of Text[80];
    //     TTotal: Decimal;
    //     ApprovalEntries: Record "Approval Entry";
    //     Approver: array[10] of Code[20];
    //     ApproverDate: array[10] of DateTime;
    //     UserSetup: Record "User Setup";
    //     UserSetup1: Record "User Setup";
    //     UserSetup2: Record "User Setup";
    //     UserSetup3: Record "User Setup";
    //     i: Integer;
}
