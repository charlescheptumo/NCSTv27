#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55040 blogReplies
{

    elements
    {
        dataitem(Blog_Replies; Blog_Replies)
        {
            column(Entry_Id; "Entry Id")
            {
            }
            column(Blog_Reply; "Blog Reply")
            {
            }
            column(Replier_Name; "Replier Name")
            {
            }
            column(Replier_DirNo; "Replier DirNo")
            {
            }
            column(Date_Replied; "Date Replied")
            {
            }
            column(Time_Replied; "Time Replied")
            {
            }
            column(BlogIdCode; BlogIdCode)
            {
            }
            dataitem(Board_Blog; Board_Blog)
            {
                DataItemLink = Blog_Id = Blog_Replies.BlogIdCode;
                column(Blog_Body; "Blog Body")
                {
                }
                column(Blog_Title; "Blog Title")
                {
                }
                column(Blog_Id; Blog_Id)
                {
                }
            }
        }
    }
}
