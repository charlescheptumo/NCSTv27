#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55036 myCommittee
{

    elements
    {
        dataitem(Committee_Board_Members; "Committee Board Members")
        {
            column(Committee; Committee)
            {
            }
            column("Code"; "Code")
            {
            }
            column(Names; Names)
            {
            }
            column(Designation; Designation)
            {
            }
            column(Remarks; Remarks)
            {
            }
            column(Role; Role)
            {
            }
            column(Director_No; "Director No")
            {
            }
            dataitem(Board_Committees; "Board Committees")
            {
                DataItemLink = Code = Committee_Board_Members.Committee;
                column(Description; Description)
                {
                }
                column(Comments; Comments)
                {
                }
                column(Status; Status)
                {
                }
            }
        }
    }
}
