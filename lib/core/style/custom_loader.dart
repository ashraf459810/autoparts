

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'base_color.dart';


Widget loader({context}){
  return SpinKitFadingFour(
    color: HexColor(cyanColor),
    size: 50.0,
  );
}

Widget listLoader({context}){
  return SpinKitThreeBounce(
    color: baseColor,
    size: 20.0,
  );
}

Widget circleLoader({context}){
  return SpinKitFadingCircle(
    color: HexColor(cyanColor),
    size: 100.0,
   );
}