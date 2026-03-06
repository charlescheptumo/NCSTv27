#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69051 "Update Pension"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Pension.rdlc';

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No") order(ascending) where(Type = const(Deduction), Code = filter('D004' | 'D005'));
            RequestFilterFields = "Employee No", "Payroll Period";
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
            column(Assignment_Matrix_X_Type; "Assignment Matrix-X".Type)
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
            column(Assignment_Matrix_XCaption; Assignment_Matrix_XCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Assignment_Matrix_X__Employee_No__Control1000000011Caption; "Assignment Matrix-X".FieldCaption("Assignment Matrix-X"."Employee No"))
            {
            }
            column(Assignment_Matrix_X_TypeCaption; "Assignment Matrix-X".FieldCaption("Assignment Matrix-X".Type))
            {
            }
            column(Assignment_Matrix_X_CodeCaption; "Assignment Matrix-X".FieldCaption("Assignment Matrix-X".Code))
            {
            }
            column(Assignment_Matrix_X__Payroll_Period_Caption; "Assignment Matrix-X".FieldCaption("Assignment Matrix-X"."Payroll Period"))
            {
            }
            column(Assignment_Matrix_X_AmountCaption; "Assignment Matrix-X".FieldCaption("Assignment Matrix-X".Amount))
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
                /*
                
                IF AssMat.GET("Assignment Matrix-X"."Employee No","Assignment Matrix-X".Type::Payment,'E001',
                "Assignment Matrix-X"."Payroll Period",'') THEN BEGIN
                //MESSAGE('%1',AssMat.Amount);
                
                "Assignment Matrix-X".Amount:=-AssMat.Amount*7.5/100;
                "Assignment Matrix-X"."Employer Amount":=AssMat.Amount*7.5/100;
                "Assignment Matrix-X".MODIFY;
                
                END;
                
                */

                /*
                
                Emp.RESET;
                Emp.SETRANGE(Emp."No.","Assignment Matrix-X"."Employee No");
                Emp.SETRANGE(Emp."Pay Period Filter","Assignment Matrix-X"."Payroll Period");
                
                IF Emp.FIND('-') THEN BEGIN
                Emp.CALCFIELDS(Emp."CHC Contract");
                
                //MESSAGE('%1',Emp."Non-Fluctuating Allowance");
                
                END;
                
                IF AssMat.GET("Assignment Matrix-X"."Employee No","Assignment Matrix-X".Type::Deduction,'D112',
                "Assignment Matrix-X"."Payroll Period",'') THEN BEGIN
                //MESSAGE('%1',AssMat.Amount);
                Tier2:=AssMat.Amount;
                END;
                "Assignment Matrix-X".Amount:=-Emp."CHC Contract"*7.5/100-Tier2+360;
                "Assignment Matrix-X"."Employer Amount":=(Emp."CHC Contract"*7.5/100)+Tier2-360;
                "Assignment Matrix-X".MODIFY;
                
                */

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
        AssMat: Record "Assignment Matrix-X";
        Emp: Record Employee;
        Tier2: Decimal;
        Assignment_Matrix_XCaptionLbl: label 'Assignment Matrix-X';
        CurrReport_PAGENOCaptionLbl: label 'Page';
}
