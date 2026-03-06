#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50048 tableextension50048 extends "Finance Cue"
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Outstanding Vendor Invoices"(Field 33)".

        field(111; "Registry Files Assigned"; Integer)
        {
            CalcFormula = count("File Receiving Header" where//("Assigned To" = field("User ID Filter"),
                                                              (Status = const(Assigned)));
            FieldClass = FlowField;
        }
        field(50001; "Posted Payment Vouchers"; Integer)
        {
            AccessByPermission = TableData Payments = R;
            CalcFormula = count(Payments where("Payment Type" = const("Payment Voucher"),
                                                Posted = const(TRUE)));
            FieldClass = FlowField;
        }
        field(50002; "Approved Payment Vouchers"; Integer)
        {
            CalcFormula = count(Payments where("Payment Type" = const("Payment Voucher"),
                                                Status = const(Released)));
            FieldClass = FlowField;
        }
        field(50003; "Pending Payment Vouchers"; Integer)
        {
            CalcFormula = count(Payments where("Payment Type" = const("Payment Voucher"),
                                                Status = const("Pending Approval")));
            FieldClass = FlowField;
        }
        field(50004; "Approved Surrenders"; Integer)
        {
            CalcFormula = count(Payments where("Payment Type" = const(Surrender),
                                                Status = const(Released),
                                                Posted = const(FALSE)));
            FieldClass = FlowField;
        }
        field(50005; "pending Surrenders"; Integer)
        {
            CalcFormula = count(Payments where("Payment Type" = const(Surrender),
                                                Status = const("Pending Approval")));
            FieldClass = FlowField;
        }
        field(50006; "Posted Surrenders"; Integer)
        {
            CalcFormula = count(Payments where("Payment Type" = const(Surrender),
                                                Posted = const(TRUE)));
            FieldClass = FlowField;
        }
        field(50007; "Customer with balance"; Integer)
        {
            CalcFormula = count(Customer where(Balance = filter(<> 0)));
            FieldClass = FlowField;
        }
        field(50008; "Vendors with Balance"; Integer)
        {
            CalcFormula = count(Vendor where(Balance = filter(<> 0)));
            FieldClass = FlowField;
        }
        field(50009; "Pending Fin Copyright Works"; Integer)
        {
            CalcFormula = count("Copyright Registration Table" where(Invoiced = const(false),
                                                                      Status = const(Pending)));
            FieldClass = FlowField;
        }
    }
}
