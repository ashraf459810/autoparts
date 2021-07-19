import 'dart:async';

import 'package:autopart/Ui/requests_screen/requests_screen.dart';
import 'package:autopart/model/QuotationReponse.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class OrderCompletedScreen extends StatefulWidget {
  String image;
  QuotationResponse qutationResponse = QuotationResponse();
  OrderCompletedScreen(this.qutationResponse,this.image);
  @override
  _OrderCompletedScreenState createState() => _OrderCompletedScreenState();
}

class _OrderCompletedScreenState extends State<OrderCompletedScreen> {
  @override
  void initState() {
    print("here the passed quotaion");
    print(widget.qutationResponse);
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => RequestsScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios,
            color: lightOrange,
          ),
          elevation: 0,
          centerTitle: false,
          flexibleSpace: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Divider(
                indent: 16,
                endIndent: 16,
              )
            ],
          ),
     
        ),
      ),
      backgroundColor: bgColor,
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Requested Completed !',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: heavyBlue,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Card(
                  color: bgColor,
                  elevation: 0,
                  margin: EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            '${widget.image}',
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: size.width * 0.45,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 16, bottom: 3),
                                  child: Text(
                                    'Order: #${widget.qutationResponse.id}',
                                    style: TextStyle(
                                        fontSize: 15, color: heavyBlue),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 16, bottom: 3),
                                  child: Text(
                                    '${widget.qutationResponse.creationDate.day}/${widget.qutationResponse.creationDate.month}/${widget.qutationResponse.creationDate.year}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: heavyBlue,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          widget.qutationResponse.notes != null
                              ? Container(
                                  width: size.width * 0.65,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 3, bottom: 3),
                                    child: Text(
                                      '  ${widget.qutationResponse.notes}  ',
                                      style: TextStyle(
                                          fontSize: 14, color: heavyBlue),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              : Container(),
                          Container(
                            width: size.width * 0.65,
                            child: Row(
                              children: [
                                Container(
                                  width: size.width * 0.55,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 3, bottom: 16),
                                    child: Text(
                                      'Price offer number : ',
                                      style: TextStyle(
                                          fontSize: 15, color: heavyBlue),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 3, bottom: 16),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          fontSize: 15, color: lightOrange),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
