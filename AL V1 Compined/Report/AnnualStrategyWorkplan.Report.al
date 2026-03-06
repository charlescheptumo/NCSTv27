#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 80002 "Annual Strategy Workplan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Annual Strategy Workplan.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Annual Strategy Workplan"; "Annual Strategy Workplan")
        {
            RequestFilterFields = No;
            column(ReportForNavId_1; 1)
            {
            }
            column(No_AnnualStrategyWorkplan; "Annual Strategy Workplan".No)
            {
            }
            column(Description_AnnualStrategyWorkplan; "Annual Strategy Workplan".Description)
            {
            }
            column(StrategyPlanID_AnnualStrategyWorkplan; "Annual Strategy Workplan"."Strategy Plan ID")
            {
            }
            column(YearReportingCode_AnnualStrategyWorkplan; "Annual Strategy Workplan"."Year Reporting Code")
            {
            }
            column(StartDate_AnnualStrategyWorkplan; "Annual Strategy Workplan"."Start Date")
            {
            }
            column(EndDate_AnnualStrategyWorkplan; "Annual Strategy Workplan"."End Date")
            {
            }
            column(NoSeries_AnnualStrategyWorkplan; "Annual Strategy Workplan"."No. Series")
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(ReportForNavId_124; 124)
                {
                }
                column(Name_CompanyInformation; "Company Information".Name)
                {
                }
                column(Name2_CompanyInformation; "Company Information"."Name 2")
                {
                }
                column(Address_CompanyInformation; "Company Information".Address)
                {
                }
                column(Address2_CompanyInformation; "Company Information"."Address 2")
                {
                }
                column(City_CompanyInformation; "Company Information".City)
                {
                }
                column(Picture_CompanyInformation; "Company Information".Picture)
                {
                }
                column(PostCode_CompanyInformation; "Company Information"."Post Code")
                {
                }
                column(County_CompanyInformation; "Company Information".County)
                {
                }
                column(CountryName; CountryName)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*Country.RESET;
                    Country.SETRANGE(Code, "Company Information"."Country/Region Code");
                    IF Country.FINDSET THEN
                      CountryName:=Country.Name;*/


                    if Country.Get("Company Information"."Country/Region Code") then
                        CountryName := Country.Name;

                end;
            }
            dataitem("Strategy Workplan Lines"; "Strategy Workplan Lines")
            {
                DataItemLink = No = field(No);
                column(ReportForNavId_17; 17)
                {
                }
                column(No_StrategyWorkplanLines; "Strategy Workplan Lines".No)
                {
                }
                column(StrategyPlanID_StrategyWorkplanLines; "Strategy Workplan Lines"."Strategy Plan ID")
                {
                }
                column(ActivityID_StrategyWorkplanLines; "Strategy Workplan Lines"."Activity ID")
                {
                }
                column(Description_StrategyWorkplanLines; "Strategy Workplan Lines".Description)
                {
                }
                column(ImportedAnnualTargetQty_StrategyWorkplanLines; "Strategy Workplan Lines"."Imported Annual Target Qty")
                {
                }
                column(ImportedAnnualBudgetEst_StrategyWorkplanLines; "Strategy Workplan Lines"."Imported Annual Budget Est.")
                {
                }
                column(PrimaryDirectorate_StrategyWorkplanLines; "Strategy Workplan Lines"."Primary Directorate")
                {
                }
                column(PrimaryDepartment_StrategyWorkplanLines; "Strategy Workplan Lines"."Primary Department")
                {
                }
                column(Q1Target_StrategyWorkplanLines; "Strategy Workplan Lines"."Q1 Target")
                {
                }
                column(Q1Budget_StrategyWorkplanLines; "Strategy Workplan Lines"."Q1 Budget")
                {
                }
                column(Q2Target_StrategyWorkplanLines; "Strategy Workplan Lines"."Q2 Target")
                {
                }
                column(Q2Budget_StrategyWorkplanLines; "Strategy Workplan Lines"."Q2 Budget")
                {
                }
                column(Q3Target_StrategyWorkplanLines; "Strategy Workplan Lines"."Q3 Target")
                {
                }
                column(Q3Budget_StrategyWorkplanLines; "Strategy Workplan Lines"."Q3 Budget")
                {
                }
                column(Q4Target_StrategyWorkplanLines; "Strategy Workplan Lines"."Q4 Target")
                {
                }
                column(Q4Budget_StrategyWorkplanLines; "Strategy Workplan Lines"."Q4 Budget")
                {
                }
                column(EntryType_StrategyWorkplanLines; "Strategy Workplan Lines"."Entry Type")
                {
                }
                column(YearReportingCode_StrategyWorkplanLines; "Strategy Workplan Lines"."Year Reporting Code")
                {
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

    var
        Country: Record "Country/Region";
        CountryName: Code[100];
}
