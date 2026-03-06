#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69020 "Employee Rank"
{
    DrillDownPageID = "P9 Self Service";
    LookupPageID = "P9 Self Service";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "CHC Daily Allowance Rate"; Decimal)
        {
        }
        field(50001; Rank; Option)
        {
            OptionCaption = 'GUARD,SITE SUPERVISOR,DRIVER,DOG HANDLER,ADMIN,SECTOR COMMANDER,SENIOR GUARD,PREMIUM GUARD I,PREMIUM GUARD II,FIELD OFFICER,CREW COMMANDER,CREW,BOOK CLERK,DOG MASTER,FIRE CREW,KENNEL ATTENDANT,CONTROLLER,TECHNICIAN,ROAD MARSHALL,B-H TECHNICIAN,B-H ATTENDANT,VSO,SITE MARSHAL,ASSISTANT GFC,GFC';
            OptionMembers = GUARD,"SITE SUPERVISOR",DRIVER,"DOG HANDLER",ADMIN,"SECTOR COMMANDER","SENIOR GUARD","PREMIUM GUARD I","PREMIUM GUARD II","FIELD OFFICER","CREW COMMANDER",CREW,"BOOK CLERK","DOG MASTER","FIRE CREW","KENNEL ATTENDANT",CONTROLLER,TECHNICIAN,"ROAD MARSHALL","B-H TECHNICIAN","B-H ATTENDANT",VSO,"SITE MARSHAL","ASSISTANT GFC",GFC;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
