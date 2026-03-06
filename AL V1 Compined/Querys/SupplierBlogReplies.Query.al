#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 55049 SupplierBlogReplies
{

    elements
    {
        dataitem(BlogVendors_Replies; BlogVendors_Replies)
        {
            column(Entry_Id; "Entry Id")
            {
            }
            column(BlogIdCode; BlogIdCode)
            {
            }
            column(Blog_Reply; "Blog Reply")
            {
            }
            column(Replier_Name; "Replier Name")
            {
            }
            column(Replier_VendorNo; "Replier VendorNo")
            {
            }
            column(Date_Replied; "Date Replied")
            {
            }
            column(Time_Replied; "Time Replied")
            {
            }
            dataitem(Blog_Vendors; Blog_Vendors)
            {
                DataItemLink = Blog_Id = BlogVendors_Replies.BlogIdCode;
                column(Blog_Title; "Blog Title")
                {
                }
                column(Blog_Body; "Blog Body")
                {
                }
            }
        }
    }
}
