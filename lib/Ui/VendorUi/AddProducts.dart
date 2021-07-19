import 'package:autopart/Ui/VendorUi/AppBar/AppBar.dart';
import 'package:autopart/Ui/upload_image/UploadPic.dart';
import 'package:autopart/Ui/VendorUi/vendorProducts.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/data/prefs_helper/prefs_helper.dart';
import 'package:autopart/model/Quotation.dart';
import 'package:autopart/model/VendorInfoAfterVerify/VendorBrands.dart';
import 'package:autopart/model/car_model/car_model.dart';
import 'package:autopart/model/listallresponseforvendor/list_all_for_vendor.dart';
import 'package:autopart/model/vendor_add_products/AddNewProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autopart/Ui/search_old_product/bloc/old_products_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  List<Brand> ids = [];
  List<int> photos = [];
  String imageurl;
  NotificationBar bar = NotificationBar();
  String select = "Select your product";
  bool carTypeSelected = false;
  bool carModelSelected = false;
  bool carYearSelected = false;
  bool carClassSelected = false;
  String cartype;
  int carid;
  String carname;
  String carYear;
  String brandid;
  String carstate;
  String product;
  int productid;
  int idforbrand;
  List<ListAllVendorProducts> listall = [];
  List<CarModel> carslist = [];
  List<String> carstatus = ["NEW", " USED"];
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
  String selectedcar;
  List<String> empty = [];
  TextEditingController productnamecontroller = TextEditingController();
  String productname;
  TextEditingController priceAed = TextEditingController();
  TextEditingController priceFls = TextEditingController();
  TextEditingController defects = TextEditingController();
  double priceinaed;
  int priceinfls = 1;
  List<int> productsid = [];
  String notes = '';
  List<String> chosenproduct = [];
  int count = 3;
  List<Sender> productstosend = [];
  int page = 0;
  int ssize = 20;
  ScrollController controller = ScrollController();
  List<VendorBrands> brands = [];

  @override
  initState() {
    super.initState();

    carTypeSelected = false;
    carModelSelected = false;
    carYearSelected = false;
    carClassSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OldProductsBloc()..add(GetVendorBrands()),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: bar.appbar(context, true)),
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
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 8, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select your product car type',
                        style: TextStyle(
                            fontSize: 22,
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
                            padding: const EdgeInsets.only(
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
                                                page = 0;
                                                carYearSelected = false;
                                                carModelSelected = false;
                                                carTypeSelected = false;
                                                carClassSelected = false;
                                                context
                                                    .read<OldProductsBloc>()
                                                    .add(ResetVendorBrands());

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
                                      height: 16,
                                    ),
                                    imageurl != " "
                                        ? Image.network(imageurl,
                                            width: size.width * 0.2,
                                            height: size.height * 0.07,
                                            fit: BoxFit.contain)
                                        : Image.asset(
                                            "assets/images/carIcon.png",
                                            height: size.height * 0.07,
                                            width: size.width * 0.3,
                                            fit: BoxFit.cover),
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
                          if (state is VendorBrandsState) {
                            brands = state.brands;
                            // if (true)
                            //   return NotificationListener<ScrollNotification>(
                            //       onNotification: (notification) {
                            //         if (notification is ScrollEndNotification &&
                            //             controller.position.extentAfter == 0) {
                            //           print("here from listener");
                            //           page++;
                            //           print(page);

                            //           context
                            //               .read<OldProductsBloc>()
                            //               .add(Get(page, ssize));
                            //         }

                            //         return false;
                            //       },
                            //       child:
                            return Container(
                              height: size.height,
                              child: GridView.builder(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 4, bottom: 4),
                                controller: controller,
                                scrollDirection: Axis.vertical,
                                itemCount: state.brands.length,
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
                                        left: 2, right: 2, top: 4, bottom: 4),
                                    child: InkWell(
                                      //hereeeeeeeeeeeeeeeeeeeeeee
                                      onTap: () {
                                        idforbrand = state.brands[index].id;
                                        brandid = state.brands[index].name;
                                        state.brands[index].img.isNotEmpty
                                            ? imageurl = state.brands[index].img
                                            : imageurl = " ";
                                        carTypeSelected = !carTypeSelected;
                                        context
                                            .read<OldProductsBloc>()
                                            .add(GetCarByBrand(idforbrand));
                                        setState(() {});
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // SizedBox(
                                            //   height: 16,
                                            // ),
                                            state.brands[index].img.isNotEmpty
                                                ? Image.network(
                                                    '${state.brands[index].img}',
                                                    width: size.width * 0.3,
                                                    height: size.height * 0.1,
                                                    // fit: BoxFit.fill,
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Image.asset(
                                                      "assets/images/carIcon.png",
                                                      width: size.width * 0.3,
                                                      height: size.height * 0.1,
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            // Container(
                                            //     width: size.width * 0.21,
                                            //     child: Text(
                                            //         state.brands[index].name,
                                            //         style: TextStyle(
                                            //             color: heavyBlue,
                                            //             fontSize: 13,
                                            //             fontWeight:
                                            //                 FontWeight.bold),
                                            //         overflow:
                                            //             TextOverflow.ellipsis,
                                            //         textAlign:
                                            //             TextAlign.center)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                (carTypeSelected)
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select your car Model',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: heavyBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
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
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                      items: carslist.map((CarModel selected) {
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
                          (carModelSelected)
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
                                        borderRadius: BorderRadius.circular(10),
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
                                            items:
                                                caryears.map((String caryear) {
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
                (carYearSelected)
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                          ),
                          (carClassSelected)
                              ? Stack(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: size.width * 0.02),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Container(
                                                width: size.width * 0.21,
                                                child: Text(
                                                  carstate,
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
                                      ],
                                    ),
                                    Positioned(
                                      left: 115,
                                      top: 5,
                                      child: Builder(
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              carClassSelected = false;
                                              context
                                                  .read<OldProductsBloc>()
                                                  .add(ListallVendor());

                                              setState(() {});
                                            },
                                            child: Container(
                                              height: size.height * 0.015,
                                              width: size.width * 0.03,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(40)),
                                                  color: Colors.grey[100]),
                                              child: Icon(
                                                Icons.close,
                                                size: 10,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )
                              : GridView.builder(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 4, bottom: 4),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: carstatus.length,
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
                                          left: 2, right: 2, top: 4, bottom: 4),
                                      child: InkWell(
                                        onTap: () {
                                          carClassSelected = !carClassSelected;
                                          setState(() {});
                                          carstate = carstatus[index];
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
                                                  carstatus[index],
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
                SizedBox(
                  height: 21,
                ),
                if (carClassSelected)
                  Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Select your product',
                            style: TextStyle(
                                fontSize: 22,
                                color: heavyBlue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),

                    Container(
                      width: size.width * 0.7,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: BlocBuilder<OldProductsBloc, OldProductsState>(
                        builder: (context, state) {
                          if (state is ListallVendorstate) {
                            listall = state.allproducts;
                          }
                          if (state is LoadingProducts) {
                            return SizedBox(
                                width: 100,
                                height: 100,
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }
                          return SizedBox(
                            height: size.height * 0.2,
                            width: size.width * 0.2,
                            child: DropdownButton<ListAllVendorProducts>(
                                underline: SizedBox(),
                                hint: Center(
                                  child: product == null
                                      ? Center(
                                          child: Text("Select your product"),
                                        )
                                      : Center(
                                          child: Text(product),
                                        ),
                                ),
                                isExpanded: true,
                                items:
                                    listall.map((ListAllVendorProducts value) {
                                  return DropdownMenuItem<
                                      ListAllVendorProducts>(
                                    value: value,
                                    child: Text(
                                        "${value.name}\n${value.arabicName}\n"),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  product = value.name;
                                  productid = value.id;
                                  // Sender sender=        Sender(
                                  //               id: value
                                  //                   .id);
                                  if (productsid.contains(productid)) {
                                    print("repeated");
                                  } else {
                                    print("first time");
                                    productsid.add(productid);
                                    productstosend.add(Sender(id: productid));
                                  }

                                  if (chosenproduct.contains(product)) {
                                  } else {
                                    chosenproduct.add(product);
                                  }

                                  setState(() {});
                                }),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                        height: size.height * 0.035,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: chosenproduct.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              child: Stack(
                                children: [
                                  Container(
                                    width: size.width * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(35)),
                                      color: orange,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        chosenproduct.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: size.height * 0.015,
                                        width: size.width * 0.03,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            color: lightOrange),
                                        child: Center(
                                          child: Icon(
                                            Icons.close,
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
                                      width: size.width * 0.3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          chosenproduct[index],
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 7),
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

                    Container(
                      width: size.width * 0.3,
                      child: Center(
                        child: TextFormField(
                            controller: defects,
                            keyboardType: TextInputType.number,
                            autofocus: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '"Add note about product"',
                              hintStyle:
                                  TextStyle(color: lightOrange, fontSize: 12),
                            ),
                            onSaved: (value) =>
                                priceinfls = priceinfls + int.parse(value),
                            onChanged: (text) {
                              setState(() {
                                notes = notes + text;
                              });
                            }),
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.02),
                        Text(
                          "Enter anothers product",
                          style: TextStyle(
                              color: heavyBlue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      width: size.width * 0.9,
                      height: size.height * 0.11,

                      //   decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: size.height * 0.1,
                                  color: Colors.white,
                                  width: size.width * 0.3,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(12, 0, 0, 10),
                                    child: TextFormField(
                                        controller: productnamecontroller,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'product name',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        onSaved: (value) => productname = value,
                                        onChanged: (text) {
                                          setState(() {
                                            productname = text;
                                          });
                                        }),
                                  )),
                              SizedBox(
                                width: size.width * 0.14,
                              ),
                              InkWell(
                                onTap: () async {
                                  List<int> ids = await Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        UploadPic(phototag: "VENDOR_PRODUCT"),
                                  ));
                                  getphotosId(ids, photos);
                                  print(photos);
                                },
                                child: Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: heavyBlue),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.04,
                                      ),
                                      Text(
                                        "upload image",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                      Container(
                                        height: size.height * 0.028,
                                        width: size.width * 0.045,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white),
                                        child: Center(
                                            child: SvgPicture.asset(
                                          "assets/images/row11.svg",
                                          color: lightOrange,
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          "Enter your product price",
                          style: TextStyle(
                              color: heavyBlue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: size.height * 0.09,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "AED",
                                style:
                                    TextStyle(color: lightGray, fontSize: 15),
                              ),
                              Container(
                                width: size.width * 0.2,
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: priceAed,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter price',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                    onSaved: (value) => productname = value,
                                    onChanged: (text) {
                                      setState(() {
                                        priceinaed = double.parse(text);
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          ",",
                          style: TextStyle(fontSize: 30),
                        ),
                        Container(
                          height: size.height * 0.09,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Fls",
                                style:
                                    TextStyle(color: lightGray, fontSize: 15),
                              ),
                              Container(
                                width: size.width * 0.2,
                                child: TextFormField(
                                    controller: priceFls,
                                    autofocus: false,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter price',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                    onSaved: (value) =>
                                        priceinfls = int.parse(value),
                                    onChanged: (text) {
                                      setState(() {
                                        priceinfls =
                                            priceinfls + int.parse(text);
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () async {
                          if (priceinaed != null) {
                            for (var i = 0; i < photos.length; i++) {
                              int s = photos[i];
                              ids.add(Brand(id: s));
                            }
                            Brand brand = Brand(id: idforbrand);
                            print(idforbrand);
                            Brand idforcar = Brand(id: carid);
                            print("car id $carid");

                            PrefsHelper prefsHelper = PrefsHelper();
                            int s = await prefsHelper.getvendorid();
                            print(s);
                            Brand vendorid = Brand(id: s);
                            print(vendorid.id);
                            Brand productt = Brand(id: productid);
                            List<String> year = [];
                            year.add(carYear);
                            print(year);
                            String defectss = notes;
                            print(notes);
                            double theprice = (priceinaed) + priceinfls / 100;
                            print(theprice);

                            AddNewProductsVendor addNewProductsVendor =
                                AddNewProductsVendor(
                                    brand: brand,
                                    car: idforcar,
                                    defects: defectss,
                                    price: theprice,
                                    product: productt,
                                    vendor: vendorid,
                                    years: year,
                                    attachments: ids,
                                    productType: carstate);
                            if (vendorid != null) {
                              context
                                  .read<OldProductsBloc>()
                                  .add(Addproductvendor(addNewProductsVendor));
                            } else {
                              Fluttertoast.showToast(
                                  msg: "please sign up first",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: lightOrange,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                           else {
                              Fluttertoast.showToast(
                                  msg: "please add your price first",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: lightOrange,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                           }
                        }
                       
                        ,
                        child: BlocConsumer<OldProductsBloc, OldProductsState>(
                            listener: (context, state) {
                          if (state is Addingproductforvendor) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        VendorProducts()));
                          }
                        }, builder: (context, state) {
                          // if (state is Addingproductforvendor) {
                          //   return CircularProgressIndicator();
                          // } else
                          return Container(
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/main_bt_bg.png'),
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Add your product',
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
                          );
                        }),
                      );
                    }),

                    // return CircularProgressIndicator(
                    //         backgroundColor: lightGray,
                    //       );
                  ])
                else
                  Container(),
                SizedBox(
                  height: size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
