import 'package:autopart/Ui/VendorUi/VendorProductDetails.dart';
import 'package:autopart/Ui/vendorblocs/VendorHomeScreen/vendorhomescreen_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/VendorProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorHomePage extends StatefulWidget {
  VendorHomePage({Key key}) : super(key: key);

  @override
  _VendorHomePageState createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage>
    with SingleTickerProviderStateMixin {
  int pages = 0;
  int ssize = 20;
  bool iseventdone = false;
  String type;
  VendorhomescreenBloc vendorhomescreenBloc = VendorhomescreenBloc();
  List<Content> newproducts = [];
  List<Content> usedproducts = [];
  ScrollController newproductscontroller = ScrollController();
  ScrollController usedproductscontroller = ScrollController();

  @override
  void initState() {
    vendorhomescreenBloc.add(GetUsedProducts(pages, "USED", ssize));

    vendorhomescreenBloc.add(GetNewProducts(pages, "NEW", ssize));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      height: size.height,
      child: Column(
        children: [
          Container(
            height: size.height * 0.218,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: size.width,
                  height: size.height * 0.23,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: size.height * 0.17,
                  left: 0,
                  right: 0,
                  child: Text(
                    'Feel The Luxury of Exceptional Service',
                    style: TextStyle(
                        fontSize: 15, color: Colors.white.withAlpha(150)),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: size.height - size.height * 0.32,
            child: Stack(children: [
              Opacity(
                opacity: 0.1,
                child: Container(
                  height: size.height * 0.8,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/login_bg.png',
                        ),
                        fit: BoxFit.fill),
                    color: lightGray,
                  ),
                ),
              ),
              BlocBuilder(
                  bloc: vendorhomescreenBloc,
                  builder: (context, state) {
                    if (state is VendorhomescreenInitial) {
                      return Container(
                          child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: orange,
                        ),
                      ));
                    }

                    if (state is VendorProductsUsedState) {
                      usedproducts = state.usedProducts;
                    }
                    if (state is VendorProductsNewState) {
                      newproducts = state.newproducts;
                      iseventdone = true;
                    }
                    return Column(children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text(
                            "New",
                            style: TextStyle(
                                color: lightOrange,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width * 0.6,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 10),
                          //   child: Text(
                          //     "SEE ALL",
                          //     style: TextStyle(
                          //         color: lightOrange,
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                        width: size.width,
                        child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification is ScrollEndNotification &&
                                  newproductscontroller.position.extentAfter ==
                                      0) {
                                print("here from listener");
                                pages++;
                                print(pages);

                                vendorhomescreenBloc
                                    .add(GetNewProducts(pages, "NEW", ssize));
                              }

                              return false;
                            },
                            child: newproducts.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: newproducts.length,
                                    controller: newproductscontroller,
                                    itemBuilder: (context, position) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(
                                              content: newproducts[position],
                                            ),
                                          ));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Container(
                                            width: size.width * 0.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                                color: Colors.white),
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.15,
                                                      width: size.width * 0.3,
                                                      child: newproducts[
                                                                  position]
                                                              .attachments
                                                              .isNotEmpty
                                                          ? Image.network(
                                                              newproducts[
                                                                      position]
                                                                  .attachments[
                                                                      0]
                                                                  .publicUrl)
                                                          : Image.asset(
                                                              "assets/images/carIcon.png")),
                                                  Container(
                                                    color: Colors.white,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            newproducts[
                                                                    position]
                                                                .product
                                                                .name,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              color: heavyBlue,
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            "price:${newproducts[position].price}",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    heavyBlue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : iseventdone
                                    ? Container(
                                        child: Center(
                                            child: Text(
                                        "You didn't add products yet",
                                        style: TextStyle(
                                            fontSize: 16, color: orange),
                                      )))
                                    : Container(
                                        height: 10,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: orange,
                                          ),
                                        ))),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text(
                            "USED",
                            style: TextStyle(
                                color: lightOrange,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width * 0.55,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 10),
                          //   child: Text(
                          //     "SEE ALL",
                          //     style: TextStyle(
                          //         color: lightOrange,
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                        width: size.width,
                        child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification is ScrollEndNotification &&
                                  usedproductscontroller.position.extentAfter ==
                                      0) {
                                print("here from listener");
                                pages++;
                                print(pages);

                                vendorhomescreenBloc
                                    .add(GetNewProducts(pages, "USED", ssize));
                              }

                              return false;
                            },
                            child: usedproducts.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: usedproducts.length,
                                    controller: usedproductscontroller,
                                    itemBuilder: (context, position) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(
                                              content: usedproducts[position],
                                            ),
                                          ));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Container(
                                            width: size.width * 0.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                                color: Colors.white),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.15,
                                                      width: size.width * 0.3,
                                                      child: usedproducts[
                                                                  position]
                                                              .attachments
                                                              .isNotEmpty
                                                          ? Image.network(
                                                              usedproducts[
                                                                      position]
                                                                  .attachments[
                                                                      0]
                                                                  .publicUrl)
                                                          : Image.asset(
                                                              "assets/images/carIcon.png")),
                                                  Text(
                                                    usedproducts[position]
                                                        .product
                                                        .name,
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: heavyBlue,
                                                    ),
                                                  ),
                                                  Text(
                                                    "price :${usedproducts[position].price.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: heavyBlue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : usedproducts.isEmpty
                                    ? Container(
                                        child: Center(
                                            child: Text(
                                        "You didn't add products yet",
                                        style: TextStyle(
                                            fontSize: 16, color: orange),
                                      )))
                                    : Container),
                      ),
                      // SizedBox(height: size.height * 0.03),
                      // Row(
                      //   children: [
                      //     SizedBox(width: size.width * 0.02),
                      //     Text(
                      //       "Statistics",
                      //       style: TextStyle(
                      //           color: lightGray,
                      //           fontSize: 30,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      //   width: size.width,
                      // ),
                      // Container(
                      //     height: size.height * 0.2,
                      //     width: size.width * 0.9,
                      //     color: Colors.white,
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 SvgPicture.asset(
                      //                   "assets/images/Group174.svg",
                      //                 ),
                      //                 SizedBox(
                      //                   width: size.width * 0.07,
                      //                 ),
                      //                 Text(
                      //                   'My Products Number',
                      //                   style: TextStyle(
                      //                     fontSize: 17,
                      //                     color: lightGray,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             Text("24 ",
                      //                 style: TextStyle(
                      //                     color: lightOrange,
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.bold)),
                      //           ],
                      //         ),
                      //         Divider(),
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 SizedBox(
                      //                   width: 0.03,
                      //                 ),
                      //                 SvgPicture.asset(
                      //                     "assets/images/Group183.svg"),
                      //                 SizedBox(
                      //                   width: size.width * 0.085,
                      //                 ),
                      //                 Text(
                      //                   'Most Of The Products Sold',
                      //                   style: TextStyle(
                      //                       fontSize: 17, color: lightGray),
                      //                 ),
                      //               ],
                      //             ),
                      //             Text("12 ",
                      //                 style: TextStyle(
                      //                     color: lightOrange,
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.bold)),
                      //           ],
                      //         ),
                      //         Divider(),
                      //         Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 SvgPicture.asset(
                      //                     "assets/images/Group189.svg"),
                      //                 SizedBox(
                      //                   width: size.width * 0.1,
                      //                 ),
                      //                 Text(
                      //                   'Your Products Rate',
                      //                   style: TextStyle(
                      //                       fontSize: 17, color: lightGray),
                      //                 ),
                      //               ],
                      //             ),
                      //             Text("5.0",
                      //                 style: TextStyle(
                      //                     color: lightOrange,
                      //                     fontSize: 17,
                      //                     fontWeight: FontWeight.bold)),
                      //           ],
                      //         ),
                      //       ],
                      //     )),
                    ]);
                  })
            ]),
          ),
        ],
      ),
    ));
  }
}
