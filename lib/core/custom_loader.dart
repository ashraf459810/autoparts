

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constent.dart';

//Widget loader({context}){
//  return SpinKitCircle(
//    color: AppColor.orangeColor,
//    size: 60.0,
//  );
//}

Widget loader({context}){
  return Image.asset(
    "assets/gif/Loading.gif",
    height: 100.0,
    width: 100.0,
  );
}

Widget listLoader({context}){
  return SpinKitThreeBounce(
    color: AppColor.greenColor,
    size: 20.0,
  );
}