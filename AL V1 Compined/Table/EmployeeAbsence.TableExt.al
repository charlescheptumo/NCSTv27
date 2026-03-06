#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50042 tableextension50042 extends "Employee Absence"
{
    fields
    {

        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        HumanResUnitOfMeasure.GET("Unit of Measure Code");
        "Qty. per Unit of Measure" := HumanResUnitOfMeasure."Qty. per Unit of Measure";
        VALIDATE(Quantity);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {HumanResUnitOfMeasure.GET("Unit of Measure Code");
        "Qty. per Unit of Measure" := HumanResUnitOfMeasure."Qty. per Unit of Measure";
        VALIDATE(Quantity);}
        */
        //end;
        field(50000; "Branch/Project"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = filter(= 'BRANCH'));
        }
        field(50001; "Customer No."; Code[10])
        {
            Editable = true;
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                //TESTFIELD("Cause of Absence Code");
                if Rec."Customer No." = '' then begin
                    Rec.Checked := false;
                    Rec."Contract No." := '';
                    Rec.Validate(Rec."Contract No.");

                end;

                Rec."Contract No." := '';
                Rec.Validate(Rec."Contract No.");

                if Rec."Customer No." <> '' then begin

                    if ((Rec."Cause of Absence Code" = 'O') or (Rec."Cause of Absence Code" = 'AB') or (Rec."Cause of Absence Code" = 'L') or (Rec."Cause of Absence Code" = 'M')
                    or (Rec."Cause of Absence Code" = 'P') or (Rec."Cause of Absence Code" = 'SB') or (Rec."Cause of Absence Code" = 'S') or (Rec."Cause of Absence Code" = 'SC')
                    or (Rec."Cause of Absence Code" = 'T') or (Rec."Cause of Absence Code" = 'SUP') or (Rec."Cause of Absence Code" = 'IND') or (Rec."Cause of Absence Code" = 'U')
                    or (Rec."Cause of Absence Code" = 'SBNO'))
                    then
                        Error('THE STATUS CODE DOES NOT ALLOW POST ALLOCATION.PLEASE CHECK!!');

                end;

                if Cust.Get(Rec."Customer No.") then begin
                    Rec."Customer Name" := Cust.Name;
                    //Customer:=Cust."No.";
                end else begin
                    Rec."Customer Name" := '';
                    Rec."Customer No." := '';
                end;
            end;
        }
        field(50002; "Contract No."; Code[10])
        {
            TableRelation = if (Locked = const(false)) "Service Contract Header"."Contract No." where("Contract Group Code" = filter('GDS' | 'DOG' | 'APH' | 'APG' | 'SUP' | 'TAL' | 'UCV' | 'DRV' | 'MRT' | 'RECP' | 'ART' | 'FRT'),
                                                                                                     "Customer No." = field("Customer No."))
            else if (Locked = const(true)) "Service Contract Header"."Contract No." where("Contract Group Code" = filter('GDS' | 'DOG' | 'APH' | 'APG' | 'SUP' | 'TAL' | 'UCV' | 'DRV' | 'MRT' | 'RECP' | 'ART' | 'FRT'),
                                                                                                                                                                                  "Customer No." = field("Customer No."));

            trigger OnValidate()
            begin
                /*
                 "Contract description":='';

               //IF "Contract No."='' THEN
               Checked:=FALSE;

               TESTFIELD("Registration Date");
               IF Contract.GET(Contract."Contract Type"::Contract,"Contract No.")THEN BEGIN
               Contract.CALCFIELDS("Service Description");
               IF "Registration Date"<Contract."Starting Date" THEN BEGIN
               ERROR('THE CONRACT HAS NOT COMMENCED.PLEASE CHECK!!');
                "Contract No.":='';
                 "Contract description":='';

               END;

               IF "Contract No."<>'' THEN BEGIN
               IF Contract."Expiration Date"<>0D THEN BEGIN
               IF "Registration Date">Contract."Expiration Date" THEN BEGIN
               ERROR('THE CONRACT HAS EXPIRED.PLEASE CHECK!!');
                "Contract No.":='';
                 "Contract description":='';

               END;
               END;
               END;
                Contract.CALCFIELDS(Contract.Quantity);
                NoOfGuards:=Contract.Quantity;
                //MESSAGE('%1',NoOfGuards);

               IF "Entry Type"="Entry Type"::Actual THEN BEGIN
               EmployeeAbsence.RESET;
               EmployeeAbsence.SETRANGE(EmployeeAbsence."Entry Type",EmployeeAbsence."Entry Type"::Actual);
               EmployeeAbsence.SETRANGE(EmployeeAbsence."Registration Date","Registration Date");
               EmployeeAbsence.SETRANGE(EmployeeAbsence."Contract No.","Contract No.");

               IF EmployeeAbsence.COUNT>=NoOfGuards THEN BEGIN
               ERROR('YOU HAVE EXCEEDED THE MAXIMUM NO. OF GUARDS IN THIS CONTRACT.PLEASE CHECK!!');
                "Contract No.":='';
                 "Contract description":='';
               END;
               END;

               IF "Entry Type"="Entry Type"::Schedule THEN BEGIN
               EmployeeAbsence.RESET;
               EmployeeAbsence.SETRANGE(EmployeeAbsence."Entry Type",EmployeeAbsence."Entry Type"::Schedule);
               EmployeeAbsence.SETRANGE(EmployeeAbsence."Registration Date","Registration Date");
               EmployeeAbsence.SETRANGE(EmployeeAbsence."Contract No.","Contract No.");

               IF EmployeeAbsence.COUNT>=NoOfGuards THEN BEGIN
               ERROR('YOU HAVE EXCEEDED THE MAXIMUM NO. OF GUARDS IN THIS CONTRACT.PLEASE CHECK!!');
                "Contract No.":='';
                 "Contract description":='';

               END;
               END;

               "Contract description":=Contract."Service Description";

               END ELSE BEGIN
               "Contract description":='';

               END;

               //Contract.CALCFIELDS("Service Description");
               IF "Contract description"='' THEN BEGIN
               "Contract No.":='';
               //MODIFY;
               END;
               {
               IF Cust.GET(Contract."Customer No.") THEN BEGIN
               "Customer Name":=Cust.Name;
               Customer:=Cust."No.";
               END ELSE BEGIN
               "Customer Name":='';
               Customer:='';
               END;
               }

               */

            end;
        }
        field(50003; Shift; Option)
        {
            OptionCaption = ' ,DAY,NIGHT';
            OptionMembers = " ",DAY,NIGHT;
        }
        field(50004; "Created by"; Code[10])
        {
            //  TableRelation = Table2000000002;
        }
        field(50005; Locked; Boolean)
        {
        }
        field(50006; "Locked by"; Code[10])
        {
            // TableRelation = Table2000000002;
        }
        field(50007; "Locking Date"; Date)
        {
        }
        field(50008; "Locking Time"; Time)
        {
        }
        field(50009; "Creation Date"; Date)
        {
        }
        field(50010; "Creation Time"; Time)
        {
        }
        field(50011; "Entry Type"; Option)
        {
            OptionCaption = ' ,Schedule,Actual';
            OptionMembers = " ",Schedule,Actual;
        }
        field(50012; "Employee Name"; Text[200])
        {
            Editable = false;
        }
        field(50013; "Customer Name"; Text[200])
        {
            Editable = false;
        }
        field(50014; Standby; Boolean)
        {

            trigger OnValidate()
            begin

                if Rec.Releiver = true then
                    Error('You have indicated this entry as RELEIVER.Please check!!');
                if Rec."Contract No." <> '' then
                    Error('You cannot link standby to a contract.Please check!!');
                if Rec."Cause of Absence Code" <> 'SB' then
                    Error('Wrong status code.Please check!!');
            end;
        }
        field(50015; Releiver; Boolean)
        {

            trigger OnValidate()
            begin
                if Rec.Standby = true then
                    Error('You have indicated this entry as STANDBY.Please check!!');
            end;
        }
        field(50016; "Last Modified By"; Code[10])
        {
            Editable = false;
            //  TableRelation = Table2000000002;
        }
        field(50017; "Last Modification Date"; Date)
        {
            Editable = false;
        }
        field(50018; "Last Modification Time"; Time)
        {
            Editable = false;
        }
        field(50019; Checked; Boolean)
        {

            trigger OnValidate()
            begin
                /*
                 "Checked By":=USERID;
                
                  TESTFIELD("Cause of Absence Code");
                   TESTFIELD(Shift);
                
                
                IF "Cause of Absence Code"='IC' THEN
                ERROR('YOU CANNOT CHECK INCOMPLETE ENTRIES.PLEASE CHECK!!');
                
                
                
                IF "Registration Date">TODAY THEN
                
                ERROR('YOU CANNOT CHECK ENTRIES FOR A DATE GREATER THAN TODAY.PLEASE CHECK!!');
                
                //Check Mandatory fields
                IF ( ("Cause of Absence Code"='RN') OR ("Cause of Absence Code"='RD')
                OR ("Cause of Absence Code"='N') OR ("Cause of Absence Code"='D')
                OR ("Cause of Absence Code"='PO'))
                THEN BEGIN
                
                TESTFIELD("Branch/Project");
                TESTFIELD("Customer No.");
                TESTFIELD("Contract No.");
                TESTFIELD(Shift);
                
                
                IF "Contract No."<>'' THEN BEGIN
                 IF "Contract description"='' THEN
                
                ERROR('INVALID ENTRY.PLEASE CHECK!!');
                END;
                
                IF Contract.GET(Contract."Contract Type"::Contract,"Contract No.")THEN BEGIN
                
                IF Contract."Customer No."<>"Customer No." THEN
                ERROR('The customer number you have selected does not match the customer number in the contract.Please check!!');
                END;
                
                IF Contract."Expiration Date"<>0D THEN BEGIN
                IF "Registration Date">Contract."Expiration Date" THEN
                ERROR('The contract has expired.Please check!!');
                END;
                
                Contract.CALCFIELDS(Quantity);
                Contract.SETFILTER(Contract."Date Filter",'=%1',"Registration Date");
                Contract.CALCFIELDS(Deployment);
                //MESSAGE('%1',Contract.Quantity);
                //MESSAGE('%1',Contract.Deployment);
                IF Contract.Deployment>Contract.Quantity THEN
                ERROR('You have exceeded the maximum allowed for this contract.Please check!!');
                
                
                END;
                
                
                //RELIEVER EXCEPTION.
                IF ( ("Cause of Absence Code"='SB') OR ("Cause of Absence Code"='L')
                OR ("Cause of Absence Code"='AB') OR ("Cause of Absence Code"='S')
                OR ("Cause of Absence Code"='SC') OR ("Cause of Absence Code"='O')
                OR ("Cause of Absence Code"='M') OR ("Cause of Absence Code"='T')
                OR ("Cause of Absence Code"='P') OR ("Cause of Absence Code"='UL')
                OR ("Cause of Absence Code"='IND')OR ("Cause of Absence Code"='U')
                OR ("Cause of Absence Code"='SBNO')  )  THEN BEGIN
                TESTFIELD("Branch/Project");
                TESTFIELD(Shift);
                END;
                
                */

            end;
        }
        field(50020; "Checked By"; Code[10])
        {
            Editable = false;
            //  TableRelation = Table2000000002;
        }
        field(50021; "Contract description"; Text[250])
        {
            Editable = false;
        }
        field(50022; "Pay Point"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = filter(= 'PAYPOINT'));
        }
        field(50023; Rank; Option)
        {
            OptionCaption = 'GUARD,SITE SUPERVISOR,DRIVER,DOG HANDLER,ADMIN,FIELD OFFICER,SENIOR GUARD,PREMIUM GUARD I,PREMIUM GUARD II,RIDER SUPERVISOR,CREW COMMANDER,CREW,BOOK CLERK,DOG MASTER,FIRE CREW,KENNEL ATTENDANT,CONTROLLER';
            OptionMembers = GUARD,"SITE SUPERVISOR",DRIVER,"DOG HANDLER",ADMIN,"FIELD OFFICER","SENIOR GUARD","PREMIUM GUARD I","PREMIUM GUARD II","RIDER SUPERVISOR","CREW COMMANDER",CREW,"BOOK CLERK","DOG MASTER","FIRE CREW","KENNEL ATTENDANT",CONTROLLER;
        }
        field(50024; "Staffing Group"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = filter(= 'STAFFINGGRP'));
        }
        field(50025; "Contract Type"; Option)
        {
            CalcFormula = lookup("Service Contract Header"."Invoice Period" where("Contract No." = field("Contract No.")));
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Month,Two Months,Quarter,Half Year,Nine Months,Year,Temporary,F.O.C,Off Contract Billing';
            OptionMembers = Month,"Two Months",Quarter,"Half Year","Nine Months",Year,"Temporary","F.O.C","Off Contract Billing";
        }
        field(50026; "Extra Coverage Hrs"; Decimal)
        {
        }
    }

    var
        Cust: Record Customer;
        NoOfGuards: Decimal;
        PayPeriods: Record "Payroll PeriodX";
}
