#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50008 "Update Purchase Header"
{
    Format = VariableText;
    TransactionType = Update;

    schema
    {
        textelement(Root)
        {
            tableelement("Purchase Header"; "Purchase Header")
            {
                AutoSave = false;
                AutoUpdate = true;
                XmlName = 'PurchaseHeader';
                fieldelement(No; "Purchase Header"."No.")
                {
                }
                fieldelement(DocType; "Purchase Header"."Document Type")
                {
                }
                fieldelement(Department; "Purchase Header"."Shortcut Dimension 1 Code")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    //"Purchase Header".VALIDATE("Purchase Header"."Shortcut Dimension 1 Code","Purchase Header"."Location Code");
                end;

                trigger OnAfterModifyRecord()
                begin
                    "Purchase Header".Validate("Purchase Header"."Shortcut Dimension 1 Code", "Purchase Header"."Location Code");
                end;
            }
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
}
