import 'package:autopart/Ui/VendorUi/AppBar/AppBar.dart';
import 'package:autopart/Ui/search_old_product/search_old_product.dart';
import 'package:autopart/Ui/search_result_screen/search_result_screen.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';

import 'package:autopart/model/brand_model/brand_model.dart';
import 'package:autopart/model/car_model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:autopart/Ui/search_old_product/Search_new_product/SearchNewProduct.dart';
import 'package:autopart/Ui/search_screen/bloc/searchscreen_bloc.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController productnameController = TextEditingController();
  TextEditingController lowpricecontroller = TextEditingController();
  TextEditingController hightpricecontroller = TextEditingController();
  String hightprice;
  String lowprice;
  String productname = " ";
  String profilehint = "Type product name";
  String profiletitle = "Name";
  PrefsHelper prefsHelper = PrefsHelper();
  NotificationBar bar = NotificationBar();
  String profileimage = "assets/images/profile.svg";
  String selectedbrand;
  int carid;
  String selectedcar;
  List<BrandModel> brandlist = [];
  int brandid;
  String lowpriceimage = 'assets/images/Group 322.svg';
  String hightpriceimage = 'assets/images/Group 321.svg';
  List<CarModel> carlist = [];
  List<String> caryears = [
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021"
  ];
  int pages = 0;
  int ssize = 10;
  String selectedcaryear;
  bool isvendor = false;
  SearchscreenBloc bloc = SearchscreenBloc();
  @override
  initState() {
    bloc..add(Isvendor());
    bloc..add(GetBrandsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double hi = size.height;
    double wi = size.width;
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is IsvendorState) {
          isvendor = state.isvendor;
        }
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: bar.appbar(context, false)),
          backgroundColor: bgColor,
          body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.png'),
                    fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
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
                                    height: 180,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  bottom: 25,
                                  left: 25,
                                  child: InkWell(
                                    onTap: () {
//                                Navigator.push(context,
//                                    MaterialPageRoute(builder: (context) => ShopProfilePage()));
                                    },
                                    child: InkWell(
                                      onTap: () {},
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                SearchNewProduct(),
                                          ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: Text(
                                                  'Search New Products',
                                                  style: TextStyle(
                                                      color: heavyBlue,
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: lightOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
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
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 15,
                          child: Image.asset(
                            'assets/images/newproduct.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
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
                                    'assets/images/used_product.png',
                                    width: size.width * 0.9,
                                    height: 180,
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
                                                  Quotation()));
                                    },
                                    child: Container(
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
                                              'Request for Quotation',
                                              style: TextStyle(
                                                  color: heavyBlue,
                                                  fontSize: 9,
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
                        ),
                        Positioned(
                          top: 0,
                          right: 15,
                          child: Image.asset(
                            'assets/images/old_product.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 30,
                            color: heavyBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is Loading) {
                        return Container(
                          child: CircularProgressIndicator(
                            backgroundColor: orange,
                          ),
                        );
                      }
                      if (state is Error) {
                        return Text(
                          "${state.error}",
                          style: TextStyle(color: orange, fontSize: 14),
                        );
                      }
                      if (state is GetBrandsState) {
                        brandlist = state.list;
                      }
                      if (state is GetCarsState) {
                        carlist = state.list;
                      }
                      return Column(
                        children: [
                          searchitem(profileimage, '', profilehint, wi, hi,
                              productnameController, productname, false),
                          Container(
                            width: size.width * 0.9,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: SvgPicture.asset(
                                    "assets/images/Group 285.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Container(
                                  child: Center(
                                    child: SizedBox(
                                      width: size.width * 0.7,
                                      child: DropdownButton<BrandModel>(
                                        hint: selectedbrand == null
                                            ? Center(
                                                child:
                                                    Text("Select your brand"))
                                            : Center(
                                                child: Text(selectedbrand,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: orange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                        items: brandlist
                                            .map((BrandModel selected) {
                                          return DropdownMenuItem<BrandModel>(
                                            value: selected,
                                            child: Text(selected.name),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            brandid = value.id;

                                            selectedbrand = value.name;
                                            selectedcar = null;
                                            bloc..add(GetcarsEvent(value.id));
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * 0.9,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: SvgPicture.asset(
                                    "assets/images/Group 276.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Container(
                                  child: Center(
                                    child: SizedBox(
                                      width: size.width * 0.7,
                                      child: DropdownButton<CarModel>(
                                        hint: selectedcar == null
                                            ? Center(
                                                child: Text("Select your car"))
                                            : Center(
                                                child: Text(selectedcar,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: orange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                        items: carlist.map((CarModel selected) {
                                          return DropdownMenuItem<CarModel>(
                                            value: selected,
                                            child: Text(selected.name),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            carid = value.id;

                                            selectedcar = value.name;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * 0.9,
                            height: size.height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: SvgPicture.asset(
                                    "assets/images/Group 287.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Container(
                                  child: Center(
                                    child: SizedBox(
                                      width: size.width * 0.7,
                                      child: DropdownButton<String>(
                                        hint: selectedcaryear == null
                                            ? Center(
                                                child: Text(
                                                    "Select your car year"))
                                            : Center(
                                                child: Text(selectedcaryear,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: orange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                        items: caryears.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedcaryear = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          searchitem(lowpriceimage, '', 'Low price', wi, hi,
                              lowpricecontroller, lowprice, true),
                          searchitem(hightpriceimage, '', 'High price', wi, hi,
                              hightpricecontroller, hightprice, true),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              print(hightpricecontroller.text);
                              // print(selectedbrand);
                              // print(selectedcar);
                              // print(selectedcaryear);
                              // print(productnameController.text);
                              // print(lowpricecontroller.text);
                              // print(hightpricecontroller.text);
                              print("$hightprice  $lowprice");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SearchResultScreen(
                                      brand: brandid!=null?
                                      brandid:-1,
                                      car: carid!=null?
                                      carid: -1,
                                      highprice: hightpricecontroller.text !=
                                              ''
                                          ? int.parse(hightpricecontroller.text)
                                          : -1,
                                      lowprice: lowpricecontroller.text != ''
                                          ? int.parse(lowpricecontroller.text)
                                          : -1,
                                      name: productname
                                      //,year: selectedcaryear,
                                      )));
                            },
                            child: Container(
                              height: size.height * 0.06,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: lightOrange,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Search",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // SizedBox(width: size.width * 0.06),
                                    Container(
                                      height: size.height * 0.03,
                                      width: size.width * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: lightOrange,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.9,
                          child: Text(
                            'Search Vin number',
                            style: TextStyle(
                                fontSize: 30,
                                color: heavyBlue,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Type car vin number',
                            style: TextStyle(
                                color: heavyBlue,
                                fontSize: 9,
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
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget searchitem(
      String image,
      String title,
      String hint,
      double sizewidth,
      double sizehigt,
      TextEditingController controller,
      String name,
      bool number) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "$image",
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Container(
                  width: sizewidth * 0.6,
                  height: sizehigt * 0.02,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("$title"),
                    ],
                  ),
                ),
                Container(
                    width: sizewidth * 0.6,
                    height: sizehigt * 0.03,
                    child: TextFormField(
                      keyboardType:
                          number ? TextInputType.number : TextInputType.name,
                      controller: controller,
                      style:
                          TextStyle(color: orange, fontWeight: FontWeight.bold),
                      autofocus: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '$hint',
                        contentPadding: EdgeInsets.only(top: 40),
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      onSaved: (value) => name = value,
                    )),
              ],
            ),
          )
        ],
      ),
      width: sizewidth * 0.9,
      height: sizehigt * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
