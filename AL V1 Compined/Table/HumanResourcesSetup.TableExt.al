#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50043 tableextension50043 extends "Human Resources Setup"
{
    fields
    {
        field(50000; "Shift overtime rate"; Decimal)
        {
            MinValue = 0;
        }
        field(50001; "Holiday overtime rate"; Decimal)
        {
            MinValue = 0;
        }
        field(50002; "Housing Earned Limit"; Decimal)
        {
        }
        field(50003; "Pension Limit Percentage"; Decimal)
        {
        }
        field(50004; "Pension Limit Amount"; Decimal)
        {
        }
        field(50005; "Round Down"; Boolean)
        {
        }
        field(50006; "Working Hours"; Decimal)
        {
        }
        field(50008; "Payroll Rounding Precision"; Decimal)
        {
        }
        field(50009; "Payroll Rounding Type"; Option)
        {
            OptionMembers = Nearest,Up,Down;
        }
        field(50010; "Special Duty Table"; Code[10])
        {
            //cc//        TableRelation = Table26004012;
        }
        field(50011; "CFW Round Deduction code"; Code[20])
        {
            TableRelation = DeductionsX;
        }
        field(50012; "BFW Round Earning code"; Code[20])
        {
            TableRelation = EarningsX;
        }
        field(50013; "Company overtime hours"; Decimal)
        {
        }
        field(50014; "Loan Product Type Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50015; "Tax Relief Amount"; Decimal)
        {
        }
        field(50016; "General Payslip Message"; Text[100])
        {
        }
        field(50017; "Tax Table"; Code[10])
        {
            TableRelation = "Bracket Tablesx";
        }
        field(50018; "Corporation Tax"; Decimal)
        {
        }
        field(50020; "Incoming Mail Server"; Text[30])
        {
        }
        field(50021; "Outgoing Mail Server"; Text[30])
        {
        }
        field(50022; "Email Text"; Text[250])
        {
        }
        field(50023; "Sender User ID"; Text[30])
        {
        }
        field(50024; "Sender Address"; Text[100])
        {
        }
        field(50025; "Email Subject"; Text[100])
        {
        }
        field(50026; "Template Location"; Text[100])
        {
        }
        field(50027; "Applicants Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50028; "Leave Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50029; "Recruitment Needs Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50030; "Disciplinary Cases Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50031; "No. Of Days in Month"; Decimal)
        {
        }
        field(50032; "Transport Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50033; "Cover Selection Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50034; "Qualification Days (Leave)"; Decimal)
        {
        }
        field(50035; "Leave Allowance Code"; Code[10])
        {
            TableRelation = EarningsX;
        }
        field(50036; "Telephone Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50037; "Training Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50038; "Leave Recall Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50039; "Medical Claim Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50040; "Account No (Training)"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50041; "Training Evaluation Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50042; "Off Days Code"; Code[10])
        {
            TableRelation = "Leave Types";
        }
        field(50043; "Appraisal Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50044; "Leave Plan Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50045; "Keys Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50046; "Incidences Nos"; Code[10])
        {
        }
        field(50047; "Sick Of Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50048; "Conveyance Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50049; "Base Calender Code"; Code[20])
        {
            TableRelation = "Base Calendar".Code;
        }
        field(50050; "Membership No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50052; "Employee Absentism"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50053; "Overtime @1.5 Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50054; "Overtime @2.0 Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50055; "Lost Days Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50056; "Basic Salary Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50057; "NHIF Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50058; "Wages Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50059; "Net Pay Advance Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50060; "Overtime Claim @1.5"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50061; "Overtime Claim @2.0"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50062; "Overtime Recovery @1.5"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50063; "Overtime Recovery @2.0"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50064; "Lost Hrs Recovery"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50065; "Wages Claim"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50066; "Night Allowance Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50067; "Lost Days Refund"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50068; "Training Allowance"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50069; "Wages Recovery"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50070; "Functional Overtime@1.5"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50071; "Functional Overtime@2.0"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50072; "Pending Days"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50073; "Lost Days Recovery"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50074; "Tax Relief Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50075; "Salary Advance"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50076; "Interest on Advance Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50077; "Training Allowance Arrears"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50078; "Night Shift Allowance Amount"; Decimal)
        {
        }
        field(50079; "Unpaid Leave Code"; Code[10])
        {
            TableRelation = EarningsX.Code;
        }
        field(50080; "Annual Leave Days"; Decimal)
        {
            MaxValue = 30;
            MinValue = 0;
        }
        field(50082; "NSSF Tier I Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50083; "NSSF Tier II Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(50084; "HR E-mail Address"; Text[150])
        {
        }
        field(50085; "Training Need Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50086; "Payroll Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50087; "Payroll Journal Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Payroll Journal Template"));
        }
        field(50088; "Base Calendar"; Code[10])
        {
            Description = '//to cater for Leave';
            TableRelation = "Base Calendar".Code;
        }
        field(50089; "Leave Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Template".Name;
        }
        field(50090; "Leave Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch".Name;
        }
        field(50091; "Leave Posting Period[FROM]"; Date)
        {
        }
        field(50092; "Leave Posting Period[TO]"; Date)
        {
        }
        field(50093; "Company Documents"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50094; "Leave Planner Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50095; "Training Application Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50096; "Quarterly Appraisal Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50097; "Annual Appraisal Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(50098; "Gratuity Percentage"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(69000; "Default Leave Posting Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
        }
        field(69001; "Default Leave Posting Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
        }
        field(69002; "Amount Per Hour"; Decimal)
        {
        }
        field(69003; "Overtime Payroll Code"; Code[10])
        {
            TableRelation = DeductionsX.Code;
        }
        field(69004; "Overtime Req Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(69005; "Employee Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(69006; "OP Paye Deduction %"; Decimal)
        {
        }
        field(69007; "Salary Voucher Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(69008; "Job Application Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69009; "Medical Claims Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69010; "Job Application No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69011; "Rating Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(69012; "Excess Pension Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX.Code;
        }
        field(69013; "NSSF Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69034; "Graduity Paid Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = EarningsX;
        }
        field(69035; "Gratuity PAYE graduated"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(69036; "Leave Allowance Threshold"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69037; "Leave  % of Basic allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69038; "Housing Fund Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = DeductionsX.Code;
        }
        field(69039; "PWD Maximum Taxable Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}
