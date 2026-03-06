#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 80000 "Export Work Plan Lines"
{
    Caption = 'Export Work Plan Lines';
    Direction = Export;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("Strategy Workplan Lines"; "Strategy Workplan Lines")
            {
                AutoUpdate = true;
                XmlName = 'workplanLines';
                fieldelement(No; "Strategy Workplan Lines".No)
                {
                }
                fieldelement(Strategy; "Strategy Workplan Lines"."Strategy Plan ID")
                {
                }
                fieldelement(Activity; "Strategy Workplan Lines"."Activity ID")
                {
                }
                fieldelement(Targets; "Strategy Workplan Lines"."Imported Annual Target Qty")
                {
                }
                fieldelement(Budgets; "Strategy Workplan Lines"."Imported Annual Budget Est.")
                {
                }
                fieldelement(Directorate; "Strategy Workplan Lines"."Primary Directorate")
                {
                }
                fieldelement(Department; "Strategy Workplan Lines"."Primary Department")
                {
                }
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
        I: Integer;
}
