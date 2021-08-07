import 'package:autopart/Ui/signin_tab/bloc/signin_bloc.dart';

import 'package:autopart/Ui/verify_email_screen/verify_email_screen.dart';

import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/style/base_color.dart';

// ignore: must_be_immutable
class SignInTab extends StatefulWidget {
  bool isvendor;
  SignInTab({this.isvendor});

  @override
  _SignInTabState createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  bool selected = false;
  String country = "select country";
  String mobileNumber;

  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNumbercontroller = TextEditingController();
  FocusNode f1 = FocusNode();

  GoogleSignIn googleSignIn = GoogleSignIn();
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => SigninBloc(),
        child: Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Card(
                      child: Container(
                        height: size.height * 0.13,
                        width: size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.02),
                            Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                Container(
                                  child: Text(
                                    'Mobile Number',
                                    style: TextStyle(
                                        fontSize: 12, color: heavyBlue),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                GestureDetector(
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      country,
                                      style: TextStyle(
                                          fontSize: 12, color: orange),
                                    )),
                                  ),
                                  onTap: () {
                                    showCountryPicker(
                                        showPhoneCode: true,
                                        countryFilter: <String>[
                                          'AE',
                                          'SA',
                                          'OM',
                                          'QA'
                                        ],
                                        context: context,
                                        onSelect: (Country value) {
                                          setState(() {
                                            country = value.phoneCode;

                                            FocusScope.of(context)
                                                .requestFocus(f1);
                                          });
                                        });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.1,
                                ),
                                SizedBox(
                                  child: Container(
                                      width: size.width * 0.4,
                                      height: 35,
                                      alignment: Alignment.centerLeft,
                                      child: Form(
                                        key: formKey,
                                        child: TextFormField(
                                            validator: (value) {
                                              if (value.startsWith("0")) {
                                                return "no need for the first digit";
                                              }
                                              if (value.isEmpty) {
                                                return "please fill the number";
                                              }
                                              if (value.length > 10) {
                                                return "please check number";
                                              }
                                              return null;
                                            },
                                            focusNode: f1,
                                            keyboardType: TextInputType.number,
                                            controller: mobileNumbercontroller,
                                            autofocus: false,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 15, bottom: 10),
                                              border: InputBorder.none,
                                              hintText: '999999999',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 16),
                                            ),
                                            onSaved: (newValue) =>
                                                mobileNumber = newValue,
                                            onChanged: (text) {
                                              setState(() {
                                                mobileNumber = text;
                                              });
                                            }),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'By creating an account, you agree to our',
                            style: TextStyle(fontSize: 12, color: heavyBlue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Terms of Service',
                              style:
                                  TextStyle(fontSize: 12, color: lightOrange),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              ' and ',
                              style: TextStyle(fontSize: 12, color: heavyBlue),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Privacy Policy',
                              style:
                                  TextStyle(fontSize: 12, color: lightOrange),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    BlocConsumer<SigninBloc, SigninState>(
                      builder: (context, state) {
                        if (state is Loading) {
                          return CircularProgressIndicator();
                        }
                        return signButton(size.width);
                      },
                      listener: (context, state) {
                        if (state is SignError) {
                          Fluttertoast.showToast(
                              msg: state.s,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: lightOrange,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        if (state is SignState) {
                          print("here from state");
                          if (widget.isvendor == true) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VerifyEmailScreen(
                                        isvendor: widget.isvendor,
                                        mobile: country + mobileNumber),
                              ),
                              (route) => false,
                            );
                          }
                        }
                        if (state is SignCustomerState) {
                          if (widget.isvendor == false) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VerifyEmailScreen(
                                  isvendor: widget.isvendor,
                                  mobile: country + mobileNumber,
                                ),
                              ),
                              (route) => false,
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16),
//        filled: true,
        fillColor: Colors.white);
  }

  Widget signButton(double s) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            if (country != "select country") {
              if (widget.isvendor == true) {
                print("vendor = true");
                if (formKey.currentState.validate() && mobileNumber != null) {
                  context.read<SigninBloc>().add(Sign(country + mobileNumber));
                }
              } else {
                if (formKey.currentState.validate() && mobileNumber != null) {
                  context
                      .read<SigninBloc>()
                      .add(SignCustomer(mobile: country + mobileNumber));
                }
              }
            } else {
              Fluttertoast.showToast(
                  msg: "please fill all the fields",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: lightOrange,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: Container(
            width: s * 0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/main_bt_bg.png'),
                  fit: BoxFit.fill),
              //                      color: orange,
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
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Sign in',
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
      },
    );
  }
}
