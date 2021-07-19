import 'package:autopart/Ui/home/home.dart';


import 'package:autopart/core/style/base_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autopart/Ui/VendorUi/Vendornavbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sms_autofill/sms_autofill.dart';
import 'bloc/checkcode_bloc.dart';

// ignore: must_be_immutable
class VerifyEmailScreen extends StatefulWidget {
  String mobile;
  bool isvendor;
  VerifyEmailScreen({this.mobile, this.isvendor});

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

@override
Future<void> initState() async {
  await SmsAutoFill().listenForCode;
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController controller = TextEditingController();
  int s;
  String _code = "";

  @override
  Widget build(BuildContext context) {
    print(widget.mobile);

    var size = MediaQuery.of(context).size;
    return MultiBlocProvider(
        providers: [
      
          BlocProvider<Checkcode>(
            create: (context) => Checkcode(),
          ),
        ],
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          Container(
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login_bg.png'),
                      fit: BoxFit.fill)),
              child: Column(children: [
                SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: heavyBlue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/iphone.png',
                      width: size.width * 0.7,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 25,
                      left: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: size.width * 0.4,
                          child: Text(
                            'Check your Message',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 14,
                              color: orange,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: size.width * 0.9,
                  child: Text(
                    'Please enter the 4 digit code sent to',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      color: heavyBlue,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  child: Text(
                    widget.mobile,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: heavyBlue,
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: PinFieldAutoFill(
                      codeLength: 4,
                      decoration: UnderlineDecoration(
                        textStyle: TextStyle(fontSize: 20, color: Colors.black),
                        colorBuilder:
                            FixedColorBuilder(Colors.black.withOpacity(0.3)),
                      ),
                      currentCode: _code,
                      onCodeSubmitted: (code) {
                        // if (widget.isvendor == true) {
                        //   context.read<Checkcode>().add(
                        //       Codecheck(widget.mobile, code, widget.isvendor));
                        // } else {
                        //   context.read<Checkcode>().add(CheckCodeCustomer(
                        //       widget.mobile, code, widget.isvendor));
                        // }
                      },
                      onCodeChanged: (code) async {
                        if (code.length == 4) {
                          if (widget.isvendor == true) {
                            print(widget.mobile);
                            context.read<Checkcode>().add(Codecheck(
                                widget.mobile, code, widget.isvendor));
                          } else {
                            context.read<Checkcode>().add(CheckCodeCustomer(
                                widget.mobile, code, widget.isvendor));
                          }
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Resend code',
                    style: TextStyle(
                      fontSize: 19,
                      color: orange,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                BlocConsumer<Checkcode, CheckcodeState>(
                    listener: (context, state) {
                  if (state is Coderesult) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Home(),
                      ),
                      (route) => false,
                    );
                  }
                  if (state is VerifyError) {
                    Fluttertoast.showToast(
                        msg: state.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: lightOrange,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (state is CoderesultVendor) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => VendorNavBar(),
                      ),
                      (route) => false,
                    );
                  }
                }, builder: (context, state) {
                  if (state is Loading) {
                    return CircularProgressIndicator();
                  }

                  return GestureDetector(
                    onTap: () {
                      if (widget.isvendor == true) {
                        // String code = controller.text;
                        context.read<Checkcode>().add(Codecheck(
                            widget.mobile, controller.text, widget.isvendor));
                      } else {
                        // String code = controller.text;
                        context.read<Checkcode>().add(CheckCodeCustomer(
                            widget.mobile, controller.text, widget.isvendor));
                      }
                    },
                    child: Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/main_bt_bg.png'),
                            fit: BoxFit.fill),
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
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: orange,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Verify',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
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
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: orange,
                                  size: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: 35,
                )
              ]))
        ]))));
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16),
        filled: true,
        fillColor: Colors.white);
  }
}
