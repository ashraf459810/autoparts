import 'package:autopart/Ui/cart/bloc/cart_bloc.dart' as cart;
import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:autopart/Ui/customer_notification_offer/bloc/customernotification_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autopart/model/customerOfferNotification/CustomerOfferNotification.dart';

class CustomerOfferDetails extends StatefulWidget {
  final int offerid;
  CustomerOfferDetails(this.offerid);

  @override
  _CustomerOfferDetailsState createState() => _CustomerOfferDetailsState();
}

class _CustomerOfferDetailsState extends State<CustomerOfferDetails> {
  cart.CartBloc cartBloc = cart.CartBloc();
  CustomerOfferNotification customerOfferNotification;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) =>
            CustomernotificationBloc()..add(GetOfferEvent(widget.offerid)),
        child:
            BlocConsumer<CustomernotificationBloc, CustomernotificationState>(
                listener: (context, state) {
    
          if (state is Error) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: lightOrange,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }, builder: (context, state) {
                if (state is RejectedState) {
            print("here from state rejected");

            return Scaffold(
              body: Center(
                child: Text(
                    "your request ${state.customerRejectedRequest.product.name} is not available",style: TextStyle(color: orange),),
              ),
            );
          }
          if (state is Loading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: orange,
                ),
              ),
            );
          }
          if (state is GetOfferState) {
            customerOfferNotification = state.customerOfferNotification;
          }
          return customerOfferNotification != null
              ? Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    centerTitle: false,
                    titleSpacing: 0,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(125.0),
                      child: Column(
                        children: [
                          Divider(
                            endIndent: 16,
                            indent: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Card(
                              margin: EdgeInsets.all(0.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: size.width * 0.8,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 16,
                                                bottom: 3),
                                            child: Text(
                                              'Order: #${customerOfferNotification.id}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: heavyBlue),
                                            )),
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 3,
                                              bottom: 3),
                                          child: Text(
                                            '${customerOfferNotification.notes}',
                                            style: TextStyle(
                                                fontSize: 15, color: heavyBlue),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 3,
                                              bottom: 16),
                                          child: Text(
                                            'Request product',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: lightOrange),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
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
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      'Your Requests',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: heavyBlue),
                    ),
                  ),
                  backgroundColor: bgColor,
                  body: SingleChildScrollView(
                    child: Container(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        width: size.width * 0.14,
                                        height: size.width * 0.14,
                                        decoration: BoxDecoration(
                                          color: lightOrange,
                                          borderRadius:
                                              BorderRadius.circular(150),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 5,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: size.width * 0.45,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 16,
                                                bottom: 3),
                                            child: Text(
                                              'Offer number 1',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: heavyBlue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.25,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 16,
                                                bottom: 3),
                                            child: Text(
                                              '${customerOfferNotification.creationDate.day}/${customerOfferNotification.creationDate.month}/${customerOfferNotification.lastModificationDate.year}',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: heavyBlue),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: size.width * 0.45,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 3,
                                            bottom: 3),
                                        child: Text(
                                          '${customerOfferNotification.notes}',
                                          style: TextStyle(
                                              fontSize: 14, color: heavyBlue),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.45,
                                      child: Row(
                                        children: [
                                          Container(
//                                width: size.width*0.36,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3,
                                                  right: 3,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                'Brand: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                '${customerOfferNotification.brand.name}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.8,
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3,
                                                  right: 3,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                'Trade Name: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                '${customerOfferNotification.product.name}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.45,
                                      child: Row(
                                        children: [
                                          Container(
//                                width: size.width*0.36,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3,
                                                  right: 3,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                'CONDITION: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                '${customerOfferNotification.productCondition.value}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.8,
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3,
                                                  right: 3,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                'CATEGORY: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                '${customerOfferNotification.objectType}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.45,
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3,
                                                  right: 3,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                'Defects: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.45,
                                      child: Row(
                                        children: [
                                          Container(
//                                width: size.width*0.36,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3,
                                                  right: 3,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                'Warranty: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w200),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 3,
                                                  bottom: 3),
                                              child: Text(
                                                '${customerOfferNotification.warrantyMonths}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: heavyBlue,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.45,
                                      child: Row(
                                        children: [
                                          Container(
//                                width: size.width*0.36,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3,
                                                  right: 3,
                                                  top: 3,
                                                  bottom: 16),
                                              child: Text(
                                                'Price: ',
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: heavyBlue),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 3,
                                                  bottom: 16),
                                              child: Text(
                                                '${customerOfferNotification.fullPrice.toInt()}',
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: lightBlues),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: customerOfferNotification
                                                .attachments.isNotEmpty
                                            ? Image.asset(
                                                '${customerOfferNotification.attachments[0]}',
                                                width: size.width * 0.4,
                                                height: size.width * 0.4,
                                                fit: BoxFit.fill,
                                              )
                                            : Container()),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: customerOfferNotification
                                                .attachments.isNotEmpty
                                            ? Image.asset(
                                                '${customerOfferNotification.attachments[1]}',
                                                width: size.width * 0.4,
                                                height: size.width * 0.4,
                                                fit: BoxFit.fill,
                                              )
                                            : Container()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/main_bt_bg.png'),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:
                                  BlocListener<cart.CartBloc, cart.CartState>(
                                bloc: cartBloc,
                                listener: (context, state) {
                                  if (state is cart.AddProductState) {}
                                },
                                child: InkWell(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "Added to cart Successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          backgroundColor: lightOrange,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      // Product product = Product(
                                      //     1,
                                      //     "",
                                      //     customerOfferNotification
                                      //         .product.name,
                                      //     customerOfferNotification.fullPrice,
                                      //     customerOfferNotification.status,
                                      //     customerOfferNotification.id);
                                      cartBloc.add(cart.AddQoutaionEvent(
                                          widget.offerid));
                                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Cart(),));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'ADD TO CART',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(200),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: orange,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container();
        }));
  }
}
