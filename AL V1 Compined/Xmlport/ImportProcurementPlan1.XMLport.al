#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 70003 "Import Procurement Plan1"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Procurement Plan Entry"; "Procurement Plan Entry")
            {
                XmlName = 'ProcurementPlan';
                fieldelement(Plan; "Procurement Plan Entry"."Procurement Plan ID")
                {
                }
                fieldelement(PlanningCategory; "Procurement Plan Entry"."Planning Category")
                {
                }
                fieldelement(ResponsibilityCenter; "Procurement Plan Entry".Region)
                {
                }
                fieldelement(ProcurementType; "Procurement Plan Entry"."Procurement Type")
                {
                }
                fieldelement(Solicitationtype; "Procurement Plan Entry"."Solicitation Type")
                {
                }
                fieldelement(ProcurementMethod; "Procurement Plan Entry"."Procurement Method")
                {
                }
                fieldelement(FundingSource; "Procurement Plan Entry"."Funding Source ID")
                {
                }
                fieldelement(Quantity; "Procurement Plan Entry".Quantity)
                {
                }
                fieldelement(UnitCost; "Procurement Plan Entry"."Unit Cost")
                {
                }
                fieldelement(preferenceReservation; "Procurement Plan Entry"."Preference/Reservation Code")
                {
                }
                fieldelement(Directorate; "Procurement Plan Entry".Directorate)
                {
                }
                fieldelement(Department; "Procurement Plan Entry".Department)
                {
                }
                fieldelement(Constituency; "Procurement Plan Entry".Constituency)
                {
                }
                fieldelement(Road; "Procurement Plan Entry"."Road No.")
                {
                }

                trigger OnAfterInsertRecord()
                begin



                    PPEntry.Reset;
                    PPEntry.SetRange("Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                    if PPEntry.FindSet then begin
                        repeat
                            ProcurementPlanLines.Reset;
                            ProcurementPlanLines.SetRange("Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                            ProcurementPlanLines.SetRange("Planning Category", "Procurement Plan Entry"."Planning Category");
                            if not ProcurementPlanLines.FindSet then begin
                                ProcurementPlanLines.Init;
                                ProcurementPlanLines.Validate(ProcurementPlanLines."Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                                ProcurementPlanLines."PP Line No" := LineNo + 1;
                                ProcurementPlanLines.Validate("Planning Category", "Procurement Plan Entry"."Planning Category");
                                ProcurementPlanLines.Validate("Procurement Type", "Procurement Plan Entry"."Procurement Type");
                                ProcurementPlanLines.Validate("Solicitation Type", "Procurement Plan Entry"."Solicitation Type");
                                ProcurementPlanLines.Validate("Procurement Method", "Procurement Plan Entry"."Procurement Method");
                                ProcurementPlanLines.Validate("Primary Source of Funds", "Procurement Plan Entry"."Funding Source ID");
                                ProcurementPlanLines.Insert(true);
                                LineNo += 1;
                            end;
                        until PPEntry.Next = 0;
                    end;

                end;
            }

            trigger OnAfterAssignVariable()
            begin
                ProcurementPlanLines.Reset;
                if ProcurementPlanLines.FindLast then
                    LineNo := ProcurementPlanLines."PP Line No" + 1;
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

    trigger OnPostXmlPort()
    begin
        Message('Procurement Plan Imported Successfully');
    end;

    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        PPEntry: Record "Procurement Plan Entry";
        PPActivity: Record "Procurement Activity Code";
        PPPlanActivity: Record "PP Purchase Activity Schedule";
        LineNo: Integer;
}
