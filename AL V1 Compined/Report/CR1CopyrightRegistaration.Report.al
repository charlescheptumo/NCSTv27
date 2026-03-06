#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56230 "CR1 Copyright Registaration"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CR1 Copyright Registaration.rdlc';

    dataset
    {
        dataitem("Copyright Registration Table"; "Copyright Registration Table")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.", "Applicant Account";
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
            column(No_CopyrightRegistrations; "Copyright Registration Table"."No.")
            {
            }
            column(Name_CopyrightRegistration; "Copyright Registration Table".Name)
            {
            }
            column(SearchName_CopyrightRegistration; "Copyright Registration Table"."Search Name")
            {
            }
            column(Name2_CopyrightRegistration; "Copyright Registration Table"."Name 2")
            {
            }
            column(Address_CopyrightRegistration; "Copyright Registration Table".Address)
            {
            }
            column(Address2_CopyrightRegistration; "Copyright Registration Table"."Address 2")
            {
            }
            column(City_CopyrightRegistration; "Copyright Registration Table".City)
            {
            }
            column(Contact_CopyrightRegistration; "Copyright Registration Table".Contact)
            {
            }
            column(PhoneNo_CopyrightRegistration; "Copyright Registration Table"."Phone No.")
            {
            }
            column(TelexNo_CopyrightRegistration; "Copyright Registration Table"."Telex No.")
            {
            }
            column(CustomerPostingGroup_CopyrightRegistration; "Copyright Registration Table"."Customer Posting Group")
            {
            }
            column(CountryRegionCode_CopyrightRegistration; "Copyright Registration Table"."Country/Region Code")
            {
            }
            column(GenBusPostingGroup_CopyrightRegistration; "Copyright Registration Table"."Gen. Bus. Posting Group")
            {
            }
            column(PostCode_CopyrightRegistration; "Copyright Registration Table"."Post Code")
            {
            }
            column(County_CopyrightRegistration; "Copyright Registration Table".County)
            {
            }
            column(EMail_CopyrightRegistration; "Copyright Registration Table"."E-Mail")
            {
            }
            column(NoSeries_CopyrightRegistration; "Copyright Registration Table"."No. Series")
            {
            }
            column(VATBusPostingGroup_CopyrightRegistration; "Copyright Registration Table"."VAT Bus. Posting Group")
            {
            }
            column(Type_CopyrightRegistration; "Copyright Registration Table".Type)
            {
            }
            column(CustomerCategory_CopyrightRegistration; "Copyright Registration Table"."Customer Category")
            {
            }
            column(CustomerType_CopyrightRegistration; "Copyright Registration Table"."Customer Type")
            {
            }
            column(CompanyRegNo_CopyrightRegistration; "Copyright Registration Table"."Company Reg No")
            {
            }
            column(IDNo_CopyrightRegistration; "Copyright Registration Table"."ID. No.")
            {
            }
            column(PIN_CopyrightRegistration; "Copyright Registration Table"."P.I.N")
            {
            }
            column(Title_CopyrightRegistration; "Copyright Registration Table".Title)
            {
            }
            column(Status_CopyrightRegistration; "Copyright Registration Table".Status)
            {
            }
            column(Capturedby_CopyrightRegistration; "Copyright Registration Table"."Captured by")
            {
            }
            column(Created_CopyrightRegistration; "Copyright Registration Table".Invoiced)
            {
            }
            column(RegistrationDate_CopyrightRegistration; "Copyright Registration Table"."Registration Date")
            {
            }
            column(CreatedBy_CopyrightRegistration; "Copyright Registration Table"."Created By")
            {
            }
            column(CopyrightTitle_CopyrightRegistration; "Copyright Registration Table"."Copyright Title")
            {
            }
            column(CopyrightWorkCategory_CopyrightRegistration; "Copyright Registration Table"."Copyright Work Category")
            {
            }
            column(CopyrightWorkSubCategory_CopyrightRegistration; "Copyright Registration Table"."Copyright Work SubCategory")
            {
            }
            column(CopyrightCategoryDescription_CopyrightRegistration; "Copyright Registration Table"."Copyright Category Description")
            {
            }
            column(CopyrightSubCategoryDesc_CopyrightRegistration; "Copyright Registration Table"."Copyright SubCategory Desc")
            {
            }
            column(DateofFixationReduction_CopyrightRegistration; "Copyright Registration Table"."Date of Fixation/Reduction")
            {
            }
            column(Language_CopyrightRegistration; "Copyright Registration Table".Language)
            {
            }
            column(CopyrightWorkAbstract_CopyrightRegistration; ObjText)
            {
            }
            column(AgentFirstName_CopyrightRegistration; "Copyright Registration Table"."Agent First Name")
            {
            }
            column(AgentSurname_CopyrightRegistration; "Copyright Registration Table"."Agent Surname")
            {
            }
            column(AgentMiddleName_CopyrightRegistration; "Copyright Registration Table"."Agent Middle Name")
            {
            }
            column(AgentAddress_CopyrightRegistration; "Copyright Registration Table"."Agent Address")
            {
            }
            column(AgentAddress2_CopyrightRegistration; "Copyright Registration Table"."Agent Address 2")
            {
            }
            column(AgentCity_CopyrightRegistration; "Copyright Registration Table"."Agent City")
            {
            }
            column(AgentContact_CopyrightRegistration; "Copyright Registration Table"."Agent Contact")
            {
            }
            column(AgentPhoneNo_CopyrightRegistration; "Copyright Registration Table"."Agent Phone No.")
            {
            }
            column(AgentIDNo_CopyrightRegistration; "Copyright Registration Table"."Agent ID. No.")
            {
            }
            column(AgentPIN_CopyrightRegistration; "Copyright Registration Table"."Agent P.I.N")
            {
            }
            column(AuthorFirstName_CopyrightRegistration; "Copyright Registration Table"."Author First Name")
            {
            }
            column(AuthorAgentSurname_CopyrightRegistration; "Copyright Registration Table"."Author Surname")
            {
            }
            column(AuthorMiddleName_CopyrightRegistration; "Copyright Registration Table"."Author Middle Name")
            {
            }
            column(AuthorAddress_CopyrightRegistration; "Copyright Registration Table"."Author Postal Address")
            {
            }
            column(AuthorAddress2_CopyrightRegistration; "Copyright Registration Table"."Author Physical Address")
            {
            }
            column(AuthorCity_CopyrightRegistration; "Copyright Registration Table"."Author City")
            {
            }
            column(AuthorContact_CopyrightRegistration; "Copyright Registration Table"."Author Contact")
            {
            }
            column(AuthorPhoneNo_CopyrightRegistration; "Copyright Registration Table"."Author Phone No.")
            {
            }
            column(AuthorIDNo_CopyrightRegistration; "Copyright Registration Table"."Author ID. No.")
            {
            }
            column(AuthorPIN_CopyrightRegistration; "Copyright Registration Table"."Author P.I.N")
            {
            }
            column(ProdPubName_CopyrightRegistration; "Copyright Registration Table"."Prod/Pub Name")
            {
            }
            column(ProdPubIDNoCompanyRegNo_CopyrightRegistration; "Copyright Registration Table"."Prod/Pub ID No/Company Reg No")
            {
            }
            column(ProdPubPIN_CopyrightRegistration; "Copyright Registration Table"."Prod/Pub P.I.N")
            {
            }
            column(AssignmentLicenseDate_CopyrightRegistration; "Copyright Registration Table"."Assignment/License Date")
            {
            }
            column(V1stCountryofProduction_CopyrightRegistration; "Copyright Registration Table"."1st Country of Production")
            {
            }
            column(ISBN_CopyrightRegistration; "Copyright Registration Table".ISBN)
            {
            }
            column(ProductionCategory_CopyrightRegistration; "Copyright Registration Table"."Production Category")
            {
            }
            column(ProdPubPhoneNo_CopyrightRegistration; "Copyright Registration Table"."Prod/Pub Phone No.")
            {
            }
            column(ProdPubEmail_CopyrightRegistration; "Copyright Registration Table"."Prod/Pub Email")
            {
            }
            column(BillingAccount_CopyrightRegistration; "Copyright Registration Table"."Applicant Account")
            {
            }
            dataitem("Copyright Authors"; "Copyright Authors")
            {
                DataItemLink = "Copyright Reg No" = field("No.");
                column(ReportForNavId_1; 1)
                {
                }
                column(AuthorFirstName_CopyrightAuthors; "Copyright Authors"."First Name")
                {
                }
                column(AuthorAgentSurname_CopyrightAuthors; "Copyright Authors".Surname)
                {
                }
                column(AuthorMiddleName_CopyrightAuthors; "Copyright Authors"."Middle Name")
                {
                }
                column(AuthorAddress_CopyrightAuthors; "Copyright Authors".Address)
                {
                }
                column(AuthorAddress2_CopyrightAuthors; "Copyright Authors"."Address 2")
                {
                }
                // column(AuthorCity_CopyrightAuthors; "Copyright Authors"."Author City")
                // {
                // }
                column(AuthorContact_CopyrightAuthors; "Copyright Authors".Contact)
                {
                }
                column(AuthorPhoneNo_CopyrightAuthors; "Copyright Authors"."Phone No.")
                {
                }
                column(AuthorIDNo_CopyrightAuthors; "Copyright Authors"."ID. No.")
                {
                }
                column(AuthorPIN_CopyrightAuthors; "Copyright Authors"."P.I.N")
                {
                }
                column(AuthorPseudoName_CopyrightAuthors; "Copyright Authors"."Pseudo Name")
                {
                }
                // column(AuthorPostalCode_CopyrightAuthors; "Copyright Authors"."Author Postal Code")
                // {
                // }
                column(AuthorEmailAddress_CopyrightAuthors; "Copyright Authors"."Email Address")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                //Ushindi
                /*
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText,TTotal,'');
                */

                //Convert Project Objectives from BLOB to TXT
                "Copyright Registration Table".CalcFields("Copyright Registration Table"."Copyright Work Abstract");
                "Copyright Work Abstract".CreateInstream(ObjInstr);
                Obj.Read(ObjInstr);
                ObjText := Format(Obj);

                if ObjText <> Format(Obj) then begin
                    Clear("Copyright Registration Table"."Copyright Work Abstract");
                    Clear(Obj);
                    Obj.AddText(ObjText);
                    "Copyright Registration Table"."Copyright Work Abstract".CreateOutstream(ObjOutStr);
                    Obj.Write(ObjOutStr);
                end;

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 58000);
                ApprovalEntries.SetRange("Document No.", "Copyright Registration Table"."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;

            end;

            trigger OnPreDataItem()
            begin
                //Payments.CALCFIELDS(Payments."Bank Name",Payments."Project Description");
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
        Approver: array[10] of Code[20];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
}
