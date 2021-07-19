import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsTab extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
 

  DetailsTab(this.text1, this.text2, this.text3, );
  @override
  _DetailsTabState createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'BRAND',
                        style: TextStyle(fontSize: 12, color: heavyBlue),
                      ),
                      Text(
                        widget.text1,
                        style: TextStyle(fontSize: 12, color: heavyBlue),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'product',
                        style: TextStyle(
                            fontSize: 14,
                            color: heavyBlue,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        widget.text2,
                        style: TextStyle(
                            fontSize: 14,
                            color: heavyBlue,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'price',
                        style: TextStyle(
                            fontSize: 14,
                            color: heavyBlue,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        widget.text3,
                        style: TextStyle(
                            fontSize: 14,
                            color: heavyBlue,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
