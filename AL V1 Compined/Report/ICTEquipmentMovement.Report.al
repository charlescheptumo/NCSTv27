#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56243 "ICT Equipment Movement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Equipment Movement.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("ICT Issuance Voucher"; "ICT Issuance Voucher")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(COMPANY; CompanyInfo.Name)
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(PostCode; CompanyInfo."Post Code")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Address; CompanyInfo.Address)
            {
            }
            column(Address2; CompanyInfo."Address 2")
            {
            }
            column(authorizer; authorizer)
            {
            }
            column(depname; departname)
            {
            }
            column(No_ICTIssuanceVoucher; "ICT Issuance Voucher"."No.")
            {
            }
            column(IssuedToUserID_ICTIssuanceVoucher; "ICT Issuance Voucher"."Issued To User ID")
            {
            }
            column(IssuedToNo_ICTIssuanceVoucher; "ICT Issuance Voucher"."Issued To No.")
            {
            }
            column(Name_ICTIssuanceVoucher; "ICT Issuance Voucher".Name)
            {
            }
            column(IssuedDate_ICTIssuanceVoucher; "ICT Issuance Voucher"."Issued Date")
            {
            }
            column(Description_ICTIssuanceVoucher; "ICT Issuance Voucher".Description)
            {
            }
            column(BranchesCode_ICTIssuanceVoucher; "ICT Issuance Voucher"."Branches Code")
            {
            }
            column(Directorate_ICTIssuanceVoucher; "ICT Issuance Voucher".Directorate)
            {
            }
            column(Department_ICTIssuanceVoucher; "ICT Issuance Voucher".Department)
            {
            }
            column(DivisionUnit_ICTIssuanceVoucher; "ICT Issuance Voucher"."Division/Unit")
            {
            }
            column(Status_ICTIssuanceVoucher; "ICT Issuance Voucher".Status)
            {
            }
            column(LocationCode_ICTIssuanceVoucher; "ICT Issuance Voucher"."Location Code")
            {
            }
            column(IssuedBy_ICTIssuanceVoucher; "ICT Issuance Voucher"."Issued By")
            {
            }
            column(NoSeries_ICTIssuanceVoucher; "ICT Issuance Voucher"."No.Series")
            {
            }
            dataitem("ICT Issuance Voucher Lines"; "ICT Issuance Voucher Lines")
            {
                DataItemLink = "No." = field("No.");
                column(ReportForNavId_16; 16)
                {
                }
                column(No_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."No.")
                {
                }
                column(Code_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines".Code)
                {
                }
                column(Description_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines".Description)
                {
                }
                column(SerialNo_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Serial No.")
                {
                }
                column(DurationofUsestartdate_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Duration of Use start date")
                {
                }
                column(DurationofUseenddate_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Duration of Use end date")
                {
                }
                column(DurationofUse_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Duration of Use")
                {
                }
                column(FANo_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."FA No")
                {
                }
                column(ReasonForMovement_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Reason For Movement")
                {
                }
                column(ReceivingOfficer_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Dpt Current Assigned")
                {
                }
                column(ReceivingOfficerName_ICTIssuanceVoucherLines; "ICT Issuance Voucher Lines"."Current Assigned Employee")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "ICT Issuance Voucher".Department);
                if ResponsibilityCenter.FindSet then begin
                    departname := ResponsibilityCenter.Name;

                end;
                UserSetup.Reset;
                UserSetup.SetRange("User ID", "ICT Issuance Voucher"."Issued By");
                if UserSetup.FindSet then begin
                    authorizer := UserSetup."Employee Name";
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        Employees: Record Employee;
        ResponsibilityCenter: Record "Responsibility Center";
        departname: Text[250];
        authorizer: Text[250];
        receiver: Text[250];
}
