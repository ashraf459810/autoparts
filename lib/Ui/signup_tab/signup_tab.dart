import 'package:analyzer/file_system/file_system.dart';
import 'package:autopart/Ui/home/home.dart';
import 'package:autopart/Ui/signup_tab/creat_vendor_bloc.dart';
import 'package:autopart/Ui/VendorUi/Vendornavbar.dart';
import 'package:autopart/Ui/verify_email_screen/verify_email_screen.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/Ui/upload_image/UploadPic.dart';
import 'package:autopart/model/brand_model/brand_model.dart';
import 'package:autopart/model/createCustomer.dart';
import 'package:country_picker/country_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:autopart/model/vendor sign up model/vendor_sign_up.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'customerbloc/bloc/customerbloc_bloc.dart';

// ignore: must_be_immutable
class SignUpTab extends StatefulWidget {
  bool isVendor;
  SignUpTab({this.isVendor});

  @override
  _SignUpTabState createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  bool isChecked = false;
  bool isVerifyPageOn = false;
  bool isMoreDateVisible = true;
  String email;
  String fullname;
  String password;
  String idNumber;
  String sellerType;
  String tradeLicenseNumber;
  String taxVat;
  String contactNumber;
  String companyName;
  bool receiveNewsAndUpdatesEmails;
  String mobileNumber;
  String firstName = " ";
  String lastName = " ";
  String country = "select country";
  CreateVendorModel vendor = new CreateVendorModel();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tradeController = TextEditingController();
  TextEditingController taxVatController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController recieveNewemailController = TextEditingController();
  TextEditingController sellrTypeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController contactNmberController = TextEditingController();
  TextEditingController mobileNumberdController = TextEditingController();
  CreateVendorModel createVendorModel = CreateVendorModel();
  bool islegal = false;
  FocusNode f1 = FocusNode();

  List<Brands> brands = [];
  List<BrandModel> list = [];
  BrandModel item = BrandModel();
  List<int> ids = [];
  bool dropselected = false;
  List<String> brAnd = [];
  final _formKey = GlobalKey<FormState>();
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  List<int> photos = [];
  String sellermode;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("${widget.isVendor}" "vendor ?");

    return MultiBlocProvider(
        providers: [
          BlocProvider<CreatVendorBloc>(
              create: (context) => CreatVendorBloc()..add(Listbrands())),
          BlocProvider<CustomerblocBloc>(
            create: (context) => CustomerblocBloc(),
          ),
        ],
        child: Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/login_bg.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      // SizedBox(
                      //   height: 21,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            child: Container(
                              //                        width: size.width*0.85,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8,
                                                right: 16,
                                                top: 8,
                                                bottom: 8),
                                            child: SvgPicture.asset(
                                              "assets/images/mail.svg",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: size.width * 0.6,
                                                    child: Text(
                                                      'EMAIL',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: heavyBlue),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  width: size.width * 0.6,
                                                  height: 35,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextFormField(
                                                    controller: emailController,
                                                    autofocus: false,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'janedoe123@email.com',
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.grey[400],
                                                          fontSize: 16),
                                                    ),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        email = value;
                                                      });
                                                    },
                                                    onSaved: (value) =>
                                                        email = value,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8,
                                                right: 16,
                                                top: 8,
                                                bottom: 8),
                                            child: SvgPicture.asset(
                                              "assets/images/profile.svg",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: size.width * 0.6,
                                                      child: Text(
                                                        'Full Name',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: heavyBlue),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                    width: size.width * 0.6,
                                                    height: size.height * 0.04,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: TextFormField(
                                                      controller:
                                                          userNameController,
                                                      autofocus: false,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'janedoe12345',
                                                        hintStyle: TextStyle(
                                                            color: Colors
                                                                .grey[400],
                                                            fontSize: 16),
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          fullname = value;
                                                        });
                                                      },
                                                      onSaved: (value) =>
                                                          fullname = value,
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    widget.isVendor
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8,
                                                      right: 16,
                                                      top: 10,
                                                      bottom: 8),
                                                  child: SvgPicture.asset(
                                                    "assets/images/profile.svg",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width:
                                                              size.width * 0.6,
                                                          child: Text(
                                                            'Seller mode',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    heavyBlue),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: size.width * 0.6,
                                                      height: 35,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 1),
                                                        child:
                                                            DropdownButton< ////////check later
                                                                    String>(
                                                                value:
                                                                    sellermode,
                                                                items: [
                                                                  DropdownMenuItem(
                                                                    child: Text(
                                                                        "PERSOAL"),
                                                                    value:
                                                                        "PERSONAL",
                                                                  ),
                                                                  DropdownMenuItem(
                                                                    child: Text(
                                                                        "LEGAL"),
                                                                    value:
                                                                        "LEGAL",
                                                                  ),
                                                                ],
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    if (value ==
                                                                        "LEGAL") {
                                                                      islegal =
                                                                          true;
                                                                      sellermode =
                                                                          value;
                                                                    } else {
                                                                      islegal =
                                                                          false;
                                                                      sellermode =
                                                                          value;
                                                                    }
                                                                  });
                                                                },
                                                                hint: Text(
                                                                  "Select mode",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                              .grey[
                                                                          400]),
                                                                )),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(
                                            height: 1,
                                          ),
                                    widget.isVendor
                                        ? Column(
                                            children: [
                                              Divider(),
                                              Row(children: [
                                                SizedBox(
                                                    width: size.width * 0.14),
                                                Container(
                                                  width: size.width * 0.4,
                                                  child: Text(
                                                    'ID Number',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: heavyBlue,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 22,
                                                        right: 16,
                                                        bottom: 8),
                                                    child: SvgPicture.asset(
                                                      "assets/images/id_num.svg",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Container(
                                                      width: size.width * 0.38,
                                                      height: 35,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: TextFormField(
                                                          controller:
                                                              idNumberController,
                                                          autofocus: false,
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                '876543217',
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .grey[400],
                                                                fontSize: 16),
                                                          ),
                                                          onSaved: (value) =>
                                                              idNumber = value,
                                                          onChanged: (text) {
                                                            setState(() {
                                                              idNumber = text;
                                                            });
                                                          })),
                                                  InkWell(
                                                    onTap: () async {
                                                      List<int> ids = await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  UploadPic(
                                                                      phototag:
                                                                          "ID_NUMBER")));
                                                      getphotosId(ids, photos);
                                                      print(photos);
                                                    },
                                                    child: Container(
                                                      width: size.width * 0.28,
                                                      decoration: BoxDecoration(
                                                        color: heavyBlue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 8,
                                                                    right: 8),
                                                            child: Container(
                                                              width:
                                                                  size.width *
                                                                      0.15,
                                                              child: Text(
                                                                'Upload ID Image',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 7,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            200),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        1.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_up,
                                                                  color: orange,
                                                                  size: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8,
                                                          right: 16,
                                                          top: 8,
                                                          bottom: 8),
                                                      child: SvgPicture.asset(
                                                        "assets/images/seller_type.svg",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  width:
                                                                      size.width *
                                                                          0.55,
                                                                  child: Text(
                                                                    'Seller Type',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          heavyBlue,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Container(
                                                              width:
                                                                  size.width *
                                                                      0.55,
                                                              height: 35,
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            1),
                                                                child: DropdownButton< ////////check later
                                                                        String>(
                                                                    value: sellerType,
                                                                    items: [
                                                                      DropdownMenuItem(
                                                                        child: Text(
                                                                            "NEW"),
                                                                        value:
                                                                            "NEW",
                                                                      ),
                                                                      DropdownMenuItem(
                                                                        child: Text(
                                                                            "USED"),
                                                                        value:
                                                                            "USED",
                                                                      ),
                                                                      DropdownMenuItem(
                                                                        child: Text(
                                                                            "NEW&USED"),
                                                                        value:
                                                                            "ALL",
                                                                      ),
                                                                    ],
                                                                    onChanged: (value) {
                                                                      setState(
                                                                          () {
                                                                        sellerType =
                                                                            value;
                                                                        print(
                                                                            sellerType);
                                                                      });
                                                                    },
                                                                    hint: Text(
                                                                      "Select type",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.grey[400]),
                                                                    )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(),
                                              islegal
                                                  ? Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.14),
                                                              Container(
                                                                width:
                                                                    size.width *
                                                                        0.4,
                                                                height:
                                                                    size.height *
                                                                        0.022,
                                                                child: Text(
                                                                  'Trade License Number',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          heavyBlue),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: 15,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 8,
                                                                        right:
                                                                            14,
                                                                        top: 8,
                                                                        bottom:
                                                                            8),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      "assets/images/trade_license.svg",
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                      width: size
                                                                              .width *
                                                                          0.38,
                                                                      height: size
                                                                              .height *
                                                                          0.03,
                                                                      child: TextFormField(
                                                                          controller: tradeController,
                                                                          autofocus: false,
                                                                          decoration: InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.only(bottom: 10, left: 2),
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                '21453657',
                                                                            hintStyle:
                                                                                TextStyle(color: Colors.grey[400], fontSize: 16),
                                                                          ),
                                                                          onSaved: (newValue) => tradeLicenseNumber = newValue,
                                                                          onChanged: (text) {
                                                                            setState(() {
                                                                              tradeLicenseNumber = text;
                                                                            });
                                                                          })),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      final List<
                                                                              int>
                                                                          ids =
                                                                          await Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => UploadPic(phototag: "TRADE_LICENESE")));

                                                                      getphotosId(
                                                                          ids,
                                                                          photos);

                                                                      print(
                                                                          photos);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: size
                                                                              .width *
                                                                          0.28,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            heavyBlue,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 8, right: 8),
                                                                            child:
                                                                                Container(
                                                                              width: size.width * 0.15,
                                                                              child: Text(
                                                                                'Upload license image',
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.bold),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(5.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(200),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(1.0),
                                                                                child: Icon(
                                                                                  Icons.keyboard_arrow_up,
                                                                                  color: orange,
                                                                                  size: 12,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                          Divider(),
                                                        ])
                                                  : Container(
                                                      height: 1,
                                                    ),
                                              islegal
                                                  ? Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.14),
                                                              Container(
                                                                width:
                                                                    size.width *
                                                                        0.38,
                                                                height:
                                                                    size.height *
                                                                        0.022,
                                                                child: Text(
                                                                  'Tax/VAT Number',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          heavyBlue),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: 15,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 8,
                                                                        right:
                                                                            14,
                                                                        top: 8,
                                                                        bottom:
                                                                            8),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      "assets/images/taxVAT.svg",
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                      width: size
                                                                              .width *
                                                                          0.39,
                                                                      height:
                                                                          35,
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: TextFormField(
                                                                          controller: taxVatController,
                                                                          autofocus: false,
                                                                          decoration: InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.only(bottom: 10, left: 6),
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                '65438333',
                                                                            hintStyle:
                                                                                TextStyle(color: Colors.grey[400], fontSize: 16),
                                                                          ),
                                                                          onSaved: (newValue) => taxVat = newValue,
                                                                          onChanged: (text) {
                                                                            setState(() {
                                                                              taxVat = text;
                                                                            });
                                                                          })),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      final List<
                                                                              int>
                                                                          ids =
                                                                          await Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => UploadPic(phototag: "VAT_IMAGE")));

                                                                      getphotosId(
                                                                          ids,
                                                                          photos);
                                                                      print(
                                                                          photos);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: size
                                                                              .width *
                                                                          0.28,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            heavyBlue,
                                                                        borderRadius:
                                                                            BorderRadius.circular(50),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 8, right: 8),
                                                                            child:
                                                                                Container(
                                                                              width: size.width * 0.15,
                                                                              child: Text(
                                                                                'Upload Vat image',
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.bold),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(5.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(200),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(1.0),
                                                                                child: Icon(
                                                                                  Icons.keyboard_arrow_up,
                                                                                  color: orange,
                                                                                  size: 12,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                          Divider(),
                                                        ])
                                                  : Container(
                                                      height: 1,
                                                    ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 30),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 30,
                                                              right: 10),
                                                      child: SvgPicture.asset(
                                                        "assets/images/Group 192.svg",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  width:
                                                                      size.width *
                                                                          0.55,
                                                                  child: Text(
                                                                    'Brand Type',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color:
                                                                            heavyBlue),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            BlocBuilder<
                                                                CreatVendorBloc,
                                                                CreatVendorState>(
                                                              builder: (context,
                                                                  state) {
                                                                if (state
                                                                    is BrandState) {
                                                                  list = [];
                                                                  // ignore: unused_local_variable
                                                                  String s;
                                                                  for (var i =
                                                                          0;
                                                                      i <
                                                                          state
                                                                              .brands
                                                                              .length;
                                                                      i++) {
                                                                    s = state
                                                                        .brands[
                                                                            i]
                                                                        .name;
                                                                    list = state
                                                                        .brands;
                                                                  }
                                                                }
                                                                return Container(
                                                                  width:
                                                                      size.width *
                                                                          0.55,
                                                                  height: 35,
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                1),
                                                                    child: DropdownButton<
                                                                        BrandModel>(
                                                                      hint:
                                                                          Text(
                                                                        "Add your brands",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey[400]),
                                                                      ),
                                                                      items: list.map(
                                                                          (BrandModel
                                                                              value) {
                                                                        return DropdownMenuItem<
                                                                            BrandModel>(
                                                                          value:
                                                                              value,
                                                                          child:
                                                                              Text(value.name),
                                                                        );
                                                                      }).toList(),
                                                                      onChanged:
                                                                          (value) {
                                                                        String
                                                                            ss =
                                                                            value.name;
                                                                        int s =
                                                                            value.id;

                                                                        brands.add(
                                                                            Brands(id: s));

                                                                        if (brAnd
                                                                            .contains(ss)) {
                                                                        } else {
                                                                          brAnd.add(
                                                                              ss);
                                                                        }

                                                                        dropselected =
                                                                            true;
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              dropselected
                                                  ? Row(children: [
                                                      Container(
                                                        height:
                                                            size.height * 0.035,
                                                        width: size.width * 0.7,
                                                        child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              brAnd.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      7),
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        size.width *
                                                                            0.2,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(35)),
                                                                      color:
                                                                          heavyBlue,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    right: 0,
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        brAnd.removeAt(
                                                                            index);
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height: size.height *
                                                                            0.015,
                                                                        width: size.width *
                                                                            0.03,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(30)),
                                                                            color: lightGray),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Icon(
                                                                            Icons.close,
                                                                            size:
                                                                                8,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: 15,
                                                                    bottom: 7,
                                                                    child: Text(
                                                                      brAnd[
                                                                          index],
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ])
                                                  : Container(),
                                              Divider(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8,
                                                          right: 16,
                                                          top: 8,
                                                          bottom: 8),
                                                      child: SvgPicture.asset(
                                                        "assets/images/company_name.svg",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width:
                                                                  size.width *
                                                                      0.6,
                                                              child: Text(
                                                                'Company Name',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        heavyBlue),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                            width: size.width *
                                                                0.6,
                                                            height: 35,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child:
                                                                TextFormField(
                                                                    controller:
                                                                        companyNameController,
                                                                    autofocus:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          'Al-Saadi',
                                                                      hintStyle: TextStyle(
                                                                          color: Colors.grey[
                                                                              400],
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                    onSaved: (newValue) =>
                                                                        companyName =
                                                                            newValue,
                                                                    onChanged:
                                                                        (text) {
                                                                      setState(
                                                                          () {
                                                                        companyName =
                                                                            text;
                                                                      });
                                                                    }))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 12, top: 12),
                            child: Text(
                              'Verification code will be sent',
                              style: TextStyle(
                                fontSize: 12,
                                color: orange,
                              ),
                            ),
                          ),
                        ],
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
                                          key: _formKey,
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
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  mobileNumberdController,
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
                                                  contactNumber = mobileNumber;
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                isChecked = !isChecked;
                                setState(() {
                                  receiveNewsAndUpdatesEmails = isChecked;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black54, width: 1.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Icon(
                                    Icons.check,
                                    color: isChecked
                                        ? heavyBlue
                                        : Colors.transparent,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.75,
                              child: Text(
                                'I would like to receive news and updates by email',
                                overflow: TextOverflow.clip,
                                style:
                                    TextStyle(fontSize: 12, color: heavyBlue),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (widget.isVendor == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VendorNavBar(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Home(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: heavyBlue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      MultiBlocListener(
                        listeners: [
                          BlocListener<CustomerblocBloc, CustomerblocState>(
                            listener: (context, state) {
                              if (state is LoadingCustomer) {
                                final snackBar = SnackBar(
                                  content: Text('Loading ...'),
                                  backgroundColor: orange,
                                  duration: Duration(milliseconds: 30),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              if (state is Onerror) {
                                Fluttertoast.showToast(
                                    msg: state.error,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: lightOrange,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              if (state is CustomerCreated) {
                                print(state.customerResponse);
                                print(country + mobileNumberdController.text);
                                print(widget.isVendor);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerifyEmailScreen(
                                        mobile: country +
                                            mobileNumberdController.text,
                                        isvendor: widget.isVendor,
                                      ),
                                    ));
                              }
                            },
                          ),
                          BlocListener<CreatVendorBloc, CreatVendorState>(
                            listener: (context, state) {
                              if (state is Loading) {
                                final snackBar = SnackBar(
                                  content: Text('Loading ...'),
                                  backgroundColor: orange,
                                  duration: Duration(milliseconds: 30),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              if (state is CreateVendorSuccess) {
                                print(widget.isVendor);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyEmailScreen(
                                              mobile: country +
                                                  mobileNumberdController.text,
                                              isvendor: widget.isVendor,
                                            )));
                              }

                              if (state is Onerror) {
                                Fluttertoast.showToast(
                                    msg: "Wrong code try again",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: lightOrange,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                          )
                        ],
                        child: Builder(builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                if (widget.isVendor == false) {
                                  print(
                                      "here from customer check ${country + mobileNumberdController.text}");
                                  CreateCustomer createCustomer =
                                      CreateCustomer(
                                    mobileNumber:
                                        country + mobileNumberdController.text,
                                    contactNumber:
                                        country + mobileNumberdController.text,
                                    fullName: fullname,
                                    email: email,
                                    userName: fullname,
                                  );

                                  if (mobileNumber != null &&
                                      fullname != null &&
                                      email != null &&
                                      country != "select country") {
                                    context.read<CustomerblocBloc>().add(
                                        CreateCustomerevent(createCustomer));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "please fill all the fields",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor: lightOrange,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                } else {
                                  if (widget.isVendor == true)
                                    // ignore: unused_local_variable
                                    CreateVendorModel vendor =
                                        CreateVendorModel();

                                  List<Photos> iDs = [];
                                  for (var i = 0; i < photos.length; i++) {
                                    Photos p = Photos(id: photos[i]);
                                    iDs.add(p);
                                  }
                                  print(iDs);
                                  vendor = CreateVendorModel(
                                      mobileNumber: country +
                                          mobileNumberdController.text,
                                      companyName: companyName,
                                      contactNumber: country + contactNumber,
                                      email: email,
                                      idNumber: idNumber,
                                      brands: brands,
                                      receiveNewsAndUpdatesEmails:
                                          receiveNewsAndUpdatesEmails,
                                      sellerType: sellerType,
                                      taxVatNumber: taxVat,
                                      tradeLicenseNumber: tradeLicenseNumber,
                                      fullName: fullname,
                                      attachments: iDs,
                                      vendorType: sellermode);
                                  if (mobileNumber != null &&
                                      companyName != null &&
                                      brands != null &&
                                      sellerType != null &&
                                      sellermode != null &&
                                      fullname != null &&
                                      idNumber != null &&
                                      country != "select country") {
                                    context
                                        .read<CreatVendorBloc>()
                                        .add(CreateVendor(vendor));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "please fill all the fields",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor: lightOrange,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                }
                              } else {}
                            },
                            child: Container(
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/main_bt_bg.png'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: false,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(200),
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
                                    ////context
                                    // .read<CreatVendorBloc>()
                                    // .add(CreateVendor(
                                    //     createVendorModel));
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: BlocListener<CreatVendorBloc,
                                                  CreatVendorState>(
                                              listener: (context, state) {
                                                if (state is Loading) {
                                                  return CircularProgressIndicator();
                                                }
                                                if (state is Vendroerror) {
                                                  Fluttertoast.showToast(
                                                      msg: state.s,
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      backgroundColor:
                                                          lightOrange,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                                if (state
                                                    is CreateVendorSuccess) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              VerifyEmailScreen(
                                                                mobile: country +
                                                                    mobileNumberdController
                                                                        .text,
                                                                isvendor: widget
                                                                    .isVendor,
                                                              )));
                                                }
                                              },
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  'Sign up',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(200),
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
                                )),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16),
        filled: true,
        fillColor: Colors.white);
  }

  List<int> getphotosId(List<int> ids, List<int> list) {
    if (ids.isEmpty) {
      return ids;
    } else {
      for (var i = 0; i < ids.length; i++) {
        list.add(ids[i]);
      }
      return list;
    }
  }
}
