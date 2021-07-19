import 'package:autopart/Ui/cart/bloc/cart_bloc.dart';

import 'package:autopart/core/style/base_color.dart';

import 'package:autopart/model/CustomerOffers.dart/CustomerOffers.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert' show utf8;
import 'package:fluttertoast/fluttertoast.dart';

class OneRequestDetailsScreen extends StatefulWidget {
  final Offer offer;
  OneRequestDetailsScreen(this.offer);

  @override
  _OneRequestDetailsScreenState createState() =>
      _OneRequestDetailsScreenState();
}

class _OneRequestDetailsScreenState extends State<OneRequestDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => CartBloc(),
        child: Scaffold(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 16, bottom: 3),
                                  child: Text(
                                    'Order: #${widget.offer.id}',
                                    style: TextStyle(
                                        fontSize: 15, color: heavyBlue),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 3, bottom: 3),
                                  child: widget.offer.notes !=null ?  Text(
                                    '${utf8.decode(widget.offer.notes.codeUnits)}',
                                  
                                    style: TextStyle(
                                        fontSize: 15, color: heavyBlue,fontFamily: "Arabic",),
                                    overflow: TextOverflow.ellipsis,
                                  ):Text("Note")
                                ),
                              ),
                              Container(
                                width: size.width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 3, bottom: 16),
                                  child: Text(
                                    'Request product',
                                    style: TextStyle(
                                        fontSize: 15, color: lightOrange),
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
                                borderRadius: BorderRadius.circular(100),
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
            leading: Icon(
              Icons.arrow_back_ios,
              color: lightOrange,
            ),
            title: Text(
              'Your Requests',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: heavyBlue),
            ),
          ),
          backgroundColor: bgColor,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: size.width * 0.18,
                              height: size.width * 0.18,
                              decoration: BoxDecoration(
                                color: lightOrange,
                                borderRadius: BorderRadius.circular(150),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.45,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 16, bottom: 3),
                                  child: Text(
                                    'Offer number 1 ',
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
                                      left: 8, right: 8, top: 16, bottom: 3),
                                  child: Text(
                                    '${widget.offer.creationDate.day}/${widget.offer.creationDate.month}/${widget.offer.creationDate.year}',
                                    style: TextStyle(
                                        fontSize: 13, color: heavyBlue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: size.width * 0.45,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 3, bottom: 3),
                              child:   widget.offer.notes !=null ?  Text(
                                    '${utf8.decode(widget.offer.notes.codeUnits)}',
                                  
                                    style: TextStyle(
                                        fontSize: 15, color: heavyBlue,fontFamily: "Arabic",),
                                    overflow: TextOverflow.ellipsis,
                                  ):Text("Note")
                            ),
                          ),
//                           Container(
//                             width: size.width * 0.45,
//                             child: Row(
//                               children: [
// //                                 Container(
// // //                                width: size.width*0.36,
// //                                   child: Padding(
// //                                     padding: const EdgeInsets.only(
// //                                         left: 3, right: 3, top: 3, bottom: 3),
// //                                     child: Text(
// //                                       'Quantity: ',
// //                                       style: TextStyle(
// //                                           fontSize: 14,
// //                                           color: heavyBlue,
// //                                           fontWeight: FontWeight.w200),
// //                                       overflow: TextOverflow.ellipsis,
// //                                     ),

// //                                   ),
// //                                 ),
//                                 Container(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 0, right: 0, top: 3, bottom: 3),
//                                     child: Text(
//                                       '4',
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           color: heavyBlue,
//                                           fontWeight: FontWeight.w300),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

                          Container(
                            width: size.width * 0.45,
                            child: Row(
                              children: [
                                Container(
//                                width: size.width*0.36,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3, top: 3, bottom: 3),
                                    child: Text(
                                      'Trade Name: ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w200),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 3, bottom: 3),
                                    child: Text(
                                      '${widget.offer.brand.name}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w300),
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
                                        left: 3, right: 3, top: 3, bottom: 3),
                                    child: Text(
                                      'CONDITION: ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w200),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 3, bottom: 3),
                                    child: Text(
                                      '${widget.offer.productCondition["label"]}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w300),
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
                                        left: 3, right: 3, top: 3, bottom: 3),
                                    child: Text(
                                      'CATEGORY: ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w200),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Expanded(
                                                                  child: Container(
                  
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0, top: 3, bottom: 3),
                                      child: Text(
                                        '${widget.offer.product.name}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: heavyBlue,
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.fade,
                                      ),
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
                                        left: 3, right: 3, top: 3, bottom: 3),
                                    child: Text(
                                      'Defects: ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w200),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 3, bottom: 3),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w300),
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
                                        left: 3, right: 3, top: 3, bottom: 3),
                                    child: Text(
                                      'Warranty: ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w200),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 3, bottom: 3),
                                    child: Text(
                                      '${widget.offer.warrantyMonths}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: heavyBlue,
                                          fontWeight: FontWeight.w300),
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
                                        left: 3, right: 3, top: 3, bottom: 16),
                                    child: Text(
                                      'Price: ',
                                      style: TextStyle(
                                          fontSize: 21, color: heavyBlue),
                                      overflow: TextOverflow.ellipsis,
                                      
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 3, bottom: 16),
                                    child: Text(
                                      '${widget.offer.fullPrice.toInt()}',
                                      style: TextStyle(
                                          fontSize: 21, color: lightBlues),
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
                  widget.offer.attachments != null
                      ? Container(
                          height: size.height * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.offer.attachments.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.2,
                                            width: size.width * 0.4,
                                            child: Image.network(
                                              '${widget.offer.attachments[0].publicUrl}',
                                              width: size.width * 0.3,
                                              height: size.width * 0.2,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocConsumer<CartBloc, CartState>(
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

                        if (state is AddProductState) {
                          if (state.success != null) {
                         
                           Fluttertoast.showToast(
                                    msg: "the offer added successfully to your cart",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: lightOrange,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                          }
                          else {
                                 Fluttertoast.showToast(
                                    msg: "There was a problem while adding offer to your cart",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: lightOrange,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                          
                          }
                        }
                      },
                      builder: (context, state) {
                        if (state is Loading) {
                          return CircularProgressIndicator(
                              backgroundColor: orange);
                        }

                        return GestureDetector(
                          onTap: () {
                          
                            context
                                .read<CartBloc>()
                                .add(AddQoutaionEvent(widget.offer.id));
                          },
                          child: Container(
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/main_bt_bg.png'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: orange,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
