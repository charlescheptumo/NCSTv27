#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69044 "HR Career History"
{
    DataCaptionFields = "Employee No.", "Date Of Event", "Career Event", Department, "Job Title", Pay, "Contract Type";
    // DrillDownPageID = UnknownPage52059;
    //LookupPageID = UnknownPage52059;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            //CC//      TableRelation = Table52000.Field1;

            trigger OnValidate()
            begin
                GetEmployeeInfo;
                OK := Employee.Get("Employee No.");
                if OK then begin
                    "Employee First Name" := Employee."Known As";
                    "Employee Last Name" := Employee."Last Name";
                end;
            end;
        }
        field(2; "Date Of Event"; Date)
        {
        }
        field(3; "Career Event"; Text[60])
        {
        }
        field(4; Office; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    // Employee.Office := Office;
                    Employee.Modify;
                end;
            end;
        }
        field(5; Department; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    // Employee."Department Code":= Department;
                    Employee.Modify;
                end;
            end;
        }
        field(6; "Job Title"; Text[45])
        {
            //CC//   TableRelation = Table52004.Field1;

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Job Title" := "Job Title";
                    Employee.Modify;
                end;
            end;
        }
        field(7; Location; Text[50])
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee.City := Location;
                    Employee.Modify;
                end;
            end;
        }
        field(8; Pay; Decimal)
        {
        }
        field(9; "Full/Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time";

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Full / Part Time" := "Full/Part Time";
                    Employee.Modify;
                end;
            end;
        }
        field(10; "Contract Type"; Code[20])
        {

            trigger OnValidate()
            begin
                //Employee.SETRANGE("No.","Employee No.");
                //OK:= Employee.FIND('-');
                //IF OK THEN BEGIN
                //Employee."Contract Type":= "Contract Type";
                //Employee.MODIFY;
                //END;
            end;
        }
        field(11; Status; Option)
        {
            OptionMembers = Active,Inactive,Terminated;

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee.Status := Status;
                    Employee.Modify;
                end;
            end;
        }
        field(12; "Last Name"; Text[30])
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Last Name" := "Last Name";
                    Employee.Modify;
                end;
            end;
        }
        field(13; Title; Option)
        {
            OptionMembers = Mr,Mrs,Miss,Dr;

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    //Employee.Title:= Title;
                    Employee.Modify;
                end;
            end;
        }
        field(14; Appraisal; Boolean)
        {

            trigger OnValidate()
            begin
                /*
                 AppraisalRec.SETRANGE("Employee No.","Employee No.");
                 OK:= AppraisalRec.FIND('+');
                 IF OK THEN BEGIN
                   AppraisalRec."Appraisal Date":= "Date Of Event";
                   AppraisalRec.MODIFY;
                 END;

  */

            end;
        }
        field(15; "Exit Interview"; Boolean)
        {

            trigger OnValidate()
            begin
                /*
                  ExitRec.SETRANGE("Employee No.","Employee No.");
                  OK:= ExitRec.FIND('+');
                  IF OK THEN BEGIN
                    ExitRec."Date Of Interview":= "Date Of Event";
                    ExitRec.MODIFY;
                  END;
   */

            end;
        }
        field(16; Grievance; Boolean)
        {

            trigger OnValidate()
            begin
                /*GrievanceRec.SETRANGE("Employee No.","Employee No.");
                OK:= GrievanceRec.FIND('+');
                IF OK THEN BEGIN
                  GrievanceRec."Release Date":= "Date Of Event";
                  GrievanceRec.MODIFY;
                END;
                */

            end;
        }
        field(17; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly;
        }
        field(18; "Medical Aid Number"; Text[80])
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    //Employee."Medical Scheme No.":= "Medical Aid Number";
                    Employee.Modify;
                end;
            end;
        }
        field(19; "Vehicle Registration"; Code[10])
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    //Employee."Vehicle Registration Number":= "Vehicle Registration";
                    Employee.Modify;
                end;
            end;
        }
        field(20; "Marital Status"; Option)
        {
            OptionMembers = Single,Married,Separated,Divorced,"Widow(er)",Other;

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Marital Status" := "Marital Status";
                    Employee.Modify;
                end;
            end;
        }
        field(21; Joined; Boolean)
        {

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Employee No.");
                OK := Employee.Find('-');
                if OK then begin
                    Employee."Date Of Join" := "Date Of Event";
                    Employee.Modify;
                end;
            end;
        }
        field(22; "Employee First Name"; Text[30])
        {
        }
        field(23; "Employee Last Name"; Text[30])
        {
        }
        field(24; "Disciplinary Date"; Date)
        {
        }
        field(25; Disciplinary; Boolean)
        {
        }
        field(26; Comment; Boolean)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(27; Reason; Text[100])
        {
        }
        field(28; "Line No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*
           OK:= Employee.GET("Employee No.");
           IF OK THEN BEGIN
            "Employee First Name":= Employee."Known As";
            "Employee Last Name":= Employee."Last Name";
            LinkDocs.Division := 'Correspondance History';
           END;

     */

    end;

    var
        OK: Boolean;
        Employee: Record Employee;


    procedure GetEmployeeInfo()
    begin
        /*
             Employee.SETRANGE("No.","Employee No.");
             OK:= Employee.FIND('-');
             IF OK THEN BEGIN
              IF ("Last Name" = '') THEN
                "Last Name" := 'NO CHANGE';
              IF (Office = '') THEN
                Office := 'NO CHANGE';
              IF (Department = '') THEN
                Department := 'NO CHANGE';
              IF ("Job Title" = '') THEN
                "Job Title" := 'NO CHANGE';
              IF (Location = '') THEN
                 Location := 'NO CHANGE';
              IF (("Full/Part Time" = 0) AND (Employee."Full / Part Time" = 0)) OR ("Full/Part Time" <> Employee."Full / Part Time")
     THEN
                "Full/Part Time":= Employee."Full / Part Time";
              //IF "Contract Type" <> Employee."Contract Type" THEN
                 //"Contract Type":= Employee."Contract Type";
              IF ((Status = 0)  AND (Employee.Status = 0)) OR (Status <> Employee.Status) THEN
                 Status:= Employee.Status;
              IF ((Title = 0) AND (Employee.Title = 0)) OR (Title <> Employee.Title) THEN
                  Title:= Employee.Title;
              IF (("Marital Status" = 0) AND (Employee."Marital Status" = 0)) OR ("Marital Status" <> Employee."Marital Status") THEN
                "Marital Status" := Employee."Marital Status";
              IF ("Medical Aid Number" = '') THEN
                 "Medical Aid Number" := 'NO CHANGE';
              IF ("Vehicle Registration" = '') THEN
                 "Vehicle Registration":= 'NO CHANGE';


              IF (Pay = 0.00) THEN BEGIN
                  PayHistory.SETRANGE("Employee No.","Employee No.");
                  OK:= PayHistory.FIND('+');
                  IF OK THEN BEGIN
                    Pay:= PayHistory.Pay;
                   "Pay Period":= PayHistory."Pay Period";
                  END;
               END;

             END;
        */

    end;
}
