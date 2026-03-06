#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50049 tableextension50049 extends "Purchase Cue"
{
    fields
    {
        field(111; "Registry Files Assigned"; Integer)
        {
            CalcFormula = count("File Receiving Header" where("Assigned To" = field("User ID Filter"),
                                                               Status = const(Assigned)));
            FieldClass = FlowField;
        }
        field(57000; "Approved PRNs"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Purchase Requisition"),
                                                         Status = filter(Released)));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                /*IF UserSetup.GET(USERID) THEN BEGIN
                IF UserSetup."Procurement Manager"=FALSE THEN BEGIN
                IF UserSetup."Procurement officer" =FALSE THEN BEGIN
                  SETRANGE("User ID Filter",USERID);
                SETRANGE("User ID Filter",USERID);END ELSE BEGIN
                FILTERGROUP(2);
                SETRANGE("User ID Filter",USERID);
                FILTERGROUP(0)
                  END;
                END;
                END;
                //SetSecurityFilterOnRespCenter;
                
                */
                if UserSetup.Get(UserId) then begin
                    if (UserSetup."Procurement Manager" = false) and (UserSetup."Procurement officer" = false) then
                        Rec.SetRange(Rec."User ID Filter", UserId);
                end;

                if UserSetup.Get(UserId) then begin
                    if UserSetup."Procurement officer" = true then
                        Rec.SetRange(Rec."User ID Filter", UserId);
                end;


                //SetSecurityFilterOnRespCenter;

                //JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

            end;
        }
        field(57001; "Pending PRNs"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Purchase Requisition"),
                                                         Status = filter("Pending Approval")));
            FieldClass = FlowField;
        }
        field(57003; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
        field(57004; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
        }
        field(57005; "Open PRNS"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Purchase Requisition"),
                                                         Status = filter(Open)));
            FieldClass = FlowField;
        }
        field(57006; "Open S11"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Open)));
            FieldClass = FlowField;
        }
        field(57007; "Pending S11"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Open | "Pending Approval")));
            FieldClass = FlowField;
        }
        field(57008; "Approved S11"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Released)));
            FieldClass = FlowField;
        }
        field(57009; "Issued S11"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Store Requisition"),
                                                         Status = filter(Released),
                                                         "Fully Issued" = const(true)));
            FieldClass = FlowField;
        }
        field(57010; "Archived PRNs"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter("Purchase Requisition"),
                                                         Status = filter("In Progress")));
            FieldClass = FlowField;
        }
        field(57011; "Approved POs"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter(Order),
                                                         Status = filter(Released)));
            FieldClass = FlowField;
        }
    }


    //Unsupported feature: Code Insertion on "OnInsert".

    //trigger OnInsert()
    //begin
    /*
    IF UserSetup.GET(USERID) THEN BEGIN
    IF UserSetup."Procurement Manager"=FALSE THEN BEGIN
    IF UserSetup."Procurement officer" =FALSE THEN BEGIN
      SETRANGE("User ID Filter",USERID);
    SETRANGE("User ID Filter",USERID);END ELSE BEGIN
    FILTERGROUP(2);
    SETRANGE("User ID Filter",USERID);
    FILTERGROUP(0)
      END;
    END;
    END;
    */
    //end;

    var
        UserSetup: Record "User Setup";
}
