import 'package:autopart/Ui/search_screen/search_screen.dart';
import 'package:autopart/Ui/shop_profile/shop_profile.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:autopart/Ui/shop_reviews/shop_reviews.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: size.width,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: Text(
                      'Feel The Luxury of Exceptional Service',
                      style: TextStyle(
                          fontSize: 15, color: Colors.white.withAlpha(150)),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 21, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Autoparts Shop',
                        style: TextStyle(
                            fontSize: 30,
                            color: heavyBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  'assets/images/Base.png',
                                  width: size.width * 0.9,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                left: 25,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShopProfilePage()));
                                  },
                                  child: Container(
//                                      width: size.width*0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            'SEE MORE',
                                            style: TextStyle(
                                                color: heavyBlue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: lightOrange,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white,
                                                size: 21,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: size.height * 0.28,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 3, right: 3, top: 8, bottom: 8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/shutterstock.png',
                                  width: size.width * 0.21,
                                  height: 65,
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                    width: size.width * 0.21,
                                    child: Text(
                                      'Shock absor ba',
                                      style: TextStyle(
                                          color: heavyBlue, fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                Container(
                                    width: size.width * 0.21,
                                    child: Text(
                                      '139.99 AED',
                                      style: TextStyle(
                                          color: heavyBlue,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Request for Quotation',
                        style: TextStyle(
                            fontSize: 29,
                            color: heavyBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              'assets/images/Base.png',
                              width: size.width * 0.9,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 50,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()));
                        },
                        child: Container(
                          width: size.width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Request for Quotation',
                                  style: TextStyle(
                                      color: heavyBlue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: lightOrange,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 21,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShopReviewsPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: lightOrange,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                'assets/images/discount.svg',
                                height: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
