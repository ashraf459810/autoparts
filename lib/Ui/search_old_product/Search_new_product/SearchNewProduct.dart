import 'package:autopart/Ui/QuotationScreen/QutationScreen.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/Quotation.dart';

import 'package:autopart/model/QuotationReponse.dart';
import 'package:autopart/model/car_model/car_model.dart';
import 'package:autopart/model/listallresponseforvendor/list_all_for_vendor.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:autopart/Ui/search_old_product/bloc/old_products_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchNewProduct extends StatefulWidget {
  @override
  SearchNewProductState createState() => SearchNewProductState();
}

class SearchNewProductState extends State<SearchNewProduct> {
  bool carTypeSelected = false;
  bool carModelSelected = false;
  bool carYearSelected = false;
  bool carClassSelected = false;
  String cartype;
  int carid;
  String brandimage;
  String carname;
  String carYear;
  String brandid;
  String carstate;
  String product;
  int productid;
  int idforbrand;
  List<String> orginal = ["ORIGINAL", "COPY"];
  QuotationResponse quotationResponse = QuotationResponse();
  ScrollController controller = ScrollController();
  List<int> productsid = [];

  // List<String> carstatus = ["NEW", "Used"];
  bool caramerican = false;
  List<String> chosenproduct = [];

  // ignore: non_constant_identifier_names
  List<String> car_type = ["AMERICAN", "GULF"];
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
  TextEditingController productnamecontroller = TextEditingController();
  String productname;
  TextEditingController priceAed = TextEditingController();
  TextEditingController priceFls = TextEditingController();
  TextEditingController defects = TextEditingController();
  TextEditingController carvincontroller = TextEditingController();
  String priceinaed;
  String priceinfls;
  String notes;
  List<String> products = [];

  bool dropselected = false;
  String selectedcar;
  String isorginal;
  bool carorginalornot;
  List<CarModel> carslist;
  List<Sender> productstosend = [];
  Sender cartosend;
  List<ListAllVendorProducts> listall = [];
  int page = 0;
  int ssize = 20;

  SendQuotation sendQuotation;

  @override
  void initState() {
    super.initState();

    carTypeSelected = false;
    carModelSelected = false;
    carYearSelected = false;
    carClassSelected = false;
    caramerican = false;
    carorginalornot = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => OldProductsBloc()..add(Get(page, ssize)),
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                flexibleSpace: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 16),
                          child: Text(
                            'Request For Quotation',
                            style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: heavyBlue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                centerTitle: false,
                title: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    '',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: heavyBlue),
                  ),
                ),
                actions: [],
              ),
            ),
            backgroundColor: bgColor,
            body: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login_bg.png'),
                        fit: BoxFit.fill)),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 8, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select your product car type',
                          style: TextStyle(
                              fontSize: 21,
                              color: heavyBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  (carTypeSelected)
                      ? Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 8),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.16,
                                          ),
                                          Builder(
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  carYearSelected = false;
                                                  carModelSelected = false;
                                                  carTypeSelected = false;
                                                  carClassSelected = false;
                                                  context
                                                      .read<OldProductsBloc>()
                                                      .add(ResetBrands());

                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: size.height * 0.015,
                                                  width: size.width * 0.03,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  40)),
                                                      color: Colors.grey[100]),
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 10,
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      brandimage != " "
                                          ? Image.network(
                                              brandimage,
                                              width: 100,
                                              height: 65,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              "assets/images/carIcon.png",
                                              width: size.width * 0.3,
                                              height: size.height * 0.07,
                                              fit: BoxFit.cover,
                                            ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      // Container(
                                      //     width: size.width * 0.21,
                                      //     child: Text(
                                      //       '$brandid',
                                      //       style: TextStyle(
                                      //         color: heavyBlue,
                                      //         fontSize: 13,
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //       overflow: TextOverflow.ellipsis,
                                      //       textAlign: TextAlign.center,
                                      //     )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : BlocBuilder<OldProductsBloc, OldProductsState>(
                          builder: (context, state) {
                            if (state is LoadedBrands) {
                              if (true)
                                return NotificationListener<ScrollNotification>(
                                    onNotification: (notification) {
                                      if (notification
                                              is ScrollEndNotification &&
                                          controller.position.extentAfter ==
                                              0) {
                                        print("here from listener");
                                        page++;
                                        print(page);

                                        context
                                            .read<OldProductsBloc>()
                                            .add(Get(page, ssize));
                                      }

                                      return false;
                                    },
                                    child: Container(
                                      height: size.height,
                                      child: GridView.builder(
                                        controller: controller,
                                        scrollDirection: Axis.vertical,
                                        padding: EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 4,
                                            bottom: 4),
                                        itemCount: state.list.length,
                                        shrinkWrap: false,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: size.width / 450,
                                          crossAxisSpacing: 0.0,
                                          mainAxisSpacing: 0.0,
                                        ),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2,
                                                right: 2,
                                                top: 4,
                                                bottom: 4),
                                            child: InkWell(
                                              //hereeeeeeeeeeeeeeeeeeeeeee
                                              onTap: () {
                                                state.list[index].attachments
                                                        .isNotEmpty
                                                    ? brandimage = state
                                                        .list[index]
                                                        .attachments[0]
                                                        .publicUrl
                                                    : brandimage = " ";
                                                idforbrand =
                                                    state.list[index].id;
                                                print(
                                                    "here is the brand or not ");
                                                print(state.list[index].id);
                                                brandid =
                                                    state.list[index].name;
                                                print(idforbrand);
                                                carTypeSelected =
                                                    !carTypeSelected;
                                                context
                                                    .read<OldProductsBloc>()
                                                    .add(GetCarByBrand(
                                                        idforbrand));
                                                setState(() {});
                                              },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // SizedBox(
                                                    //   height: 16,
                                                    // ),
                                                    state
                                                            .list[index]
                                                            .attachments
                                                            .isNotEmpty
                                                        ? Container(
                                                            child:
                                                                Image.network(
                                                              '${state.list[index].attachments[0].publicUrl}',
                                                              width:
                                                                  size.width *
                                                                      0.3,
                                                              height:
                                                                  size.height *
                                                                      0.1,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          )
                                                        : Image.asset(
                                                            'assets/images/carIcon.png',
                                                            width: size.width *
                                                                0.3,
                                                            height:
                                                                size.height *
                                                                    0.1,
                                                          ),

                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    // Container(
                                                    //     width: size.width * 0.21,
                                                    //     child: Text(
                                                    //         state
                                                    //             .list[index].name,
                                                    //         style: TextStyle(
                                                    //             color: heavyBlue,
                                                    //             fontSize: 13,
                                                    //             fontWeight:
                                                    //                 FontWeight
                                                    //                     .bold),
                                                    //         overflow: TextOverflow
                                                    //             .ellipsis,
                                                    //         textAlign: TextAlign
                                                    //             .center)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ));
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                  (carTypeSelected)
                      ? Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                Text(
                                  'Select your car Model',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: heavyBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            BlocBuilder<OldProductsBloc, OldProductsState>(
                              builder: (context, state) {
                                if (state is Loading) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                if (state is GetCars) {
                                  carslist = state.carList;
                                }
                                return Container(
                                  height: size.height * 0.07,
                                  width: size.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color: orange),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      width: size.width * 0.7,
                                      child: DropdownButton<CarModel>(
                                        isExpanded: true,
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
                                        items:
                                            carslist.map((CarModel selected) {
                                          return DropdownMenuItem<CarModel>(
                                            value: selected,
                                            child: Text(selected.name),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            carid = value.id;
                                            carModelSelected = true;
                                            selectedcar = value.name;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            carModelSelected
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.04,
                                          ),
                                          Text(
                                            'Select your car Year',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: heavyBlue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Container(
                                        height: size.height * 0.07,
                                        width: size.width * 0.8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          border: Border.all(color: orange),
                                        ),
                                        child: Center(
                                          child: SizedBox(
                                            width: size.width * 0.7,
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              hint: carYear == null
                                                  ? Center(
                                                      child: Text(
                                                          "Select your car year"))
                                                  : Center(
                                                      child: Text(carYear,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: orange,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )),
                                                    ),
                                              items: caryears
                                                  .map((String caryear) {
                                                return DropdownMenuItem<String>(
                                                  value: caryear,
                                                  child: Text(caryear),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  carYear = value;
                                                  carYearSelected = true;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container()
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  (carYearSelected)
                      ? Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.04),
                                Text(
                                  'Select your car Class',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: heavyBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 12, color: lightOrange),
                                ),
                              ],
                            ),
                            carClassSelected
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Row(children: [
                                        SizedBox(
                                          width: size.width * 0.3,
                                        ),
                                      ]),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Stack(children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.02,
                                              ),
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Container(
                                                      width: size.width * 0.21,
                                                      child: Text(
                                                        carstate,
                                                        style: TextStyle(
                                                            color: heavyBlue,
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            left: 115,
                                            top: 4,
                                            child: Builder(
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    carClassSelected = false;

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: size.height * 0.015,
                                                    width: size.width * 0.03,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    40)),
                                                        color:
                                                            Colors.grey[100]),
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 10,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Row(children: [
                                        SizedBox(width: size.width * 0.04),
                                        Text(
                                          'Select your product type',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: heavyBlue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),

                                      carorginalornot
                                          ? Column(children: [
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Row(children: [
                                                SizedBox(
                                                  width: size.width * 0.3,
                                                ),
                                              ]),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Stack(children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.02,
                                                      ),
                                                      Card(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Container(
                                                              width:
                                                                  size.width *
                                                                      0.21,
                                                              child: Text(
                                                                isorginal,
                                                                style: TextStyle(
                                                                    color:
                                                                        heavyBlue,
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Positioned(
                                                    left: 115,
                                                    top: 4,
                                                    child: Builder(
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            carorginalornot =
                                                                false;

                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            height:
                                                                size.height *
                                                                    0.015,
                                                            width: size.width *
                                                                0.03,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            40)),
                                                                color: Colors
                                                                    .grey[100]),
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 10,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            ])
                                          : GridView.builder(
                                              padding: EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 4,
                                                  bottom: 4),
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: orginal.length,
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio:
                                                    size.width / 200,
                                                crossAxisSpacing: 0.0,
                                                mainAxisSpacing: 0.0,
                                              ),
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2,
                                                          right: 2,
                                                          top: 4,
                                                          bottom: 4),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {});
                                                      isorginal =
                                                          orginal[index];
                                                      carorginalornot = true;
                                                    },
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            16.0),
                                                        child: Container(
                                                            width: size.width *
                                                                0.21,
                                                            child: Text(
                                                              orginal[index],
                                                              style: TextStyle(
                                                                  color:
                                                                      heavyBlue,
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ), ///////here grid view builder for orginal
                                      carorginalornot
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.04),
                                                    Text(
                                                      'Select your product',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: heavyBlue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: size.height * 0.01),
                                                Container(
                                                  width: size.width * 0.7,
                                                  height: size.height * 0.06,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white),
                                                  child: BlocBuilder<
                                                      OldProductsBloc,
                                                      OldProductsState>(
                                                    builder: (context, state) {
                                                      if (state
                                                          is ListallVendorstate) {
                                                        listall =
                                                            state.allproducts;
                                                      }
                                                      if (state
                                                          is LoadingProducts) {
                                                        return SizedBox(
                                                            width: 100,
                                                            height: 100,
                                                            child: Center(
                                                                child:
                                                                    CircularProgressIndicator()));
                                                      }
                                                      return SizedBox(
                                                        height:
                                                            size.height * 0.2,
                                                        width: size.width * 0.2,
                                                        child: DropdownButton<
                                                                ListAllVendorProducts>(
                                                            underline:
                                                                SizedBox(),
                                                            hint: Center(
                                                              child:
                                                                  product ==
                                                                          null
                                                                      ? Center(
                                                                          child:
                                                                              Text("Select your product"),
                                                                        )
                                                                      : Center(
                                                                          child:
                                                                              Text(product),
                                                                        ),
                                                            ),
                                                            isExpanded: true,
                                                            items: listall.map(
                                                                (ListAllVendorProducts
                                                                    value) {
                                                              return DropdownMenuItem<
                                                                  ListAllVendorProducts>(
                                                                value: value,
                                                                child: Text(
                                                                    "${value.name}\n${value.arabicName}\n"),
                                                              );
                                                            }).toList(),
                                                            onChanged: (value) {
                                                              product =
                                                                  value.name;
                                                              productid =
                                                                  value.id;
                                                              // Sender sender=        Sender(
                                                              //               id: value
                                                              //                   .id);
                                                              if (productsid
                                                                  .contains(
                                                                      productid)) {
                                                                print(
                                                                    "repeated");
                                                              } else {
                                                                print(
                                                                    "first time");
                                                                productsid.add(
                                                                    productid);
                                                                productstosend
                                                                    .add(Sender(
                                                                        id: productid));
                                                              }

                                                              if (chosenproduct
                                                                  .contains(
                                                                      product)) {
                                                              } else {
                                                                chosenproduct
                                                                    .add(
                                                                        product);
                                                              }

                                                              dropselected =
                                                                  true;
                                                              setState(() {});
                                                            }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Container(
                                                    height: size.height * 0.035,
                                                    width: size.width * 0.9,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          chosenproduct.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      9),
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
                                                                          Radius.circular(
                                                                              35)),
                                                                  color: orange,
                                                                ),
                                                              ),
                                                              Positioned(
                                                                right: 0,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    chosenproduct
                                                                        .removeAt(
                                                                            index);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: size
                                                                            .height *
                                                                        0.015,
                                                                    width: size
                                                                            .width *
                                                                        0.03,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(
                                                                                30)),
                                                                        color:
                                                                            lightOrange),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .close,
                                                                        size: 8,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 15,
                                                                bottom: 7,
                                                                child: SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.3,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            15),
                                                                    child: Text(
                                                                      chosenproduct[
                                                                          index],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              7),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    )),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                SizedBox(
                                                    height: size.height * 0.01),
                                                SizedBox(
                                                    height: size.height * 0.01),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.04),
                                                    Text(
                                                      'Car vin number',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: heavyBlue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.02,
                                                    ),
                                                    Text(
                                                      "(Required)",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: heavyBlue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: size.height * 0.01),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        width: size.width * 0.9,
                                                        height:
                                                            size.height * 0.08,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color:
                                                                Colors.white),
                                                        child: Center(
                                                            child: SizedBox(
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.3,
                                                                  child:
                                                                      TextFormField(
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            "EXP : 14234123"),
                                                                    controller:
                                                                        carvincontroller,

                                                                    // "Select your product",
                                                                    style: TextStyle(
                                                                        color:
                                                                            lightGray,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ]),
                                                        )))),
                                                Builder(builder: (context) {
                                                  return GestureDetector(
                                                      onTap: () async {
                                                        PrefsHelper
                                                            prefsHelper =
                                                            PrefsHelper();
                                                        int customerid =
                                                            await prefsHelper
                                                                .getcustomerid();
                                                        sendQuotation =
                                                            SendQuotation(
                                                          customer: Sender(
                                                              id: customerid),
                                                          brand: Sender(
                                                              id: idforbrand),
                                                          products:
                                                              productstosend,
                                                          car:
                                                              Sender(id: carid),
                                                          carClass: carstate,
                                                          year: carYear,
                                                          type: "NEW",
                                                          productQuality:
                                                              isorginal,
                                                        );

                                                        if (customerid !=
                                                            null) {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      OrderScreen(
                                                                          sendQuotation,
                                                                          brandimage)));
                                                        } else {
                                                          print(
                                                              "here from tosat no id for customer");
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "please sign up first",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .CENTER,
                                                              backgroundColor:
                                                                  lightOrange,
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0);
                                                        }
                                                      },
                                                      child: Container(
                                                        width: size.width * 0.9,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/images/main_bt_bg.png'),
                                                              fit: BoxFit.fill),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Visibility(
                                                              visible: false,
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
                                                                          8.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color:
                                                                        orange,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                'Request product',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
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
                                                                          3.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_forward_ios,
                                                                    color:
                                                                        orange,
                                                                    size: 18,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ));
                                                })
                                              ],
                                            )
                                          : Container()
                                    ],
                                  )
                                : GridView.builder(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, top: 4, bottom: 4),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: car_type.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: size.width / 200,
                                      crossAxisSpacing: 0.0,
                                      mainAxisSpacing: 0.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 2,
                                            right: 2,
                                            top: 4,
                                            bottom: 4),
                                        child: InkWell(
                                          onTap: () {
                                            carClassSelected =
                                                !carClassSelected;
                                            setState(() {});
                                            carstate = car_type[index];
                                            carClassSelected = true;
                                            context
                                                .read<OldProductsBloc>()
                                                .add(ListallVendor());
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Container(
                                                  width: size.width * 0.21,
                                                  child: Text(
                                                    car_type[index],
                                                    style: TextStyle(
                                                        color: heavyBlue,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        )
                      : Container(),
                ])))));
  }
}
// List<String> years (List<String> list){
  
// for (i = 1990 ; i < Datet)
// }