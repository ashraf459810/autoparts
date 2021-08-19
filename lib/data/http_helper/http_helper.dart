import 'dart:convert';
import 'dart:developer';
import 'package:autopart/model/AutopartShop.dart';
import 'package:autopart/model/BrandPagenModel.dart';
import 'package:autopart/model/BrandsEdit.dart';
import 'package:autopart/model/BrandsEditBody.dart';
import 'package:autopart/model/CartHistory.dart';
import 'package:autopart/model/CustomerOffers.dart/CustomerOffers.dart';
import 'package:autopart/model/FinishedOrdersCustomer.dart';
import 'package:autopart/model/GetCartModel.dart';
import 'package:autopart/model/MultiReqestforQuotationNotification.dart';
import 'package:autopart/model/Quotation.dart';
import 'package:autopart/model/QuotationReponse.dart';
import 'package:autopart/model/RequestForCustomers.dart';
import 'package:autopart/model/ReturnRequestModel/ReturnRequestsModel.dart';
import 'package:autopart/model/SearchedProduct.dart';
import 'package:autopart/model/UploadImage/UploadImage.dart';
import 'package:autopart/model/VendorChosenNotification/VendorChosenNotification.dart';
import 'package:autopart/model/VendorNotificationsModel.dart';
import 'package:autopart/model/VendorOfferNotification.dart';
import 'package:autopart/model/VendorStatistics.dart';
import 'package:autopart/model/Vendorpullproducts.dart';
import 'package:autopart/model/customeOrdersResponse.dart';
import 'package:autopart/model/customerResponse.dart';
import 'package:autopart/model/createCustomer.dart';
import 'package:autopart/model/getVendorNotifications(requests)/GetVendorRequests.dart';
import 'package:autopart/model/vendor_add_products/AddNewProductsResponse.dart';
import 'package:autopart/model/listallresponseforvendor/list_all_for_vendor.dart';
import 'package:autopart/model/vendor_add_products/AddNewProducts.dart';
import 'package:autopart/model/vendorresponse/vendorResponse.dart';
import 'package:autopart/model/CustomerInfoAfterVerify/CustomerInfo.dart';
import 'package:autopart/model/brand_model/brand_model.dart';
import 'package:autopart/model/VendorInfoAfterVerify/VendorInfo.dart';
import 'package:autopart/model/vendor%20sign%20up%20model/vendor_sign_up.dart';
import '../../model/car_model/car_model.dart';
import 'Ihttp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:autopart/model/VendorProductsModel.dart' as con;

class HttpHelper implements IHttpHelper {
  String base = "134.209.78.88";

  @override
  Future<List<CarModel>> getcars({int id}) async {
    String url = "http://$base:8080/autoparts/car/getbybrand?brand=$id";

    final response = await http.get(url);
    print(response.body);

    List<CarModel> cars = carModelFromJson(response.body);
    print("hereeeee the carrs");

    return cars;
  }

  @override
  Future<Vendoresponse> createvendor({CreateVendorModel createVendor}) async {
    var body = createVendorModelToJson(createVendor);
    print("bodytest $body");

    final String url = "http://$base:8080/autoparts/vendor/create";
    final response = await http.post(url, body: body);
    print("here the response from create vendor");

    print("vendor ${response.statusCode.toString()}");

    Vendoresponse vendoresponse = new Vendoresponse();
    vendoresponse = vendoresponseFromJson(response.body);
    return vendoresponse;
  }

  @override
  Future<String> sendsms({String mobile}) async {
    String url =
        "http://$base:8080/autoparts/vendor/sendotp?mobileNumber=$mobile";

    final response = await http.get(url);

    String theresponse = (response.body);
    if (response.statusCode == 200) {
      print("$theresponse");
    }
    return theresponse;
  }

  @override
  Future<String> sendsmscustomer({String mobile}) async {
    String url =
        "http://$base:8080/autoparts/customer/send-otp?mobileNumber=$mobile";

    final response = await http.get(url);

    String theresponse = (response.body);
    if (response.statusCode == 200) {
      print("$theresponse");
    }
    return theresponse;
  }

  @override
  Future<VendorInfo> checksmscode({String mobile, String code}) async {
    String url =
        "http://$base:8080/autoparts/vendor/checkotp?mobileNumber=$mobile&code=$code";

    final response = await http.get(url);
    print(response.body);

    VendorInfo vendorInfo = vendorInfoFromJson(response.body);

    return vendorInfo;
  }

  @override
  Future<CustomerInfo> checksmscodecustomer(
      {String mobile, String code}) async {
    String url =
        "http://$base:8080/autoparts/customer/checkotp?mobileNumber=$mobile&code=$code";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      CustomerInfo customerInfo = customerInfoFromJson(response.body);

      return customerInfo;
    } else {
      return null;
    }
  }

  @override
  Future<CustomerResponse> createcustomer({CreateCustomer customer}) async {
    var body = createCustomerToJson(customer);

    final String url = "http://$base:8080/autoparts/customer/create";
    final response = await http.post(url, body: body);
    print("${response.body}");

    CustomerResponse customerResponse = CustomerResponse();

    customerResponse = customerResponseFromJson(response.body);
    print(customerResponse);

    return customerResponse;
  }

  @override
  Future<List<con.Content>> getvendorproducts(
      {VendorPullProducts vendorPullProducts}) async {
    final String url =
        "http://$base:8080/autoparts/vendorproduct/getbyvendorandproducttype?vendor=${vendorPullProducts.id}&page=${vendorPullProducts.page}&productType=${vendorPullProducts.type}&size=${vendorPullProducts.size}";

    final response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      print("getting vendor products ${response.statusCode}");

      con.VendorProductsModel vendorProducts =
          con.vendorProductsModelFromJson(response.body);
      List<con.Content> products = vendorProducts.content;

      return products;
    }
    return null;
  }

  @override
  Future<AddNewProductsResponse> addproducts(
      {AddNewProductsVendor addNewProductsVendor}) async {
    final String url = 'http://$base:8080/autoparts/vendorproduct/create';

    var body = addNewProductsVendorToJson(addNewProductsVendor);

    final response = await http.post(url, body: body);

    print("vendor ${response.statusCode.toString()}");
    if (response.statusCode == 200) {
      print(response);
      // AddNewProductsResponse addNewProductsResponse =
      //     addNewProductsResponseFromJson(response.body);
      // // BrandVendorProduct brandVendorProduct = addNewProductsResponse.brand;
      // // print("response for adding product for vendor' {$brandVendorProduct}");
      // // return brandVendorProduct;
    }
    return null;
  }

  @override
  Future<List<ListAllVendorProducts>> listall() async {
    final String url = 'http://$base:8080/autoparts/product/listall';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("getting vendor products ${response.statusCode}");
      var body = utf8.decode(response.bodyBytes);

      List<ListAllVendorProducts> list = listAllVendorProductsFromJson(body);
      print("here the list lenght ${list.length}");
      return list;
    }
    return null;
  }

  @override
  // ignore: missing_return
  Future<QuotationResponse> sendqutation({SendQuotation sendQuotation}) async {
    final String url = "http://$base:8080/autoparts/requestforquotation/create";

    var body = sendQuotationToJson(sendQuotation);
    print(url);
    log(body);

    print("here is the json body " "$body");

    var response = await http.post(url, body: body);
    print("test here from http");
    print(response.body);

    print("response${response.statusCode}");

    if (response.statusCode == 200) {
      print("${response.statusCode} " "here from quotaion reqest");
      QuotationResponse quotationResponse =
          quotationResponseFromJson(response.body);

      return quotationResponse;
    } else
      return null;
  }

  @override
  // ignore: missing_return
  Future<List<Content>> customerorders({int pages, int size, int id}) async {
    final String url =
        "http://$base:8080/autoparts/order/getcustomerorders?id=$id&page=$pages&size=$size";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("requests ${response.statusCode}");
      log(response.body);

      CustomerRequest customerRequest = customerRequestFromJson(response.body);
      List<Content> requests = [];
      requests = customerRequest.content;
      print(requests);

      return requests;
    }
  }

  @override
  Future<List<CustomerRequests>> getcustomerrequests(
      {int pages, int size, int id}) async {
    final String url =
        "http://$base:8080/autoparts//requestforquotation/getbycustomer?customer=$id&page=$pages&size=$size";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("requests ${response.statusCode}");
      log(response.body);

      RequestForCustomer customerRequest =
          requestForCustomerFromJson(response.body);
      List<CustomerRequests> requests = [];
      requests = customerRequest.content;
      print(requests);

      return requests;
    }
    return null;
  }

  @override
  Future<String> signin({String mobile}) async {
    final String url =
        "http://$base:8080/autoparts/vendor/login?mobileNumber=$mobile";

    // print("url $url");
    var response = await http.post(url);

    // print(response.statusCode);
    // VendorLogin vendorLogin = vendorLoginFromJson(response.body);

    // print("here from vendor sign in");
    return response.body;
  }

  @override
  Future<String> savetokenforcustomer({int id, String token}) async {
    String url =
        "http://$base:8080/autoparts/customer/savefirebasetoken?customer=$id&token=$token";
    var response = await http.post(url);
    print("from token");
    print(response.statusCode);
    print(id);
    print(token);

    if (response.statusCode == 200) {
      return "done";
    }
    return "not done";
  }

  @override
  Future<String> savetokenforvendor({int id, String token}) async {
    print("vendor id  from http" "$id");
    print("vendor token " "$token");
    String url =
        "http://$base:8080/autoparts/vendor/savefirebasetoken?vendor=$id&token=$token";
    var response = await http.post(url);
    print("from token");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return "done";
    }
    print(response.body);
    return "not done";
  }

  @override
  Future<String> customerlogin({
    String mobile,
  }) async {
    final String url =
        "http://$base:8080/autoparts/customer/login?mobileNumber=$mobile";
    var response = await http.post(url);
    // print(response.statusCode);
    // CustomerLogin customerLogin = customerLoginFromJson(response.body);

    // print("here from customer sign in");
    return response.body;
  }

  @override
  // ignore: missing_return
  Future<List<Requests>> getvendorrequests({int id, int page, int size}) async {
    try {
      final String url =
          "http://$base:8080/autoparts/vendor/getrequests?vendor=$id&page=$page&size=$size";

      var response = await http.get(url);
      print("response note ${response.statusCode}");
      print(response);
      if (response.statusCode == 200) {
        GetVendorRequests getVendorRequests =
            getVendorRequestsFromJson(response.body);

        List<Requests> list = getVendorRequests.content;
        print(list);

        return list;
      }
    } catch (e) {
      print("err $e");
    }
  }

  @override
  Future<String> addvendoroffer(
      {double price,
      int offerid,
      int days,
      int warranty,
      String condition}) async {
    final String url =
        "http://$base:8080/autoparts/vendor/replyonoffer?offer=$offerid&price=$price&daysToDeliver=$days&warrantyMonths=$warranty&condition=$condition";
    print(offerid);
    print(price);
    print(days);
    var response = await http.get(url);
    print(response.body);

    print("response from add offer for vendor");
    print(response.body);
    if (response.statusCode == 200) {
      return "Done";
    } else
      return "there is a problem with adding offer";
  }

  @override
  Future<String> replyvendornotavailable({int offerid}) async {
    final String url =
        "http://$base:8080/autoparts/vendor/notavailableoffer?offer=$offerid";

    var response = await http.get(url);
    print("here from reply on offer not available ${response.body}");
    if (response.statusCode == 200) {
      return "Done";
    } else
      return "there is a problem with rejecting offer";
  }

  @override
  Future<List<Offer>> getcustomeroffers({int id, int page, int size}) async {
    final String url =
        "http://$base:8080/autoparts/requestforquotation/getoffers?requestForQuotation=$id&page=$page&size=$size";

    var response = await http.get(url);
    print("${response.statusCode} here from the http");
    print("${response.body} here from http");
    if (response.statusCode == 200) {
      log(response.body);
      CustomerOffers customerOffers = customerOffersFromJson(response.body);
      List<Offer> offers = customerOffers.content;
      return offers;
    }

    return null;
  }

  @override
  Future<UploadImage> uploadimage({String tag, String images}) async {
    print("here");
    final String url = "http://$base:8080/autoparts/storage/upload?tag=$tag";
    final uri = Uri.parse(url);

    var request = http.MultipartRequest('post', uri);

    var pic = await http.MultipartFile.fromPath("file", images);
    request.files.add(pic);

    var response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      var json = await http.Response.fromStream(response);
      UploadImage uploadImage = uploadImageFromJson(json.body);

      return uploadImage;
    }
    return null;
  }

  @override
  Future<VendorOfferNotificationModel> vendorofferfromnotification(
      {int vendorId, int offerId, String ondition, int warranty}) async {
    final String url =
        "http://$base:8080/autoparts/vendor/getrequestforquotationoffer?requestForQuotationOffer=$offerId&vendor=$vendorId";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("here from offer api${response.statusCode}");
      log(response.body);
      VendorOfferNotificationModel vendorOfferNotification =
          vendorOfferNotificationModelFromJson(response.body);

      return vendorOfferNotification;
    } else {
      return null;
    }
  }

  @override
  Future<dynamic> getcustomeroffernotification(
      {int offerid, int customerid}) async {
    final String url =
        "http://$base:8080/autoparts/customer/getrequestforquotationoffer?requestForQuotationOffer=$offerid&customer=$customerid";

    var response = await http.get(url);

    print(response.statusCode);
    if (response.statusCode == 200) {
      log(response.body);
      print("200 from getustomernot");

      return response.body;
    }
    return null;
  }

  @override
  Future<List<SearchResult>> searchproduct({
    int brand,
    int car,
    String name,
    int lowprice,
    int highprice,
    int pages,
    int size,
    // String year
  }) async {
    final String url =
        'http://$base:8080/autoparts/vendorproduct/search?name=$name&brand=$brand&car=$car&lowPrice=$lowprice&highPrice=$highprice&page=$pages&size=$size';
    // &year=$year';
    var response = await http.get(url);
    print("$brand $car $name $lowprice $highprice $pages $size");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print("200 from search product");
      SearchedProduct searchProduct = searchedProductFromJson(response.body);
      List<SearchResult> products = searchProduct.content;
      print(products);
      return products;
    }
    return null;
  }

  @override
  Future<List<VendorNot>> getvendornotifications(
      int id, int page, int size) async {
    final String url =
        "http://$base:8080/autoparts/vendor/getnotifications?vendor=$id&page=$page&size=$size";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("200 from vendor notidication");
      VendorNotificationsModel vendorNotificationsModel =
          vendorNotificationsModelFromJson(response.body);
      return vendorNotificationsModel.content;
    }
    return null;
  }

  @override
  Future<VendorStatisics> getvendorstatistics(
      String date1, String date2, int id) async {
    final String url =
        "http://$base:8080/autoparts/vendor/getstatistics?vendor=$id&from=$date1&to=$date2";
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("200 from statisitics");
      VendorStatisics vendorStatisics = vendorStatisicsFromJson(response.body);
      return vendorStatisics;
    }
    return null;
  }

  @override
  Future<List<VendorNot>> getcustomernotifications(
      int id, int page, int size) async {
    print("here");
    final String url =
        "http://$base:8080/autoparts/customer/getnotifications?customer=$id&page=$page&size=$size";
    var response = await http.get(url);
    print("${response.statusCode}here from customer notificaions");

    if (response.statusCode == 200) {
      VendorNotificationsModel vendorNotificationsModel =
          vendorNotificationsModelFromJson(response.body);
      return vendorNotificationsModel.content;
    }
    return null;
  }

  @override
  Future<List<Notifications>> getontificationswithtype(
      int vendorid, int pages, int size, String status) async {
    print("vendor id $vendorid");
    print(pages);
    print(size);
    print(status);

    final String url =
        "http://$base:8080/autoparts/vendor/getrequests?vendor=$vendorid&status=$status&page=$pages&size=$size";

    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print("200 from get chosen notificaitions");
      VendorChosenNotification vendorChosenNotification =
          vendorChosenNotificationFromJson(response.body);
      List<Notifications> list = vendorChosenNotification.content;
      return list;
    }
    return null;
  }

  @override
  Future<String> rateappforvendor(
      int raterid, String ratertype, int rate, String notes) async {
    final String url =
        "http://$base:8080/autoparts/rate/addrate?raterId=$raterid&raterType=$ratertype&rate=$rate&notes=$notes";

    var response = await http.post(url);
    if (response.statusCode == 200) {
      print("200 from rate");
      return "Done";
    } else
      return "Not Done";
  }

  @override
  Future<String> rateappforcustomer(
      int raterid, String ratertype, int rate, String notes) async {
    final String url =
        "http://$base:8080/autoparts/rate/addrate?raterId=$raterid&raterType=$ratertype&rate=$rate&notes=$notes";
    var response = await http.post(url);
    if (response.statusCode == 200) {
      print("200 from rate");
      return "Done";
    } else
      return "Not Done";
  }

  @override
  Future<String> support(
      int requesterid, String requestertype, String notes) async {
    print(requesterid);
    print(notes);
    print(requestertype);
    final String url =
        'http://$base:8080/autoparts/support/addrequest?requesterId=$requesterid&requesterType=$requestertype&note=$notes';
    var response = await http.post(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print("200 from support");
      return response.body.toString();
    } else
      return null;
  }

  @override
  Future<String> suggestion(int id, String sendertype, String notes) async {
    final String url =
        "http://$base:8080/autoparts/suggestion/addsuggestion?suggesterId=$id&suggesterType=$sendertype&suggestion=$notes";
    var response = await http.post(url);
    if (response.statusCode == 200) {
      print("200 from suggestion");
      return response.body.toString();
    } else {
      return null;
    }
  }

  @override
  Future<GetCartModel> getbycart(int id) async {
    final String url =
        "http://$base:8080/autoparts/order/getbycustomer?customer=$id";
    var response = await http.get(url);
    print("${response.statusCode} here the response from cart");
    print(response.body);
    if (response.statusCode == 200) {
      print("200 from cart");
      GetCartModel cartModel = getCartModelFromJson(response.body);
      return cartModel;
    } else
      return null;
  }

  @override
  Future<List<PagenBrands>> getbrand(int page, int size) async {
    String url =
        "http://$base:8080/autoparts/brand/getbrandsbyorder?page=$page&size=$size";

    final response = await http.get(url);
    print(response.statusCode);

    BrandPagen model = brandPagenFromJson(response.body);
    List<PagenBrands> brands = model.content;
    return brands;
  }

  @override
  Future<List<BrandModel>> getbrandd() async {
    String url = "http://$base:8080/autoparts/brand/listall";

    final response = await http.get(url);
    print(response.statusCode);

    List<BrandModel> brands = brandModelFromJson(response.body);
    return brands;
  }

  @override
  Future<GetCartModel> addProductfromSerachtocart(
      int productid, int cartId) async {
    final String url =
        "http://$base:8080/autoparts/order/addproduct?order=$cartId&product=$productid";
    var response = await http.post(url);
    print("${response.statusCode} here the response from adding product");
    print(response.body);

    if (response.statusCode == 200) {
      print("200 from cart adding product");
      GetCartModel cartModel = getCartModelFromJson(response.body);
      return cartModel;
    } else
      return null;
  }

  @override
  Future<GetCartModel> addQuotaiontocart(
      int qoutaionoOfferid, int cartId) async {
    print("cart id is $cartId  qoutation id is $qoutaionoOfferid");
    final String url =
        "http://$base:8080/autoparts/order/addoffer?order=$cartId&offer=$qoutaionoOfferid";
    var response = await http.post(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("200 from cart adding quotation");
      GetCartModel cartModel = getCartModelFromJson(response.body);
      return cartModel;
    } else
      return null;
  }

  @override
  Future<String> cancelcart(int cartid) async {
    final String url = "http://$base:8080/autoparts/order/cancel?order=$cartid";

    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("200 from cart");
      String result = response.body;
      return result;
    } else
      return null;
  }

  @override
  Future<String> confirmcart(int customerid, double x, double y, String city,
      String street, String country, int cartid) async {
    final String url =
        "http://$base:8080/autoparts/order/confirm?order=$cartid&country=$country&city=$city&street=$street&additionalAddress=&deliverXLongitude=$x&deliverYLatitude=$y&customer=$customerid";
    print(url);
    var response = await http.post(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print("200 from cart");
      String result = response.body;
      return result;
    } else
      return null;
  }

  @override
  Future<GetCartModel> removecartitem(int cartid, int itemid) async {
    final String url =
        "http://$base:8080/autoparts/order/removeitem?item=$itemid&order=$cartid";
    print("cart id is $cartid  item id is $itemid");
    var response = await http.post(url);
    print(response.body);
    if (response.statusCode == 200) {
      print("200 from remove item");
      GetCartModel cartModel = getCartModelFromJson(response.body);

      return cartModel;
    } else
      return null;
  }

  @override
  Future<List<MultiReqestQModel>> multirequestforquotationnotification(
      int vendorid, int requestid) async {
    final String url =
        'http://$base:8080/autoparts/requestforquotation/getbyrequestforquotationandvendor?requestForQuotation=$requestid&vendor=$vendorid';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("200 from multi request not");
      var model = multiReqestQModelFromJson(response.body);
      return model;
    } else
      print("not 200 return null");
    return null;
  }

  @override
  Future<AutopartShop> getshopitems(String type, int page, int size) async {
    final String url =
        'http://$base:8080/autoparts/vendorproduct/getshopproducts?productType=$type&page=$page&size=$size';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("200 from shop");
      AutopartShop autopartShop = autopartShopFromJson(response.body);
      return autopartShop;
    } else
      return null;
  }

  @override
  Future<BrandsEdit> editbrands(BrandsEditBody brandsEditBody) async {
    final String url = 'http://$base:8080/autoparts/vendor/update';
    print(url);
    print("${brandsEditBodyToJson(brandsEditBody)}");

    var response =
        await http.post(url, body: brandsEditBodyToJson(brandsEditBody));
    print(" here the list from edit brands ${response.body}");
    if (response.statusCode == 200) {
      print("200 from edit");
      BrandsEdit brandsEdit = brandsEditFromJson(response.body);
      return brandsEdit;
    } else
      return null;
  }

  @override
  Future<String> getcustomerpoints(int customerid) async {
    final String url =
        'http://$base:8080/autoparts/customer/getpurchasespoints?customer=$customerid';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('200 from points');
      String points = response.body;
      return points;
    } else
      return null;
  }

  @override
  Future<CartHistory> getcustomerordershistory(
      int page, int size, int customerid) async {
    print(customerid);

    final String url =
        "http://$base:8080/autoparts/order/getcustomerorders?customer=$customerid&page=$page&size=$size";
    print(url);
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("200 from cart histpry");
      CartHistory cartHistory = cartHistoryFromJson(response.body);
      return cartHistory;
    } else
      return null;
  }

  @override
  Future<String> requesttoreturnitem(
      int customerid, int itemid, String reason) async {
    final String url =
        "http://$base:8080/autoparts/order/returnproduct?cartItem=$itemid&customer=$customerid&reason=$reason";
    var response = await http.post(url);
    print(url);
    print(response.statusCode);

    if (response.body == "Done")
      return response.body;
    else
      return null;
  }

  @override
  Future<ReturnRequestsModel> getreturnrequests(
      int id, int page, int size) async {
    final String url =
        "http://$base:8080/autoparts/order/getcustomerreturntodos?customer=$id&page=$page&size=$size";
    var response = await http.get(url);
    print(url);
    print(response.statusCode);
    ReturnRequestsModel requestsModel =
        returnRequestsModelFromJson(response.body);

    if (response.statusCode == 200)
      return requestsModel;
    else
      return null;
  }

  @override
  Future<List<FinishedOrders>> customerfinishedorders(
    int customerid,
  ) async {
    final String url =
        "http://$base:8080/autoparts/order/getbycustomerandstatus?customer=$customerid&orderStatus=DONE";
    var response = await http.get(url);
    print(url);
    if (response.statusCode == 200) {
      print(response.statusCode);
      FinishedOrdersCustomer finishedOrdersCustomer =
          finishedOrdersCustomerFromJson(response.body);
      return finishedOrdersCustomer.content;
    } else
      return null;
  }
}
