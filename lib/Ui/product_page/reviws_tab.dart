
import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ReviewsTab extends StatefulWidget {
  @override
  _ReviewsTabState createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('MR', style: TextStyle(fontSize: 22,color: Colors.teal)),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: size.width*0.7,
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: size.width*0.25,
                                height: size.height*0.028,
                                child: RatingBar.builder(
                                  initialRating: 3.5,
                                  ignoreGestures: false,
                                  minRating: 1,
                                  updateOnDrag: false,
                                  itemSize: size.width*0.05,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: lightRed,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              Container(
                                width: size.width*0.25,
                                height: size.height*0.028,
                                color: Colors.transparent,
                              )
                            ],
                          ),

                          Container(
                            width: size.width*0.28,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('10 Oct, 2020',
                                style: TextStyle(fontSize: 14,color: heavyBlue),),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        width: size.width*0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text('Mohanad Riad',
                                style: TextStyle(fontSize: 15,color: heavyBlue,fontWeight: FontWeight.w400),),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: size.width*0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                width: size.width*0.7,

                                child: Text('Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore',
                                  style: TextStyle(fontSize: 14,color: heavyBlue,fontWeight: FontWeight.w300),overflow: TextOverflow.clip,),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Image.asset('assets/images/grear.png',
                            width: 60,height: 60,
                            fit: BoxFit.fill,),
                        ],
                      ),

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
