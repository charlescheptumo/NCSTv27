#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50003 "Import Items-old"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Xml;

    schema
    {
        textelement(Root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                AutoReplace = false;
                AutoUpdate = true;
                XmlName = 'Item';
                fieldelement(t; "Gen. Journal Line"."Journal Template Name")
                {
                }
                fieldelement(b; "Gen. Journal Line"."Journal Batch Name")
                {
                }
                fieldelement(PD; "Gen. Journal Line"."Posting Date")
                {
                }
                fieldelement(Description; "Gen. Journal Line"."Document No.")
                {
                }
                fieldelement(BUM; "Gen. Journal Line"."External Document No.")
                {
                }
                fieldelement(SearchDescription; "Gen. Journal Line"."Account Type")
                {
                }
                fieldelement(InventoryPostingGroup; "Gen. Journal Line"."Account No.")
                {
                }
                fieldelement(GenProductPostingGroup; "Gen. Journal Line".Description)
                {
                }
                fieldelement(cr; "Gen. Journal Line"."Credit Amount")
                {
                }
                fieldelement(VATProductPostingGroup; "Gen. Journal Line".Amount)
                {
                }
                fieldelement(LN; "Gen. Journal Line"."Line No.")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    /*  Item.VALIDATE(Item."No.");
                      Item.VALIDATE(Item.Description);

                   UNIT.INIT;
                   UNIT."Item No.":=Item."No.";
                   UNIT.Code:=Item."Base Unit of Measure";
                   UNIT.VALIDATE(UNIT.Code);
                   UNIT."Qty. per Unit of Measure":=1;
                   UNIT.INSERT;

                      Item.VALIDATE(Item."Gen. Prod. Posting Group");
                      Item.VALIDATE(Item."Inventory Posting Group");
                      Item.VALIDATE(Item."VAT Prod. Posting Group");
                      */

                end;

                trigger OnBeforeModifyRecord()
                begin
                    /* Item.VALIDATE(Item."No.");
                     Item.VALIDATE(Item.Description);

                  UNIT.INIT;
                  UNIT."Item No.":=Item."No.";
                  UNIT.Code:=Item."Base Unit of Measure";
                  UNIT.VALIDATE(UNIT.Code);
                  UNIT."Qty. per Unit of Measure":=1;
                  UNIT.INSERT;

                     Item.VALIDATE(Item."Item Category Code");
                     Item.VALIDATE(Item."Product Group Code");
                     Item.VALIDATE(Item."Inventory Posting Group");
                     Item.VALIDATE(Item."VAT Prod. Posting Group");
                     Item.VALIDATE(Item."Gen. Prod. Posting Group");
                     Item.VALIDATE(Item."Costing Method");
                    //  Item.VALIDATE(Item."Sales Unit of Measure");
                     //  Item.VALIDATE(Item."Purch. Unit of Measure");

                     */

                end;
            }

            trigger OnAfterAssignVariable()
            begin
                /* Item.VALIDATE(Item."No.");
                  Item.VALIDATE(Item.Description);

               UNIT.INIT;
               UNIT."Item No.":=Item."No.";
               UNIT.Code:=Item."Base Unit of Measure";
               UNIT.VALIDATE(UNIT.Code);
               UNIT."Qty. per Unit of Measure":=1;
               UNIT.INSERT;

                  Item.VALIDATE(Item."Gen. Prod. Posting Group");
                  Item.VALIDATE(Item."Inventory Posting Group");
                  Item.VALIDATE(Item."VAT Prod. Posting Group");
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

    var
        UNIT: Record "Item Unit of Measure";
}
