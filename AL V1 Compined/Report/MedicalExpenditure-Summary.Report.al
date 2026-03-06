#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69135 "Medical Expenditure -Summary"
{
    ApplicationArea = All;
    // DefaultLayout = RDLC;
    // RDLCLayout = './Layouts/Medical Expenditure -Summary.rdlc';

    // dataset
    // {
    //     dataitem(Employee; Employee)
    //     {
    //         DataItemTableView = where(Status = const(Active));
    //         column(ReportForNavId_7528; 7528)
    //         {
    //         }
    //         column(USERID; UserId)
    //         {
    //         }
    //         column(CurrReport_PAGENO; CurrReport.PageNo)
    //         {
    //         }
    //         column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
    //         {
    //         }
    //         column(CompanyInfo_Picture; CompanyInfo.Picture)
    //         {
    //         }
    //         column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
    //         {
    //         }
    //         column(Medical_Cover_SelectionCaption; Medical_Cover_SelectionCaptionLbl)
    //         {
    //         }
    //         column(Employee_No_; Employee."No.")
    //         {
    //         }
    //         // dataitem(UnknownTable51511306; UnknownTable51511306)
    //         // {
    //         //     DataItemLink = "Employee No" = field("No.");
    //         //     PrintOnlyIfDetail = false;
    //         //     RequestFilterFields = "Employee No", "Cover Type", "Cover Selected", "Policy Expiry Date";
    //         //     column(ReportForNavId_3647; 3647)
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__GETFILTERS; "Medical Scheme Header".GetFilters)
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__Employee_Name_; "Employee Name")
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__Cover_Type_; "Cover Type")
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__Entitlement__OutPatient_; "Entitlement -OutPatient")
    //         //     {
    //         //     }
    //         //     column(Entitlement__OutPatient___Out_Patient_Claims_; "Entitlement -OutPatient" - "Out-Patient Claims")
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__Out_Patient_Claims_; "Out-Patient Claims")
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__Entitlement__Inpatient_; "Entitlement -Inpatient")
    //         //     {
    //         //     }
    //         //     column(Entitlement__Inpatient___In_Patient_Claims_; "Entitlement -Inpatient" - "In-Patient Claims")
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__In_Patient_Claims_; "In-Patient Claims")
    //         //     {
    //         //     }
    //         //     column(Employee_NameCaption; Employee_NameCaptionLbl)
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__Cover_Type_Caption; UnknownTable51511306.FieldCaption("Cover Type"))
    //         //     {
    //         //     }
    //         //     column(ExpenditureCaption; ExpenditureCaptionLbl)
    //         //     {
    //         //     }
    //         //     column(Outpatient_BalanceCaption; Outpatient_BalanceCaptionLbl)
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__Entitlement__OutPatient_Caption; UnknownTable51511306.FieldCaption("Entitlement -OutPatient"))
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1__Entitlement__Inpatient_Caption; UnknownTable51511306.FieldCaption("Entitlement -Inpatient"))
    //         //     {
    //         //     }
    //         //     column(In_Patient_ExpenditureCaption; In_Patient_ExpenditureCaptionLbl)
    //         //     {
    //         //     }
    //         //     column(In_Patient_BalanceCaption; In_Patient_BalanceCaptionLbl)
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1_No_; "No.")
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1_Employee_No; "Employee No")
    //         //     {
    //         //     }
    //         //     column(Medical_Scheme_Header1_Policy_Start_Date; "Policy Start Date")
    //         //     {
    //         //     }
    //             dataitem(UnknownTable51511307; UnknownTable51511307)
    //             {
    //                 DataItemLink = "Employee Code" = field("Employee No"), "Medical Scheme No" = field("No."), "Policy Start Date" = field("Policy Start Date");
    //                 column(ReportForNavId_1975; 1975)
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_Relationship; Relationship)
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1__Date_Of_Birth_; "Date Of Birth")
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_Gender; Gender)
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1__Other_Names_; "Other Names")
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_SurName; SurName)
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1__Employee_Code_; "Employee Code")
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1__Employee_Code_Caption; UnknownTable51511307.FieldCaption("Employee Code"))
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_SurNameCaption; UnknownTable51511307.FieldCaption(SurName))
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1__Other_Names_Caption; UnknownTable51511307.FieldCaption("Other Names"))
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_RelationshipCaption; UnknownTable51511307.FieldCaption(Relationship))
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1__Date_Of_Birth_Caption; UnknownTable51511307.FieldCaption("Date Of Birth"))
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_GenderCaption; UnknownTable51511307.FieldCaption(Gender))
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_Medical_Scheme_No; "Medical Scheme No")
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_Line_No_; "Line No.")
    //                 {
    //                 }
    //                 column(Medical_Scheme_Lines1_Policy_Start_Date; "Policy Start Date")
    //                 {
    //                 }
    //             }

    //             trigger OnAfterGetRecord()
    //             begin
    //                 "Medical Scheme Header".CalcFields("Medical Scheme Header"."Out-Patient Claims");
    //                 ExpenseBal := 0;
    //                 ExpenseBalline := 0;
    //             end;

    //             trigger OnPreDataItem()
    //             begin

    //                 CurrReport.CreateTotals(MedScheme."Entitlement -OutPatient", MedScheme."Out-Patient Claims");
    //             end;
    //         }

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
    //     Medical_Cover_SelectionCaptionLbl: label 'Medical Cover Selection';
    //     Employee_NameCaptionLbl: label 'Employee Name';
    //     ExpenditureCaptionLbl: label 'Expenditure';
    //     Outpatient_BalanceCaptionLbl: label 'Outpatient Balance';
    //     In_Patient_ExpenditureCaptionLbl: label 'In-Patient Expenditure';
    //     In_Patient_BalanceCaptionLbl: label 'In-Patient Balance';
}
