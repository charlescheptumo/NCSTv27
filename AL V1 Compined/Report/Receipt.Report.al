#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 56003 Receipt
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Receipt.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Receipt Header"; "Receipts Header1")
        {
            RequestFilterFields = "No.", Date;
            column(ReportForNavId_3632; 3632)
            {
            }
            column(CAshier; "Receipt Header".Cashier)
            {
            }
            column(ChequeNo_ReceiptHeader; "Receipt Header"."Cheque No")
            {
            }
            column(ReceiptNo; "Receipt Header"."No.")
            {
            }
            column(OnBehalfOf_ReceiptHeader; "Receipt Header"."On Behalf Of")
            {
            }
            column(Received_From; "Receipt Header"."Received From")
            {
            }
            column(Date; "Receipt Header".Date)
            {
            }
            column(Posted_date; "Receipt Header"."Posted Date")
            {
            }
            column(Posted_Time; "Receipt Header"."Posted Time")
            {
            }
            column(Legal_Entity; CompanyInfo."Name 2")
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            column(Address_1; CompanyInfo.Address)
            {
            }
            column(Address_2; CompanyInfo."Address 2")
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
            column(Donor; Donor)
            {
            }
            column(Project; Project)
            {
            }
            column(TotAmountHeader; "Receipt Header".Amount)
            {
            }
            column(StrCopyText; StrCopyText)
            {
            }
            column(CreatorName; CreatorName)
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(Creator; Creator)
            {
            }
            dataitem("Receipt Line"; "Receipt Lines1")
            {
                DataItemLink = "Receipt No." = field("No.");
                DataItemTableView = sorting("Receipt No.", "Line No") order(ascending);
                column(ReportForNavId_7160; 7160)
                {
                }
                column(Description; "Receipt Line"."Account Name")
                {
                }
                column(Amount; "Receipt Line".Amount)
                {
                }
                column(NumberText; NumberText[1])
                {
                }
                column(Description_ReceiptLine; "Receipt Line".Description)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //MESSAGE(FORMAT(Amount));
                    //TotAmount := TotAmount + "Receipt Line".Amount;
                end;

                trigger OnPostDataItem()
                begin
                    /*
                    CheckReport.InitTextVariable;
                    CheckReport.InitTextVariable;
                    CheckReport.FormatNoText(NumberText,TotAmount,'');
                    CheckReport.FormatNoText(NumberText,TotAmount,'');
                     */

                end;

                trigger OnPreDataItem()
                begin
                    //MESSAGE(FORMAT(Amount));
                    TotAmount := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                /*StrCopyText:='';
                IF "No. Printed">=1 THEN
                  BEGIN
                    StrCopyText:='DUPLICATE';
                  END;*/
                /*
              objLogos.RESET;
               objLogos.SETRANGE(objLogos.Code,"Receipt Header"."Global Dimension 1 Code");
              IF objLogos.FIND('-') THEN BEGIN
                  objLogos.CALCFIELDS(objLogos.Picture);
              END ELSE BEGIN
                  objLogos.SETRANGE(objLogos.Default,TRUE);
                  objLogos.CALCFIELDS(objLogos.Picture);
              END;
              */
                // CompanyInfo.GET;
                // CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
                //DimVal.RESET;
                //    DimVal.SETRANGE(DimVal.Code,"Receipt Header"."Global Dimension 1 Code");
                //    DimVal.FIND('-');
                //    Donor := DimVal.Name;
                //    //MESSAGE('Global dimension 1::' + DimVal.Name);
                //
                //    DimVal.RESET;
                //    DimVal.SETRANGE(DimVal.Code,"Receipt Header"."Global Dimension 2 Code");
                //    DimVal.FIND('-');
                //    Project := DimVal.Name;


                "Receipt Header".CalcFields("Receipt Header".Amount);
                TotAmount := "Receipt Header".Amount;

                CheckReport.InitTextVariable;
                CheckReport.FormatNoText(NumberText, "Receipt Header".Amount, CurrencyCodeText);

                //Approvals
                if UserSetup.Get("Receipt Header".Cashier) then begin
                    Creator := "Receipt Header".Cashier;
                    CreatorName := UserSetup."Employee Name";
                    UserSetup.CalcFields(Picture);
                end;

            end;

            trigger OnPostDataItem()
            begin
                /*//IF CurrReport.PREVIEW=FALSE THEN
                  BEGIN
                    //"No. Printed":="No. Printed" + 1;
                    //MODIFY;
                  END;
                  */

            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get;

                Address1 := CompanyInfo.Address;
                Tel := CompanyInfo."Phone No.";
                Homepage := CompanyInfo."Home Page";
                Address2 := CompanyInfo."Address 2";
                CompanyInfo.CalcFields(Picture);
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
        Chq__Slip_No_CaptionLbl: label 'Chq./Slip No.';
        DescriptionCaptionLbl: label 'Description';
        No_CaptionLbl: label 'No.';
        Received_fromCaptionLbl: label 'Received from';
        Currency_CaptionLbl: label 'Currency:';
        VATCaptionLbl: label 'VAT';
        DateCaptionLbl: label 'Date';
        DepartmentCaptionLbl: label 'Department';
        TotalCaptionLbl: label 'Total';
        Signature___________________Lbl: label '..................................';
        Amount_Incl__VATCaptionLbl: label 'Amount Incl. VAT';
        You_were_served_by_CaptionLbl: label 'You were served by:';
        TimeCaptionLbl: label 'Time';
        Amount_in_wordsCaptionLbl: label 'Amount in words';
        VAT_Amount_CaptionLbl: label 'VAT Amount:';
        Amount_Excl_VATCaptionLbl: label 'Amount Excl VAT';
        Signature_CaptionLbl: label 'Signature:';
        CompanyInfo: Record "Company Information";
        objLogos: Record "Company Information";
        CheckReport: Codeunit "Payments-Post";
        NumberText: array[2] of Text;
        TotAmount: Decimal;
        Donor: Text;
        Project: Text;
        DimVal: Record "Dimension Value";
        StrCopyText: Text;
        CurrencyCodeText: Code[10];
        Address1: Text;
        Homepage: Text;
        Address2: Text;
        Tel: Text;
        Creator: Code[30];
        CreatorName: Text;
        UserSetup: Record "User Setup";
        PreparedBy_Signature: Text;
        Legal_Entity: Text;
}
