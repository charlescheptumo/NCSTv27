#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 80001 "Corporate Strategic Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Corporate Strategic Plan.rdlc';

    dataset
    {
        dataitem("Corporate Strategic Plans"; "Corporate Strategic Plans")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(Code_CorporateStrategicPlans; "Corporate Strategic Plans".Code)
            {
            }
            column(Description_CorporateStrategicPlans; "Corporate Strategic Plans".Description)
            {
            }
            column(PrimaryTheme_CorporateStrategicPlans; "Corporate Strategic Plans"."Primary Theme")
            {
            }
            column(StrategyFramework_CorporateStrategicPlans; "Corporate Strategic Plans"."Strategy Framework")
            {
            }
            column(StartDate_CorporateStrategicPlans; "Corporate Strategic Plans"."Start Date")
            {
            }
            column(EndDate_CorporateStrategicPlans; "Corporate Strategic Plans"."End Date")
            {
            }
            column(DurationYears_CorporateStrategicPlans; "Corporate Strategic Plans"."Duration (Years)")
            {
            }
            column(VisionStatement_CorporateStrategicPlans; "Corporate Strategic Plans"."Vision Statement")
            {
            }
            column(MissionStatement_CorporateStrategicPlans; "Corporate Strategic Plans"."Mission Statement")
            {
            }
            column(ImplementationStatus_CorporateStrategicPlans; "Corporate Strategic Plans"."Implementation Status")
            {
            }
            column(ApprovalStatus_CorporateStrategicPlans; "Corporate Strategic Plans"."Approval Status")
            {
            }
            column(NoSeries_CorporateStrategicPlans; "Corporate Strategic Plans"."No. Series")
            {
            }
            column(CreatedBy_CorporateStrategicPlans; "Corporate Strategic Plans"."Created By")
            {
            }
            column(CreatedDate_CorporateStrategicPlans; "Corporate Strategic Plans"."Created Date")
            {
            }
            column(CreationTime_CorporateStrategicPlans; "Corporate Strategic Plans"."Creation Time")
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
            dataitem("Strategic Initiative"; "Strategic Initiative")
            {
                DataItemLink = "Strategic Plan ID" = field(Code);
                column(ReportForNavId_17; 17)
                {
                }
                column(StrategicPlanID_StrategicInitiative; "Strategic Initiative"."Strategic Plan ID")
                {
                }
                column(ThemeID_StrategicInitiative; "Strategic Initiative"."Theme ID")
                {
                }
                column(ObjectiveID_StrategicInitiative; "Strategic Initiative"."Objective ID")
                {
                }
                column(StrategyID_StrategicInitiative; "Strategic Initiative"."Strategy ID")
                {
                }
                column(Code_StrategicInitiative; "Strategic Initiative".Code)
                {
                }
                column(Description_StrategicInitiative; "Strategic Initiative".Description)
                {
                }
                column(FrameworkPerspective_StrategicInitiative; "Strategic Initiative"."Framework Perspective")
                {
                }
                column(StrategyPlannedTarget_StrategicInitiative; "Strategic Initiative"."Strategy Planned Target")
                {
                }
                column(PCPlannedTarget_StrategicInitiative; "Strategic Initiative"."PC Planned Target")
                {
                }
                column(AchievedTarget_StrategicInitiative; "Strategic Initiative"."Achieved Target")
                {
                }
                column(PlannedBudget_StrategicInitiative; "Strategic Initiative"."Planned Budget")
                {
                }
                column(UsageBudget_StrategicInitiative; "Strategic Initiative"."Usage Budget")
                {
                }
                column(StrategyFramework_StrategicInitiative; "Strategic Initiative"."Strategy Framework")
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
