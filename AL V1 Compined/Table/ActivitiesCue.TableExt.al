#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50037 tableextension50037 extends "Activities Cue"
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Outstanding Vendor Invoices"(Field 31)".

        field(111; "Registry Files Assigned"; Integer)
        {
            CalcFormula = count("File Receiving Header" where//("Assigned To" = const(userId)),
                                                              (Status = const(Assigned)));
            FieldClass = FlowField;

            trigger OnValidate()
            var
                user: Code[50];
            begin
                user := userId();
            end;


        }
    }





}
