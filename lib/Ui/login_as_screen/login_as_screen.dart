import 'package:autopart/Ui/sign_in_up_tabs/sign_in_up_tabs.dart';
import 'package:autopart/core/style/base_color.dart';


import 'package:flutter/material.dart';


import 'package:flutter_svg/flutter_svg.dart';

class LoginAsScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginAsScreen> {
  
  @override
  void initState() {
    
    super.initState();
  }

  bool isVendor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
          Container(
            height: size.height - 180,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.png'),
                    fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Log in as',
                    style: TextStyle(fontSize: 30, color: heavyBlue),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.4,
                        child: Card(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              isVendor = true;
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignInUpTabs(isVendor: isVendor)));
                              //  setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: size.width * 0.38,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          top: 24,
                                          bottom: 24),
                                      child: SvgPicture.asset(
                                        "assets/images/vendor.svg",
                                        color: lightOrange,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'As a ',
                                          style: TextStyle(
                                              fontSize: 16, color: heavyBlue),
                                        ),
                                        Text(
                                          'Vendor',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: heavyBlue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.4,
                        child: Card(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              isVendor = false;
                              setState(() {});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignInUpTabs(isVendor: isVendor)));
                              //setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                width: size.width * 0.38,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          top: 24,
                                          bottom: 24),
                                      child: SvgPicture.asset(
                                        "assets/images/customer.svg",
                                        color: lightOrange,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'As a ',
                                          style: TextStyle(
                                              fontSize: 16, color: heavyBlue),
                                        ),
                                        Text(
                                          'Customer',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: heavyBlue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
