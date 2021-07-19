
import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopReviewsPage extends StatefulWidget {
  @override
  _ShopReviewsPageState createState() => _ShopReviewsPageState();
}

class _ShopReviewsPageState extends State<ShopReviewsPage> {
  bool isVendor = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Image.asset("assets/images/review_cover.png",
                  width: size.width,
                  height: 200,
                  fit: BoxFit.fill,),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'AutoParts',
                        style: TextStyle(fontSize: 22,color: Colors.white),
                        textAlign: TextAlign.center,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Feel The Luxury of Exceptional Service',
                          style: TextStyle(fontSize: 15,color: Colors.white.withAlpha(150)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 20,
                  top: 50,
                  child: Icon(Icons.arrow_back_ios,
                    color: Colors.white,
                    ),
                ),

                Positioned(
                  right: 20,
                  top: 50,
                  child: Icon(Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: size.height - 200,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: lightOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Offers',
                            style: TextStyle(fontSize: 15,color: Colors.white),),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/images/discount.svg',),
                      )
                        ],
                      ),
                    ),
                  ),


                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: lightOrange,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('assets/images/discount.svg',),
                            ),
                          ),
                        ),

                        Container(
                          width: size.width*0.8,
                          child: Row(
                            children: [
                              Container(
                                width: size.width*0.6,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('50% OFF of everything at MAX store !!',
                                    style: TextStyle(fontSize: 15,color: heavyBlue),),
                                ),
                              ),

                              Container(
                                width: size.width*0.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('15 Oct',
                                    style: TextStyle(fontSize: 14,color: heavyBlue),),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: lightGreen,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('assets/images/tag.svg',),
                            ),
                          ),
                        ),

                        Container(
                          width: size.width*0.8,
                          child: Row(
                            children: [
                              Container(
                                width: size.width*0.6,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('BOGO Sale starting tomorrow. Don’t forget to check it out for great deals!',
                                    style: TextStyle(fontSize: 15,color: heavyBlue),),
                                ),
                              ),

                              Container(
                                width: size.width*0.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('20 Sep',
                                    style: TextStyle(fontSize: 14,color: heavyBlue),),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
