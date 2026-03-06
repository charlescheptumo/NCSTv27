#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 70001 "Purchase Requisition Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Purchase Requisition Report.rdlc';

    dataset
    {
        dataitem("Requisition Header1"; "Requisition Header1")
        {
            DataItemTableView = sorting("No.") where("Requisition Type" = const("Purchase Requisition"));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(ReportForNavId_3574; 3574)
            {
            }
            column(Department; "Requisition Header1"."Global Dimension 4 Code")
            {
            }
            column(Requisition_Header1__Requisition_Header1___No__; "Requisition Header1"."No.")
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(Requisition_Header1__Employee_Name_; "Requisition Header1"."Employee Name")
            {
            }
            column(Requisition_Header1__Requisition_Header1___Requisition_Date_; "Requisition Header1"."Requisition Date")
            {
            }
            column(PROCUREMENT_REQUISITIONCaptions; PROCUREMENT_REQUISITIONCaptionLbl)
            {
            }
            column(FromCaption; FromCaptionLbl)
            {
            }
            column(DepartmentCaption; DepartmentCaptionLbl)
            {
            }
            column(QTYCaption; QTYCaptionLbl)
            {
            }
            column(DESCRIPTIONCaption; DESCRIPTIONCaptionLbl)
            {
            }
            column(UNITCaption; UNITCaptionLbl)
            {
            }
            column(Previous_Supplied__Where_Known_Caption; Previous_Supplied__Where_Known_CaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(ToCaption; ToCaptionLbl)
            {
            }
            column(Procurement_ManagerCaption; Procurement_ManagerCaptionLbl)
            {
            }
            column(Please_procure_the_following_items_on_our_behalfCaption; Please_procure_the_following_items_on_our_behalfCaptionLbl)
            {
            }
            column(Unit_PriceCaption; Unit_PriceCaptionLbl)
            {
            }
            column(Estimated_CostCaption; Estimated_CostCaptionLbl)
            {
            }
            column(Date_Caption; Date_CaptionLbl)
            {
            }
            column(Requisition_Lines1__Budget_Line_Caption; "Requisition Lines1".FieldCaption("Budget Line"))
            {
            }
            column(NO_Caption_Control1000000126; NO_Caption_Control1000000126Lbl)
            {
            }
            column(Reason_For_PR; "Requisition Header1".Reason)
            {
            }
            column(TotalAmount; "Requisition Header1".Total)
            {
            }
            dataitem("Requisition Lines1"; "Requisition Lines1")
            {
                DataItemLink = "Requisition No" = field("No.");
                DataItemTableView = sorting("Requisition No", "Line No");
                column(ReportForNavId_8404; 8404)
                {
                }
                column(Requisition_Lines1_Quantity; "Requisition Lines1".Quantity)
                {
                }
                column(Requisition_Lines1_Description; "Requisition Lines1".Description)
                {
                }
                column(EmptyString; '')
                {
                }
                column(Requisition_Lines1__Requisition_Lines1___Unit_of_Measure_; "Requisition Lines1"."Unit of Measure")
                {
                }
                column(Requisition_Lines1__Requisition_Lines1___Unit_Price_; "Requisition Lines1"."Unit Cost")
                {
                }
                column(RecSeq; RecSeq)
                {
                }
                column(Requisition_Lines1_Amount; "Requisition Lines1".Amount)
                {
                }
                column(Requisition_Lines1__Budget_Line_; "Requisition Lines1"."Budget Line")
                {
                }
                column(V1stapprover_; "1stapprover")
                {
                }
                column(V2ndapprover_; "2ndapprover")
                {
                }
                column(UserRecApp2_Picture; UserRecApp2.Picture)
                {
                }
                column(UserRecApp1_Picture; UserRecApp1.Picture)
                {
                }
                column(UserRecApp3_Picture; UserRecApp3.Picture)
                {
                }
                column(V3rdapprover_; "3rdapprover")
                {
                }
                column(V3rdapproverdate_; "3rdapproverdate")
                {
                }
                column(V2ndapproverdate_; "2ndapproverdate")
                {
                }
                column(V1stapproverdate_; "1stapproverdate")
                {
                }
                column(PREPARED_BYCaption; PREPARED_BYCaptionLbl)
                {
                }
                column(CHECKED_BY_Caption; CHECKED_BY_CaptionLbl)
                {
                }
                column(SIGNATURECaption; SIGNATURECaptionLbl)
                {
                }
                column(SIGNATURECaption_Control1000000032; SIGNATURECaption_Control1000000032Lbl)
                {
                }
                column(DATE__________________________________________________Caption; DATE__________________________________________________CaptionLbl)
                {
                }
                column(DATE__________________________________________________Caption_Control1000000036; DATE__________________________________________________Caption_Control1000000036Lbl)
                {
                }
                column(APPROVED_BY_Caption; APPROVED_BY_CaptionLbl)
                {
                }
                column(SIGNATURE_Caption; SIGNATURE_CaptionLbl)
                {
                }
                column(DATE__________________________________________________Caption_Control1000000040; DATE__________________________________________________Caption_Control1000000040Lbl)
                {
                }
                column(Requisition_Lines1_Requisition_No; "Requisition Lines1"."Requisition No")
                {
                }
                column(Requisition_Lines1_Line_No; "Requisition Lines1"."Line No")
                {
                }

                trigger OnAfterGetRecord()
                begin


                    ThisLNAmt := ThisLNAmt + "Requisition Lines1".Amount;
                    RecSeq := RecSeq + 1;
                end;

                trigger OnPreDataItem()
                begin
                    RecSeq := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Dimvalues.SetRange(Dimvalues."Dimension Code", GenLedSetup."Global Dimension 1 Code");
                Dimvalues.SetRange(Dimvalues.Code, "Requisition Header1"."Global Dimension 1 Code");
                if Dimvalues.Find('-') then
                    Department := Dimvalues.Name;

                //DateRequired:="Requisition Header"."Required Date";
                CompInfo.CalcFields(Picture);

                ApprovalEntries.Reset;
                ApprovalEntries.SetRange(ApprovalEntries."Table ID", 51511110);
                ApprovalEntries.SetRange(ApprovalEntries."Document No.", "Requisition Header1"."No.");
                ApprovalEntries.SetRange(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat

                        i := i + 1;
                        if i = 1 then begin
                            "1stapprover" := ApprovalEntries."Sender ID";
                            //MESSAGE('1stapprover=%1',"1stapprover");
                            "1stapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp1.Get("1stapprover") then
                                UserRecApp1.CalcFields(UserRecApp1.Picture);
                        end;
                        if i = 2 then begin
                            "2ndapprover" := ApprovalEntries."Approver ID";
                            //MESSAGE('2ndapprover=%1',"2ndapprover");
                            "2ndapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp2.Get("2ndapprover") then
                                UserRecApp2.CalcFields(UserRecApp2.Picture);
                        end;

                        if i = 2 then begin
                            /*AdditionalApprovers.RESET;
                            AdditionalApprovers.SETRANGE("Approval Code",ApprovalEntries."Approval Code");
                            AdditionalApprovers.SETRANGE("Global Dimension 1 Code","Requisition Header1"."Global Dimension 1 Code");
                            AdditionalApprovers.SETRANGE("Approver ID",ApprovalEntries."Approver ID");
                             IF AdditionalApprovers.FIND('-') THEN BEGIN
                            "3rdapprover":=ApprovalEntries."Approver ID";
                            //MESSAGE('3rdapprover=%1',"2ndapprover");
                            "3rdapproverdate":=ApprovalEntries."Last Date-Time Modified";
                             IF UserRecApp3.GET("3rdapprover") THEN
                             UserRecApp3.CALCFIELDS(UserRecApp3.Picture);
                             END
                             ELSE BEGIN

                            "3rdapprover":=ApprovalEntries."Approver ID";
                            //MESSAGE('3rdapprover=%1',"2ndapprover");
                            "3rdapproverdate":=ApprovalEntries."Last Date-Time Modified";
                             IF UserRecApp3.GET("3rdapprover") THEN
                             UserRecApp3.CALCFIELDS(UserRecApp3.Picture);
                             END;*/
                        end;

                        if i = 3 then begin
                            /*
                            IF Skip THEN BEGIN
                            "2ndapprover":=ApprovalEntries."Approver ID";
                            "2ndapproverdate":=ApprovalEntries."Last Date-Time Modified";
                             IF UserRecApp2.GET("2ndapprover") THEN
                             UserRecApp2.CALCFIELDS(UserRecApp2.Picture);
                            END ELSE BEGIN
                            */
                            //MESSAGE('3rdApprover=%1',ApprovalEntries."Approver ID");
                            "3rdapprover" := ApprovalEntries."Approver ID";
                            "3rdapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp3.Get("3rdapprover") then
                                UserRecApp3.CalcFields(UserRecApp3.Picture);
                            //END;
                        end;

                        if i = 4 then begin
                            "3rdapprover" := ApprovalEntries."Approver ID";
                            "3rdapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp3.Get("3rdapprover") then
                                UserRecApp3.CalcFields(UserRecApp3.Picture);
                        end;

                        if i = 5 then begin
                            "3rdapprover" := ApprovalEntries."Approver ID";
                            "3rdapproverdate" := ApprovalEntries."Last Date-Time Modified";
                            if UserRecApp3.Get("3rdapprover") then
                                UserRecApp3.CalcFields(UserRecApp3.Picture);
                        end;

                    until ApprovalEntries.Next = 0;
                end;

            end;

            trigger OnPreDataItem()
            begin
                CompInfo.Get;
                GenLedSetup.Get;
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
        Department: Text[60];
        Dimvalues: Record "Dimension Value";
        Vendors: Record Vendor;
        PrevMonthBud: Decimal;
        CurrMonthBud: Decimal;
        TotAvailableBud: Decimal;
        GLAccount: Record "G/L Account";
        GenLedSetup: Record "General Ledger Setup";
        QtyStore: Record Item;
        GenPostGroup: Record "General Posting Setup";
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "Requisition Header1";
        BudgetDate: Date;
        YrBudget: Decimal;
        "BudgetB/F": Decimal;
        RequisitionLine: Record "Requisition Lines1";
        BudgetGL: Code[20];
        ThisLNAmt: Decimal;
        MonthReqHdr: Record "Requisition Header1";
        PeriodTo: Date;
        MonthReq: Record "Requisition Lines1";
        TotalMonthReq: Decimal;
        RecSeq: Integer;
        DateRequired: Date;
        CompInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        "1stapprover": Text[30];
        "2ndapprover": Text[30];
        i: Integer;
        "1stapproverdate": DateTime;
        "2ndapproverdate": DateTime;
        UserRec: Record "User Setup";
        UserRecApp1: Record "User Setup";
        UserRecApp2: Record "User Setup";
        UserRecApp3: Record "User Setup";
        "3rdapprover": Text[30];
        "3rdapproverdate": DateTime;
        PROCUREMENT_REQUISITIONCaptionLbl: label 'PROCUREMENT REQUISITION';
        FromCaptionLbl: label 'From';
        DepartmentCaptionLbl: label 'Department';
        QTYCaptionLbl: label 'QTY';
        DESCRIPTIONCaptionLbl: label 'DESCRIPTION';
        UNITCaptionLbl: label 'UNIT';
        Previous_Supplied__Where_Known_CaptionLbl: label 'Previous Supplied (Where Known)';
        No_CaptionLbl: label 'No.';
        ToCaptionLbl: label 'To';
        Procurement_ManagerCaptionLbl: label 'Procurement Manager';
        Please_procure_the_following_items_on_our_behalfCaptionLbl: label 'Please procure the following items on our behalf';
        Unit_PriceCaptionLbl: label 'Unit Price';
        Estimated_CostCaptionLbl: label 'Estimated Cost';
        Date_CaptionLbl: label 'Date:';
        NO_Caption_Control1000000126Lbl: label 'NO.';
        PREPARED_BYCaptionLbl: label 'PREPARED BY';
        CHECKED_BY_CaptionLbl: label 'CHECKED BY ';
        SIGNATURECaptionLbl: label 'SIGNATURE';
        SIGNATURECaption_Control1000000032Lbl: label 'SIGNATURE';
        DATE__________________________________________________CaptionLbl: label 'DATE ';
        DATE__________________________________________________Caption_Control1000000036Lbl: label 'DATE ';
        APPROVED_BY_CaptionLbl: label 'APPROVED BY ';
        SIGNATURE_CaptionLbl: label 'SIGNATURE ';
        DATE__________________________________________________Caption_Control1000000040Lbl: label 'DATE ';
        Skip: Boolean;


    procedure GetMonthlyTot(var Periodfrom: Date; var Dept: Code[20]) TotMonthReq: Decimal
    begin
        /*TotMonthReq:=0;
        PeriodTo:=CALCDATE('1M',Periodfrom);
        PeriodTo:=CALCDATE('-1D',PeriodTo);
        MonthReqHdr.RESET;
        MonthReqHdr.SETRANGE(MonthReqHdr."Request date",Periodfrom,PeriodTo);
        MonthReqHdr.SETRANGE(MonthReqHdr."Global Dimension 1 Code",Dept);
        MonthReqHdr.SETRANGE(MonthReqHdr.Status,MonthReqHdr.Status::Released);
        IF MonthReqHdr.FIND('-') THEN BEGIN
           REPEAT
           MonthReq.RESET;
           MonthReq.SETRANGE(MonthReq."Requistion No",MonthReqHdr.No);
           IF MonthReq.FIND('-') THEN BEGIN
              REPEAT
              TotMonthReq:=TotMonthReq+MonthReq."Line Amount";
              UNTIL MonthReq.NEXT=0;
           END;
           UNTIL MonthReqHdr.NEXT=0;
        END;
        */

    end;
}
