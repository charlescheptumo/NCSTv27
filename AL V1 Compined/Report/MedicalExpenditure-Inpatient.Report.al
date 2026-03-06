#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69134 "Medical Expenditure -Inpatient"
{
    // DefaultLayout = RDLC;
    // RDLCLayout = './Layouts/Medical Expenditure -Inpatient.rdlc';

    // dataset
    // {
    //     dataitem(UnknownTable51511306; UnknownTable51511306)
    //     {
    //         PrintOnlyIfDetail = true;
    //         RequestFilterFields = "Employee No", "Cover Selected", "Policy Start Date";
    //         column(ReportForNavId_3647; 3647)
    //         {
    //         }
    //         column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
    //         {
    //         }
    //         column(USERID; UserId)
    //         {
    //         }
    //         column(Claim_Line1__GETFILTERS; "Claim Line".GetFilters)
    //         {
    //         }
    //         column(CurrReport_PAGENO; CurrReport.PageNo)
    //         {
    //         }
    //         column(Medical_Scheme_Header1__Entitlement__Inpatient_; "Entitlement -Inpatient")
    //         {
    //         }
    //         column(Medical_Scheme_Header1__In_Patient_Claims_; "In-Patient Claims")
    //         {
    //         }
    //         column(Entitlement__Inpatient___In_Patient_Claims_; "Entitlement -Inpatient" - "In-Patient Claims")
    //         {
    //         }
    //         column(Medical_Scheme_Header1__Employee_Name_; "Employee Name")
    //         {
    //         }
    //         column(CompanyInfo_Picture; CompanyInfo.Picture)
    //         {
    //         }
    //         column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
    //         {
    //         }
    //         column(Medical_EntitlementCaption; Medical_EntitlementCaptionLbl)
    //         {
    //         }
    //         column(Expenditure_to_DateCaption; Expenditure_to_DateCaptionLbl)
    //         {
    //         }
    //         column(Employee_Medical_Expenditure_In_PatientCaption; Employee_Medical_Expenditure_In_PatientCaptionLbl)
    //         {
    //         }
    //         column(Medical_Scheme_Header1_No_; "No.")
    //         {
    //         }
    //         column(Medical_Scheme_Header1_Employee_No; "Employee No")
    //         {
    //         }
    //         column(Medical_Scheme_Header1_Policy_Start_Date; "Policy Start Date")
    //         {
    //         }
    //         dataitem(UnknownTable51511322; UnknownTable51511322)
    //         {
    //             DataItemLink = "Employee No" = field("Employee No"), "Policy Start Date" = field("Policy Start Date");
    //             DataItemTableView = sorting("Claim No", "Line No") where("Claim Type" = const("In Patient"));
    //             RequestFilterFields = "Claim Type";
    //             column(ReportForNavId_8957; 8957)
    //             {
    //             }
    //             column(Claim_Line1__Claim_No_; "Claim No")
    //             {
    //             }
    //             column(Claim_Line1__Patient_Name_; "Patient Name")
    //             {
    //             }
    //             column(Claim_Line1__Hospital_Specialist_; "Hospital/Specialist")
    //             {
    //             }
    //             column(Claim_Line1__Invoice_Number_; "Invoice Number")
    //             {
    //             }
    //             column(Claim_Line1_Amount; Amount)
    //             {
    //             }
    //             column(Claim_Line1__Visit_Date_; "Visit Date")
    //             {
    //             }
    //             column(Claim_Line1__Claim_Line1__Relationship; "Claim Line".Relationship)
    //             {
    //             }
    //             column(ExpenseBal; ExpenseBal)
    //             {
    //             }
    //             column(Claim_Line1_Amount_Control1000000013; Amount)
    //             {
    //             }
    //             column(Claim_Line1__Claim_No_Caption; UnknownTable51511322.FieldCaption("Claim No"))
    //             {
    //             }
    //             column(Claim_Line1__Visit_Date_Caption; UnknownTable51511322.FieldCaption("Visit Date"))
    //             {
    //             }
    //             column(Claim_Line1__Patient_Name_Caption; UnknownTable51511322.FieldCaption("Patient Name"))
    //             {
    //             }
    //             column(Claim_Line1__Claim_Line1__RelationshipCaption; UnknownTable51511322.FieldCaption(Relationship))
    //             {
    //             }
    //             column(Hospital_ClinicCaption; Hospital_ClinicCaptionLbl)
    //             {
    //             }
    //             column(Invoice_Receipt_NumberCaption; Invoice_Receipt_NumberCaptionLbl)
    //             {
    //             }
    //             column(ExpensesCaption; ExpensesCaptionLbl)
    //             {
    //             }
    //             column(BalanceCaption; BalanceCaptionLbl)
    //             {
    //             }
    //             column(Claim_Line1_Line_No; "Line No")
    //             {
    //             }
    //             column(Claim_Line1_Employee_No; "Employee No")
    //             {
    //             }
    //             column(Claim_Line1_Policy_Start_Date; "Policy Start Date")
    //             {
    //             }

    //             trigger OnAfterGetRecord()
    //             begin

    //                 MedScheme.Reset;
    //                 MedScheme.SetRange(MedScheme."Employee No", "Claim Line"."Employee No");
    //                 if MedScheme.Find('+') then
    //                     MedScheme.CalcFields(MedScheme."In-Patient Claims");
    //                 ExpenseBalline := ExpenseBalline + "Claim Line".Amount;
    //                 // MESSAGE('the balance now is %1',ExpenseBal );
    //                 ExpenseBal := "Medical Scheme Header"."Entitlement -Inpatient" - ExpenseBalline;
    //             end;
    //         }

    //         trigger OnAfterGetRecord()
    //         begin
    //             "Medical Scheme Header".CalcFields("Medical Scheme Header"."In-Patient Claims");
    //             ExpenseBalline := 0;
    //         end;

    //         trigger OnPreDataItem()
    //         begin
    //             CompanyInfo.Reset;
    //             CompanyInfo.CalcFields(CompanyInfo.Picture);
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

    // var
    //     ExpenseBal: Decimal;
    //     MedScheme: Record UnknownRecord51511306;
    //     ExpenseBalline: Decimal;
    //     CompanyInfo: Record "Company Information";
    //     CurrReport_PAGENOCaptionLbl: label 'Page';
    //     Medical_EntitlementCaptionLbl: label 'Medical Entitlement';
    //     Expenditure_to_DateCaptionLbl: label 'Expenditure to Date';
    //     Employee_Medical_Expenditure_In_PatientCaptionLbl: label 'Employee Medical Expenditure In-Patient';
    //     Hospital_ClinicCaptionLbl: label 'Hospital/Clinic';
    //     Invoice_Receipt_NumberCaptionLbl: label 'Invoice/Receipt Number';
    //     ExpensesCaptionLbl: label 'Expenses';
    //     BalanceCaptionLbl: label 'Balance';
}
