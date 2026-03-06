#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 70000 "Import Req Lines"
{
    Format = VariableText;

    schema
    {
        textelement(Requisitions)
        {
            tableelement("Requisition Lines1"; "Requisition Lines1")
            {
                XmlName = 'ReqLines';
                fieldelement(Type; "Requisition Lines1".Type)
                {
                }
                fieldelement(No; "Requisition Lines1".No)
                {
                }
                fieldelement(Description; "Requisition Lines1".Description)
                {
                }
                fieldelement(Quantity; "Requisition Lines1".Quantity)
                {
                }
                fieldelement(UnitOfM; "Requisition Lines1"."Unit of Measure")
                {
                }
                fieldelement(UnitPrice; "Requisition Lines1"."Unit Cost")
                {
                }
                fieldelement(Amount; "Requisition Lines1".Amount)
                {
                }
                fieldelement(CostCentre; "Requisition Lines1"."Cost Centre Code")
                {
                }
                fieldelement(FnCode; "Requisition Lines1"."FN Code")
                {
                }
                fieldelement(FSCCode; "Requisition Lines1"."FSC Code")
                {
                }

                trigger OnBeforeInsertRecord()
                begin
                    "Requisition Lines1"."Requisition No" := ReqNo;
                    "Requisition Lines1"."Line No" := LineNo;
                    LineNo := LineNo + 1000;
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

    trigger OnPreXmlPort()
    begin
        LineNo := 10000;
    end;

    var
        ReqNo: Code[10];
        LineNo: Integer;


    procedure GetRec(var Req: Record "Requisition Header1")
    begin
        ReqNo := Req."No.";
    end;
}
