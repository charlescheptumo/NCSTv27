#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56242 "ICT Issuance Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ICT Issuance Voucher.rdlc';
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
            column(Issuedto_Signature; UserSetup.Picture)
            {
            }
            column(issuedBy_Signature; UserSetup1.Picture)
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
            }

            trigger OnAfterGetRecord()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", "ICT Issuance Voucher"."Issued To User ID");
                if UserSetup.FindSet then begin
                    UserSetup.CalcFields(Picture);
                end;

                UserSetup1.Reset;
                UserSetup1.SetRange("User ID", "ICT Issuance Voucher"."Issued By");
                if UserSetup1.FindSet then begin
                    UserSetup1.CalcFields(Picture);
                end
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
        UserSetup1: Record "User Setup";
}
