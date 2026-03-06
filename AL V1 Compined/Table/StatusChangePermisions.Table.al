#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59016 "Status Change Permisions"
{
    // DrillDownPageID = UnknownPage39004327;
    //LookupPageID = UnknownPage39004327;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            NotBlank = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.LookupUserID("User ID");
            end;

            trigger OnValidate()
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.ValidateUserID("User ID");
            end;
        }
        field(2; "Function"; Option)
        {
            NotBlank = false;
            OptionCaption = 'Account Status,Standing Order,Discounting Cheque,Inter Teller Approval,Discounting Loan,Fosa Loan Appraisal,Discounting Shares,Discounting Dividends,Loan External EFT,Overide Defaulters,BOSA Account Status,Fosa Loan Approval,PV Approval,PV Verify,PV Cancel,ATM Approval,Petty Cash Approval,Bosa Loan Approval,Bosa Loan Appraisal,Atm card ready,Audit Approval,Finance Approval,Replace Guarantors,Account Opening,Mpesa Change,Edit,NameEdit,Stop Cheque,Reverse Entries,Charge Statement,BBFview,LimitChange,Loan Variation,Replace Guarantors-BOSA,Super Permission,Disable ATM';
            OptionMembers = "Account Status","Standing Order","Discounting Cheque","Inter Teller Approval","Discounting Loan","Fosa Loan Appraisal","Discounting Shares","Discounting Dividends","Loan External EFT","Overide Defaulters","BOSA Account Status","Fosa Loan Approval","PV Approval","PV Verify","PV Cancel","ATM Approval","Petty Cash Approval","Bosa Loan Approval","Bosa Loan Appraisal","Atm card ready","Audit Approval","Finance Approval","Replace Guarantors","Account Opening","Mpesa Change",Edit,NameEdit,"Stop Cheque","Reverse Entries","Charge Statement",BBFview,LimitChange,"Loan Variation","Replace Guarantors-BOSA","Super Permission","Disable ATM";
        }
    }

    keys
    {
        key(Key1; "Function", "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin

        /*StatusPermissions.RESET;
        StatusPermissions.SETRANGE(StatusPermissions."User ID",USERID);
        StatusPermissions.SETRANGE(StatusPermissions."Function",StatusPermissions."Function"::"Super Permission");
        IF StatusPermissions.FIND('-') = FALSE THEN
        ERROR(Text001);*/

    end;

    var
        UserMgt: Codeunit "User Setup Management";
        Text001: label 'You do not have permissions to change or edit this page.Please contact administrator';
}
