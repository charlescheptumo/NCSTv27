#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50015 tableextension50015 extends "General Ledger Setup"
{
    fields
    {
        field(50146; "Bank Balances"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Bank Account Ledger Entry"."Amount (LCY)" where("Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                "Posting Date" = field("Date Filter")));
            Caption = 'Bank Balances';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50147; "Pending L.O.P"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Amount (LCY)" where("Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                                "Expected Receipt Date" = field("Date Filter"),
                                                                                Amount = filter(<> 0),
                                                                                "Document Type" = filter(<> Quote)));
            FieldClass = FlowField;
        }
        field(50148; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(59002; "Service Nos."; Code[10])
        {
            Caption = 'Service Nos.';
            TableRelation = "No. Series";
        }
        field(59003; "File Movement Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(59004; "DMS Link"; Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(59005; "File Creation Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }


    //Unsupported feature: Code Modification on "RoundingErrorCheck(PROCEDURE 2)".

    //procedure RoundingErrorCheck();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ErrorMessage := FALSE;
    IF GLEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
    IF ItemLedgerEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
    IF JobLedgEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
    IF ResLedgEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
    IF FALedgerEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
    IF MaintenanceLedgerEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
    IF InsCoverageLedgerEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
    IF ErrorMessage THEN
      ERROR(
        Text018,
        NameOfField);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     ErrorMessage := FALSE;
     IF GLEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
     IF ItemLedgerEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
     IF JobLedgEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
     IF ResLedgEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
     IF FALedgerEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
     IF MaintenanceLedgerEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
     IF InsCoverageLedgerEntry.FINDFIRST THEN
      ErrorMessage := TRUE;
     IF ErrorMessage THEN
    #17..19

    */
    //end;
}
