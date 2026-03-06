#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55002 Meetings
{

    elements
    {
        dataitem(Board_Meetings; "Board Meetings")
        {
            DataItemTableFilter = Status = filter(Upcoming);
            column(No; No)
            {
            }
            column(Title; Title)
            {
            }
            column(Start_date; "Start date")
            {
            }
            column(Start_time; "Start time")
            {
            }
            column(End_Date; "End Date")
            {
            }
            column(End_time; "End time")
            {
            }
            column(Venue_Location; "Venue/Location")
            {
            }
            column(Convened_by; "Convened by")
            {
            }
            column(Contact_Tel_No; "Contact Tel. No")
            {
            }
            column(Contact_Email; "Contact Email")
            {
            }
            column(Description; Description)
            {
            }
            column(Status; Status)
            {
            }
            column(Published; Published)
            {
            }
            column(Meeting_group_Code; "Meeting group Code")
            {
            }
            column(Meeting_group; "Meeting group")
            {
            }
            column(Conference_Venue; "Conference Venue")
            {
            }
            column(Parking_Arrangement; "Parking Arrangement")
            {
            }
            column(Access_requirement; "Access requirement")
            {
            }
        }
    }
}
