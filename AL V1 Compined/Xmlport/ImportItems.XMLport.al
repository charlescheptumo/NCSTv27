#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50002 "Import Items"
{
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Xml;

    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                AutoReplace = false;
                AutoUpdate = true;
                XmlName = 'Item';
                fieldelement(No; Item."No.")
                {
                }
                fieldelement(Category; Item."Item Category Code")
                {
                }
                fieldelement(GenProd; Item."Gen. Prod. Posting Group")
                {
                }
                fieldelement(InvPG; Item."Inventory Posting Group")
                {
                }

                trigger OnAfterInsertRecord()
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
                     */

                    //Ushindi......30th June 2019
                    Item.Validate(Item."No.");
                    Item.Validate(Item."Item Category Code");
                    Item.Validate(Item."Gen. Prod. Posting Group");
                    Item.Validate(Item."Inventory Posting Group");

                    /*
                      Item.VALIDATE(Item."Reordering Policy");
                       Item.VALIDATE(Item."Reorder Point");
                        Item.VALIDATE(Item."Reorder Quantity");
                         Item.VALIDATE(Item."Time Bucket");
                          */
                    Item.Validate(Item."Inventory Posting Group");
                    Item.Validate(Item."VAT Prod. Posting Group");
                    Item.Validate(Item."Gen. Prod. Posting Group");
                    Item.Validate(Item."Costing Method");
                    //  Item.VALIDATE(Item."Sales Unit of Measure");
                    //  Item.VALIDATE(Item."Purch. Unit of Measure");

                end;

                trigger OnBeforeModifyRecord()
                begin
                    /*Item.VALIDATE(Item."No.");
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
                    //Ushindi......30th June 2019
                    Item.Validate(Item."No.");
                    Item.Validate(Item."Item Category Code");
                    Item.Validate(Item."Gen. Prod. Posting Group");
                    Item.Validate(Item."Inventory Posting Group");

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

    var
        UNIT: Record "Item Unit of Measure";
}
