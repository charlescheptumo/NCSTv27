#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65017 "Research Output Register Card"
{
    PageType = Card;
    SourceTable = "Research Output Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Research Project Id"; Rec."Research Project Id")
                {
                    ApplicationArea = Basic;
                }
                field("Research Program Id"; Rec."Research Program Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Principle Investigator"; Rec."Principle Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Research Output Category"; Rec."Research Output Category")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output SubCategory"; Rec."Research Output SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output Title"; Rec."Research Output Title")
                {
                    ApplicationArea = Basic;
                }
                field(Abstract; Rec.Abstract)
                {
                    ApplicationArea = Basic;
                }
                group("Comments Info")
                {
                    Caption = 'Comments Info';
                    field(Comments; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Comments';
                        MultiLine = true;

                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
                }
                field("Publication Status"; Rec."Publication Status")
                {
                    ApplicationArea = Basic;
                }
                field("Visibilty Category"; Rec."Visibilty Category")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup18)
            {
                action(Authors)
                {
                    ApplicationArea = Basic;
                    Image = User;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Authorship List";
                    RunPageLink = "Research Output Id" = field(No);
                }
                action("Collaborations/Affiliations")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Collaboration List";
                    RunPageLink = "Research Output ID" = field(No);
                }
                action("Events && Activities")
                {
                    ApplicationArea = Basic;
                    Image = "Event";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Activities List";
                    RunPageLink = "Research Output ID" = field(No);
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription;
    end;

    var
        WorkDescription: Text;
}
