import 'dart:ui';

import 'package:autopart/Ui/CartHistory/bloc/carthistory_bloc.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/CartHistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartHistoryItem extends StatefulWidget {
  final CartInfo cartInfo;
  CartHistoryItem({Key key, this.cartInfo}) : super(key: key);

  @override
  _CartHistoryItemState createState() => _CartHistoryItemState();
}

class _CartHistoryItemState extends State<CartHistoryItem> {
  TextEditingController controller = TextEditingController();
  String reason;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CarthistoryBloc(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  child: Text(
                    "Order#${widget.cartInfo.id}",
                    style: TextStyle(
                        color: heavyBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              elevation: 0,
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.7,
                child: ListView.builder(
                  itemCount: widget.cartInfo.currentCartItems.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Row(
                        children: [
                          Container(
                            height: size.height * 0.2,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: SizedBox(
                              height: size.height * 0.2,
                              width: size.width * 0.2,
                              child: widget.cartInfo.currentCartItems[index]
                                      .product.attachments.isNotEmpty
                                  ? Image.network(
                                      '${widget.cartInfo.currentCartItems[index].product.attachments[0].publicUrl}',
                                      width: size.width * 0.3,
                                      height: size.height * 0.1,
                                    )
                                  : Image.asset("assets/images/carIcon.png"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40, bottom: 40),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.04,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.02,
                                      width: size.width * 0.3,
                                      child: Text(
                                        "${widget.cartInfo.currentCartItems[index].product.name}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.grey,

                                            // overflow: TextOverflow
                                            // .ellipsis,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.023,
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Text(
                                        "${widget.cartInfo.currentCartItems[index].sourceTypeName}",
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: size.height * 0.02,
                                      width: size.width * 0.3,
                                      child: Text(
                                        "${widget.cartInfo.currentCartItems[index].brand.name}",
                                        style: TextStyle(
                                            color: green, fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.015,
                                ),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.3,
                                  child: Text(
                                    "${widget.cartInfo.currentCartItems[index].fullPrice}",
                                    style:
                                        TextStyle(color: orange, fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.08,
                          ),
                          GestureDetector(
                            onTap: () {
                              showAlertDialog(context,
                                  widget.cartInfo.currentCartItems[index].id);
                              print("here");
                            },
                            child:
                                BlocListener<CarthistoryBloc, CarthistoryState>(
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
                                if (state is ReturnItemState) {
                                  print("here should be toasst");
                                  Fluttertoast.showToast(
                                      msg:
                                          "your return order sent successfully",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: lightOrange,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    child: Icon(Icons.redo_outlined),
                                  ),
                                  Text("return")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(height: 0.5, color: Colors.grey[300]),
                    ]);
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            "TOTAL ",
                            style: TextStyle(
                                color: lightGray,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            ": ${widget.cartInfo.fullPrice}",
                            style: TextStyle(
                                color: lightGray,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.height * 0.01,
                          ),
                          Text(
                            "Address : ${widget.cartInfo.deliverStreet}",
                            style: TextStyle(color: lightGray, fontSize: 20),
                          ),
                        ],
                      ),
                      // Text(
                      //   "over 1000 AED",
                      //   style:
                      //       TextStyle(color: lightGray, fontSize: 12),
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, int id) {
    // set up the

    Widget okButton = InkWell(
      onTap: () {
        context.read<CarthistoryBloc>().add(ReturnItemEvent(id, reason));
        Navigator.of(context, rootNavigator: true).pop();
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
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Write your problem here",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => reason = value,
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
