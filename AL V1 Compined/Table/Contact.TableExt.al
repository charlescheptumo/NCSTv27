#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50038 tableextension50038 extends Contact
{
    fields
    {
        field(50100; password; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50101; "KRA PIN"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Tax Compliance Certificate No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50103; "Director 1 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50104; "Director 2 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Director 3 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50106; Group; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Group".Code;
        }
        field(50107; "Sub-Group"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Sub-Group".Code where("Stakeholder Group" = field(Group));
        }
        field(50108; "Parent Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(50109; "Entity Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Organization,Individual';
            OptionMembers = Organization,Individual;
        }
        field(50110; UserVerified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "ID Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Portal Request"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "onboarded Year"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
    }

    //Unsupported feature: Variable Insertion (Variable: PortalUSer) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: RandomDigit) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: Procurement) (VariableCollection) on "CreateVendor(PROCEDURE 7)".


    //Unsupported feature: Variable Insertion (Variable: entryno) (VariableCollection) on "CreateVendor(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "CreateVendor(PROCEDURE 7)".

    //procedure CreateVendor();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckForExistingRelationships(ContBusRel."Link to Table"::Vendor);
    CheckIfPrivacyBlockedGeneric;
    TESTFIELD("Company No.");
    RMSetup.GET;
    RMSetup.TESTFIELD("Bus. Rel. Code for Vendors");

    #7..24

    UpdateCustVendBank.UpdateVendor(ContComp,ContBusRel);

    IF OfficeMgt.IsAvailable THEN
      PAGE.RUN(PAGE::"Vendor Card",Vend)
    ELSE
      IF NOT HideValidationDialog THEN
        MESSAGE(RelatedRecordIsCreatedMsg,Vend.TABLECAPTION);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    TESTFIELD("onboarded Year");
    #4..27
    // Update Dynasoft Portal user
    PortalUSer.RESET;
    IF PortalUSer.FINDLAST THEN
      entryno:=PortalUSer."Entry No";
    PortalUSer.RESET;
    PortalUSer.SETRANGE("User Name","E-Mail");
    IF NOT PortalUSer.FINDSET THEN BEGIN
      PortalUSer.INIT;
      PortalUSer."Entry No":=entryno+1;
      PortalUSer."User Name":="E-Mail";
      PortalUSer."Full Name":=Name;
      PortalUSer."Authentication Email":="E-Mail";
      PortalUSer."Mobile Phone No.":="Phone No.";
      PortalUSer.State:=PortalUSer.State::Enabled;
      PortalUSer."Record Type":=PortalUSer."Record Type"::Vendor;
      PortalUSer."Record ID":=Vend."No.";

    RandomDigit := CREATEGUID;
    RandomDigit := DELCHR(RandomDigit,'=','{}-01');
    RandomDigit := COPYSTR(RandomDigit,1,8);
    //MESSAGE(RandomDigit);
      PortalUSer."Password Value":=RandomDigit;
      PortalUSer.INSERT;
     Procurement.FnSendEmaiNotificationOnSupplierAccountActivation(Rec);
      END;

    #28..32
    */
    //end;
}
