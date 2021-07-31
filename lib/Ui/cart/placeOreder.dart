import 'package:autopart/Ui/CartHistory/CartHistory.dart';
import 'package:autopart/Ui/cart/bloc/cart_bloc.dart';
import 'package:autopart/Ui/home/home.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/GetCartModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PlaceOrder extends StatefulWidget {
  final List<CurrentCartItem> cart;
  final String street;
  final String country;
  final String city;
  final double x;
  final double y;

  PlaceOrder(
      {Key key,
      this.cart,
      this.city,
      this.country,
      this.street,
      this.x,
      this.y})
      : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  TextEditingController messagecontroller = TextEditingController();
  String message;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close,
                    size: 25,
                    color: lightOrange,
                  ),
                )
              ],
              backgroundColor: bgColor,
              elevation: 0,
            )),
        body: BlocProvider(
          create: (context) => CartBloc(),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check out',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: heavyBlue),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text('SHIPPING ADDRESS',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      SizedBox(
                        height: size.height * 0.004,
                      ),
                      Text('${widget.country}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: heavyBlue)),
                      SizedBox(
                        height: size.height * 0.004,
                      ),
                      Text(widget.city,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(widget.street,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                          SizedBox(width: size.width * 0.44),
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.grey[200]),
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: heavyBlue,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                      // Text('P.O. Box 554531 Dubai',
                      //     style: TextStyle(
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.grey)),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Divider(
                        color: Colors.grey[200],
                        height: 0.2,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text('PAYMENT METHOD',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(children: [
                        Container(
                          height: size.height * 0.04,
                          width: size.width * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: SvgPicture.asset(
                            'assets/images/Group 35.svg',
                            height: 15,
                            width: 15,
                          ),
                        ),
                        Text("Master Card ending **00",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: heavyBlue)),
                        SizedBox(
                          width: size.width * 0.33,
                        ),
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey[200]),
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: heavyBlue,
                            size: 15,
                          ),
                        )
                      ]),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Divider(
                        color: Colors.grey[200],
                        height: 0.2,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('ITEMS',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ),
                      Container(
                        height: size.height * 0.25,
                        child: ListView.builder(
                          itemCount: widget.cart.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Container(
                                      height: size.height * 0.07,
                                      width: size.width * 0.12,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: widget.cart[index].product
                                              .attachments.isNotEmpty
                                          ? Image.network(widget.cart[index]
                                              .product.attachments[0].publicUrl)
                                          : Image.asset(
                                              "assets/images/carIcon.png"),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.025,
                                    ),
                                    Text(widget.cart[index].product.name,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: heavyBlue)),
                                    Text(widget.cart[index].sourceTypeName,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: green)),
                                    Text(
                                        widget.cart[index].fullPrice.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: lightOrange,
                                        )),
                                  ],
                                ),
                                SizedBox(width: size.width * 0.25),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 30),
                                //   child: Column(
                                //     children: [
                                //       Row(
                                //         children: [
                                //           GestureDetector(
                                //             onTap: () {
                                //               if (counter > 1) {
                                //                 counter--;
                                //               }
                                //               setState(() {});
                                //             },
                                //             child: Container(
                                //               height: size.height * 0.03,
                                //               width: size.width * 0.06,
                                //               decoration: BoxDecoration(
                                //                 borderRadius: BorderRadius.all(
                                //                     Radius.circular(30)),
                                //                 color: Colors.grey[400],
                                //               ),
                                //               child: Icon(
                                //                 Icons.remove,
                                //                 size: 15,
                                //                 color: Colors.black,
                                //               ),
                                //             ),
                                //           ),
                                //           // SizedBox(
                                //           //   width: size.width * 0.02,
                                //           // ),

                                //           // GestureDetector(
                                //           //   onTap: () {
                                //           //     counter++;
                                //           //     setState(() {});
                                //           //   },
                                //           //   child: Container(
                                //           //     height: size.height * 0.03,
                                //           //     width: size.width * 0.06,
                                //           //     decoration: BoxDecoration(
                                //           //       borderRadius: BorderRadius.all(
                                //           //           Radius.circular(30)),
                                //           //       color: Colors.grey[400],
                                //           //     ),
                                //           //     child: Icon(
                                //           //       Icons.add,
                                //           //       size: 15,
                                //           //       color: Colors.black,
                                //           //     ),
                                //           //   ),
                                //           // ),
                                //         ],
                                //       )
                                //     ],
                                //   ),
                                // )
                              ],
                            );
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey[200],
                        height: 0.2,
                      ),
                      Container(
                        height: size.height * 0.05,
                        child: Padding(
                          padding: EdgeInsets.only(left: 80),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "message to seller (optional)"),
                            controller: messagecontroller,

                            // "Select your product",
                            style: TextStyle(color: lightGray, fontSize: 14),
                            onSaved: (newValue) {
                              message = newValue;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[200],
                        height: 0.2,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/Path 16.svg',
                                    color: orange,
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  Text(
                                    "Add Promo Code",
                                    style:
                                        TextStyle(color: orange, fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: size.height * 0.03,
                                    width: size.width * 0.06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.grey[200]),
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: heavyBlue,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/Group 398.svg',
                                    color: orange,
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  Text(
                                    "Use your wallet",
                                    style:
                                        TextStyle(color: orange, fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: size.height * 0.03,
                                    width: size.width * 0.06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.grey[200]),
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: heavyBlue,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartHistory(),
                          ));
                        },
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/Group 405.svg',
                                      color: orange,
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    Text(
                                      "your cart history",
                                      style: TextStyle(
                                          color: orange, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.03,
                                      width: size.width * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: Colors.grey[200]),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: heavyBlue,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  Text(
                                    "TOTAL",
                                    style: TextStyle(
                                        color: lightGray, fontSize: 12),
                                  ),
                                  Text(
                                    "${widget.cart[0].fullPrice}",
                                    style: TextStyle(
                                        color: lightGray,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Free shipping on all orders",
                                    style: TextStyle(
                                        color: lightGray, fontSize: 12),
                                  ),
                                  Text(
                                    "over 1000 AED",
                                    style: TextStyle(
                                        color: lightGray, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.18),
                            Builder(
                              builder: (context) => InkWell(
                                onTap: () {
                                  print("here the confirm event");
                                  context.read<CartBloc>().add(ConfirmCart(
                                      widget.city,
                                      widget.country,
                                      widget.x,
                                      widget.y,
                                      widget.street));
                                },
                                child: BlocConsumer<CartBloc, CartState>(
                                  listener: (context, state) {
                                    if (state is ConfirmCartState) {
                                      Fluttertoast.showToast(
                                          msg: "Order Placed Successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor: lightOrange,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Home(),
                                        ),
                                        (route) => false,
                                      );
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
                                  },
                                  builder: (context, state) {
                                    return Container(
                                      height: size.height * 0.06,
                                      width: size.width * 0.35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: lightOrange,
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Place order",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: size.width * 0.02),
                                            Container(
                                              height: size.height * 0.03,
                                              width: size.width * 0.06,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.white),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: lightOrange,
                                                size: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        color: Colors.white,
                        height: size.height * 0.2,
                        width: size.width),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
