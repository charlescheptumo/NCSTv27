#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 56011 "FA Dep Lines"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("FA Depreciation Book"; "FA Depreciation Book")
            {
                XmlName = 'FADEPLINES';
                fieldelement(FANo; "FA Depreciation Book"."FA No.")
                {
                }
                fieldelement(DepBook; "FA Depreciation Book"."Depreciation Book Code")
                {
                }
                fieldelement(FAPostGrp; "FA Depreciation Book"."FA Posting Group")
                {
                }
                fieldelement(DepMeth; "FA Depreciation Book"."Depreciation Method")
                {
                }
                fieldelement(DepStartDate; "FA Depreciation Book"."Depreciation Starting Date")
                {
                }
                fieldelement(NoOfYears; "FA Depreciation Book"."No. of Depreciation Years")
                {
                }
                fieldelement(Percent; "FA Depreciation Book"."Straight-Line %")
                {
                }

                trigger OnAfterInsertRecord()
                begin

                    "FA Depreciation Book".Validate("FA Depreciation Book"."FA No.");
                    "FA Depreciation Book".Validate("FA Depreciation Book"."Depreciation Book Code");
                    "FA Depreciation Book".Validate("FA Depreciation Book"."FA Posting Group");
                    "FA Depreciation Book".Validate("FA Depreciation Book"."Depreciation Method");
                    "FA Depreciation Book".Validate("FA Depreciation Book"."Depreciation Starting Date");
                    "FA Depreciation Book".Validate("FA Depreciation Book"."No. of Depreciation Years");
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
