#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69028 "Update KRA classification"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update KRA classification.rdlc';
    UsageCategory = Tasks;

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No");
            RequestFilterFields = "Payroll Period", "Employee No", "Posting Group Filter";
            column(ReportForNavId_1213; 1213)
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
            column(Assignment_Matrix_X__Employee_No_; "Assignment Matrix-X"."Employee No")
            {
            }
            column(Assignment_Matrix_X__Employee_No__Control1000000011; "Assignment Matrix-X"."Employee No")
            {
            }
            column(Assignment_Matrix_X_Code; "Assignment Matrix-X".Code)
            {
            }
            column(Assignment_Matrix_X__Payroll_Period_; "Assignment Matrix-X"."Payroll Period")
            {
            }
            column(Assignment_Matrix_X_Amount; "Assignment Matrix-X".Amount)
            {
            }
            column(Assignment_Matrix_X_Type; "Assignment Matrix-X".Type)
            {
            }
            column(Assignment_Matrix_XCaption; Assignment_Matrix_XCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Assignment_Matrix_X__Employee_No__Control1000000011Caption; "Assignment Matrix-X".FieldCaption("Assignment Matrix-X"."Employee No"))
            {
            }
            column(Control1000000015Caption; Control1000000015CaptionLbl)
            {
            }
            column(Assignment_Matrix_X__Employee_No_Caption; "Assignment Matrix-X".FieldCaption("Assignment Matrix-X"."Employee No"))
            {
            }
            column(Assignment_Matrix_X_Reference_No; "Assignment Matrix-X"."Reference No")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //IF Emp.GET("Assignment Matrix-X"."Employee No") THEN BEGIN


                /*
                IF Empl.GET("Assignment Matrix-X"."Employee No") THEN BEGIN
                
                "Assignment Matrix-X".Rank:=Empl.Rank;
                 "Assignment Matrix-X".MODIFY;
                END;
                */

                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Payment then begin
                    if Earning.Get("Assignment Matrix-X".Code) then begin
                        "Assignment Matrix-X"."KRA Classification" := Earning."KRA Classification";
                        "Assignment Matrix-X".Modify;
                    end;

                end;

            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := "Assignment Matrix-X".FieldNo("Assignment Matrix-X"."Employee No");
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Emp: Record Employee;
        Empl: Record Employee;
        PstGrp: Record "Employee Posting GroupX";
        Earning: Record EarningsX;
        Assignment_Matrix_XCaptionLbl: label 'Assignment Matrix-X';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Control1000000015CaptionLbl: label 'Label1000000015';
}
