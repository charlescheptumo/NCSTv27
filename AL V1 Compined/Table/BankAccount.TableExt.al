#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50026 tableextension50026 extends "Bank Account"
{
    fields
    {
        field(50000; Test; Code[30])
        {
        }
        field(57000; Type; Option)
        {
            OptionCaption = 'Bank,Petty Cash,Float';
            OptionMembers = Bank,"Petty Cash",Float;
        }
        field(57001; "Bank Type"; Option)
        {
            OptionMembers = Normal,Cash,"Fixed Deposit",SMPA,"Chq Collection";

            trigger OnValidate()
            begin

                //TestNoEntriesExist(FIELDCAPTION("Bank Type"));
            end;
        }
        field(57002; "Pending Voucher Amount"; Decimal)
        {
        }
        field(57003; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';

            trigger OnValidate()
            begin
                /*
                IF NOT UserMgt.CheckRespCenter(1,"Responsibility Center") THEN
                  ERROR(
                    Text005,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);
                
                */

            end;
        }
        field(57004; "Bank Branch Name"; Text[250])
        {
        }
        field(57005; "Cheque Numbers"; Code[20])
        {
            TableRelation = "No. Series";
        }
    }
}
