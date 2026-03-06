#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56231 "Copyright Work Certificate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Copyright Work Certificate.rdlc';

    dataset
    {
        dataitem("Service Item"; "Service Item")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyinfoName; Companyinfo.Name)
            {
            }
            column(CompanyinfoPicture; Companyinfo.Picture)
            {
            }
            column(CompanyinfoRubberStamp; Companyinfo.RubberStamp)
            {
            }
            column(Description_ServiceItem; "Service Item".Description)
            {
            }
            column(Description2_ServiceItem; "Service Item"."Description 2")
            {
            }
            column(Type_ServiceItem; "Service Item".Type)
            {
            }
            column(CustomerType_ServiceItem; "Service Item"."Customer Type")
            {
            }
            column(CompanyRegNo_ServiceItem; "Service Item"."Company Reg No")
            {
            }
            column(IDNo_ServiceItem; "Service Item"."ID. No.")
            {
            }
            column(PIN_ServiceItem; "Service Item"."P.I.N")
            {
            }
            column(Title_ServiceItem; "Service Item".Title)
            {
            }
            column(Capturedby_ServiceItem; "Service Item"."Captured by")
            {
            }
            column(Created_ServiceItem; "Service Item".Created)
            {
            }
            column(RegistrationDate_ServiceItem; "Service Item"."Registration Date")
            {
            }
            column(CreatedBy_ServiceItem; "Service Item"."Created By")
            {
            }
            column(CopyrightTitle_ServiceItem; "Service Item"."Copyright Title")
            {
            }
            column(CopyrightWorkCategory_ServiceItem; "Service Item"."Copyright Work Category")
            {
            }
            column(CopyrightWorkSubCategory_ServiceItem; "Service Item"."Copyright Work SubCategory")
            {
            }
            column(CopyrightCategoryDescription_ServiceItem; "Service Item"."Copyright Category Description")
            {
            }
            column(CopyrightSubCategoryDesc_ServiceItem; "Service Item"."Copyright SubCategory Desc")
            {
            }
            column(DateofFixationReduction_ServiceItem; "Service Item"."Date of Fixation/Reduction")
            {
            }
            column(Language_ServiceItem; "Service Item".Language)
            {
            }
            column(CopyrightWorkAbstract_ServiceItem; "Service Item"."Copyright Work Abstract")
            {
            }
            column(AgentFirstName_ServiceItem; "Service Item"."Agent First Name")
            {
            }
            column(AgentSurname_ServiceItem; "Service Item"."Agent Surname")
            {
            }
            column(AgentMiddleName_ServiceItem; "Service Item"."Agent Middle Name")
            {
            }
            column(AgentAddress_ServiceItem; "Service Item"."Agent Address")
            {
            }
            column(AgentAddress2_ServiceItem; "Service Item"."Agent Address 2")
            {
            }
            column(AgentCity_ServiceItem; "Service Item"."Agent City")
            {
            }
            column(AgentContact_ServiceItem; "Service Item"."Agent Contact")
            {
            }
            column(AgentPhoneNo_ServiceItem; "Service Item"."Agent Phone No.")
            {
            }
            column(AgentIDNo_ServiceItem; "Service Item"."Agent ID. No.")
            {
            }
            column(AgentPIN_ServiceItem; "Service Item"."Agent P.I.N")
            {
            }
            column(AuthorFirstName_ServiceItem; "Service Item"."Author First Name")
            {
            }
            column(AuthorAgentSurname_ServiceItem; "Service Item"."Author Agent Surname")
            {
            }
            column(AuthorMiddleName_ServiceItem; "Service Item"."Author Middle Name")
            {
            }
            column(AuthorAddress_ServiceItem; "Service Item"."Author Address")
            {
            }
            column(AuthorAddress2_ServiceItem; "Service Item"."Author Address 2")
            {
            }
            column(AuthorCity_ServiceItem; "Service Item"."Author City")
            {
            }
            column(AuthorContact_ServiceItem; "Service Item"."Author Contact")
            {
            }
            column(AuthorPhoneNo_ServiceItem; "Service Item"."Author Phone No.")
            {
            }
            column(AuthorIDNo_ServiceItem; "Service Item"."Author ID. No.")
            {
            }
            column(AuthorPIN_ServiceItem; "Service Item"."Author P.I.N")
            {
            }
            column(ProdPubName_ServiceItem; "Service Item"."Prod/Pub Name")
            {
            }
            column(ProdPubIDNoCompanyRegNo_ServiceItem; "Service Item"."Prod/Pub ID No/Company Reg No")
            {
            }
            column(ProdPubPIN_ServiceItem; "Service Item"."Prod/Pub P.I.N")
            {
            }
            column(AssignmentLicenseDate_ServiceItem; "Service Item"."Assignment/License Date")
            {
            }
            column(V1stCountryofProduction_ServiceItem; "Service Item"."1st Country of Production")
            {
            }
            column(ISBN_ServiceItem; "Service Item".ISBN)
            {
            }
            column(ProductionCategory_ServiceItem; "Service Item"."Production Category")
            {
            }
            column(ProdPubPhoneNo_ServiceItem; "Service Item"."Prod/Pub Phone No.")
            {
            }
            column(ProdPubEmail_ServiceItem; "Service Item"."Prod/Pub Email")
            {
            }
            column(ApplicantAccount_ServiceItem; "Service Item"."Applicant Account")
            {
            }
            column(ReceiptNo_ServiceItem; "Service Item"."Receipt No")
            {
            }
            column(ReceiptAmount_ServiceItem; "Service Item"."Receipt Amount")
            {
            }
            column(PayemntReferenceNo_ServiceItem; "Service Item"."Payemnt Reference No")
            {
            }
            column(No_ServiceItem; "Service Item"."No.")
            {
            }
            column(SerialNo_ServiceItem; "Service Item"."Serial No.")
            {
            }
            column(Name_ServiceItem; "Service Item".Name)
            {
            }
            column(Address_ServiceItem; "Service Item".Address)
            {
            }
            column(Address2_ServiceItem; "Service Item"."Address 2")
            {
            }
            column(PhoneNo_ServiceItem; "Service Item"."Phone No.")
            {
            }
            column(City_ServiceItem; "Service Item".City)
            {
            }
            column(userSignature; usersetup.Picture)
            {
            }
            column(regDate; regDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                regDate := Format("Service Item"."Registration Date", 0, '<Month Text> <Day, 2>,<Year4>');
            end;

            trigger OnPreDataItem()
            begin
                Companyinfo.CalcFields(RubberStamp);
                copyrightSetup.Reset;
                copyrightSetup.Get();
                usersetup.Reset;
                usersetup.SetRange("User ID", 'ESIGEI');
                if usersetup.FindSet then begin
                    usersetup.CalcFields(Picture);
                    //MESSAGE('found');
                end;
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
        Companyinfo: Record "Company Information";
        usersetup: Record "User Setup";
        copyrightSetup: Record "Copyright Setup";
        regDate: Text;
        otherParties: Record "Copyright Authors";
        second: Text;
        third: Text;
}
