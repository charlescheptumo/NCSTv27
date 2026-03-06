#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65022 "Researcher Profile"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Researcher Profile.rdlc';

    dataset
    {
        dataitem(Resource; Resource)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(No_Resource; Resource."No.")
            {
            }
            column(Type_Resource; Resource.Type)
            {
            }
            column(Name_Resource; Resource.Name)
            {
            }
            column(SearchName_Resource; Resource."Search Name")
            {
            }
            column(Name2_Resource; Resource."Name 2")
            {
            }
            column(Address_Resource; Resource.Address)
            {
            }
            column(Address2_Resource; Resource."Address 2")
            {
            }
            column(City_Resource; Resource.City)
            {
            }
            column(SocialSecurityNo_Resource; Resource."Social Security No.")
            {
            }
            column(JobTitle_Resource; Resource."Job Title")
            {
            }
            column(Education_Resource; Resource.Education)
            {
            }
            column(ContractClass_Resource; Resource."Contract Class")
            {
            }
            column(EmploymentDate_Resource; Resource."Employment Date")
            {
            }
            column(ResourceGroupNo_Resource; Resource."Resource Group No.")
            {
            }
            column(GlobalDimension1Code_Resource; Resource."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Resource; Resource."Global Dimension 2 Code")
            {
            }
            column(Comment_Resource; Resource.Comment)
            {
            }
            column(Blocked_Resource; Resource.Blocked)
            {
            }
            column(DateFilter_Resource; Resource."Date Filter")
            {
            }
            column(Picture_Resource; Resource.Image)
            {
            }
            column(PostCode_Resource; Resource."Post Code")
            {
            }
            column(County_Resource; Resource.County)
            {
            }
            column(Image_Resource; Resource.Image)
            {
            }
            column(Admin_Resource; Resource.Admin)
            {
            }
            column(EmployeeNo_Resource; Resource."Employee No")
            {
            }
            column(EmployeeName_Resource; Resource."Employee Name")
            {
            }
            column(ResourceType_Resource; Resource."Resource Type")
            {
            }
            column(ExternalConsultant_Resource; Resource."External Consultant")
            {
            }
            column(Researchers_Major; Resource."Researcher's Major")
            {
            }
            column(Researcher_Biography; Resource."Researcher Biography")
            {
            }
            column(Gender; Gender)
            {
            }
            column(PhoneNo; PhoneNo)
            {
            }
            column(Email; Email)
            {
            }
            column(DOB; DOB)
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(ReportForNavId_76; 76)
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
                    Country.Reset;
                    Country.SetRange(Code, "Company Information"."Country/Region Code");
                    if Country.FindSet then
                        CountryName := Country.Name;
                end;
            }
            dataitem("Employee Qualification"; "Employee Qualification")
            {
                DataItemLink = "Employee No." = field("Employee No");
                column(ReportForNavId_20; 20)
                {
                }
                column(QualificationCode_EmployeeQualification; "Employee Qualification"."Qualification Code")
                {
                }
                column(Description_EmployeeQualification; "Employee Qualification".Description)
                {
                }
                column(InstitutionCompany_EmployeeQualification; "Employee Qualification"."Institution/Company")
                {
                }
            }
            dataitem(Job; Job)
            {
                DataItemLink = "Person Responsible" = field("No.");
                column(ReportForNavId_24; 24)
                {
                }
                column(Project_ID; Job."No.")
                {
                }
                column(Project_Title; Job.Description)
                {
                }
                column(Project_Role; ProjectRole)
                {
                }
                column(Funding_Organization; FundingOrg)
                {
                }
                column(ProjectArea_Code; RPAreaCode)
                {
                }
                column(ProjectArea_Description; RPADescription)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Grants.Reset;
                    Grants.SetRange("Application No", Job."Grant Applications ID");
                    if Grants.FindSet then
                        FundingOrg := Grants."Grantor Name";

                    ProjectResearchTeam.Reset;
                    ProjectResearchTeam.SetRange("Researcher ID", Job."Person Responsible");
                    ProjectResearchTeam.SetRange("Job No", Job."No.");
                    if ProjectResearchTeam.Find('-') then
                        ProjectRole := ProjectResearchTeam."Primary Role"
                    else
                        ProjectRole := '';

                    if Job.Get(Job."No.") then
                        ProjectArea := Job."Research Project Area";
                    RProjectArea.Reset;
                    RProjectArea.SetRange(Code, ProjectArea);
                    if RProjectArea.FindSet then begin
                        repeat
                            RPAreaCode := RProjectArea.Code;
                            RPADescription := RProjectArea."Project Area Description";
                        until RProjectArea.Next = 0;
                    end;
                end;
            }
            dataitem("Research Output Register"; "Research Output Register")
            {
                DataItemLink = "Principle Investigator" = field("No.");
                column(ReportForNavId_35; 35)
                {
                }
                column(No_ResearchOutputRegister; "Research Output Register".No)
                {
                }
                column(ResearchOutputTitle_ResearchOutputRegister; "Research Output Register"."Research Output Title")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Emp.Reset;
                Emp.SetRange("No.", Resource."Employee No");
                if Emp.FindSet then
                    Gender := Emp.Gender;
                PhoneNo := Emp."Phone No.";
                Email := Emp."Company E-Mail";
                DOB := Emp."Birth Date";
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
        Country: Record "Country/Region";
        CountryName: Text[100];
        Emp: Record Employee;
        Gender: Option;
        PhoneNo: Text[100];
        Email: Code[100];
        DOB: Date;
        Grants: Record "Grant Funding Application";
        FundingOrg: Text[200];
        ProjectResearchTeam: Record "Project Research Team";
        ProjectRole: Code[50];
        RProjectArea: Record "Research Project Area";
        RPAreaCode: Code[50];
        RPADescription: Text[200];
        ProjectArea: Code[50];
}
