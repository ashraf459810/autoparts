import 'package:autopart/Ui/signup_tab/signup_tab.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:flutter/material.dart';

import 'package:autopart/Ui/signin_tab/signin_tab.dart';

// ignore: must_be_immutable
class SignInUpTabs extends StatefulWidget {
  bool isVendor;
  SignInUpTabs({this.isVendor});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInUpTabs> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Image.asset("assets/images/logo.png",
                  width: size.width,
                  height: 150,
                  fit: BoxFit.fill,),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Text(
                    'Feel The Luxury of Exceptional Service',
                    style: TextStyle(fontSize: 15,color: Colors.white.withAlpha(150)),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),




          Container(
            child: TabBar(
              unselectedLabelColor: Colors.blueGrey,
              labelColor: heavyBlue,
              indicator: BoxDecoration(
                //This is for background color
                  image: DecorationImage(image: AssetImage('assets/images/gradient.png'),alignment: Alignment.bottomCenter),
                  ),
              tabs: [
                Tab(
                  text: 'SIGN IN',
                ),
                Tab(
                  text: 'SIGN UP',
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                SignInTab(isvendor: widget.isVendor),
                SignUpTab(isVendor: widget.isVendor)
              ],
              controller: _tabController,
            ),
          ),
    /*      Container(
            height: size.height - 200,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/login_bg.png'),
                    fit: BoxFit.fill)
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Login as',
                      style: TextStyle(fontSize: 30,color: heavyBlue),),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: size.width*0.38,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8,right: 8,top: 24,bottom: 24),
                                  child: SvgPicture.asset("assets/images/vendor.svg",
                                    fit: BoxFit.fill,),
                                ),

                                Row(
                                  children: [
                                    Text('As a ',
                                      style: TextStyle(fontSize: 16,color: heavyBlue),),

                                    Text('Vendor',
                                      style: TextStyle(fontSize: 16,color: heavyBlue,fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),


                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: size.width*0.38,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8,right: 8,top: 24,bottom: 24),
                                  child: SvgPicture.asset("assets/images/customer.svg",
                                    fit: BoxFit.fill,),
                                ),

                                Row(
                                  children: [
                                    Text('As a ',
                                      style: TextStyle(fontSize: 16,color: heavyBlue),),

                                    Text('Customer',
                                      style: TextStyle(fontSize: 16,color: heavyBlue,fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height*0.2,),


                  Container(
                    width: size.width*0.9,
                    decoration: BoxDecoration(
                      color: orange,
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
                                borderRadius: BorderRadius.circular(200),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_forward_ios,color: orange,size: 25,),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),

                          textAlign: TextAlign.center,

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(Icons.arrow_forward_ios,color: orange,size: 18,),
                            ),
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          )*/
        ],
      ),
    );
  }
}
