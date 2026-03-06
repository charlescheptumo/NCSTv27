#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69129 "HR Applicant to Employee"
{
    ProcessingOnly = true;
    UsageCategory = Tasks;
    UseRequestPage = false;
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            RequestFilterFields = "Application No", Qualified;
            column(ReportForNavId_3952; 3952)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(HR_Job_Applications__Application_No_; "HR Job Applications"."Application No")
            {
            }
            column(HR_Job_Applications__FullName; "HR Job Applications".FullName)
            {
            }
            column(HR_Job_Applications__Postal_Address_; "HR Job Applications"."Postal Address")
            {
            }
            column(HR_Job_Applications_City; "HR Job Applications".City)
            {
            }
            column(HR_Job_Applications__Post_Code_; "HR Job Applications"."Post Code")
            {
            }
            column(HR_Job_ApplicationsCaption; HR_Job_ApplicationsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(HR_Job_Applications__Application_No_Caption; "HR Job Applications".FieldCaption("HR Job Applications"."Application No"))
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(HR_Job_Applications__Postal_Address_Caption; "HR Job Applications".FieldCaption("HR Job Applications"."Postal Address"))
            {
            }
            column(HR_Job_Applications_CityCaption; "HR Job Applications".FieldCaption("HR Job Applications".City))
            {
            }
            column(HR_Job_Applications__Post_Code_Caption; "HR Job Applications".FieldCaption("HR Job Applications"."Post Code"))
            {
            }

            trigger OnPostDataItem()
            begin
                mLineNo := 0;

                if "HR Job Applications".Find('-') then begin

                    if Confirm('Are you sure you want to upload qualified applicants information to the Employee card?', true) = false then exit;
                    begin
                        repeat
                            if "HR Job Applications"."Employee No" = '' then
                                HRSetup.Get;
                            HRSetup.TestField("Employee Nos.");

                            objEmReq.Reset;
                            objEmReq.SetRange(objEmReq."Requisition No.", "HR Job Applications"."Employee Requisition No");
                            if objEmReq.Find('-') then begin
                                if "HR Job Applications".Expatriate = false then begin
                                    objNoSeries.Reset;
                                    objNoSeries.SetRange(objNoSeries.Code, HRSetup."Employee Nos.");
                                    //  objNoSeries.SETRANGE(objNoSeries."Series Filter",objEmReq."Global Dimension 2 Code");
                                    if objNoSeries.Find('-') then begin
                                        // NoSeriesMgt.InitSeries(objNoSeries."Series Code", "HR Job Applications"."No. Series", 0D, "HR Job Applications"."Employee No", "HR Job Applications"."No. Series");
                                        "HR Job Applications"."Employee No" := NoSeriesMgt.GetNextNo(objNoSeries."Series Code", today, true);
                                    end
                                    else begin
                                        // NoSeriesMgt.InitSeries(objNoSeries."Series Code","HR Job Applications"."No. Series",0D,"Employee No","No. Series");
                                        //   NoSeriesMgt.InitSeries('HREXPAT', "HR Job Applications"."No. Series", 0D, "HR Job Applications"."Employee No", "HR Job Applications"."No. Series");
                                        "HR Job Applications"."Employee No" := NoSeriesMgt.GetNextNo('HREXPAT', today, true);
                                    end
                                end;

                            end;

                            HREmp.Init;
                            HREmp."No." := "HR Job Applications"."Employee No";
                            HREmp."First Name" := "HR Job Applications"."First Name";
                            HREmp."Middle Name" := "HR Job Applications"."Middle Name";
                            HREmp."Last Name" := "HR Job Applications"."Last Name";
                            HREmp."Search Name" := "HR Job Applications"."Search Name";
                            HREmp."Postal Address" := "HR Job Applications"."Postal Address";
                            HREmp."Residential Address" := "HR Job Applications"."Residential Address";
                            HREmp.City := "HR Job Applications".City;
                            HREmp."Post Code" := "HR Job Applications"."Post Code";
                            HREmp.County := "HR Job Applications".County;
                            HREmp."Home Phone Number" := "HR Job Applications"."Home Phone Number";
                            //HREmp."Cell Phone Number":="Cell Phone Number";
                            HREmp."Work Phone Number" := "HR Job Applications"."Work Phone Number";
                            HREmp."Ext." := "HR Job Applications"."Ext.";
                            HREmp."E-Mail" := "HR Job Applications"."E-Mail";
                            HREmp."ID Number" := "HR Job Applications"."ID Number";
                            HREmp.Gender := "HR Job Applications".Gender;
                            HREmp.Citizenship := "HR Job Applications"."Country Code";
                            HREmp."Fax Number" := "HR Job Applications"."Fax Number";
                            HREmp."Marital Status" := "HR Job Applications"."Marital Status";
                            HREmp."Ethnic Origin" := "HR Job Applications"."Ethnic Origin";
                            HREmp."First Language (R/W/S)" := "HR Job Applications"."First Language (R/W/S)";
                            //HREmp."Has Driving Licence":=HREmp."Has Driving Licence"::"Driving Licence";
                            // HREmp.Disabled:=Disabled;
                            //HREmp."Health Assesment?:="Health Assesment?";
                            //HREmp."Health Assesment Date":="Health Assesment Date";
                            HREmp."Date Of Birth" := "HR Job Applications"."Date Of Birth";
                            HREmp.Age := "HR Job Applications".Age;
                            HREmp."Second Language (R/W/S)" := "HR Job Applications"."Second Language (R/W/S)";
                            HREmp."Additional Language" := "HR Job Applications"."Additional Language";
                            // HREmp."Postal Address 2":="Postal Address2";
                            // HREmp."Postal Address 3":="Postal Address3";
                            // HREmp."Residential Address 2":="Residential Address2";
                            // HREmp."Residential Address 3":="Residential Address3";
                            // HREmp."Post Code 2":="Post Code2";
                            HREmp.Citizenship := "HR Job Applications".Citizenship;
                            HREmp."Passport Number" := "HR Job Applications"."Passport Number";
                            //HREmp."First Language Read":="First Language Read";
                            //HREmp."First Language Write":="First Language Write";
                            // HREmp."First Language Speak":="First Language Speak";
                            //HREmp."Second Language Read":="Second Language Read";
                            //HREmp."Second Language Write":="Second Language Write";
                            //HREmp."Second Language Speak":="Second Language Speak";
                            // HREmp."PIN No.":=;
                            "HR Job Applications".Modify;
                            HREmp.Insert;

                            //Fill the Qualifications************************************* HREmp."No."
                            EmpQualifications.Reset;
                            EmpQualifications.SetRange(EmpQualifications."Line No.");
                            if EmpQualifications.Find('+') then mLineNo := EmpQualifications."Line No.";

                            mLineNo := mLineNo + 1;
                            AppQualification.Reset;
                            AppQualification.SetRange(AppQualification."Application No", "HR Job Applications"."Application No");
                            if AppQualification.Find('-') then
                                repeat
                                    EmpQualifications.Init;
                                    EmpQualifications."Employee No." := "HR Job Applications"."Employee No";
                                    EmpQualifications."From Date" := EmpQualifications."From Date";
                                    EmpQualifications."To Date" := EmpQualifications."To Date";
                                    EmpQualifications."Line No." := mLineNo;
                                    EmpQualifications.Type := EmpQualifications.Type;
                                    EmpQualifications.Description := EmpQualifications.Description;
                                    EmpQualifications."Institution/Company" := EmpQualifications."Institution/Company";
                                    EmpQualifications."Qualification Type" := AppQualification."Qualification Type";
                                    EmpQualifications."Qualification Code" := AppQualification."Qualification Code";
                                    EmpQualifications."Qualification Description" := AppQualification."Qualification Description";
                                    EmpQualifications.Insert;
                                    mLineNo := mLineNo + 1;
                                until AppQualification.Next = 0;

                        until "HR Job Applications".Next = 0;


                        Message('Applicants Information successfully uploaded.');
                    end;

                end else begin
                    Message('No qualified applicants were found');
                end;
            end;

            trigger OnPreDataItem()
            begin
                if JopAppNo = '' then begin
                    //UPLOAD ALL QUALIFIED APPLICANTS WHO HAVE NOT ALREADY BEEN EMPLOYED
                    "HR Job Applications".Reset;
                    "HR Job Applications".SetRange("HR Job Applications".Qualified, true);
                    //"HR Job Applications".SETRANGE("HR Job Applications"."Employee No",'<>%1','');

                end else begin
                    //UPLOAD THE SELECTED APPLICANT
                    "HR Job Applications".Reset;
                    "HR Job Applications".SetRange("HR Job Applications"."Application No", JopAppNo);
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

    trigger OnPreReport()
    begin
        JopAppNo := "HR Job Applications".GetFilter("HR Job Applications"."Application No");
    end;

    var
        HREmp: Record Employee;
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit "No. Series";
        JopAppNo: Code[10];
        HR_Job_ApplicationsCaptionLbl: label 'HR Job Applications';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        NameCaptionLbl: label 'Name';
        EmpQualifications: Record "HR Employee Qualifications";
        AppQualification: Record "HR Applicant Qualifications";
        mLineNo: Integer;
        objNoSeries: Record "No. Series Relationship";
        objEmReq: Record "Employee Requisitions";
}
