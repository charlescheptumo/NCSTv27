#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 69037 "Journal Export"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Journal Export.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Payroll PeriodX"; "Payroll PeriodX")
        {
            RequestFilterFields = "Starting Date";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin

                Dep := '';
                ProfitCtr := '';
                Branch1 := '';
                DocNumber := 'PAYROLL' + Format(Date2dmy("Payroll PeriodX"."Starting Date", 2)) + Format(Date2dmy("Payroll PeriodX"."Starting Date", 3));
                LineNo := 1000;

                GenJnlLine.Reset;
                GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERALJOU');
                GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'PAYROLL');
                GenJnlLine.DeleteAll;

                //Advance
                AssMatrix.Reset;
                AssMatrix.SetRange(AssMatrix."Payroll Period", "Payroll PeriodX"."Starting Date");
                AssMatrix.SetRange(AssMatrix.Type, AssMatrix.Type::Deduction);
                AssMatrix.SetRange(AssMatrix.Code, 'D017');
                if AssMatrix.Find('-') then begin
                    repeat
                        //Empl.GET(AssMatrix."Employee No");
                        //Empl.CALCFIELDS(Empl."Payroll Group");
                        //k:=1;
                        //IF Empl."Payroll Group"=Empl."Payroll Group"::Management THEN BEGIN
                        //AmountX[k]:=AssMatrix.Amount;
                        Dep := AssMatrix."Department Code";
                        //ProfitCtr:=AssMatrix."Profit Centre";
                        //Branch1:=AssMatrix.Branch;



                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := 'GENERALJOU';
                        GenJnlLine."Journal Batch Name" := 'PAYROLL';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                        GenJnlLine."Account No." := '2470';
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := "Payroll PeriodX"."Pay Date";
                        GenJnlLine."Document No." := DocNumber;
                        GenJnlLine.Amount := AssMatrix.Amount;

                        GenJnlLine.Validate(GenJnlLine.Amount);


                        GenJnlLine.Description := UpperCase("Payroll PeriodX".Name) + ' ' +
                        Format(Date2dmy("Payroll PeriodX"."Starting Date", 3)) + ' PAYROLL-Advance';


                        //insert dimension
                        TempDimBuf2.Reset;
                        TempDimBuf2.DeleteAll;
                        //IF TempDimSetEntry0.FINDSET THEN
                        //REPEAT

                        //MESSAGE('%1',TempDimSetEntry0."Dimension Code");
                        TempDimBuf2.Init;
                        TempDimBuf2."Table ID" := 69009;
                        TempDimBuf2."Entry No." := 0;
                        TempDimBuf2."Dimension Code" := 'EMPLOYEES';
                        TempDimBuf2."Dimension Value Code" := AssMatrix."Employee No";
                        TempDimBuf2.Insert;
                        //EXIT;
                        // UNTIL TempDimSetEntry0.NEXT = 0;
                        TempDimSetEntry.DeleteAll;
                        TempDimBuf2.Reset;
                        if TempDimBuf2.FindSet then begin
                            repeat
                                // TempDimSetEntry.INIT;
                                DimVal.Get(TempDimBuf2."Dimension Code", TempDimBuf2."Dimension Value Code");
                                TempDimSetEntry."Dimension Code" := TempDimBuf2."Dimension Code";
                                TempDimSetEntry."Dimension Value Code" := TempDimBuf2."Dimension Value Code";
                                TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
                                TempDimSetEntry.Insert(true);
                            until TempDimBuf2.Next = 0;
                            GenJnlLine."Dimension Set ID" := Dmgt.GetDimensionSetID(TempDimSetEntry);
                            // MESSAGE('%1',GenJnlLine."Dimension Set ID" );
                            //EXIT;
                        end;




                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert;

                        /*
                        JLDim.INIT;
                        JLDim."Table ID":=81;
                        JLDim.VALIDATE("Table ID");
                        JLDim."Journal Template Name":='GENERALJOU';
                        JLDim.VALIDATE("Journal Template Name");
                        JLDim."Journal Batch Name":='PAYROLL';
                        JLDim.VALIDATE("Journal Batch Name");
                        JLDim."Journal Line No.":=LineNo;
                        JLDim.VALIDATE("Journal Line No.");

                        JLDim."Allocation Line No.":=0;
                        JLDim.VALIDATE(JLDim."Allocation Line No.");

                        JLDim."Dimension Code":='EMPLOYEES';
                        JLDim.VALIDATE("Dimension Code");
                        //JLDim."Dimension Value Code":="DimVal-Region".Code;
                        JLDim."Dimension Value Code":=AssMatrix."Employee No";

                        JLDim.VALIDATE("Dimension Value Code");
                        JLDim."New Dimension Value Code":='';
                        JLDim.VALIDATE(JLDim."New Dimension Value Code");
                        JLDim.INSERT(TRUE);

                        */
                        LineNo := LineNo + 1000;

                    //MakeExcelDataBody;
                    //k:=k+1;

                    //END;

                    until AssMatrix.Next = 0;

                end;




                //Net Pay
                ///Calculate Gross pay
                EarnRec.Reset;
                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                EarnRec.SetRange(EarnRec."Pay Period Filter", "Payroll PeriodX"."Starting Date");
                //EarnRec.SETRANGE(EarnRec."Payroll Grouping Filter",EarnRec."Payroll Grouping Filter"::Management);

                if EarnRec.Find('-') then begin
                    repeat
                        EarnRec.CalcFields(EarnRec."Total Amount");
                        GrossPay := GrossPay + EarnRec."Total Amount";
                    until EarnRec.Next = 0;
                end;

                Ded.Reset;
                Ded.SetRange(Ded."Pay Period Filter", "Payroll PeriodX"."Starting Date");
                //Ded.SETRANGE(Ded."Payroll Grouping Filter",Ded."Payroll Grouping Filter"::Management);
                if Ded.Find('-') then begin
                    repeat
                        Ded.CalcFields(Ded."Total Amount");
                        Totalded := Totalded + Ded."Total Amount";
                    until Ded.Next = 0;
                end;

                NetPay := -(GrossPay + Totalded);
                //MakeExcelDataBody3;

                GenJnlLine.Init;
                GenJnlLine."Journal Template Name" := 'GENERALJOU';
                GenJnlLine."Journal Batch Name" := 'PAYROLL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Account Type" := GenJnlLine."account type"::Vendor;
                GenJnlLine."Account No." := 'V000171';
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Posting Date" := "Payroll PeriodX"."Pay Date";
                GenJnlLine."Document No." := DocNumber;
                GenJnlLine.Amount := NetPay;

                GenJnlLine.Validate(GenJnlLine.Amount);


                GenJnlLine.Description := UpperCase("Payroll PeriodX".Name) + ' ' +
                Format(Date2dmy("Payroll PeriodX"."Starting Date", 3)) + ' PAYROLL-NET PAY';




                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert;

                LineNo := LineNo + 1000;






                //Other Deductions
                Ded.Reset;
                Ded.SetRange(Ded."Pay Period Filter", "Payroll PeriodX"."Starting Date");
                //Ded.SETRANGE(Ded."Payroll Grouping Filter",Ded."Payroll Grouping Filter"::Management);
                //Ded.SETRANGE(Ded.Statutory,FALSE);


                Ded.SetFilter(Ded.Code, '<>%1', 'D016');
                //Ded.SETFILTER(Ded.Code,'<>%1','D091');
                //Ded.SETFILTER(Ded.Code,'<>%1','D008');
                //Ded.SETFILTER(Ded.Code,'<>%1','D087');

                if Ded.Find('-') then begin
                    repeat

                        if ((Ded.Code = 'D031') or (Ded.Code = 'D091') or (Ded.Code = 'D087')) then begin
                            //CurrReport.SKIP;
                            /*Ded.CALCFIELDS(Ded."Total Amount");
                            IF Ded."Total Amount"<>0 THEN
                            MakeExcelDataBody13;
                            */
                        end else begin
                            Ded.CalcFields(Ded."Total Amount");
                            //IF Ded."Total Amount"<>0 THEN
                            //MakeExcelDataBody13;

                            //END;

                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'GENERALJOU';
                            GenJnlLine."Journal Batch Name" := 'PAYROLL';
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Account Type" := Ded."Account Type";
                            GenJnlLine."Account No." := Ded."Account No.";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            GenJnlLine."Posting Date" := "Payroll PeriodX"."Pay Date";
                            GenJnlLine."Document No." := DocNumber;
                            GenJnlLine.Amount := Ded."Total Amount";

                            GenJnlLine.Validate(GenJnlLine.Amount);


                            GenJnlLine.Description := UpperCase("Payroll PeriodX".Name) + ' ' +
                            Format(Date2dmy("Payroll PeriodX"."Starting Date", 3)) + ' ' + Ded.Description;



                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert;

                            LineNo := LineNo + 1000;

                        end;
                    until Ded.Next = 0;
                end;

                //MakeExcelDataBody9;


                //Pension and NSSF Company
                Ded.Reset;
                Ded.SetRange(Ded."Pay Period Filter", "Payroll PeriodX"."Starting Date");
                Ded.SetRange(Ded."Pension Scheme", true);
                //Ded.SETRANGE(Ded.Statutory,FALSE);


                if Ded.Find('-') then begin
                    repeat

                        Ded.CalcFields(Ded."Total Amount Employer");

                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := 'GENERALJOU';
                        GenJnlLine."Journal Batch Name" := 'PAYROLL';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Account Type" := Ded."Account Type";
                        GenJnlLine."Account No." := Ded."Account No.";
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := "Payroll PeriodX"."Pay Date";
                        GenJnlLine."Document No." := DocNumber;
                        GenJnlLine.Amount := -Ded."Total Amount Employer";

                        GenJnlLine.Validate(GenJnlLine.Amount);


                        GenJnlLine.Description := UpperCase("Payroll PeriodX".Name) + ' ' +
                        Format(Date2dmy("Payroll PeriodX"."Starting Date", 3)) + ' ' + Ded.Description + '-COMPANY';



                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert;

                        LineNo := LineNo + 1000;


                    until Ded.Next = 0;
                end;






                //gross pay

                /*
                TempDimBuf2.RESET;
                TempDimBuf2.DELETEALL;
                
                */

                "DimVal-Dep".Reset;
                "DimVal-Dep".SetRange("DimVal-Dep"."Dimension Code", 'DEPARTMENT');
                if "DimVal-Dep".Find('-') then begin
                    repeat




                        PostingGroup.Reset;
                        if PostingGroup.Find('-') then begin

                            repeat
                                //gross pay
                                BranchGrossPay := 0;
                                EarnRec.Reset;
                                EarnRec.SetRange(EarnRec."Earning Type", EarnRec."earning type"::"Normal Earning");
                                EarnRec.SetRange(EarnRec."Non-Cash Benefit", false);
                                EarnRec.SetRange(EarnRec."Pay Period Filter", "Payroll PeriodX"."Starting Date");
                                EarnRec.SetRange(EarnRec."Posting Group Filter", PostingGroup.Code);
                                //EarnRec.SETRANGE(EarnRec."Region Filter","DimVal-Region".Code);
                                //EarnRec.SETRANGE(EarnRec."Country Filter","DimVal-Country".Code);

                                EarnRec.SetRange(EarnRec."Department Filter", "DimVal-Dep".Code);
                                //EarnRec.SETRANGE(EarnRec."Projects Filter","DimVal-Project".Code);



                                if EarnRec.Find('-') then begin
                                    repeat
                                        if ((EarnRec.Code = 'E026') or (EarnRec.Code = 'E034')) then begin
                                            //Do Nothing

                                        end else begin

                                            EarnRec.CalcFields(EarnRec."Total Amount");
                                            BranchGrossPay := BranchGrossPay + EarnRec."Total Amount";
                                        end;

                                    until EarnRec.Next = 0;
                                end;

                                //IF BranchGrossPay>0 THEN
                                //MakeExcelDataBody10;

                                GenJnlLine.Init;
                                GenJnlLine."Journal Template Name" := 'GENERALJOU';
                                GenJnlLine."Journal Batch Name" := 'PAYROLL';
                                GenJnlLine."Line No." := LineNo;
                                GenJnlLine."Account Type" := PostingGroup."Account Type";
                                GenJnlLine."Account No." := PostingGroup."Salary Account";
                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                GenJnlLine."Posting Date" := "Payroll PeriodX"."Pay Date";
                                GenJnlLine."Document No." := DocNumber;
                                GenJnlLine.Amount := BranchGrossPay;

                                GenJnlLine.Validate(GenJnlLine.Amount);


                                GenJnlLine.Description := UpperCase("Payroll PeriodX".Name) + ' ' +
                                Format(Date2dmy("Payroll PeriodX"."Starting Date", 3)) + ' PAYROLL-Gross PaY ' + PostingGroup.Description;


                                //insert dimension
                                TempDimBuf2.Reset;
                                TempDimBuf2.DeleteAll;
                                //IF TempDimSetEntry0.FINDSET THEN
                                //REPEAT

                                //MESSAGE('%1',TempDimSetEntry0."Dimension Code");
                                TempDimBuf2.Init;
                                TempDimBuf2."Table ID" := 69009;
                                TempDimBuf2."Entry No." := 0;
                                TempDimBuf2."Dimension Code" := 'DEPARTMENT';
                                TempDimBuf2."Dimension Value Code" := "DimVal-Dep".Code;
                                TempDimBuf2.Insert;

                                TempDimBuf2.Init;
                                TempDimBuf2."Table ID" := 69009;
                                TempDimBuf2."Entry No." := 0;
                                TempDimBuf2."Dimension Code" := 'PROJECTS';
                                TempDimBuf2."Dimension Value Code" := 'NON-PROJECT';
                                TempDimBuf2.Insert;

                                TempDimBuf2.Init;
                                TempDimBuf2."Table ID" := 69009;
                                TempDimBuf2."Entry No." := 0;
                                TempDimBuf2."Dimension Code" := 'COUNTRY';
                                TempDimBuf2."Dimension Value Code" := 'KE';
                                TempDimBuf2.Insert;

                                TempDimBuf2.Init;
                                TempDimBuf2."Table ID" := 69009;
                                TempDimBuf2."Entry No." := 0;
                                TempDimBuf2."Dimension Code" := 'REGION';
                                TempDimBuf2."Dimension Value Code" := 'EA';
                                TempDimBuf2.Insert;
                                //EXIT;
                                // UNTIL TempDimSetEntry0.NEXT = 0;
                                TempDimSetEntry.DeleteAll;
                                TempDimBuf2.Reset;
                                if TempDimBuf2.FindSet then begin
                                    repeat
                                        DimVal.Get(TempDimBuf2."Dimension Code", TempDimBuf2."Dimension Value Code");
                                        TempDimSetEntry."Dimension Code" := TempDimBuf2."Dimension Code";
                                        TempDimSetEntry."Dimension Value Code" := TempDimBuf2."Dimension Value Code";
                                        TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";

                                        TempDimSetEntry.Insert(true);
                                    until TempDimBuf2.Next = 0;
                                    GenJnlLine."Dimension Set ID" := Dmgt.GetDimensionSetID(TempDimSetEntry);
                                    //MESSAGE('%1',GenJnlLine."Dimension Set ID" );
                                    //EXIT;
                                end;



                                if GenJnlLine.Amount <> 0 then begin
                                    GenJnlLine.Insert;

                                    /*
                                    JLDim.INIT;
                                    JLDim."Table ID":=81;
                                    JLDim.VALIDATE("Table ID");
                                    JLDim."Journal Template Name":='GENERALJOU';
                                    JLDim.VALIDATE("Journal Template Name");
                                    JLDim."Journal Batch Name":='PAYROLL';
                                    JLDim.VALIDATE("Journal Batch Name");
                                    JLDim."Journal Line No.":=LineNo;
                                    JLDim.VALIDATE("Journal Line No.");

                                    JLDim."Allocation Line No.":=0;
                                    JLDim.VALIDATE(JLDim."Allocation Line No.");

                                    JLDim."Dimension Code":='DEPARTMENT';
                                    JLDim.VALIDATE("Dimension Code");
                                    JLDim."Dimension Value Code":="DimVal-Dep".Code;
                                    JLDim.VALIDATE("Dimension Value Code");
                                    JLDim."New Dimension Value Code":='';
                                    JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                    JLDim.INSERT(TRUE);

                                    JLDim.INIT;
                                    JLDim."Table ID":=81;
                                    JLDim.VALIDATE("Table ID");
                                    JLDim."Journal Template Name":='GENERALJOU';
                                    JLDim.VALIDATE("Journal Template Name");
                                    JLDim."Journal Batch Name":='PAYROLL';
                                    JLDim.VALIDATE("Journal Batch Name");
                                    JLDim."Journal Line No.":=LineNo;
                                    JLDim.VALIDATE("Journal Line No.");

                                    JLDim."Allocation Line No.":=0;
                                    JLDim.VALIDATE(JLDim."Allocation Line No.");

                                    JLDim."Dimension Code":='PROJECTS';
                                    JLDim.VALIDATE("Dimension Code");
                                    JLDim."Dimension Value Code":='NON-PROJECT';
                                    //JLDim."Dimension Value Code":="DimVal-Project".Code;
                                    JLDim.VALIDATE("Dimension Value Code");
                                    JLDim."New Dimension Value Code":='';
                                    JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                    JLDim.INSERT(TRUE);



                                    JLDim.INIT;
                                    JLDim."Table ID":=81;
                                    JLDim.VALIDATE("Table ID");
                                    JLDim."Journal Template Name":='GENERALJOU';
                                    JLDim.VALIDATE("Journal Template Name");
                                    JLDim."Journal Batch Name":='PAYROLL';
                                    JLDim.VALIDATE("Journal Batch Name");
                                    JLDim."Journal Line No.":=LineNo;
                                    JLDim.VALIDATE("Journal Line No.");

                                    JLDim."Allocation Line No.":=0;
                                    JLDim.VALIDATE(JLDim."Allocation Line No.");

                                    JLDim."Dimension Code":='COUNTRY';
                                    JLDim.VALIDATE("Dimension Code");
                                    JLDim."Dimension Value Code":='KE';
                                    //JLDim."Dimension Value Code":="DimVal-Country".Code;

                                    JLDim.VALIDATE("Dimension Value Code");
                                    JLDim."New Dimension Value Code":='';
                                    JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                    JLDim.INSERT(TRUE);


                                    JLDim.INIT;
                                    JLDim."Table ID":=81;
                                    JLDim.VALIDATE("Table ID");
                                    JLDim."Journal Template Name":='GENERALJOU';
                                    JLDim.VALIDATE("Journal Template Name");
                                    JLDim."Journal Batch Name":='PAYROLL';
                                    JLDim.VALIDATE("Journal Batch Name");
                                    JLDim."Journal Line No.":=LineNo;
                                    JLDim.VALIDATE("Journal Line No.");

                                    JLDim."Allocation Line No.":=0;
                                    JLDim.VALIDATE(JLDim."Allocation Line No.");

                                    JLDim."Dimension Code":='REGION';
                                    JLDim.VALIDATE("Dimension Code");
                                    JLDim."Dimension Value Code":='EA';
                                    //JLDim."Dimension Value Code":="DimVal-Region".Code;

                                    JLDim.VALIDATE("Dimension Value Code");
                                    JLDim."New Dimension Value Code":='';
                                    JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                    JLDim.INSERT(TRUE);
                                    */

                                end;

                                //IF GenJnlLine.Amount<>0 THEN
                                //GenJnlLine.INSERT;

                                LineNo := LineNo + 1000;



                                //employer pension and nssf;



                                Ded.Reset;
                                Ded.SetRange(Ded."Pay Period Filter", "Payroll PeriodX"."Starting Date");
                                Ded.SetRange(Ded."Pension Scheme", true);
                                //Ded.SETRANGE(Ded.Statutory,FALSE);
                                Ded.SetRange(Ded."Posting Group Filter", PostingGroup.Code);
                                //Ded.SETRANGE(Ded."Region Filter","DimVal-Region".Code);
                                //Ded.SETRANGE(Ded."Country Filter","DimVal-Country".Code);

                                Ded.SetRange(Ded."Department Filter", "DimVal-Dep".Code);
                                //Ded.SETRANGE(Ded."Projects Filter","DimVal-Project".Code);



                                if Ded.Find('-') then begin
                                    repeat

                                        Ded.CalcFields(Ded."Total Amount Employer");

                                        GenJnlLine.Init;
                                        GenJnlLine."Journal Template Name" := 'GENERALJOU';
                                        GenJnlLine."Journal Batch Name" := 'PAYROLL';
                                        GenJnlLine."Line No." := LineNo;
                                        GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                                        if Ded.Code = 'D003' then
                                            GenJnlLine."Account No." := PostingGroup."SSF Employer Account"
                                        else
                                            GenJnlLine."Account No." := PostingGroup."Pension Employer Acc";
                                        //GenJnlLine."Account No.":=Ded."Account No.";
                                        GenJnlLine.Validate(GenJnlLine."Account No.");
                                        GenJnlLine."Posting Date" := "Payroll PeriodX"."Pay Date";
                                        GenJnlLine."Document No." := DocNumber;
                                        GenJnlLine.Amount := Ded."Total Amount Employer";

                                        GenJnlLine.Validate(GenJnlLine.Amount);


                                        GenJnlLine.Description := UpperCase("Payroll PeriodX".Name) + ' ' +
                                        Format(Date2dmy("Payroll PeriodX"."Starting Date", 3)) + ' ' + Ded.Description + '-COMPANY';



                                        //insert dimension
                                        TempDimBuf2.Reset;
                                        TempDimBuf2.DeleteAll;
                                        //IF TempDimSetEntry0.FINDSET THEN
                                        //REPEAT

                                        //MESSAGE('%1',TempDimSetEntry0."Dimension Code");
                                        TempDimBuf2.Init;
                                        TempDimBuf2."Table ID" := 69009;
                                        TempDimBuf2."Entry No." := 0;
                                        TempDimBuf2."Dimension Code" := 'DEPARTMENT';
                                        TempDimBuf2."Dimension Value Code" := "DimVal-Dep".Code;
                                        TempDimBuf2.Insert;

                                        TempDimBuf2.Init;
                                        TempDimBuf2."Table ID" := 69009;
                                        TempDimBuf2."Entry No." := 0;
                                        TempDimBuf2."Dimension Code" := 'PROJECTS';
                                        TempDimBuf2."Dimension Value Code" := 'NON-PROJECT';
                                        TempDimBuf2.Insert;

                                        TempDimBuf2.Init;
                                        TempDimBuf2."Table ID" := 69009;
                                        TempDimBuf2."Entry No." := 0;
                                        TempDimBuf2."Dimension Code" := 'COUNTRY';
                                        TempDimBuf2."Dimension Value Code" := 'KE';
                                        TempDimBuf2.Insert;

                                        TempDimBuf2.Init;
                                        TempDimBuf2."Table ID" := 69009;
                                        TempDimBuf2."Entry No." := 0;
                                        TempDimBuf2."Dimension Code" := 'REGION';
                                        TempDimBuf2."Dimension Value Code" := 'EA';
                                        TempDimBuf2.Insert;
                                        //EXIT;
                                        // UNTIL TempDimSetEntry0.NEXT = 0;
                                        TempDimSetEntry.DeleteAll;
                                        TempDimBuf2.Reset;
                                        if TempDimBuf2.FindSet then begin
                                            repeat
                                                DimVal.Get(TempDimBuf2."Dimension Code", TempDimBuf2."Dimension Value Code");
                                                TempDimSetEntry."Dimension Code" := TempDimBuf2."Dimension Code";
                                                TempDimSetEntry."Dimension Value Code" := TempDimBuf2."Dimension Value Code";
                                                TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";

                                                TempDimSetEntry.Insert(true);
                                            until TempDimBuf2.Next = 0;
                                            GenJnlLine."Dimension Set ID" := Dmgt.GetDimensionSetID(TempDimSetEntry);
                                            //MESSAGE('%1',GenJnlLine."Dimension Set ID" );
                                            //EXIT;
                                        end;




                                        if GenJnlLine.Amount <> 0 then begin
                                            GenJnlLine.Insert;


                                            /*

                                            JLDim.INIT;
                                            JLDim."Table ID":=81;
                                            JLDim.VALIDATE("Table ID");
                                            JLDim."Journal Template Name":='GENERALJOU';
                                            JLDim.VALIDATE("Journal Template Name");
                                            JLDim."Journal Batch Name":='PAYROLL';
                                            JLDim.VALIDATE("Journal Batch Name");
                                            JLDim."Journal Line No.":=LineNo;
                                            JLDim.VALIDATE("Journal Line No.");

                                            JLDim."Allocation Line No.":=0;
                                            JLDim.VALIDATE(JLDim."Allocation Line No.");

                                            JLDim."Dimension Code":='DEPARTMENT';
                                            JLDim.VALIDATE("Dimension Code");
                                            JLDim."Dimension Value Code":="DimVal-Dep".Code;
                                            JLDim.VALIDATE("Dimension Value Code");
                                            JLDim."New Dimension Value Code":='';
                                            JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                            JLDim.INSERT(TRUE);


                                            JLDim.INIT;
                                            JLDim."Table ID":=81;
                                            JLDim.VALIDATE("Table ID");
                                            JLDim."Journal Template Name":='GENERALJOU';
                                            JLDim.VALIDATE("Journal Template Name");
                                            JLDim."Journal Batch Name":='PAYROLL';
                                            JLDim.VALIDATE("Journal Batch Name");
                                            JLDim."Journal Line No.":=LineNo;
                                            JLDim.VALIDATE("Journal Line No.");

                                            JLDim."Allocation Line No.":=0;
                                            JLDim.VALIDATE(JLDim."Allocation Line No.");

                                            JLDim."Dimension Code":='PROJECTS';
                                            JLDim.VALIDATE("Dimension Code");
                                            JLDim."Dimension Value Code":='NON-PROJECT';
                                            JLDim.VALIDATE("Dimension Value Code");
                                            JLDim."New Dimension Value Code":='';
                                            JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                            JLDim.INSERT(TRUE);


                                            JLDim.INIT;
                                            JLDim."Table ID":=81;
                                            JLDim.VALIDATE("Table ID");
                                            JLDim."Journal Template Name":='GENERALJOU';
                                            JLDim.VALIDATE("Journal Template Name");
                                            JLDim."Journal Batch Name":='PAYROLL';
                                            JLDim.VALIDATE("Journal Batch Name");
                                            JLDim."Journal Line No.":=LineNo;
                                            JLDim.VALIDATE("Journal Line No.");

                                            JLDim."Allocation Line No.":=0;
                                            JLDim.VALIDATE(JLDim."Allocation Line No.");

                                            JLDim."Dimension Code":='COUNTRY';
                                            JLDim.VALIDATE("Dimension Code");
                                            JLDim."Dimension Value Code":='KE';
                                            //JLDim."Dimension Value Code":="DimVal-Country".Code;

                                            JLDim.VALIDATE("Dimension Value Code");
                                            JLDim."New Dimension Value Code":='';
                                            JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                            JLDim.INSERT(TRUE);


                                            JLDim.INIT;
                                            JLDim."Table ID":=81;
                                            JLDim.VALIDATE("Table ID");
                                            JLDim."Journal Template Name":='GENERALJOU';
                                            JLDim.VALIDATE("Journal Template Name");
                                            JLDim."Journal Batch Name":='PAYROLL';
                                            JLDim.VALIDATE("Journal Batch Name");
                                            JLDim."Journal Line No.":=LineNo;
                                            JLDim.VALIDATE("Journal Line No.");

                                            JLDim."Allocation Line No.":=0;
                                            JLDim.VALIDATE(JLDim."Allocation Line No.");

                                            JLDim."Dimension Code":='REGION';
                                            JLDim.VALIDATE("Dimension Code");
                                            //JLDim."Dimension Value Code":="DimVal-Region".Code;
                                            JLDim."Dimension Value Code":='EA';

                                            JLDim.VALIDATE("Dimension Value Code");
                                            JLDim."New Dimension Value Code":='';
                                            JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                            JLDim.INSERT(TRUE);

                                            */

                                        end;

                                        //IF GenJnlLine.Amount<>0 THEN
                                        //GenJnlLine.INSERT;

                                        //LineNo:=LineNo+1000;
                                        LineNo := LineNo + 1000;

                                    until Ded.Next = 0;
                                end;









                            until PostingGroup.Next = 0;
                        end;
                    /*
                    UNTIL "DimVal-Project".NEXT=0;
                    END;
                    */

                    until "DimVal-Dep".Next = 0;
                end;

                /*
                UNTIL "DimVal-Country".NEXT=0;
                END;
                
                
                UNTIL "DimVal-Region".NEXT=0;
                END;
                
                 */

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
        Empl: Record Employee;
        AssMatrix: Record "Assignment Matrix-X";
        AmountX: array[2000] of Decimal;
        Dep: Code[20];
        ProfitCtr: Code[20];
        Branch1: Code[20];
        k: Integer;
        ExcelBuf: Record "Excel Buffer" temporary;
        GrossPay: Decimal;
        NetPay: Decimal;
        HRSetup: Record "Human Resources Setup";
        EarnRec: Record EarningsX;
        Ded: Record DeductionsX;
        Totalded: Decimal;
        PAYE: Decimal;
        NSSF: Decimal;
        "NSSF-Company": Decimal;
        "NSSF-Vol": Decimal;
        NHIF: Decimal;
        "DimVal-Region": Record "Dimension Value";
        "DimVal-Country": Record "Dimension Value";
        "DimVal-Dep": Record "Dimension Value";
        "DimVal-Project": Record "Dimension Value";
        BranchGrossPay: Decimal;
        NSSFCompany: Decimal;
        PensionComp: Decimal;
        DocNumber: Code[20];
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        PostingGroup: Record "Employee Posting GroupX";
        Text002: label 'PAYROLL JOURNAL';
        Text001: label 'CIMBRIA';
        TempDimBuf2: Record "Dimension Buffer" temporary;
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        DimVal: Record "Dimension Value";
        Dmgt: Codeunit DimensionManagement;
        TempDimSetEntry0: Record "Dimension Set Entry" temporary;
}
