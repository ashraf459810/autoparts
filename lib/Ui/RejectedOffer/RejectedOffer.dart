import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';

class RejectedOffer extends StatefulWidget {
  RejectedOffer({Key key}) : super(key: key);

  @override
  _RejectedOfferState createState() => _RejectedOfferState();
}

class _RejectedOfferState extends State<RejectedOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Container(
        child: Text("Sorry..The product not available",style:TextStyle(color: orange,fontWeight: FontWeight.bold,fontSize: 18),),
      )),
    ));
  }
}
