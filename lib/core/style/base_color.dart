import 'package:flutter/material.dart';

const baseColor = Color(0xFF10968d);
const fontColor = Color(0xFF022741);
const cyanColor = "#1baad4";

const heavyBlue = Color(0xFF515C6F);
const orange = Color(0xFFD9613D);
const lightOrange = Color(0xFFE48646);
const red = Color(0xFFDC0918);
const blue = Color(0xFF727C8E);
const containerColor = Colors.grey;
const textColor = Colors.black38;
const bgTextColor = Color(0xFFE5E6E8);
const green = Color(0xFF1DB712);
const bgColor = Color(0xFFF5F6F8);
const lightGreen = Color(0xFFADD172);
const lightRed = Color(0xFFFF6969);
const lightGray = Color(0xFF707070);
const darkBlue = Color(0xFF3076D8);
const lightBlues = Color(0xFF2D77F9);
const lightBlue = Color.fromARGB(25, 0, 181, 255);
const yalowColor = Color(0xFFFFA814);
const cayan = Color(0XFF8B9DFF);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.tryParse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
