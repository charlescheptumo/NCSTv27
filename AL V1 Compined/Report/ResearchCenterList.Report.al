#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65009 "Research Center List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Research Center List.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Research Center"; "Research Center")
        {
            PrintOnlyIfDetail = false;
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(Number_In_Words; NumberText[1])
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
            column(ExaminedBy; UserSetup2."Employee Name")
            {
            }
            column(DateExamined; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
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
            column(Code_ResearchCenter; "Research Center".Code)
            {
            }
            column(Name_ResearchCenter; "Research Center".Name)
            {
            }
            column(Address_ResearchCenter; "Research Center".Address)
            {
            }
            column(Address2_ResearchCenter; "Research Center"."Address 2")
            {
            }
            column(City_ResearchCenter; "Research Center".City)
            {
            }
            column(PostCode_ResearchCenter; "Research Center"."Post Code")
            {
            }
            column(CountryRegionCode_ResearchCenter; "Research Center"."Country/Region Code")
            {
            }
            column(PhoneNo_ResearchCenter; "Research Center"."Phone No.")
            {
            }
            column(FaxNo_ResearchCenter; "Research Center"."Fax No.")
            {
            }
            column(Name2_ResearchCenter; "Research Center"."Name 2")
            {
            }
            column(Contact_ResearchCenter; "Research Center".Contact)
            {
            }
            column(GlobalDimension1Code_ResearchCenter; "Research Center"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ResearchCenter; "Research Center"."Global Dimension 2 Code")
            {
            }
            column(LocationCode_ResearchCenter; "Research Center"."Location Code")
            {
            }
            column(County_ResearchCenter; "Research Center".County)
            {
            }
            column(EMail_ResearchCenter; "Research Center"."E-Mail")
            {
            }
            column(HomePage_ResearchCenter; "Research Center"."Home Page")
            {
            }
            column(DateFilter_ResearchCenter; "Research Center"."Date Filter")
            {
            }
            column(ContractGainLossAmount_ResearchCenter; "Research Center"."Contract Gain/Loss Amount")
            {
            }
            column(ResearchCenter_ResearchCenter; "Research Center"."Research Center?")
            {
            }
            column(CenterDirector_ResearchCenter; "Research Center"."Center Director")
            {
            }
            column(Overview_ResearchCenter; "Research Center".Overview)
            {
            }
            column(Blocked_ResearchCenter; "Research Center".Blocked)
            {
            }
            column(CenterDirectorName_ResearchCenter; "Research Center"."Center Director Name")
            {
            }
            column(NoofResearchPrograms_ResearchCenter; "Research Center"."No. of Research Programs")
            {
            }
            column(NoofAwardedGFO_ResearchCenter; "Research Center"."No. of Awarded GFO")
            {
            }
            column(NoofLostGrantGFO_ResearchCenter; "Research Center"."No. of Lost Grant GFO")
            {
            }
            column(NoofOngoingRProjects_ResearchCenter; "Research Center"."No. of Ongoing RProjects")
            {
            }
            column(NoofCompletedRProjects_ResearchCenter; "Research Center"."No. of Completed RProjects")
            {
            }
            column(TotalAmountAwardedLCY_ResearchCenter; "Research Center"."Total Amount Awarded(LCY)")
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

    trigger OnInitReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        TTotal: Decimal;
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        PaymentMgt: Codeunit "Payments-Post";
        CurrencyCodeText: Code[10];
}
