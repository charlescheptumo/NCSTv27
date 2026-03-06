#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50014 ECommerce
{

    // trigger OnRun()
    // var
    //     fileName: Text;
    // begin
    //     //MESSAGE(FORMAT(FnUpdateCart(296, 10.00)))
    //     //GetItemImage('BOOK004112')
    //     //fnShowpass('CUST5534');
    //     //getCustomerStatement('CUST5534',20181008D,20191012D);
    //     //fnCustomerStateReport('CUST5534','custstatementTest.pdf','08/10/18..12/10/18')
    //     //fnBLOBCustomerStatement('CUST5534',20180810D,20181210D);
    //     //MESSAGE(FORMAT(getCustomerStatement('CUST5534',20180810D,20181210D)));
    //     Message(Format(FnUpdateCartWIP('172_17_21_193', 'CUST5534')));
    //     //MESSAGE(FORMAT(resetPassword('kevinnzioka@dynasoft.co.ke', '1111','1111', '1111')))

    //     //ForgotWEmailPassword('kevinnzioka@dynasoft.co.ke');
    //     //ForgotPassword('CUST5534');
    // end;

    // var
    //     Customer: Record Customer;
    //     SMTPMail: Codeunit "SMTP Mail";
    //     SMTPMailSetup: Record "SMTP Mail Setup";
    //     ECommerceUsers: Record HRPortalUsers;
    //     Cart: Record UnknownRecord56902;
    //     Item: Record Item;
    //     SalesHeader: Record "Sales Header";
    //     SalesLine: Record "Sales Line";
    //     objCustomer: Record Customer;
    //     SalesLineDiscount: Record "Sales Line Discount";
    //     Wishlist: Record "Hr Jobs Applicants";
    //     SalesInvoiceHeader: Record "Sales Invoice Header";
    //     SalesHeader1: Record "Sales Header";
    //     FILESPATH: label '\\LHP-NAV-TEST\Downloads\';
    //     WarehouseShipmentLine: Record "Warehouse Shipment Line";
    //     WarehouseShipmentHeader: Record "Warehouse Shipment Header";
    //     SalesShipmentHeader: Record "Sales Shipment Header";
    //     IMAGEPATH: label '\\LHP-NAV-TEST\images_optimized\ ';
    //     testpath: label 'C:\ServiceTest\downloadtest\';


    // procedure GetItemImage(ItemNo: Code[50]) photo: Text
    // begin
    //     //photo:= 'avatar.png';
    //     Item.Reset;
    //     Item.SetRange(Item."No.", ItemNo);
    //     if Item.Find('-') then begin
    //         Item.Picture.ExportFile(IMAGEPATH + ItemNo + '.jpg');
    //         if FILE.Exists(IMAGEPATH + ItemNo + '-1.jpg') then
    //             photo := ItemNo + '-1.jpg';
    //         Message(Format(photo));
    //     end
    //     else begin
    //         photo := 'noimage.jpg';
    //         Message(Format(photo));
    //     end;
    //     exit(photo);
    // end;


    // procedure AddToCart(CustomerNo: Code[50]; ProductId: Code[50]; Quantity: Decimal; IPAddress: Text; CookieID: Text) status: Text
    // begin
    //     if Item.Get(ProductId) then begin
    //         Cart.Reset;
    //         Cart.SetRange(CustomerNo, CustomerNo);
    //         Cart.SetRange("Product Id", ProductId);
    //         if Cart.FindSet then begin
    //             Cart.Quantity := Cart.Quantity + Quantity;
    //             Cart."Unit Price" := Item."Unit Price";
    //             Cart.PercentageDiscount := getCartDiscount(Cart);
    //             if Cart.Modify(true) then begin
    //                 status := 'success*The item was successfully added to your cart';
    //             end else begin
    //                 status := 'danger*The item could not be added to your cart';
    //             end;
    //         end else begin
    //             Cart.Init;
    //             Cart.CustomerNo := CustomerNo;
    //             Cart.Quantity := Quantity;
    //             Cart."Product Id" := ProductId;
    //             Cart."Unit Price" := Item."Unit Price";
    //             Cart.PercentageDiscount := getCartDiscount(Cart);
    //             Cart.CookieId := CookieID;
    //             Cart."IP Address" := IPAddress;
    //             if Cart.Insert(true) then begin
    //                 status := 'success*The item was successfully added to your cart';
    //             end else begin
    //                 status := 'danger*The item could not be added to your cart';
    //             end;
    //         end;
    //     end else begin
    //         status := 'danger*The selected product does not exist';
    //     end;
    // end;


    // procedure CheckOut(CustomerNo: Code[50]) status: Text
    // var
    //     body: Text;
    //     fileName: Text;
    //     orderCount: Integer;
    //     orderNo: Code[50];
    // begin
    //     orderCount := 0;
    //     if Customer.Get(CustomerNo) then begin
    //         Cart.Reset;
    //         Cart.SetRange(CustomerNo, CustomerNo);
    //         if Cart.FindSet then begin
    //             repeat
    //                 if orderCount = 0 then begin
    //                     orderNo := createSalesOrder(CustomerNo);
    //                 end;
    //                 orderCount := orderCount + 1;
    //                 if orderCount = 20 then
    //                     orderCount := 0;
    //                 SalesLine.Init;
    //                 SalesLine."Document Type" := SalesLine."document type"::Order;
    //                 SalesLine."Document No." := orderNo;
    //                 SalesLine.Validate("Document No.");
    //                 SalesLine."Line No." := Cart.id;
    //                 SalesLine.Type := SalesLine.Type::Item;
    //                 SalesLine."No." := Cart."Product Id";
    //                 SalesLine.Validate("No.");
    //                 SalesLine.Quantity := Cart.Quantity;
    //                 SalesLine.Validate(Quantity);
    //                 SalesLine."From the Portal" := true;
    //                 if SalesLine.Insert(true) then
    //                     Cart.Delete(true);
    //             //Cart.MODIFY;
    //             until Cart.Next = 0;
    //             status := 'success*Your order was successfully created. Please check your email for your order confirmation';
    //         end else begin
    //             status := 'danger*You order could not be created';
    //         end;
    //     end else begin
    //         status := 'danger*The customer account does not exist';
    //     end;
    // end;


    // procedure CreateCustomerAccount(customerNumber: Code[50]; emailAddress: Text; password: Text) status: Text
    // var
    //     error: Boolean;
    //     emailBody: Text;
    // begin
    //     if Customer.Get(customerNumber) then begin
    //         if ECommerceUsers.Get(emailAddress) then begin
    //             status := 'danger*Seems you already have an account. Please use the forgot password link';
    //         end else begin
    //             //get email
    //             if Customer."E-Mail" <> '' then begin
    //                 //add User to users
    //                 ECommerceUsers.Init;
    //                 ECommerceUsers.customerNo := customerNumber;
    //                 //ECommerceUsers."ID No":= Customer.Id;
    //                 ECommerceUsers.Password := password;// FORMAT(password);
    //                 ECommerceUsers.EMail := Customer."E-Mail";
    //                 ECommerceUsers.Name := Customer.Name;
    //                 if ECommerceUsers.Insert(true) then begin
    //                     //send customer email
    //                     emailBody := 'Dear ' + Customer.Name + ', <br/> Thank you for creating an account with Longhorm publishers.Your one time password is <strong>' + Format(password) + '</strong>.Kindly Reset the Password on Login<BR>' +
    //                                 'Click the following link to acess the' + ' ' + '<b><a href="https://customer.longhornpublishers.com/">Longhorn Portal</a></b><BR>'
    //                                 + '<BR>';
    //                     sendEmail(Customer."E-Mail", 'PORTAL ACCOUNT CREATION', emailBody);
    //                     status := 'success*You account was successfully created. Please use the password sent via your email to log in';
    //                 end else begin
    //                     status := 'danger*Your account could not be created';
    //                 end;
    //             end else begin
    //                 status := 'danger*Your account does not have a valid email address. Please contact Longhorn Publishers PLC to update your details';
    //             end;
    //         end;
    //     end else begin
    //         status := 'danger*A user account with the given customer number does not exist';
    //     end;
    // end;

    // local procedure sendEmail(emailAddress: Text; subject: Text; body: Text)
    // begin
    //     SMTPMailSetup.Get;
    //     SMTPMailSetup.Get;
    //     SMTPMail.CreateMessage('Longhorn Publishers PLC', SMTPMailSetup."User ID", emailAddress, subject, body, true);
    //     SMTPMail.Send
    // end;


    // procedure resetPassword(email: Text; currentPassword: Text; newPassword: Text; confirmPassword: Text) status: Text
    // var
    //     emailBody: Text;
    //     password: Integer;
    //     changedate: Text;
    // begin
    //     //ensure customer exists
    //     Customer.Reset;
    //     Customer.SetRange("E-Mail", email);
    //     if Customer.FindSet() then begin
    //         ECommerceUsers.Reset;
    //         ECommerceUsers.SetRange(EMail, email);
    //         if ECommerceUsers.FindSet() then begin
    //             if ECommerceUsers.Password = currentPassword then begin
    //                 if newPassword = confirmPassword then begin
    //                     if StrLen(newPassword) < 4 then begin
    //                         status := 'danger*The new password is too short. Minimum characters are four (4)';
    //                     end else begin
    //                         ECommerceUsers.Password := newPassword;
    //                         ECommerceUsers."Changed Password" := true;
    //                         ECommerceUsers.EMail := Customer."E-Mail";
    //                         ECommerceUsers.Name := Customer.Name;
    //                         ECommerceUsers.CreatedDate := Format(CurrentDatetime);
    //                         changedate := Format(ECommerceUsers.CreatedDate);
    //                         if ECommerceUsers.Modify(true) then begin
    //                             //send customer email
    //                             emailBody := 'Dear ' + Customer.Name + ', <br/>Your password was successfully changed on' + '   ' + '<strong>' + ECommerceUsers.CreatedDate + '</strong>.Your new password is <strong>' + ECommerceUsers.Password + '</strong>.<BR>' +
    //                                  'Click the following link to acess the' + ' ' + '<b><a href="https://customer.longhornpublishers.com/">Longhorn Portal</a></b><BR>'
    //                                  + '<BR>';
    //                             sendEmail(Customer."E-Mail", 'ACCOUNT PASSWORD', emailBody);

    //                             status := 'success*Your pasword was successfully updated.';
    //                         end else begin
    //                             status := 'danger*Your password could not be updated. Please try again';
    //                         end;
    //                     end;
    //                 end else begin
    //                     status := 'danger*New password does not match confirm new password';
    //                 end;
    //             end else begin
    //                 status := 'danger*The current password you have entered is wrong';
    //             end;
    //         end else begin
    //             status := 'danger*An account for the chosen customer does not exist. Kindly use the signup link';
    //         end;
    //     end else begin
    //         status := 'danger*The specified customer does not exist';
    //     end;
    // end;


    // procedure getCustomerStatement(customerNo: Code[20]; DateForm: Date; DateTo: Date) status: Text
    // begin
    //     Customer.Reset;
    //     Customer.SetRange("No.", customerNo);
    //     if Customer.FindSet() then begin
    //         objCustomer.SetFilter("Date Filter", Format(DateForm) + '..' + Format(DateTo));
    //         if Exists(FILESPATH + customerNo + '.pdf') then begin
    //             Erase(FILESPATH + customerNo + '.pdf');
    //         end;
    //         //Report.SaveAsPdf(50053, FILESPATH + customerNo + '.pdf', objCustomer);
    //         status := FILESPATH;//'success*Downloads\'+customerNo+'.pdf';
    //     end else begin
    //         status := 'danger*The customer does not exist';
    //     end;
    // end;


    // procedure removeFromCart(customerNumber: Code[50]; CartId: Integer) status: Text
    // begin
    //     Cart.Reset;
    //     Cart.SetRange(id, CartId);
    //     Cart.SetRange(CustomerNo, customerNumber);
    //     if Cart.FindSet then begin
    //         if Cart.Delete(true) then begin
    //             status := 'success*Item removed from cart!';
    //         end else begin
    //             status := 'danger*Error occured while deleting!';
    //         end
    //     end else begin
    //         status := 'danger*Item not found!';
    //     end
    // end;


    // procedure addToWishList(productId: Code[20]; customerNo: Code[20]) status: Text
    // begin
    //     status := 'danger*The product could not be added to the wishlist';
    //     if Item.Get(productId) then begin
    //         Wishlist.Reset;
    //         Wishlist.SetRange(CustomerNo, customerNo);
    //         Wishlist.SetRange("Product Id", productId);
    //         if Wishlist.FindSet then begin
    //             status := 'danger*The item already exists in your wishlist';

    //         end else begin
    //             Wishlist.Init;
    //             Wishlist.CustomerNo := customerNo;

    //             Wishlist."Product Id" := productId;
    //             if Wishlist.Insert(true) then begin
    //                 status := 'success*The item was successfully added to your wishlist';
    //             end else begin
    //                 status := 'danger*The item could not be added to your wishlist';
    //             end;
    //         end;

    //     end else begin
    //         status := 'danger*The selected product does not exist';
    //     end;
    // end;


    // procedure requestHelp(customerNo: Code[20]; subject: Text; message: Text; customerName: Text; customerEmail: Text; customerPhone: Text) status: Text
    // var
    //     messageToSend: Text;
    // begin
    //     Customer.Reset;
    //     Customer.SetRange("No.", customerNo);
    //     if Customer.FindSet then begin

    //         messageToSend := Customer.Name + ', Email ' + Customer."E-Mail" + ' has sent the following message: <br/>' + message + '<br/>. Additional: <br/>Name: <strong>' + customerName + '</strong><br/>Email: <strong>' + customerEmail;//
    //         messageToSend := messageToSend + '</strong><br/>Phone Number: <strong>' + customerPhone + '</strong><br/>';
    //         sendEmail('customercare@longhornpublishers.com', subject, messageToSend);
    //     end;
    //     status := 'success*Your email has been received. We shall get back to you.Thank you.';
    // end;

    // local procedure getCartDiscount(Cart: Record UnknownRecord56902) discount: Decimal
    // var
    //     found: Boolean;
    // begin

    //     found := false;

    //     Customer.Get(Cart.CustomerNo);
    //     Item.Get(Cart."Product Id");

    //     //check customer
    //     if not found then begin
    //         SalesLineDiscount.Reset;
    //         SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."sales type"::Customer);
    //         SalesLineDiscount.SetRange("Sales Code", Customer."Customer Disc. Group");
    //         SalesLineDiscount.SetRange(Code, Item."No.");
    //         if SalesLineDiscount.FindSet then begin
    //             if SalesLineDiscount."Minimum Quantity" <= Cart.Quantity then begin
    //                 if (SalesLineDiscount."Starting Date" <= Today) and (SalesLineDiscount."Ending Date" <= Today) then begin
    //                     discount := SalesLineDiscount."Line Discount %";
    //                     found := true;
    //                 end;
    //             end;
    //         end;
    //     end;
    //     if not found then begin
    //         SalesLineDiscount.Reset;
    //         SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."sales type"::Customer);
    //         SalesLineDiscount.SetRange("Sales Code", Customer."Customer Disc. Group");
    //         SalesLineDiscount.SetRange(Code, Item."Item Disc. Group");
    //         if SalesLineDiscount.FindSet then begin
    //             if SalesLineDiscount."Minimum Quantity" <= Cart.Quantity then begin
    //                 if (SalesLineDiscount."Starting Date" <= Today) and (SalesLineDiscount."Ending Date" <= Today) then begin
    //                     discount := SalesLineDiscount."Line Discount %";
    //                     found := true;
    //                 end;
    //             end;
    //         end;
    //     end;
    //     //check customer discount grouop
    //     if not found then begin
    //         SalesLineDiscount.Reset;
    //         SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."sales type"::"Customer Disc. Group");
    //         SalesLineDiscount.SetRange("Sales Code", Customer."Customer Disc. Group");
    //         SalesLineDiscount.SetRange(Code, Item."No.");
    //         if SalesLineDiscount.FindSet then begin
    //             if SalesLineDiscount."Minimum Quantity" <= Cart.Quantity then begin
    //                 if (SalesLineDiscount."Starting Date" <= Today) and (SalesLineDiscount."Ending Date" <= Today) then begin
    //                     discount := SalesLineDiscount."Line Discount %";
    //                     found := true;
    //                 end;
    //             end;
    //         end;
    //     end;
    //     if not found then begin
    //         SalesLineDiscount.Reset;
    //         SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."sales type"::"Customer Disc. Group");
    //         SalesLineDiscount.SetRange("Sales Code", Customer."Customer Disc. Group");
    //         SalesLineDiscount.SetRange(Code, Item."Item Disc. Group");
    //         if SalesLineDiscount.FindSet then begin
    //             if SalesLineDiscount."Minimum Quantity" <= Cart.Quantity then begin
    //                 if (SalesLineDiscount."Starting Date" <= Today) and (SalesLineDiscount."Ending Date" <= Today) then begin
    //                     discount := SalesLineDiscount."Line Discount %";
    //                     found := true;
    //                 end;
    //             end;
    //         end;
    //     end;
    //     //all customers
    //     if not found then begin
    //         SalesLineDiscount.Reset;
    //         SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."sales type"::"All Customers");
    //         SalesLineDiscount.SetRange("Sales Code", Customer."Customer Disc. Group");
    //         SalesLineDiscount.SetRange(Code, Item."No.");
    //         if SalesLineDiscount.FindSet then begin
    //             if SalesLineDiscount."Minimum Quantity" <= Cart.Quantity then begin
    //                 if (SalesLineDiscount."Starting Date" <= Today) and (SalesLineDiscount."Ending Date" <= Today) then begin
    //                     discount := SalesLineDiscount."Line Discount %";
    //                     found := true;
    //                 end;
    //             end;
    //         end;
    //     end;
    //     if not found then begin
    //         SalesLineDiscount.Reset;
    //         SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."sales type"::"All Customers");
    //         SalesLineDiscount.SetRange("Sales Code", Customer."Customer Disc. Group");
    //         SalesLineDiscount.SetRange(Code, Item."Item Disc. Group");
    //         if SalesLineDiscount.FindSet then begin
    //             if SalesLineDiscount."Minimum Quantity" <= Cart.Quantity then begin
    //                 if (SalesLineDiscount."Starting Date" <= Today) and (SalesLineDiscount."Ending Date" <= Today) then begin
    //                     discount := SalesLineDiscount."Line Discount %";
    //                     found := true;
    //                 end;
    //             end;
    //         end;
    //     end;
    //     //campaign
    //     if not found then begin
    //         SalesLineDiscount.Reset;
    //         SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."sales type"::Campaign);
    //         SalesLineDiscount.SetRange("Sales Code", Customer."Customer Disc. Group");
    //         SalesLineDiscount.SetRange(Code, Item."No.");
    //         if SalesLineDiscount.FindSet then begin
    //             if SalesLineDiscount."Minimum Quantity" <= Cart.Quantity then begin
    //                 if (SalesLineDiscount."Starting Date" <= Today) and (SalesLineDiscount."Ending Date" <= Today) then begin
    //                     discount := SalesLineDiscount."Line Discount %";
    //                     found := true;
    //                 end;
    //             end;
    //         end;
    //     end;
    //     if not found then begin
    //         SalesLineDiscount.Reset;
    //         SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."sales type"::Campaign);
    //         SalesLineDiscount.SetRange("Sales Code", Customer."Customer Disc. Group");
    //         SalesLineDiscount.SetRange(Code, Item."Item Disc. Group");
    //         if SalesLineDiscount.FindSet then begin
    //             if SalesLineDiscount."Minimum Quantity" <= Cart.Quantity then begin
    //                 if (SalesLineDiscount."Starting Date" <= Today) and (SalesLineDiscount."Ending Date" <= Today) then begin
    //                     discount := SalesLineDiscount."Line Discount %";
    //                     found := true;
    //                 end;
    //             end;
    //         end;
    //     end;
    // end;


    // procedure removeFromWishlist(customerNumber: Code[50]; CartId: Integer)
    // begin
    //     Wishlist.Reset;
    //     Wishlist.SetRange(id, CartId);
    //     Wishlist.SetRange(CustomerNo, customerNumber);
    //     if Wishlist.FindSet then
    //         Wishlist.Delete;
    // end;


    // procedure addToCartFromWishlist(customerNumber: Code[50]; CartId: Integer) status: Text
    // begin
    //     Wishlist.Reset;
    //     Wishlist.SetRange(id, CartId);
    //     Wishlist.SetRange(CustomerNo, customerNumber);
    //     if Wishlist.FindSet then begin
    //         status := AddToCart(customerNumber, Wishlist."Product Id", 1, '', '');
    //         Wishlist.Delete;
    //     end;
    // end;


    // procedure generateInvoice(customerNo: Code[20]; invoiceNo: Code[20]) status: Text
    // begin
    //     status := 'danger*Your invoice could not be generated*';
    //     SalesInvoiceHeader.Reset;
    //     SalesInvoiceHeader.SetRange("Sell-to Customer No.", customerNo);
    //     SalesInvoiceHeader.SetRange("No.", invoiceNo);
    //     if SalesInvoiceHeader.FindSet then begin
    //         //Report.SaveAsPdf(206, '\\10.0.0.229\downloads\' + SalesInvoiceHeader."No." + '.pdf', SalesInvoiceHeader);
    //         if FILE.Exists('\\10.0.0.229\downloads\' + SalesInvoiceHeader."No." + '.pdf') then
    //             status := '**' + SalesInvoiceHeader."No." + '';
    //     end else begin
    //         status := 'danger*The invoice does not exists*';
    //     end;

    //     //'\\10.0.0.229\
    // end;

    // local procedure createSalesOrder(customerNo: Code[20]) orderNo: Text
    // begin
    //     SalesHeader.Reset;
    //     SalesHeader.Init;
    //     SalesHeader."No." := '';
    //     SalesHeader."Sell-to Customer No." := customerNo;
    //     SalesHeader.Validate("Sell-to Customer No.");
    //     SalesHeader."Bill-to Customer No." := customerNo;
    //     SalesHeader.Validate("Bill-to Customer No.");
    //     SalesHeader."Document Type" := SalesHeader."document type"::Order;
    //     SalesHeader."From Portal" := true;
    //     SalesHeader.OrderConfirmationSent := false;
    //     if SalesHeader.Insert(true) then
    //         exit(SalesHeader."No.");
    // end;


    // procedure sendOrderNotification(orderNo: Code[50]): Boolean
    // var
    //     fileName: Text;
    //     body: Text;
    // begin
    //     SalesHeader1.Reset;
    //     SalesHeader1.SetRange("No.", orderNo);
    //     SalesHeader1.SetRange("Document Type", SalesHeader1."document type"::Order);
    //     if SalesHeader1.FindSet then begin
    //         if Customer.Get(SalesHeader1."Sell-to Customer No.") then begin
    //             SalesHeader1.OrderConfirmationSent := true;
    //             SalesHeader1.Modify(true);
    //             fileName := '\\10.0.0.229\downloads\' + orderNo + '.pdf';
    //             // SalesHeader.GET(SalesHeader."Document Type"::Order, SalesHeader."No.");
    //             //Report.SaveAsPdf(205, fileName, SalesHeader1);
    //             if FILE.Exists(fileName) then begin

    //                 body := 'Dear ' + Customer.Name + ', <br/> Thank you for placing an order with Longhorn Publishers PLC. Please find attached your order for confirmation <br/>'
    //                   + '<br/> <b>Thank you for using Longhorn Publishers e-Portal.</b>'
    //                   + '<br/>'
    //                   + '<b>Note: This is a system-generated e-mail. Please do NOT reply to it.</b><br/>'
    //                   + '<br/>'
    //                   + '<b>Regards,</b><br/>'
    //                   + '<b>Customer Service</b><br/>'
    //                   + '<b>Longhorn publishers</b><br/>'
    //                   + '<b>P.O BOX 18033 - 00500, NAIROBI</b><br/>'
    //                   + '<b>E-mail: customercare@longhornpublishers.com</b><br/>'
    //                   + '<b>TEL: +254 20 6532579/80/81</b><br/>'
    //                   + '<b>MOBILE: 0713 793 734 OR 0736 308 525<b><br/>'
    //                   + '<b>WHATSAPP: 0736 308 525 <br/>';
    //                 SMTPMailSetup.Get;
    //                 SMTPMail.CreateMessage('Longhorn Publishers PLC', SMTPMailSetup."User ID", Customer."E-Mail", 'Order Confirmation', body, true);
    //                 SMTPMail.AddAttachment(fileName, orderNo + '.pdf');
    //                 SMTPMail.Send;
    //                 /*SMTPMail.CreateMessage('Longhorn Publishers PLC',SMTPMailSetup."User ID",'customercare@longhornpublishers.com','Order Placed',' Customer '+Customer.Name+' has placed an order through the portal. Please find attached the details', TRUE);
    //                 SMTPMail.AddAttachment(fileName, orderNo+'.pdf');
    //                 SMTPMail.Send;*/

    //             end;
    //         end;
    //     end;

    // end;


    // procedure ForgotPassword(email: Text) status: Text
    // var
    //     password: Integer;
    //     error: Boolean;
    //     emailBody: Text;
    // begin
    //     if Customer.Get(email) then begin
    //         if not ECommerceUsers.Get(email) then begin
    //             status := 'danger*Seems you do not have an account. Please use the register link';
    //         end else begin
    //             //get email
    //             if Customer."E-Mail" <> '' then begin
    //                 error := true;

    //                 repeat
    //                     password := Random(9999);
    //                     if password > 1000 then
    //                         error := false;
    //                 until not error;
    //                 ECommerceUsers.Password := Format(password);
    //                 ECommerceUsers."Changed Password" := false;
    //                 ECommerceUsers.EMail := Customer."E-Mail";
    //                 ECommerceUsers.Name := Customer.Name;
    //                 if ECommerceUsers.Modify(true) then begin
    //                     //send customer email
    //                     emailBody := 'Dear ' + Customer.Name + ', <br/> Thank you for creating an account with Longhorm publishers. Your one time password is <strong>' + Format(password) + '</strong>. Kindly log in and update this password.';
    //                     sendEmail(Customer."E-Mail", 'Your one time password', emailBody);
    //                     status := 'success*Your account password was successfully reset. Please use the password sent via your email to log in';
    //                 end else begin
    //                     status := 'danger*Your account could not be created';
    //                 end;
    //             end else begin
    //                 status := 'danger*Your account does not have a valid email address. Please contact Longhorn Publishers PLC to update your details';
    //             end;
    //         end;
    //     end else begin
    //         status := 'danger*A user account with the given customer number does not exist';
    //     end;
    // end;


    // procedure fnShowpass(custno: Text[20]) mypass: Text
    // begin
    //     ECommerceUsers.Reset;
    //     ECommerceUsers.SetRange(customerNo, custno);
    //     if ECommerceUsers.Find('-')
    //       then begin
    //         mypass := ECommerceUsers.Password;
    //         Message(mypass);
    //     end
    // end;


    // procedure fnBLOBCustomerStatement(CustomerrNo: Code[50]; DateFrom: Date; DateTo: Date; var BigText: BigText)
    // var
    //     Filename: Text[100];
    //     Convert: dotnet Convert;
    //     Path: dotnet Path;
    //     _File: dotnet File;
    //     FileAccess: dotnet FileAccess;
    //     FileMode: dotnet FileMode;
    //     MemoryStream: dotnet MemoryStream;
    //     FileStream: dotnet FileStream;
    //     Outputstream: OutStream;
    // begin
    //     objCustomer.Reset;
    //     objCustomer.SetRange("No.", CustomerrNo);

    //     Filename := Path.GetTempPath() + Path.GetRandomFileName();

    //     if objCustomer.FindSet()
    //       then begin
    //         objCustomer.SetFilter("Date Filter", Format(DateFrom) + '..' + Format(DateTo));
    //         //objCustomer
    //         //Report.SaveAsPdf(50053, Filename, objCustomer);

    //         FileMode := 4;
    //         FileAccess := 1;

    //         FileStream := _File.Open(Filename, FileMode, FileAccess);

    //         MemoryStream := MemoryStream.MemoryStream();

    //         MemoryStream.SetLength(FileStream.Length);
    //         FileStream.Read(MemoryStream.GetBuffer(), 0, FileStream.Length);

    //         BigText.AddText((Convert.ToBase64String(MemoryStream.GetBuffer())));

    //         MemoryStream.Close();
    //         MemoryStream.Dispose();
    //         FileStream.Close();
    //         FileStream.Dispose();
    //         _File.Delete(Filename);

    //     end
    //     else begin
    //         Error('Error generating report');
    //     end;
    // end;


    // procedure getOrderShipmentStatus(OrderNumber: Code[20]; CustomerNumber: Code[20]): Text
    // begin
    //     /*WarehouseShipmentLine.RESET;
    //     WarehouseShipmentLine.SETRANGE("Source No.", OrderNumber);
    //     WarehouseShipmentLine.SETRANGE("Destination No.", CustomerNumber);
    //     IF WarehouseShipmentLine.FINDSET THEN BEGIN
    //       //get warehouse header
    //       WarehouseShipmentHeader.RESET;
    //       WarehouseShipmentHeader.SETRANGE("No.", WarehouseShipmentLine."No.");
    //       IF WarehouseShipmentHeader.FINDSET THEN BEGIN

    //         IF WarehouseShipmentHeader.Status= WarehouseShipmentHeader.Status::Released THEN BEGIN
    //            EXIT('Dispatched');
    //           END ELSE BEGIN
    //              EXIT('Processing');
    //             END;
    //         END ELSE BEGIN
    //           EXIT('Processing');
    //           END;
    //     END ELSE BEGIN
    //     EXIT('Processing');
    //     END;
    //     */
    //     SalesShipmentHeader.Reset;
    //     SalesShipmentHeader.SetRange("Order No.", OrderNumber);
    //     SalesShipmentHeader.SetRange("Sell-to Customer No.", CustomerNumber);
    //     if SalesShipmentHeader.FindSet then begin
    //         exit('Dispatched');
    //     end else begin
    //         exit('Processing');
    //     end;

    // end;


    // procedure fnRunJobs() CUnitExecuted: Boolean
    // begin
    //     CUnitExecuted := false;
    //     if Codeunit.Run(Codeunit::"Notification Entry Dispatcher") then begin
    //         CUnitExecuted := true;
    //         // MESSAGE(FORMAT(CUnitExecuted));
    //     end
    //     else begin
    //         CUnitExecuted := false;
    //     end;
    // end;


    // procedure ForgotWEmailPassword(customerEmail: Text[100]) status: Text
    // var
    //     password: Integer;
    //     error: Boolean;
    //     emailBody: Text;
    // begin
    //     Customer.Reset;
    //     Customer.SetRange("E-Mail", customerEmail);
    //     if Customer.Find('-') then begin
    //         ECommerceUsers.Reset;
    //         ECommerceUsers.SetRange(EMail, customerEmail);
    //         if ECommerceUsers.Find('-') then begin
    //             password := fnRandomize();
    //             ECommerceUsers.Password := Format(password);
    //             ECommerceUsers."Changed Password" := false;
    //             ECommerceUsers.EMail := Customer."E-Mail";
    //             ECommerceUsers.Name := Customer.Name;

    //             if ECommerceUsers.Modify(true)
    //             then begin
    //                 //send customer email
    //                 emailBody := 'Dear ' + Customer.Name + ', <br/> Thank you for creating an account with Longhorm publishers. Your one time password is <strong>' + Format(password) + '</strong>. Kindly log in and update this password.';
    //                 sendEmail(Customer."E-Mail", 'Your one time password', emailBody);
    //                 status := 'success*You account password was successfully reset. Please use the password sent via your email to log in';
    //                 Message(status);
    //             end
    //             else begin
    //                 status := 'danger*Your Password could not be changed!';
    //                 Message(status);
    //             end
    //         end else begin
    //             status := 'danger*Your account does not have a valid email address. Please contact Longhorn Publishers PLC to update your details';
    //             Message(status);
    //         end
    //     end else begin
    //         status := 'danger*A user account with the given customer number does not exist';
    //         Message(status);
    //     end;

    // end;


    // procedure fnRandomize() myNo: Integer
    // begin
    //     myNo := Random(1000) + 1999;
    //     //MESSAGE(FORMAT(myNo));
    // end;


    // procedure FnRegister(firstname: Text[50]; lastname: Text[50]; middlename: Text; phone: Code[20]; email: Text; password: Text) status: Text
    // begin
    //     Customer.Reset;
    //     Customer.SetRange("E-Mail", email);
    //     if Customer.FindSet then begin
    //         status := 'danger*The customer details with email address ' + email + ' already exists';
    //     end else begin
    //         Customer.Init;
    //         Customer.Name := firstname + ' ' + middlename + ' ' + lastname;
    //         Customer."E-Mail" := email;
    //         Customer."Phone No." := phone;
    //         Customer."Customer Type" := Customer."customer type"::General;
    //         Customer."Gen. Bus. Posting Group" := 'GENERAL';
    //         Customer."Customer Posting Group" := 'ACCOUNT';
    //         if Customer.Insert(true) then begin
    //             status := CreateCustomerAccount(Customer."No.", email, password);
    //         end else begin
    //             status := 'danger*Error creating Account!'
    //         end
    //     end;
    // end;


    // procedure FnUpdateCart(cartId: Integer; quantity: Decimal) updatestatus: Text
    // var
    //     unitprice: Decimal;
    // begin
    //     Cart.Reset;
    //     Cart.SetRange(id, cartId);
    //     if Cart.FindSet() then begin
    //         unitprice := Cart."Unit Price";
    //         // Cart.PercentageDiscount:= getCartDiscount(Cart);
    //         Cart.Quantity := quantity;
    //         if Cart.Modify(true) then begin
    //             updatestatus := 'success*Your cart updated successfully!';
    //         end else begin
    //             updatestatus := 'danger*Error occured updating cart!';
    //         end
    //     end
    //     else begin
    //         updatestatus := 'danger*Unknown error!';
    //     end
    // end;

    // procedure FnCountCartLoggedin(customerNo: Code[30]) allitems: Integer
    // begin
    //     Cart.Reset;
    //     Cart.SetRange(CustomerNo, customerNo);
    //     if Cart.FindSet() then begin
    //         allitems := Cart.Count;
    //     end else begin
    //         allitems := 0;
    //     end
    // end;

    // procedure FnCountCartLoggedOut(IPAddress: Text) allitems: Integer
    // begin
    //     Cart.Reset;
    //     Cart.SetRange(CustomerNo, IPAddress);
    //     if Cart.FindSet() then begin
    //         allitems := Cart.Count;
    //     end else begin
    //         allitems := 0;
    //     end
    // end;


    // procedure FnAddToCartLoggedOut(ProductId: Code[50]; Quantity: Decimal; IPAddress: Text; CookieID: Text; minusIPAddr: Text) status: Text
    // begin
    //     if Item.Get(ProductId) then begin
    //         Cart.Reset;
    //         Cart.SetRange("IP Address", IPAddress);
    //         Cart.SetRange("Product Id", ProductId);
    //         if Cart.FindSet then begin
    //             Cart.Quantity := Cart.Quantity + Quantity;
    //             Cart."Unit Price" := Item."Unit Price";
    //             Cart.PercentageDiscount := 0;//getCartDiscount(Cart);
    //             if Cart.Modify(true) then begin
    //                 status := 'success*The item was successfully added to your cart';
    //             end else begin
    //                 status := 'danger*The item could not be added to your cart';
    //             end;
    //         end else begin
    //             Cart.Init;
    //             Cart.CustomerNo := minusIPAddr;
    //             Cart.Quantity := Quantity;
    //             Cart."Product Id" := ProductId;
    //             Cart."Unit Price" := Item."Unit Price";
    //             Cart.PercentageDiscount := 0; //getCartDiscount(Cart);
    //             Cart.CookieId := CookieID;
    //             Cart."IP Address" := IPAddress;
    //             if Cart.Insert(true) then begin
    //                 status := 'success*The item was successfully added to your cart';
    //             end else begin
    //                 status := 'danger*The item could not be added to your cart';
    //             end;
    //         end;
    //     end else begin
    //         status := 'danger*The selected product does not exist';
    //     end;
    // end;


    // procedure FnUpdateCartWIP(IPAddress: Text; customerNo: Code[30]) updatestatus: Text
    // var
    //     unitprice: Decimal;
    //     IPAddress0: Text;
    // begin
    //     Cart.Reset;
    //     Cart.SetRange("IP Address", IPAddress);
    //     if Cart.FindSet then begin
    //         repeat
    //             Cart.CustomerNo := customerNo;
    //             Cart.Modify(true);
    //         until Cart.Next = 0;
    //         updatestatus := 'success*Your cart updated successfully!';
    //     end else begin
    //         updatestatus := 'nocart';
    //     end;
    // end;
}
