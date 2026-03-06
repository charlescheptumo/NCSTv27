#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50047 tableextension50047 extends "Sales Cue"
{
    fields
    {
        field(111; "Registry Files Assigned"; Integer)
        {
            CalcFormula = count("File Receiving Header" where("Assigned To" = field("User ID Filter"),
                                                               Status = const(Assigned)));
            FieldClass = FlowField;
        }
    }
}
