#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70003 "Fiscal Year Categories"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Procurement Category Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Fiscal Year"; Rec."Fiscal Year")
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                }
                field("No of Prequalified Suppliers"; Rec."No of Prequalified Suppliers")
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
            group("Pre-Qualified Suppliers")
            {
                Caption = 'Pre-Qualified Suppliers';
                action(List)
                {
                    ApplicationArea = Basic;
                    Caption = 'List';
                    RunObject = Page "Pre Qualified Suppliers";
                    RunPageLink = "Fiscal Year" = field("Fiscal Year"),
                                  Category = field(Category);
                }
                action("Generate Prequalification")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin

                        Prequalification.RunModal;
                        Clear(Prequalification);
                    end;
                }
                action("Copy Prequalified Suppliers")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin

                        PrequalifiedSuppliers.RunModal;
                        Clear(PrequalifiedSuppliers);
                    end;
                }
                action("Load Prequlified Suppliers")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    var
                        Vend: Record Vendor;
                    begin
                        Vend.Reset;
                        Vend.SetFilter("Supplier Category", '<>%1', '');
                        if Vend.FindSet then begin
                            repeat
                                //TESTFIELD("Company PIN No");
                                //MESSAGE('Test %1',vend."No.");
                                Prequalifiedlist.Reset;
                                Prequalifiedlist.SetRange("Vendor No", Vend."No.");
                                Prequalifiedlist.SetRange(Category, Vend."Supplier Category");
                                Prequalifiedlist.SetRange("Fiscal Year", '2020/2021');
                                Prequalifiedlist.SetRange(Name, Vend.Name);
                                if Prequalifiedlist.FindSet = false then begin

                                    /*Vendor.RESET;
                                    Vendor.SETRANGE("PIN Number",Prequalifiedlist."Company PIN No");
                                    IF Vendor.FINDSET THEN
                                      ERROR('The supplier %1 has already been created',Vendor."No.");*/

                                    Prequalifiedlist.Init;
                                    Prequalifiedlist."Fiscal Year" := '2020/2021';
                                    Prequalifiedlist."Vendor No" := Vend."No.";
                                    Prequalifiedlist.Name := Vend.Name;
                                    Prequalifiedlist."Physical Address" := Vend.Address;
                                    Prequalifiedlist."Postal Address" := Vend."Address 2";
                                    Prequalifiedlist."E-mail" := Vend."E-Mail";
                                    Prequalifiedlist."Telephone No" := Vend."Phone No.";
                                    Prequalifiedlist."Mobile No" := Vend."Telex No.";
                                    Prequalifiedlist."Contact Person" := Vend.Contact;
                                    Prequalifiedlist."KBA Bank Code" := Vend."KBA Code";
                                    Prequalifiedlist."KBA Branch Code" := Vend."KBA Branch Code";
                                    Prequalifiedlist."Bank account No" := Vend."Our Account No.";
                                    Prequalifiedlist."Vendor Type" := Vend."Vendor Type";
                                    Prequalifiedlist."VAT Registration No" := Vend."VAT Registration No.";
                                    Prequalifiedlist."Maximum Order Amount" := Vend."Maximum Order Amount";
                                    Prequalifiedlist."Minimum Order Amount" := Vend."Minimum Order Amount";
                                    Prequalifiedlist."Maximum Order Quantity" := Vend."Maximum Order Quantity";
                                    Prequalifiedlist."Minimum Order Quantity" := Vend."Minimum Order Quantity";
                                    Prequalifiedlist."Company PIN No" := Vend."PIN Number";
                                    Prequalifiedlist.Category := Vend."Supplier Category";
                                    Prequalifiedlist."Pre Qualified" := true;
                                    //MESSAGE('Test %1',vend."No.");
                                    /*IF CategoryRec.GET(Prequalifiedlist.Category) THEN
                                    BEGIN
                                    Vend."Gen. Bus. Posting Group":=CategoryRec."Gen. Bus. Posting Group";
                                    Vend."VAT Bus. Posting Group":=CategoryRec."VAT Bus. Posting Group";
                                    Vend."Vendor Posting Group":=CategoryRec."Vendor Posting Group";
                                    END;*/
                                    Prequalifiedlist.Insert(true);

                                end;
                            until Vend.Next = 0;
                        end;
                        /*
                        Prequalifiedlist."Vendor No":=Vend."No.";
                        Prequalifiedlist.MODIFY;
                        MESSAGE('Supplier %1 has been created succesfully',Vend."No.")*/

                    end;
                }
            }
        }
    }

    var
        Prequalification: Report "Prequalification Category";
        PrequalifiedSuppliers: Report "Purchase Requisition Report";
        Prequalifiedlist: Record "Prequalified Suppliers1";
}
