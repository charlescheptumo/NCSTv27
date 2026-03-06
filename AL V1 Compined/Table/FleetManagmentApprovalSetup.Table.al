#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59007 "Fleet Managment Approval Setup"
{

    fields
    {
        field(1; UserID; Code[20])
        {
            TableRelation = User;
        }
        field(2; "Fleet Management Area"; Option)
        {
            OptionMembers = " ","Vehicle Management",TransportReq,DailyWorksheet,FuelReq,MaintenanceReq;
        }
        field(3; Create; Boolean)
        {
        }
        field(4; "Line Manager Approver"; Boolean)
        {
        }
        field(5; "Transport Mger Approver"; Boolean)
        {
        }
        field(6; "View Only Department"; Boolean)
        {
        }
        field(7; "User Department"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
