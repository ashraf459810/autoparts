import 'dart:ui';

import 'package:autopart/Ui/CartHistory/CartHistory.dart';
import 'package:autopart/Ui/VendorUi/ChosenNotificationType.dart';
import 'package:autopart/Ui/VendorUi/EditBrands.dart';
import 'package:autopart/Ui/wallet/Wallet.dart';

import 'package:autopart/Ui/login_as_screen/login_as_screen.dart';

import 'package:autopart/Ui/VendorUi/VendorReports.dart';
import 'package:autopart/Ui/requests_screen/requests_screen.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/VendorInfoAfterVerify/VendorBrands.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autopart/Ui/VendorUi/vendorProducts.dart';
import 'package:autopart/Ui/vendorblocs/profilebloc/profilebloc_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'AppBar/AppBar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController customersupportcontroller = TextEditingController();
  String customersupport;
  TextEditingController reviewcontroller = TextEditingController();
  bool isvendor = true;
  String review;
  int rate;
  ProfileblocBloc p = ProfileblocBloc();
  String username = '';
  String email = '';
  List<VendorBrands> brand = [];

  NotificationBar bar = NotificationBar();

  int count = 0;
  PrefsHelper helper = PrefsHelper();

  @override
  initState() {
    p.add(Getisvendor());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder(
        bloc: p,
        builder: (context, state) {
          if (state is ProfileblocInitial) {
            return Center(child: Container(child: CircularProgressIndicator()));
          }

          if (state is Loading) {
            return Center(child: Container(child: CircularProgressIndicator()));
          }
          if (state is ISvendor) {
            print("here from the name state ");
            isvendor = state.isvendor;
            username = state.username;
            email = state.email;
            state.isvendor ? p.add(GetVendorBrands()) : Container();
          }
          if (state is RateState) {
            if (state.result == "Done") {
              Fluttertoast.showToast(
                  msg: "Your rate Addedd Successfuly",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: lightOrange,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
          if (state is GetVendorBrandsState) {
            print("the state of vendor brands");
            brand = state.brands;
            for (var i = 0; i < state.brands.length; i++) {
              print(brand[i].name);
            }
          }
          if (state is Error) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: lightOrange,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is SupportState) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: lightOrange,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is SuggetsionState) {
            Fluttertoast.showToast(
                msg: state.result,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: lightOrange,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: bar.appbar(context, isvendor)),
            backgroundColor: bgColor,
            body: Container(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.07),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 16, bottom: 3),
                                      child: Text(
                                        username,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: heavyBlue,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: size.width * 0.07),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 3, bottom: 16),
                                      child: Text(
                                        email,
                                        style: TextStyle(
                                            fontSize: 15, color: heavyBlue),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: size.width * 0.5,
                                  height: size.height * 0.0007,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.3,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: size.width * 0.069),
                                    isvendor
                                        ? Text("Your Brands")
                                        : Container(),
                                    SizedBox(width: size.width * 0.029),
                                    Container(
                                        width: size.width * 0.6,
                                        height: size.height * 0.04,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: brand.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 6),
                                              child: Text(
                                                "${brand[index].name}",
                                                style: TextStyle(
                                                    color: heavyBlue,
                                                    fontSize: 18),
                                              ),
                                            );
                                          },
                                        )),
                                    isvendor
                                        ? InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    EditBrands(
                                                  reset: () {
                                                    p.add(Getisvendor());
                                                  },
                                                ),
                                              ));
                                            },
                                            child: Container(
                                              height: size.height * 0.04,
                                              child: Center(
                                                child: Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                      color: heavyBlue),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ],
                            )
                          ]),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: size.width * 0.8,
                          child: Column(
                            children: [
                              isvendor
                                  ? InkWell(
                                      // check it laaaaaaaaaaaaaaaaater
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VendorProducts()));
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    right: 16,
                                                    top: 8,
                                                    bottom: 8),
                                                child: SvgPicture.asset(
                                                  "assets/images/Group174.svg",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Container(
                                                width: size.width * 0.54,
                                                child: Text(
                                                  'Products',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: heavyBlue),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: bgColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: heavyBlue,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Divider()
                                        ],
                                      ),
                                    )
                                  : Container(),
                              InkWell(
                                onTap: () {
                                  isvendor
                                      ? Navigator.of(context)
                                          .push(MaterialPageRoute(
                                          builder: (context) =>
                                              ChosenNotificationType(
                                            type: "SEND_PENDING",
                                          ),
                                        ))
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RequestsScreen()));
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: SvgPicture.asset(
                                        "assets/images/all order.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                        width: size.width * 0.55,
                                        child: !isvendor
                                            ? Text(
                                                'All My Requests',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: heavyBlue),
                                              )
                                            : Container(
                                                width: size.width * 0.55,
                                                child: Text(
                                                  'New Requests',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: heavyBlue),
                                                ),
                                              )),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: heavyBlue,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              !isvendor
                                  ? Column(
                                      children: [
                                        Divider(
                                          indent: 8,
                                          endIndent: 8,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  right: 16,
                                                  top: 8,
                                                  bottom: 8),
                                              child: SvgPicture.asset(
                                                "assets/images/pending shipments.svg",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Container(
                                              width: size.width * 0.55,
                                              child: Text(
                                                'Pending Shipments',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: heavyBlue),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: bgColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: heavyBlue,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(
                                          indent: 8,
                                          endIndent: 8,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  right: 16,
                                                  top: 8,
                                                  bottom: 8),
                                              child: SvgPicture.asset(
                                                "assets/images/pending payment.svg",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Container(
                                              width: size.width * 0.55,
                                              child: Text(
                                                'Pending Payments',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: heavyBlue),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: bgColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: heavyBlue,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(
                                          indent: 8,
                                          endIndent: 8,
                                        ),
                                      ],
                                    )
                                  : Divider(
                                      indent: 8,
                                      endIndent: 8,
                                    ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 16, top: 8, bottom: 8),
                                    child: SvgPicture.asset(
                                      "assets/images/finished.svg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.55,
                                    child: Text(
                                      'Finished Orders',
                                      style: TextStyle(
                                          fontSize: 12, color: heavyBlue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: heavyBlue,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                              ),
                              isvendor
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => VendorReports(),
                                        ));
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8,
                                                right: 16,
                                                top: 8,
                                                bottom: 8),
                                            child: SvgPicture.asset(
                                              "assets/images/pending payment.svg",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(
                                            width: size.width * 0.55,
                                            child: Text(
                                              'Reports & Statistics',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: heavyBlue),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: bgColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: heavyBlue,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: 1,
                                    ),
                              // Divider(
                              //   indent: 8,
                              //   endIndent: 8,
                              // ),
                              !isvendor
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Wallet(),
                                        ));
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8,
                                                right: 16,
                                                top: 8,
                                                bottom: 8),
                                            child: SvgPicture.asset(
                                              "assets/images/Group 196.svg",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(
                                            width: size.width * 0.55,
                                            child: Text(
                                              'My Wallet',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: heavyBlue),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: bgColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: heavyBlue,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: 1,
                                    ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                              ),

                              !isvendor
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => CartHistoryy(),
                                        ));
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5,
                                                right: 16,
                                                top: 8,
                                                bottom: 8),
                                            child: Icon(
                                              Icons.shopping_bag,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Container(
                                            width: size.width * 0.55,
                                            child: Text(
                                              'Cart History',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: heavyBlue),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: bgColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: heavyBlue,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: 1,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: size.width * 0.8,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 16, top: 8, bottom: 8),
                                    child: SvgPicture.asset(
                                      "assets/images/invite.svg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.55,
                                    child: Text(
                                      'Invite Friends',
                                      style: TextStyle(
                                          fontSize: 12, color: heavyBlue),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: heavyBlue,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  showAlertDialog(context, "Support");
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: SvgPicture.asset(
                                        "assets/images/support.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.55,
                                      child: Text(
                                        'Customer Support',
                                        style: TextStyle(
                                            fontSize: 12, color: heavyBlue),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: heavyBlue,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible:
                                          true, // set to false if you want to force a rating
                                      builder: (context) {
                                        return Builder(
                                          builder: (context) => RatingDialog(
                                              icon: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.rate_review_outlined,
                                                    size: 100,
                                                    color: orange,
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.01),
                                                  Container(
                                                    height: 40,
                                                    child: TextFormField(
                                                      maxLines: 1,
                                                      controller:
                                                          reviewcontroller,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 40,
                                                                right: 40),
                                                        hintText:
                                                            "Write a review here",
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      onChanged: (value) =>
                                                          review = value,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // set your own image/icon widget
                                              title: "Enjoying Autoparts?",
                                              description:
                                                  "Tap a star to set your rating",
                                              submitButton: "SUBMIT",
                                              positiveComment:
                                                  "We are so happy to hear that", // optional
                                              negativeComment:
                                                  "Thank you for your feedback", // optional
                                              accentColor: Colors.orange,
                                              // optional
                                              onSubmitPressed: (int rating) {
                                                rate = rating;
                                                if (isvendor == true) {
                                                  print("here from the event");

                                                  p.add(RateEvent(
                                                      isvendor: true,
                                                      notes: review,
                                                      rate: rate,
                                                      ratertype: "Vendor"));
                                                } else {
                                                  p.add(RateEvent(
                                                      isvendor: false,
                                                      notes: review,
                                                      rate: rate,
                                                      ratertype: "Customer"));
                                                }
                                              }),
                                        );
                                      });
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: SvgPicture.asset(
                                        "assets/images/rate.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.55,
                                      child: Text(
                                        'Rate Our App',
                                        style: TextStyle(
                                            fontSize: 12, color: heavyBlue),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: heavyBlue,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 8,
                                endIndent: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  showAlertDialog(context, "Suggestion");
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      child: SvgPicture.asset(
                                        "assets/images/suggest.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.55,
                                      child: Text(
                                        'Make a Suggestion',
                                        style: TextStyle(
                                            fontSize: 12, color: heavyBlue),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: heavyBlue,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    InkWell(
                      onTap: () async {
                        await helper.setislogin(false);
                        await helper.setvendorid(null);
                        await helper.setcustomerid(null);
                        await helper.setemail(null);
                        await helper.setusername(null);
                        await helper.setcartid(null);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginAsScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                border: Border.all(color: lightOrange)),
                            child: Center(
                              child: Text(
                                "LOG OUT",
                                style: TextStyle(
                                    color: lightOrange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  showAlertDialog(BuildContext context, String type) {
    // set up the button

    Widget okButton = InkWell(
      onTap: () {
        if (type == "Support") {
          p.add(SupportEvent(isvendor, customersupportcontroller.text));
          Navigator.of(context, rootNavigator: true).pop();
        } else {
          p.add(SuggestionEvent(isvendor, customersupportcontroller.text));
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
      child: Container(
        height: 47,
        width: 300,
        color: orange,
        child: Center(
            child: Text(
          "Confirm",
          style: TextStyle(color: Colors.black87, fontSize: 20),
        )),
      ),
    );

    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      title: Center(
        child: Text("please Type your issue here",
            style: TextStyle(color: Colors.black87, fontSize: 16)),
      ),
      content: Container(
        height: 47,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 200,
                child: TextFormField(
                  maxLines: 1,
                  controller: customersupportcontroller,
                  decoration: InputDecoration(
                    hintText: "Write your problem here",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => customersupport = value,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: alert);
      },
    );
  }
}
