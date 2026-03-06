#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69275 "Committee Member Card"
{
    SourceTable = "Board Of Directors";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("General Details")
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                }
                field("Other Names"; Rec."Other Names")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport No."; Rec."ID/Passport No.")
                {
                    ApplicationArea = Basic;
                }
                field(Ethnicity; Rec.Ethnicity)
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No"; Rec."Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field("County of Residence"; Rec."County of Residence")
                {
                    ApplicationArea = Basic;
                    Caption = 'Country of Residence';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                }
                field("Area of Expertise"; Rec."Area of Expertise")
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Disability; Rec.Disability)
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Category"; Rec."Appointment Category")
                {
                    ApplicationArea = Basic;
                }
                field("Nominating Body"; Rec."Nominating Body")
                {
                    ApplicationArea = Basic;
                }
                field("Appointing Body"; Rec."Appointing Body")
                {
                    ApplicationArea = Basic;
                }
                field("Gazzette Notice No."; Rec."Gazzette Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Term Expiry Date"; Rec."Term Expiry Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
