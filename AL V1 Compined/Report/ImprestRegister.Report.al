#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 57017 "Imprest Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Register.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Payments; Payments)
        {
            DataItemTableView = where("Payment Type" = const(Surrender), Posted = const(True), "Archive Document" = const(False));
            RequestFilterFields = Date;
            column(ReportForNavId_1; 1)
            {
            }
            column(CIName; CompanyInformation.Name)
            {
            }
            column(CIAddress; CompanyInformation.Address)
            {
            }
            column(CIAddress2; CompanyInformation."Address 2")
            {
            }
            column(CIPic; CompanyInformation.Picture)
            {
            }
            column(No_Payments; Payments."No.")
            {
            }
            column(Date_Payments; Format(Payments.Date))
            {
            }
            column(Payee_Payments; Payments.Payee)
            {
            }
            column(Onbehalfof_Payments; Payments."On behalf of")
            {
            }
            column(TotalAmount_Payments; Payments."Total Amount")
            {
            }
            column(PaymentType_Payments; Payments."Payment Type")
            {
            }
            column(AccountNo_Payments; Payments."Account No.")
            {
            }
            column(AccountName_Payments; Payments."Account Name")
            {
            }
            column(ImprestAmount_Payments; Payments."Imprest Amount")
            {
            }
            column(AppliesToDocNo_Payments; Payments."Applies- To Doc No.")
            {
            }
            column(SurrenderStatus_Payments; Payments."Surrender Status")
            {
            }
            column(PaymentNarration_Payments; Payments."Payment Narration")
            {
            }
            column(ActualAmountSpent_Payments; Payments."Actual Amount Spent")
            {
            }
            column(ImprestMemoNo_Payments; Payments."Imprest Memo No")
            {
            }
            column(CurrencyCode_Payments; Payments."Currency Code")
            {
            }
            column(RemainingAmount_Payments; Payments."Remaining Amount")
            {
            }
            column(DeptName; DeptName)
            {
            }
            column(NoOfDaysOutstanding; NoOfDaysOutstanding)
            {
            }
            column(ImprestDueDate; Format(ImprestDueDate))
            {
            }
            column(SNumber; SNumber)
            {
            }
            column(WarrantVoucherNo; WarrantVoucherNo)
            {
            }
            column(WarrantVoucherDate; Format(WarrantVoucherDate))
            {
            }
            column(PostedDate_Payments; Format(Payments."Posted Date"))
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
            }

            trigger OnAfterGetRecord()
            begin
                SNumber := 0;
                Payments.CalcFields("Cash Receipt Amount");

                Employee.Reset;
                Employee.SetRange(Employee."No.", Payments."Account No.");
                if Employee.FindSet then begin
                    Employee.CalcFields("Department Name");
                    DeptName := Employee."Department Name";
                end;

                /*Payments.RESET;
                Payments.SETRANGE(Payments."No.",Payments."No.");
                //Payments.SETRANGE(Payments."Payment Type",Payments."Payment Type"::Surrender);
                //Payments.SETRANGE(Payments.Posted,TRUE);
                IF Payments.FINDSET THEN BEGIN
                  SNumber:=SNumber;
                  END;
                  SNumber:=SNumber+1;*/

                //Warrant Voucher No

                ImprestMemo.Reset;
                ImprestMemo.SetRange(ImprestMemo."Archive Document", false);
                ImprestMemo.SetRange(ImprestMemo.Posted, true);
                ImprestMemo.SetRange(ImprestMemo."No.", Payments."Imprest Memo No");
                //IF ImprestMemo."Return Date"<>0D THEN BEGIN
                if ImprestMemo.FindSet then begin
                    //MESSAGE('%1',ImprestMemo."Return Date");
                    ImprestDueDate := CalcDate('2D', ImprestMemo."Return Date");
                    NoOfDaysOutstanding := ImprestDueDate - Payments."Posted Date";
                    if ImprestMemo."Currency Code" = '' then
                        CurrencyCode := 'KES'
                    else
                        CurrencyCode := ImprestMemo."Currency Code";
                    PaymentsHeader.Reset;
                    PaymentsHeader.SetRange(PaymentsHeader."Payment Type", PaymentsHeader."payment type"::"Warrant Voucher");
                    PaymentsHeader.SetRange(PaymentsHeader."Archive Document", false);
                    PaymentsHeader.SetRange(PaymentsHeader."Imprest Memo No", ImprestMemo."No.");
                    if PaymentsHeader.FindSet then begin
                        //MESSAGE('%1',PaymentsHeader."No.");
                        WarrantVoucherNo := PaymentsHeader."No.";
                        WarrantVoucherDate := PaymentsHeader."Cheque Date";
                    end;
                    //END;
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

    trigger OnInitReport()
    begin
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        PaymentsHeader: Record Payments;
        Employee: Record Employee;
        ResponsibilityCenter: Record "Responsibility Center";
        DeptName: Text[100];
        NoOfDaysOutstanding: Integer;
        ImprestDueDate: Date;
        SNumber: Integer;
        WarrantVoucherNo: Code[20];
        PVHeader: Record Payments;
        ImprestMemo: Record "Imprest Memo";
        WarrantVoucherDate: Date;
        CurrencyCode: Code[100];
}
