import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/CartHistory.dart';
import 'package:flutter/material.dart';

class CartHistoryItem extends StatefulWidget {
  final CartInfo cartInfo;
  CartHistoryItem({Key key, this.cartInfo}) : super(key: key);

  @override
  _CartHistoryItemState createState() => _CartHistoryItemState();
}

class _CartHistoryItemState extends State<CartHistoryItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Scaffold(
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
      body: Column(
        children: [
          Container(
            height: size.height * 0.7,
            child: ListView.builder(
              itemCount: widget.cartInfo.cartItems.length,
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
                          child: widget.cartInfo.cartItems[index].product
                                  .attachments.isNotEmpty
                              ? Image.network(
                                  '${widget.cartInfo.cartItems[index].product.attachments[0].publicUrl}',
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
                                    "${widget.cartInfo.cartItems[index].product.name}",
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Text(
                                    "${widget.cartInfo.cartItems[index].sourceTypeName}",
                                    style: TextStyle(color: Colors.grey[400]),
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
                                    "${widget.cartInfo.cartItems[index].brand.name}",
                                    style:
                                        TextStyle(color: green, fontSize: 15),
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
                                "${widget.cartInfo.cartItems[index].fullPrice}",
                                style: TextStyle(color: orange, fontSize: 15),
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
                        "Address : Dubai alwade street",
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
    );
  }
}
