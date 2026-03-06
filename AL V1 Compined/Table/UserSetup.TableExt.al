#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50012 tableextension50012 extends "User Setup"
{
    fields
    {
        field(50000; "Membership Approver"; Boolean)
        {
        }
        field(50001; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50002; "Accounts Approver"; Boolean)
        {
        }
        field(50003; Pictures; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(50004; "Unlimited Imprest Amt Approval"; Boolean)
        {
        }
        field(50005; "Imprest Amount Approval Limit"; Decimal)
        {
        }
        field(50006; "Unlimited Store RqAmt Approval"; Boolean)
        {
        }
        field(50007; "Store Req. Amt Approval Limit"; Decimal)
        {
        }
        field(50009; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50010; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50011; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(50012; "Unlimited ImprestSurr Amt Appr"; Boolean)
        {
        }
        field(50013; "ImprestSurr Amt Approval Limit"; Decimal)
        {
        }
        field(50014; "Unlimited Interbank Amt Appr"; Boolean)
        {
        }
        field(50015; "Interbank Amt Approval Limit"; Decimal)
        {
        }
        field(50016; "Imprest Account"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(50017; UserName; Text[30])
        {
        }
        field(50018; Approvername; Text[30])
        {
        }
        field(50019; Approvermail; Text[30])
        {
        }
        field(50020; "Staff No"; Code[50])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                /*IF Staff.GET("Staff No")THEN BEGIN
                UserName:=Staff."First Name"+' '+Staff."Middle Name"+' '+Staff."Last Name";
                "E-Mail":=Staff."Company E-Mail";
                "Global Dimension 1 Code":=Staff."HR Department Name";
                "Job Tittle":=Staff."Job Title";
                END
                */

            end;
        }
        field(50021; "Job Tittle"; Text[100])
        {
        }
        field(50022; "Vote User"; Boolean)
        {
        }
        field(50023; Designation; Text[50])
        {
        }
        field(50024; "Allowed To Auto Reverse"; Boolean)
        {
        }
        field(50025; "User Signature"; Blob)
        {
            SubType = Memo;
        }
        field(50026; "Store Requisitioner"; Boolean)
        {
        }
        field(50027; "PV Amount Approval Limit"; Decimal)
        {
        }
        field(50028; "Unlimited PettyAmount Approval"; Boolean)
        {
        }
        field(50029; "Petty C Amount Approval Limit"; Decimal)
        {
        }
        field(50030; "Unlimited PV Amount Approval"; Boolean)
        {
        }
        field(57000; "Employee No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Get(Rec."Employee No.");
                Rec."Employee Name" := Emp."First Name" + ' ' + Emp."Last Name";
                Rec.Modify;
            end;
        }
        field(57001; Picture; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(57003; "Employee Name"; Text[100])
        {
            Editable = false;
        }
        field(57006; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(59000; "Create New Job"; Boolean)
        {
            Description = '//Restrict Job creation...Ushindi';
        }
        field(59001; "Update Job Status"; Boolean)
        {
            Description = '//Restrict Job modification...Ushindi';
        }
        field(59002; "Resource No"; Code[20])
        {
            Description = '//Link Resource Code Mapping...Ushindi';
            TableRelation = Resource where(Type = filter(Person));
        }
        field(59015; "Payroll View"; Boolean)
        {
        }
        field(59016; "Post Memo"; Boolean)
        {
        }
        field(59017; "post surrender"; Boolean)
        {
        }
        field(59018; "Post Requisition"; Boolean)
        {
        }
        field(59019; "Accounts User"; Boolean)
        {
            Description = 'Restrict documents view';
        }
        field(59020; "Post Receipts"; Boolean)
        {
        }
        field(59021; "Lock Imprests"; Boolean)
        {
        }
        field(59022; "Procurement officer"; Boolean)
        {
        }
        field(59023; Leave; Boolean)
        {
        }
        field(59024; "Reopen Document"; Boolean)
        {
        }
        field(59025; "Process Claims"; Boolean)
        {
        }
        field(59026; Receiptionist; Boolean)
        {
        }
        field(59027; "Procurement Manager"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59028; CIDO; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59029; "Portal User"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59030; "Second Supervisor"; Code[50])
        {
            Caption = 'Second Supervisor';
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnLookup()
            var
                UserSetup: Record "User Setup";
            begin
                UserSetup.SetFilter("User ID", '<>%1', Rec."User ID");
                if Page.RunModal(Page::"Approval User Setup", UserSetup) = Action::LookupOK then
                    Rec.Validate(Rec."Second Supervisor", UserSetup."User ID");
            end;

            trigger OnValidate()
            begin
                if Rec."Second Supervisor" = Rec."User ID" then
                    Rec.FieldError(Rec."Second Supervisor");
            end;
        }
        field(70000; "Cancel Invitation For Supply"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Authorized to Cancel Invitation For Supply)';
        }
        field(70001; "Authorize IFS Creator"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70002; Block; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70003; "ICT Officer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Property Modification (Id) on "UserSetupManagement(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //UserSetupManagement : 1001;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserSetupManagement : 1651;
    //Variable type has not been exported.

    var
        Emp: Record Employee;
}
