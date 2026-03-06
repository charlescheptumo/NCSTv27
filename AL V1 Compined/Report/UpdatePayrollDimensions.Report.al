#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69054 "Update Payroll Dimensions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Payroll Dimensions.rdlc';
    UsageCategory = Tasks;

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No");
            RequestFilterFields = "Payroll Period", "Employee No";
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


                //"Assignment Matrix-X".VALIDATE("Assignment Matrix-X"."Employee No");
                //"Assignment Matrix-X".VALIDATE("Assignment Matrix-X"."Payroll Period");
                // END;

                if Empl.Get("Assignment Matrix-X"."Employee No") then begin
                    Empl.CalcFields(Branch, Paypoint, "Staffing Group", Department);

                    "Assignment Matrix-X"."Posting Group Filter" := Empl."Posting Group";
                    "Assignment Matrix-X"."Profit Centre" := Empl."Global Dimension 2 Code";
                    "Assignment Matrix-X".Branch := Empl.Branch;
                    "Assignment Matrix-X"."Department Code" := Empl.Department;
                    "Assignment Matrix-X"."Salary Pointer" := Empl."Salary Scale";
                    "Assignment Matrix-X"."Pay Point" := Empl.Paypoint;
                    "Assignment Matrix-X"."Staffing Group" := Empl."Staffing Group";

                    "Assignment Matrix-X".Modify;
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
        Assignment_Matrix_XCaptionLbl: label 'Assignment Matrix-X';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Control1000000015CaptionLbl: label 'Label1000000015';
}
