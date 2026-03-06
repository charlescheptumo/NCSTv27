#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69504 "Opportunity card."
{
    PageType = Card;
    SourceTable = "Lead Management";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Dates)
            {
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Next Action Date"; Rec."Next Action Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Attempted"; Rec."Last Date Attempted")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Last Interaction"; Rec."Date of Last Interaction")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Opportunity details")
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Lost Reasons"; Rec."Lost Reasons")
                {
                    ApplicationArea = Basic;
                }
                field("Company No."; Rec."Company No.")
                {
                    ApplicationArea = Basic;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("External ID"; Rec."External ID")
                {
                    ApplicationArea = Basic;
                }
                field("Duration (Min.)"; Rec."Duration (Min.)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Opportunities"; Rec."No. of Opportunities")
                {
                    ApplicationArea = Basic;
                }
                field(status; Rec.status)
                {
                    ApplicationArea = Basic;
                }
                field("Lead Type"; Rec."Lead Type")
                {
                    ApplicationArea = Basic;
                }
                field("member no"; Rec."member no")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Detailed Member Page")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = New;
            }
            action("Create Opportunity")
            {
                ApplicationArea = Basic;
                Image = ChangeTo;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Type = Rec.Type::Person then begin
                        ok := Confirm('Create an lead  for ' + Rec."First Name" + Rec.Surname + '.The inquiry will be given a new lead Number. Continue?');
                        if ok then begin
                            //Create Invest Account
                            if OppSetup.Get then begin
                                OppSetup.TestField(OppSetup."Customer App Nos");
                                OppNo := NoSeriesMgt.GetNextNo(OppSetup."Customer App Nos", 0D, true);
                                if OppNo <> '' then begin
                                    /*membApp.INIT;
                                        membApp."No.":="No.";
                                        //membApp."First member name":="First Name";
                                        membApp.Name:=Name;
                                        membApp.Address:=Address;
                                        membApp."ID No.":="ID No";
                                        membApp."Customer Posting Group":='MEMBER';
                                        //membApp."Customer Type":=membApp."Customer Type"::Member;
                                        membApp.City:=City;
                                        membApp."Recruited By":=USERID;
                                        membApp."Registration Date":=TODAY;
                                        membApp."Mobile Phone No":="Phone No.";
                                        membApp.INSERT(TRUE);
                                        Converted:=TRUE;
                                        MODIFY;*/
                                    Message('opportunity members successfully generated');
                                end;
                            end;
                        end;
                    end;
                    if Rec.Type = Rec.Type::Company then begin
                        /*employer.INIT;
                        employer.Code:="Company No.";
                        employer.Description:="Company Name";
                        employer."Join Date":=TODAY;
                        employer.INSERT(TRUE);
                        Converted:=TRUE;
                        MODIFY;*/
                        Message('opportunity organizations successfully generated');
                    end;
                    // LOAN FORM

                end;
            }
        }
    }

    var
        CustCare: Record "General Equiries.";
        CQuery: Record "General Equiries.";
        LeadM: Record "Lead Management";
        entry: Integer;
        vend: Record Vendor;
        CASEM: Record "Cases Management";
        ok: Boolean;
        OppSetup: Record "Crm General Setup.";
        OppNo: Code[10];
        NoSeriesMgt: Codeunit "No. Series";
}
