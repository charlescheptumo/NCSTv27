#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 50040 "My Meetings"
{

    elements
    {
        dataitem(Vendor; Vendor)
        {
            column(No; "No.")
            {
            }
            dataitem(Committee_Board_Members; "Committee Board Members")
            {
                DataItemLink = "Director No" = Vendor."No.";
                column(Committee; Committee)
                {
                }
                dataitem(Board_Meetings; "Board Meetings")
                {
                    DataItemLink = "Meeting group Code" = Committee_Board_Members.Committee;
                    column(MeetingNo; No)
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
                }
            }
        }
    }
}
