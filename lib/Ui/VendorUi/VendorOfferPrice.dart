import 'package:autopart/core/style/base_color.dart';

import 'package:autopart/model/getVendorNotifications(requests)/GetVendorRequests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autopart/Ui/vendorblocs/AddofferBloc/bloc/addoffer_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:autopart/Ui/vendorblocs/RejectOffer/rejectoffer_bloc.dart';

// ignore: must_be_immutable
class VendorOfferPrice extends StatefulWidget {
  int orderid;
  Requests requests;
  VendorOfferPrice(this.requests);

  @override
  _VendorOfferPriceState createState() => _VendorOfferPriceState();
}

class _VendorOfferPriceState extends State<VendorOfferPrice> {
  double price;
  String _chosenValue;
  int priceinfls = 1;
  double priceinaed;
  String daystodeliver;
  String warranty;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MultiBlocProvider(
        providers: [
          BlocProvider<AddofferBloc>(
              create: (BuildContext context) => AddofferBloc()),
          BlocProvider<RejectofferBloc>(
            create: (BuildContext context) => RejectofferBloc(),
          ),
        ],
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(top: 95),
                  child: Container(
                    width: size.width * 0.12,
                    height: size.height * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      color: Colors.white,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/Image 2.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'New order',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: heavyBlue),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          Text(
                            'Order:#${widget.requests.id}',
                            style: TextStyle(fontSize: 15, color: heavyBlue),
                          ),
                        ],
                      ),
                      Text(
                        'note : ${widget.requests.notes}   ',
                        style: TextStyle(fontSize: 15, color: heavyBlue),
                      ),
                      Text(
                        'car type :${widget.requests.car.brand.name}',
                        style: TextStyle(fontSize: 15, color: heavyBlue),
                      ),
                      Text(
                        'car name :${widget.requests.car.name}',
                        style: TextStyle(fontSize: 15, color: heavyBlue),
                      ),
                      Text(
                        'Product Name : ${widget.requests.product.name}',
                        style: TextStyle(fontSize: 12, color: heavyBlue),
                      ),
                      // Text(
                      //   'Product Type   : ${widget.requests.daysToDeliver}',
                      //   style: TextStyle(fontSize: 12, color: heavyBlue),
                      // ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Price Offer Number : ${widget.requests.id}',
                        style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Enter your offer price',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: heavyBlue),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: size.width * 0.1,
                                      bottom: size.height * 0.02),
                                  hintText: 'AED',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                onSaved: (value) =>
                                    priceinaed = double.parse(value),
                                onChanged: (text) {
                                  setState(() {
                                    priceinaed = double.parse(text);
                                  });
                                }),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Text(",",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          SizedBox(width: size.width * 0.03),
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Fls',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    contentPadding: EdgeInsets.only(
                                        left: size.width * 0.1,
                                        bottom: size.height * 0.02)),
                                onChanged: (text) {
                                  setState(() {
                                    priceinfls = priceinfls + int.parse(text);
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.04,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Days to deliver',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    contentPadding: EdgeInsets.only(
                                        bottom: size.height * 0.018)),
                                onSaved: (value) => daystodeliver = value,
                                onChanged: (text) {
                                  setState(() {
                                    daystodeliver = text;
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.04,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'product warranty (by months)',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    contentPadding: EdgeInsets.only(
                                        bottom: size.height * 0.018)),
                                onSaved: (value) => warranty = value,
                                onChanged: (text) {
                                  setState(() {
                                    warranty = text;
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        color: Colors.white,
                        height: size.height * 0.04,
                        width: size.width * 0.8,
                        child: Center(
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            isExpanded: true,
                            focusColor: Colors.white,
                            value: _chosenValue,
                            elevation: 5,
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 16),
                            iconEnabledColor: Colors.grey[400],
                            items: <String>[
                              'LOW',
                              'GOOD',
                              'HIGH',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              );
                            }).toList(),
                            hint: Center(
                              child: Text(
                                "product condition",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      BlocListener<AddofferBloc, AddofferState>(
                          listener: (context, state) {
                        if (state is AddOfferState) {
                          Fluttertoast.showToast(
                              msg: "your offer sent successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: orange,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        if (state is AddOfferErrorState) {
                          Fluttertoast.showToast(
                              msg:
                                  "a problem occurred\n while adding your offer",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: orange,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }, child: Builder(builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            if (priceinaed != null &&
                                daystodeliver != null &&
                                warranty != null &&
                                _chosenValue != null) {
                            
                                print(priceinfls);
                                price = priceinaed + (priceinfls / 100);
                              

                              context.read<AddofferBloc>().add(AddOfferEvent(
                                  days: int.parse(daystodeliver),
                                  offerid: widget.requests.id,
                                  price: price,
                                  condition: _chosenValue,
                                  warranty: int.parse(warranty)));
                              print("order id is ${widget.orderid}");
                            } else {
                              Fluttertoast.showToast(
                                  msg: "please fill all the fields",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: orange,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: Container(
                            width: size.width * 0.65,
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
                                Visibility(
                                  visible: false,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: orange,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '     Add your offer',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(3.0),
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
                      })),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      BlocListener<RejectofferBloc, RejectofferState>(
                        listener: (context, state) {
                          if (state is RejecOfferState) {
                            Fluttertoast.showToast(
                                msg: "Your response has been sent successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: orange,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          if (state is RejectOfferError) {
                            Fluttertoast.showToast(
                                msg: "a problem occurred",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: orange,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        child: Builder(
                          builder: (context) => GestureDetector(
                            onTap: () {
                              context
                                  .read<RejectofferBloc>()
                                  .add(RejectOfferEvent(widget.orderid));
                            },
                            child: Container(
                              ////////////hereeeeeeeeeeeeeeeee the second bloc
                              width: size.width * 0.65,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/main_bt_bg.png'),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: false,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(200),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: orange,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'No offer for this request',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(200),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(3.0),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ],
          ),
        )));
  }
}
