#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56062 "ICT Issuance Voucher Lines"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Issuance Voucher"."No.";
        }
        field(2; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Movement)) "ICT Inventory".Code
            else if (Type = const(Issuance),
                                     "Leasing/Issuing" = const(Issuing)) "ICT Inventory".Code where(Status = filter(<> Issued),
                                                                                                   "Leasing/Issuing" = filter(Issuing))
            else if (Type = const(Issuance),
                                                                                                            "Leasing/Issuing" = const(Leasing)) "ICT Inventory".Code where(Status = filter(<> Leased),
                                                                                                                                                                          Status = filter(<> Issued),
                                                                                                                                                                          "Leasing/Issuing" = filter(Leasing));

            trigger OnValidate()
            begin
                ICTInventory.Reset;
                ICTInventory.SetRange(Code, Code);
                if ICTInventory.FindSet then begin
                    Description := ICTInventory.Description;
                    "Serial No." := ICTInventory."Serial No.";
                    "FA No" := ICTInventory."Sub Type No.";
                    "Current Assigned Employee" := ICTInventory."Current Assigned Employee";
                    "Dpt Current Assigned" := ICTInventory."Current Assigned Division/Unit";

                end;
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Serial No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Duration of Use start date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //MESSAGE('Staing');
                ICTIssuanceEntries.Reset;
                ICTIssuanceEntries.SetRange(ICTIssuanceEntries.Code, Code);
                //ICTIssuanceEntries.SETFILTER("Duration of Use start date",'= %1..%2',ICTIssuanceEntries."Duration of Use start date",ICTIssuanceEntries."Duration of Use end date");
                if ICTIssuanceEntries.FindSet then begin
                    if ("Duration of Use start date" <= ICTIssuanceEntries."Duration of Use end date") and ("Duration of Use start date" >= ICTIssuanceEntries."Duration of Use start date") then begin
                        Error('Error!! There exist a reservation for the item on this date');
                    end;
                end;
            end;
        }
        field(6; "Duration of Use end date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ICTIssuanceEntries.Reset;
                ICTIssuanceEntries.SetRange(ICTIssuanceEntries.Code, Code);
                //ICTIssuanceEntries.SETFILTER("Duration of Use end date",'= %1..%2',ICTIssuanceEntries."Duration of Use start date",ICTIssuanceEntries."Duration of Use end date");
                if ICTIssuanceEntries.FindSet then begin
                    if ("Duration of Use end date" <= ICTIssuanceEntries."Duration of Use end date") and ("Duration of Use end date" >= ICTIssuanceEntries."Duration of Use start date") then begin
                        Error('Error!! There exist a reservation for the item on this date');
                    end;
                end;
                //startday:=DT2DATE("Duration of Use start date");
                //endday:=DT2DATE("Duration of Use end date");
                //"Duration of Use":="Duration of Use end date"-"Duration of Use start date";
            end;
        }
        field(7; "Duration of Use"; DateFormula)
        {
            DataClassification = ToBeClassified;
            Enabled = false;
        }
        field(8; "FA No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";
        }
        field(9; "Reason For Movement"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Issuance,Movement';
            OptionMembers = Issuance,Movement;
        }
        field(11; "Dpt Current Assigned"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Dpt Current Assigned");
                if Employee.FindSet then begin
                    "Current Assigned Employee" := Employee."First Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(12; "Current Assigned Employee"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Comment; Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Leasing/Issuing"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Leasing, Issuing';
            OptionMembers = Leasing,Issuing;
        }
        field(15; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.", Type, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTInventory: Record "ICT Inventory";
        Employee: Record Employee;
        ICTIssuanceEntries: Record "ICT Issuance Entries";
        startday: Integer;
        endday: Date;
}
