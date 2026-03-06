#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56200 "Customer Feedback"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Customer Feedback.rdlc';

    dataset
    {
        dataitem("Customer FeedbackS"; "Customer FeedbackS")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            column(Address_1; CompanyInfo.Address)
            {
            }
            column(Address_2; CompanyInfo."Address 2")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Phone_No; CompanyInfo."Phone No.")
            {
            }
            column(Phone_No2; CompanyInfo."Phone No. 2")
            {
            }
            column(No_CustomerFeedbackS; "Customer FeedbackS".No)
            {
            }
            column(CustomerName_CustomerFeedbackS; "Customer FeedbackS"."Customer Name")
            {
            }
            column(FeedbackDate_CustomerFeedbackS; "Customer FeedbackS"."Feedback Date")
            {
            }
            column(Description_CustomerFeedbackS; "Customer FeedbackS".Description)
            {
            }
            column(Action_CustomerFeedbackS; "Customer FeedbackS".Action)
            {
            }
            column(CreatedBy_CustomerFeedbackS; "Customer FeedbackS"."Created By")
            {
            }
            column(Datecreated_CustomerFeedbackS; "Customer FeedbackS"."Date created")
            {
            }
            column(Timecreated_CustomerFeedbackS; "Customer FeedbackS"."Time created")
            {
            }
            column(NoSeries_CustomerFeedbackS; "Customer FeedbackS"."No. Series")
            {
            }
            column(Gender_CustomerFeedbackS; "Customer FeedbackS".Gender)
            {
            }
            column(Age_CustomerFeedbackS; "Customer FeedbackS".Age)
            {
            }
            column(Organization_CustomerFeedbackS; "Customer FeedbackS".Organization)
            {
            }
            column(Email_CustomerFeedbackS; "Customer FeedbackS".Email)
            {
            }
            column(PhoneNo_CustomerFeedbackS; "Customer FeedbackS"."Phone No")
            {
            }
            column(Reception_CustomerFeedbackS; "Customer FeedbackS".Reception)
            {
            }
            column(PromptServices_CustomerFeedbackS; "Customer FeedbackS"."Prompt Services")
            {
            }
            column(ReceptionFacilities_CustomerFeedbackS; "Customer FeedbackS"."Reception Facilities")
            {
            }
            column(Professionalism_CustomerFeedbackS; "Customer FeedbackS".Professionalism)
            {
            }
            column(GeneralPresentation_CustomerFeedbackS; "Customer FeedbackS"."General Presentation")
            {
            }
            column(Efficiency_CustomerFeedbackS; "Customer FeedbackS".Efficiency)
            {
            }
            column(Quality_CustomerFeedbackS; "Customer FeedbackS".Quality)
            {
            }
            column(Knowledge_CustomerFeedbackS; "Customer FeedbackS".Knowledge)
            {
            }
            column(RecommendationLikelihood_CustomerFeedbackS; "Customer FeedbackS"."Recommendation Likelihood")
            {
            }
            column(ServicesSought_CustomerFeedbackS; "Customer FeedbackS"."Services Sought")
            {
            }
            column(AnyProblems_CustomerFeedbackS; "Customer FeedbackS"."Any Problems")
            {
            }
            column(Overallsatisfaction_CustomerFeedbackS; "Customer FeedbackS"."Overall satisfaction")
            {
            }
            column(Comments_CustomerFeedbackS; "Customer FeedbackS".Comments)
            {
            }
            column(Improvement_CustomerFeedbackS; "Customer FeedbackS".Improvement)
            {
            }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get;
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
        CompanyInfo: Record "Company Information";
}
