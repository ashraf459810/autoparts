import 'package:autopart/model/AutopartShop.dart';
import 'package:autopart/model/BrandPagenModel.dart';
import 'package:autopart/model/BrandsEdit.dart';
import 'package:autopart/model/BrandsEditBody.dart';
import 'package:autopart/model/CartHistory.dart';
import 'package:autopart/model/GetCartModel.dart';
import 'package:autopart/model/MultiReqestforQuotationNotification.dart';
import 'package:autopart/model/Quotation.dart';
import 'package:autopart/model/QuotationReponse.dart';
import 'package:autopart/model/ReturnRequestModel/ReturnRequestsModel.dart';
import 'package:autopart/model/VendorStatistics.dart';
import 'package:autopart/model/getVendorNotifications(requests)/GetVendorRequests.dart';
import 'package:autopart/model/brand_model/brand_model.dart';
import 'package:autopart/model/customeOrdersResponse.dart';
import 'package:autopart/model/UploadImage/UploadImage.dart';
import 'package:autopart/model/vendor%20sign%20up%20model/vendor_sign_up.dart';
import 'package:autopart/model/vendor_add_products/AddNewProducts.dart';
import 'package:autopart/model/vendor_add_products/AddNewProductsResponse.dart';
import 'package:autopart/model/CustomerInfoAfterVerify/CustomerInfo.dart';
import 'package:autopart/model/vendorresponse/vendorResponse.dart';
import 'package:autopart/model/createCustomer.dart';
import 'package:autopart/model/customerResponse.dart';
import 'package:autopart/model/listallresponseforvendor/list_all_for_vendor.dart';
import '../../model/car_model/car_model.dart';
import 'package:autopart/model/Vendorpullproducts.dart';
import 'package:autopart/model/VendorProductsModel.dart' as con;
import 'package:autopart/model/RequestForCustomers.dart';
import 'package:autopart/model/VendorInfoAfterVerify/VendorInfo.dart';
import 'package:autopart/model/CustomerOffers.dart/CustomerOffers.dart';
import 'package:autopart/model/VendorOfferNotification.dart';

import 'package:autopart/model/SearchedProduct.dart';
import 'package:autopart/model/VendorChosenNotification/VendorChosenNotification.dart';
import 'package:autopart/model/VendorNotificationsModel.dart';

abstract class IHttpHelper {
  // ignore: missing_return
  Future<List<BrandModel>> getbrandd();
  Future<List<PagenBrands>> getbrand(int page, int size);
  Future<List<CarModel>> getcars({int id});
  Future<Vendoresponse> createvendor({CreateVendorModel createVendor});
  Future<String> sendsms({String mobile});
  Future<VendorInfo> checksmscode({String mobile, String code});
  Future<CustomerResponse> createcustomer({CreateCustomer customer});
  Future<List<con.Content>> getvendorproducts(
      {VendorPullProducts vendorPullProducts});
  Future<AddNewProductsResponse> addproducts(
      {AddNewProductsVendor addNewProductsVendor});
  Future<List<ListAllVendorProducts>> listall();
  Future<QuotationResponse> sendqutation({SendQuotation sendQuotation});
  Future<List<Content>> customerorders({int pages, int size, int id});
  Future<List<CustomerRequests>> getcustomerrequests({int pages, int id});
  Future<CustomerInfo> checksmscodecustomer({String mobile, String code});
  Future<String> sendsmscustomer({String mobile});
  Future<String> signin({String mobile});
  Future<String> savetokenforvendor({int id, String token});
  Future<String> savetokenforcustomer({int id, String token});
  Future<String> customerlogin({String mobile});
  Future<List<Requests>> getvendorrequests({int id, int page, int size});
  Future<String> addvendoroffer(
      {double price, int offerid, int days, int warranty, String condition});
  Future<String> replyvendornotavailable({int offerid});
  Future<List<Offer>> getcustomeroffers({int id, int page, int size});
  Future<UploadImage> uploadimage({String tag});
  Future<VendorOfferNotificationModel> vendorofferfromnotification(
      {int vendorId, int offerId});
  Future<dynamic> getcustomeroffernotification({int offerid, int customerid});
  Future<List<SearchResult>> searchproduct({
    int brand,
    int car,
    String name,
    int lowprice,
    int highprice,
    int pages,
    int size,
    // String year
  });
  Future<List<VendorNot>> getvendornotifications(int id, int page, int size);
  Future<VendorStatisics> getvendorstatistics(
      String date1, String date2, int id);

  Future<List<VendorNot>> getcustomernotifications(int id, int page, int size);
  Future<List<Notifications>> getontificationswithtype(
      int vendorid, int pages, int size, String status);
  Future<String> rateappforvendor(
      int raterid, String ratertype, int rate, String notes);
  Future<String> rateappforcustomer(
      int raterid, String ratertype, int rate, String notes);
  Future<String> support(int requesterid, String requestertype, String notes);
  Future<String> suggestion(int id, String sendertype, String notes);
  Future<GetCartModel> getbycart(int id);

  Future<GetCartModel> addQuotaiontocart(int qoutaionoOfferid, int cartId);

  Future<GetCartModel> addProductfromSerachtocart(int productid, int cartId);
  Future<String> confirmcart(int customerid, double x, double y, String city,
      String street, String country, int cartid);
  Future<String> cancelcart(int cartid);
  Future<GetCartModel> removecartitem(int cartid, int itemid);
  Future<List<MultiReqestQModel>> multirequestforquotationnotification(
      int vendorid, int requestid);
  Future<AutopartShop> getshopitems(String type, int page, int size);
  Future<BrandsEdit> editbrands(BrandsEditBody brandsEditBody);
  Future<String> getcustomerpoints(int customerid);
  Future<CartHistory> getcustomerordershistory(
      int page, int size, int customerid);
  Future<String> requesttoreturnitem(int customerid, int itemid, String reason);
  Future<ReturnRequestsModel> getreturnrequests(int id, int page, int size);
}
