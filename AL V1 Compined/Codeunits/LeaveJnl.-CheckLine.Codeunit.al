#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 69018 "Leave Jnl.-Check Line"
{
    TableNo = "HR Journal Line";

    trigger OnRun()
    begin
        GLSetup.Get;
        RunCheck(Rec);
    end;

    var
        Text000: label 'The combination of dimensions used in %1 %2, %3, %4 is blocked. %5';
        Text001: label 'A dimension used in %1 %2, %3, %4 has caused an error. %5';
        GLSetup: Record "General Ledger Setup";
        FASetup: Record "Human Resources Setup";
        DimMgt: Codeunit DimensionManagement;
        CallNo: Integer;
        LeaveEntries: Record "HR Leave Ledger Entries";


    procedure RunCheck(var InsuranceJnlLine: Record "HR Journal Line")
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        begin

            if InsuranceJnlLine."Leave Entry Type" = InsuranceJnlLine."leave entry type"::Negative then begin
                InsuranceJnlLine.TestField(InsuranceJnlLine."Leave Application No.");
            end;

            if InsuranceJnlLine."Document No." = '' then
                exit;

            InsuranceJnlLine.TestField(InsuranceJnlLine."Document No.");
            InsuranceJnlLine.TestField(InsuranceJnlLine."Posting Date");
            InsuranceJnlLine.TestField(InsuranceJnlLine."Staff No.");


            CallNo := 1;

            if not DimMgt.CheckDimIDComb(InsuranceJnlLine."Dimension Set ID") then
                Error(
                  Text000,
                  InsuranceJnlLine.TableCaption, InsuranceJnlLine."Journal Template Name", InsuranceJnlLine."Journal Batch Name", InsuranceJnlLine."Line No.",
                  DimMgt.GetDimCombErr);

            TableID[1] := Database::"HR Journal Line";
            No[1] := InsuranceJnlLine."Leave Application No.";
            if not DimMgt.CheckDimValuePosting(TableID, No, InsuranceJnlLine."Dimension Set ID") then
                if InsuranceJnlLine."Line No." <> 0 then
                    Error(
                      Text001,
                      InsuranceJnlLine.TableCaption, InsuranceJnlLine."Journal Template Name", InsuranceJnlLine."Journal Batch Name", InsuranceJnlLine."Line No.",
                      DimMgt.GetDimValuePostingErr)
                else
                    Error(DimMgt.GetDimValuePostingErr);
        end;
    end;
}
