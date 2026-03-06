#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 69017 "Leave Jnl.-Post Line"
{
    Permissions = TableData "HR Leave Ledger Entries" = rimd,
                  TableData "HR Leave Register" = rimd;
    TableNo = "HR Journal Line";

    trigger OnRun()
    begin
        GLSetup.Get;
        RunWithCheck(Rec);
    end;

    var
        GLSetup: Record "General Ledger Setup";
        FA: Record Employee;
        Insurance: Record "HR Leave Application";
        InsuranceJnlLine: Record "HR Journal Line";
        InsCoverageLedgEntry: Record "HR Leave Ledger Entries";
        InsCoverageLedgEntry2: Record "HR Leave Ledger Entries";
        InsuranceReg: Record "HR Leave Register";
        InsuranceJnlCheckLine: Codeunit "Leave Jnl.-Check Line";
        MakeInsCoverageLedgEntry: Codeunit "HR Make Leave Ledg. Entry";
        NextEntryNo: Integer;


    procedure RunWithCheck(var InsuranceJnlLine2: Record "HR Journal Line")
    begin
        InsuranceJnlLine.Copy(InsuranceJnlLine2);
        Code(true);
        InsuranceJnlLine2 := InsuranceJnlLine;
    end;


    procedure RunWithOutCheck(var InsuranceJnlLine2: Record "HR Journal Line")
    begin
        InsuranceJnlLine.Copy(InsuranceJnlLine2);
        Code(false);
        InsuranceJnlLine2 := InsuranceJnlLine;
    end;

    local procedure "Code"(CheckLine: Boolean)
    begin
        begin
            if InsuranceJnlLine."Document No." = '' then
                exit;
            if CheckLine then
                //InsuranceJnlCheckLine.RunCheck(InsuranceJnlLine);
                //Insurance.GET("Document No.");
                //Insurance.TESTFIELD(Blocked,FALSE);
                FA.Get(InsuranceJnlLine."Staff No.");
            //FA.TESTFIELD("Budgeted Asset",FALSE);
            //FA.TESTFIELD(Blocked,FALSE);
            //FA.TESTFIELD(Inactive,FALSE);
            MakeInsCoverageLedgEntry.CopyFromJnlLine(InsCoverageLedgEntry, InsuranceJnlLine);
            //MakeInsCoverageLedgEntry.CopyFromInsuranceCard(InsCoverageLedgEntry,Insurance);
        end;
        if NextEntryNo = 0 then begin
            InsCoverageLedgEntry.LockTable;
            if InsCoverageLedgEntry2.FindLast then
                NextEntryNo := InsCoverageLedgEntry2."Entry No.";
            InsuranceReg.LockTable;
            if InsuranceReg.FindLast then
                InsuranceReg."No." := InsuranceReg."No." + 1
            else
                InsuranceReg."No." := 1;
            InsuranceReg.Init;
            InsuranceReg."From Entry No." := NextEntryNo + 1;
            InsuranceReg."Creation Date" := Today;
            InsuranceReg."Source Code" := InsuranceJnlLine."Source Code";
            InsuranceReg."Journal Batch Name" := InsuranceJnlLine."Journal Batch Name";
            InsuranceReg."User ID" := UserId;
        end;
        NextEntryNo := NextEntryNo + 1;
        InsCoverageLedgEntry."Entry No." := NextEntryNo;
        InsCoverageLedgEntry."Dimension Set ID" := InsuranceJnlLine."Dimension Set ID";
        InsCoverageLedgEntry."Current Period" := true;
        InsCoverageLedgEntry.Insert;
        if InsuranceReg."To Entry No." = 0 then begin
            InsuranceReg."To Entry No." := NextEntryNo;
            InsuranceReg.Insert;
        end else begin
            InsuranceReg."To Entry No." := NextEntryNo;
            InsuranceReg.Modify;
        end;
    end;
}
