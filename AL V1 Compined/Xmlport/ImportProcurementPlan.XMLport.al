#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50020 "Import Procurement Plan"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Procurement Plan"; "Procurement Plan 1")
            {
                XmlName = 'ProcurementPlan';
                fieldelement(PlanYear; "Procurement Plan"."Plan Year")
                {
                }
                fieldelement(PlanItemNo; "Procurement Plan"."Plan Item No")
                {
                }
                fieldelement(Dept; "Procurement Plan"."Department Code")
                {
                }
                fieldelement(ProcurementType; "Procurement Plan"."Procurement Type")
                {
                }
                fieldelement(Quantity; "Procurement Plan".Quantity)
                {
                }
                fieldelement(UnitPrice; "Procurement Plan"."Unit Cost")
                {
                }
                fieldelement(FundingSource; "Procurement Plan"."Funding Source Code")
                {
                }
                fieldelement(Marginofpreference; "Procurement Plan"."Margin of preference for Local")
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
}
