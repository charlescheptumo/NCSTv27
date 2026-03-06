#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69136 "Employees with Excess Claims"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employees with Excess Claims.rdlc';

    dataset
    {
        dataitem("Medical Scheme Header"; "Medical Scheme Header")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Entitlement -Inpatient";
            column(ReportForNavId_3647; 3647)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(Medical_Scheme_Header1__Employee_No_; "Medical Scheme Header"."Employee No")
            {
            }
            column(Medical_Scheme_Header1__Employee_Name_; "Medical Scheme Header"."Employee Name")
            {
            }
            column(Medical_Scheme_Header1__Entitlement__Inpatient_; "Medical Scheme Header"."Entitlement -Inpatient")
            {
            }
            column(Medical_Scheme_Header1__Entitlement__OutPatient_; "Medical Scheme Header"."Entitlement -OutPatient")
            {
            }
            column(Medical_Scheme_Header1__In_Patient_Claims_; "Medical Scheme Header"."In-Patient Claims")
            {
            }
            column(Medical_Scheme_Header1__Out_Patient_Claims_; "Medical Scheme Header"."Out-Patient Claims")
            {
            }
            column(Medical_Scheme_Header1__Policy_Start_Date_; "Medical Scheme Header"."Policy Start Date")
            {
            }
            column(Medical_Scheme_Header1__Policy_Expiry_Date_; "Medical Scheme Header"."Policy Expiry Date")
            {
            }
            column(Employees_with_Excess_ClaimsCaption; Employees_with_Excess_ClaimsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Medical_Scheme_Header1__Employee_No_Caption; "Medical Scheme Header".FieldCaption("Medical Scheme Header"."Employee No"))
            {
            }
            column(Medical_Scheme_Header1__Employee_Name_Caption; "Medical Scheme Header".FieldCaption("Medical Scheme Header"."Employee Name"))
            {
            }
            column(Medical_Scheme_Header1__Entitlement__Inpatient_Caption; "Medical Scheme Header".FieldCaption("Medical Scheme Header"."Entitlement -Inpatient"))
            {
            }
            column(Medical_Scheme_Header1__Entitlement__OutPatient_Caption; "Medical Scheme Header".FieldCaption("Medical Scheme Header"."Entitlement -OutPatient"))
            {
            }
            column(Medical_Scheme_Header1__In_Patient_Claims_Caption; "Medical Scheme Header".FieldCaption("Medical Scheme Header"."In-Patient Claims"))
            {
            }
            column(Medical_Scheme_Header1__Out_Patient_Claims_Caption; "Medical Scheme Header".FieldCaption("Medical Scheme Header"."Out-Patient Claims"))
            {
            }
            column(Medical_Scheme_Header1__Policy_Start_Date_Caption; "Medical Scheme Header".FieldCaption("Medical Scheme Header"."Policy Start Date"))
            {
            }
            column(Medical_Scheme_Header1__Policy_Expiry_Date_Caption; "Medical Scheme Header".FieldCaption("Medical Scheme Header"."Policy Expiry Date"))
            {
            }
            column(Medical_Scheme_Header1_No_; "Medical Scheme Header"."No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                amount := 0;
                amount := "Medical Scheme Header"."Entitlement -OutPatient" - "Medical Scheme Header"."Out-Patient Claims";
                if amount > 0 then begin
                    CurrReport.Skip;

                end
            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Reset;
                CompanyInfo.CalcFields(CompanyInfo.Picture);
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
        excessclaim: Record "Medical Scheme Header";
        amount: Decimal;
        CompanyInfo: Record "Company Information";
        Employees_with_Excess_ClaimsCaptionLbl: label 'Employees with Excess Claims';
        CurrReport_PAGENOCaptionLbl: label 'Page';
}
