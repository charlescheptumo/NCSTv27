#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70006 "Inspection Certificate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Inspection Certificate.rdlc';

    dataset
    {
        dataitem("Inspection Header1"; "Inspection Header1")
        {
            RequestFilterFields = "Inspection No", "Order No";
            column(ReportForNavId_9565; 9565)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(Accepted; Accepted)
            {
            }
            column(Rejected; Rejected)
            {
            }
            column(Inspection_Header1__Inspection_Header1___Inspection_No_; "Inspection Header1"."Inspection No")
            {
            }
            column(Inspection_Header1__Order_No_; "Inspection Header1"."Order No")
            {
            }
            column(Inspection_Header1__Supplier_Name_; "Inspection Header1"."Supplier Name")
            {
            }
            column(Dept; Dept)
            {
            }
            column(InvoiceNo; InvoiceNo)
            {
            }
            column(V1stapprover_; "1stapprover")
            {
            }
            column(UserRecApp1_Picture; UserRecApp1.Picture)
            {
            }
            column(UserRecApp2_Picture; UserRecApp2.Picture)
            {
            }
            column(V2ndapprover_; "2ndapprover")
            {
            }
            column(UserRecApp3_Picture; UserRecApp3.Picture)
            {
            }
            column(V3rdapprover_; "3rdapprover")
            {
            }
            column(V2ndapproverdate_; "2ndapproverdate")
            {
            }
            column(V1stapproverdate_; "1stapproverdate")
            {
            }
            column(V3rdapproverdate_; "3rdapproverdate")
            {
            }
            column(UserRecApp4_Picture; UserRecApp4.Picture)
            {
            }
            column(V4thapprover_; "4thapprover")
            {
            }
            column(V4thapproverdate_; "4thapproverdate")
            {
            }
            column(UserRecApp5_Picture; UserRecApp5.Picture)
            {
            }
            column(V5thapprover_; "5thapprover")
            {
            }
            column(V5thapproverdate_; "5thapproverdate")
            {
            }
            column(INSPECTION_AND_ACCEPTANCE_COMMITTEE__IAC__REPORTCaption; INSPECTION_AND_ACCEPTANCE_COMMITTEE__IAC__REPORTCaptionLbl)
            {
            }
            column(INSPECTION_NOCaption; INSPECTION_NOCaptionLbl)
            {
            }
            column(Inspection_Header1__Order_No_Caption; OrderNoCaptionLbl)
            {
            }
            column(Inspection_Header1__Supplier_Name_Caption; SupplierCaptionLbl)
            {
            }
            column(DepartmentCaption; DepartmentCaptionLbl)
            {
            }
            column(Invoice_NoCaption; Invoice_NoCaptionLbl)
            {
            }
            column(Officer_In_Charge_of_stores_Name_and_Signature_Caption; Officer_In_Charge_of_stores_Name_and_Signature_CaptionLbl)
            {
            }
            column(User_Department__Name___Signature_Caption; User_Department__Name___Signature_CaptionLbl)
            {
            }
            column(Committee_Member__Name___Signature_Caption; Committee_Member__Name___Signature_CaptionLbl)
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(DateCaption_Control1000000061; DateCaption_Control1000000061Lbl)
            {
            }
            column(DateCaption_Control1000000062; DateCaption_Control1000000062Lbl)
            {
            }
            column(Committee_Member__Name___Signature_Caption_Control1000000067; Committee_Member__Name___Signature_Caption_Control1000000067Lbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(Chairman__Name___Signature_Caption; Chairman__Name___Signature_CaptionLbl)
            {
            }
            column(CertificationCaption; Text001)
            {
            }
            column(DescriptionCaption; Text002)
            {
            }
            column(Date_Caption_Control1000000013; Date_Caption_Control1000000013Lbl)
            {
            }
            dataitem("Inspection Lines1"; "Inspection Lines1")
            {
                DataItemLink = "Inspection No" = field("Inspection No");
                DataItemTableView = sorting("Inspection No", "Line No");
                column(ReportForNavId_3527; 3527)
                {
                }
                column(Inspection_Lines1_Description; "Inspection Lines1".Description)
                {
                }
                column(Inspection_Lines1__Unit_of_Measure_; "Inspection Lines1"."Unit of Measure")
                {
                }
                column(Inspection_Lines1__Quantity_Ordered_; "Inspection Lines1"."Quantity Ordered")
                {
                }
                column(Inspection_Lines1__Inspection_Decision_; "Inspection Lines1"."Inspection Decision")
                {
                }
                column(Inspection_Lines1__Inspection_Lines1___Reasons_for_Rejection_; "Inspection Lines1"."Reasons for Rejection")
                {
                }
                column(QTYCaption; QTYCaptionLbl)
                {
                }
                column(STATUSCaption; STATUSCaptionLbl)
                {
                }
                column(UNITCaption; UNITCaptionLbl)
                {
                }
                column(ITEM_DESCRIPTIONCaption; ITEM_DESCRIPTIONCaptionLbl)
                {
                }
                column(NOCaption; NOCaptionLbl)
                {
                }
                column(REASONSCaption; REASONSCaptionLbl)
                {
                }
                column(Inspection_Lines1_Inspection_No; "Inspection Lines1"."Inspection No")
                {
                }
                column(Inspection_Lines1_Line_No; "Inspection Lines1"."Line No")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                GLSetup.Get;
                CompInfo.Get;
                //"Inspection Header1".CALCFIELDS(Amount);
                CompInfo.CalcFields(Picture);
                if PurchHeader.Get(PurchHeader."document type"::Order, "Inspection Header1"."Order No") then begin
                    if DimValue.Get(GLSetup."Global Dimension 1 Code", PurchHeader."Shortcut Dimension 1 Code") then
                        Dept := DimValue.Name;
                    InvoiceNo := PurchHeader."Vendor Invoice No.";
                end;

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange(ApprovalEntries."Table ID", 51511124);
                ApprovalEntries.SetRange(ApprovalEntries."Document No.", "Inspection Header1"."Inspection No");
                ApprovalEntries.SetRange(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            "1stapprover" := ApprovalEntries."Approver ID";
                            "1stapproverdate" := ApprovalEntries."Date-Time Sent for Approval";
                            if UserRecApp1.Get("1stapprover") then
                                UserRecApp1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            "2ndapprover" := ApprovalEntries."Approver ID";
                            "2ndapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp2.Get("2ndapprover") then
                                UserRecApp2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            "3rdapprover" := ApprovalEntries."Approver ID";
                            "3rdapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp3.Get("3rdapprover") then
                                UserRecApp3.CalcFields(Picture);
                        end;
                        if i = 4 then begin
                            "4thapprover" := ApprovalEntries."Approver ID";
                            "4thapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp4.Get("4thapprover") then
                                UserRecApp4.CalcFields(Picture);
                        end;
                        if i = 5 then begin
                            "5thapprover" := ApprovalEntries."Approver ID";
                            "5thapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp5.Get("5thapprover") then
                                UserRecApp5.CalcFields(Picture);
                        end;

                    until
                     ApprovalEntries.Next = 0;
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

    var
        CompInfo: Record "Company Information";
        PurchHeader: Record "Purchase Header";
        DimValue: Record "Dimension Value";
        Dept: Text[100];
        GLSetup: Record "General Ledger Setup";
        ApprovalEntries: Record "Approval Entry";
        "1stapprover": Code[20];
        "1stapproverdate": DateTime;
        UserRecApp1: Record "User Setup";
        i: Integer;
        "2ndapprover": Code[20];
        "2ndapproverdate": DateTime;
        UserRecApp2: Record "User Setup";
        "3rdapprover": Code[20];
        "3rdapproverdate": DateTime;
        UserRecApp3: Record "User Setup";
        "4thapprover": Code[20];
        "4thapproverdate": DateTime;
        UserRecApp4: Record "User Setup";
        "5thapprover": Code[20];
        "5thapproverdate": DateTime;
        UserRecApp5: Record "User Setup";
        InvoiceNo: Code[20];
        INSPECTION_AND_ACCEPTANCE_COMMITTEE__IAC__REPORTCaptionLbl: label 'INSPECTION AND ACCEPTANCE CERTIFICATE';
        INSPECTION_NOCaptionLbl: label 'INSPECTION NO';
        DepartmentCaptionLbl: label 'DEPARTMENT';
        Invoice_NoCaptionLbl: label 'INVOICE';
        Officer_In_Charge_of_stores_Name_and_Signature_CaptionLbl: label 'Officer In-Charge of stores(Name and Signature)';
        User_Department__Name___Signature_CaptionLbl: label 'User Department (Name & Signature)';
        Committee_Member__Name___Signature_CaptionLbl: label 'Committee Member (Name & Signature)';
        DateCaptionLbl: label 'Date';
        DateCaption_Control1000000061Lbl: label 'Date';
        DateCaption_Control1000000062Lbl: label 'Date';
        Committee_Member__Name___Signature_Caption_Control1000000067Lbl: label 'Committee Member (Name & Signature)';
        Date_CaptionLbl: label 'Date ';
        Chairman__Name___Signature_CaptionLbl: label 'Chairman (Name & Signature)';
        Date_Caption_Control1000000013Lbl: label 'Date ';
        QTYCaptionLbl: label 'QUANTITY';
        STATUSCaptionLbl: label 'STATUS';
        UNITCaptionLbl: label 'UNIT OF MEASURE';
        ITEM_DESCRIPTIONCaptionLbl: label 'ITEM DESCRIPTION';
        NOCaptionLbl: label 'NO';
        REASONSCaptionLbl: label 'REASONS';
        SupplierCaptionLbl: label 'SUPPLIER:';
        OrderNoCaptionLbl: label 'REFERENCE: LPO/LSO NO';
        Text001: label 'This is to certify that the following goods/services/works have been inspected, verified/tested and:';
        Text002: label 'Description of goods/service/works';
        Accepted: label 'Accepted';
        Rejected: label 'Rejected';
}
