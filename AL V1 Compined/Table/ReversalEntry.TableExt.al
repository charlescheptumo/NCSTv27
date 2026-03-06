#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50024 tableextension50024 extends "Reversal Entry"
{

    //Unsupported feature: Code Modification on "CheckFAPostingDate(PROCEDURE 24)".

    //procedure CheckFAPostingDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (AllowPostingFrom = 0D) AND (AllowPostingto = 0D) THEN BEGIN
      IF USERID <> '' THEN
        IF UserSetup.GET(USERID) THEN BEGIN
    #4..9
        AllowPostingto := FASetup."Allow FA Posting To";
      END;
      IF AllowPostingto = 0D THEN
        AllowPostingto := 99983112D;
    END;
    IF (FAPostingDate < AllowPostingFrom) OR (FAPostingDate > AllowPostingto) THEN
      ERROR(Text005,Caption,EntryNo,FALedgEntry.FIELDCAPTION("FA Posting Date"));
    IF FAPostingDate > MaxPostingDate THEN
      MaxPostingDate := FAPostingDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
        AllowPostingto := 99981231D;
    #14..18
    */
    //end;
}
