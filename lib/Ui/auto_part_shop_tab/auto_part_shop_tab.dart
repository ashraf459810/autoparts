import 'package:autopart/Ui/SeeAllProducts/SeeAllProducts.dart';
import 'package:autopart/Ui/ShopProductDetails/ShopProductDetails.dart';
import 'package:autopart/Ui/auto_part_shop_tab/AutoShop/autoshop_bloc.dart';

import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/AutopartShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AutoPartShopPage extends StatefulWidget {
  @override
  _AutoPartShopPageState createState() => _AutoPartShopPageState();
}

class _AutoPartShopPageState extends State<AutoPartShopPage> {
  List<ShopItems> newproducts = [];
  List<ShopItems> oldproducts = [];
  int page = 0;
  int ssize = 10;
  ScrollController controller = ScrollController();
  ScrollController controller2 = ScrollController();
  bool seeallnew = false;
  bool seeallused = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          AutoshopBloc()..add(GetShopProductsEvent(page, ssize)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Used Proucts',
                      style: TextStyle(
                          fontSize: 30,
                          color: heavyBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SeeAllProducts(
                            type: "USED",
                          ),
                        ));
                      },
                      child: Text(
                        'see all',
                        style: TextStyle(fontSize: 12, color: lightOrange),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<AutoshopBloc, AutoshopState>(
                builder: (context, state) {
                  if (state is AutoshopInitial) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: orange,
                      ),
                    );
                  }

                  if (state is Error) {
                    return Text(state.error);
                  }
                  if (state is GetShopProcutsState) {
                    oldproducts = state.oldproducts;
                    newproducts = state.newproducts;
                  }
                  return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            controller.position.extentAfter == 0) {
                          print("here from listener");
                          page++;

                          context
                              .read<AutoshopBloc>()
                              .add(GetShopProductsEvent(page, ssize));
                        }

                        return false;
                      },
                      child: Container(
                        height: size.height * 0.23,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          itemCount: oldproducts.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 3, right: 3, top: 8, bottom: 8),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            ShopProductDetails(
                                                oldproducts[index]),
                                      ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical:  15),
                                      child: Column(
                                        children: [
                                          oldproducts[index].product.attachments.isEmpty
                                              ? Image.asset(
                                                  'assets/images/carIcon.png',
                                                  width: size.width * 0.3,
                                                  height: size.height * 0.1,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(
                                                  oldproducts[index]
                                                      .attachments[0]
                                                      .publicUrl,
                                                  width: size.width * 0.3,
                                                  height: size.height * 0.1,
                                                  fit: BoxFit.cover,
                                                ),
                                          // SizedBox(
                                          //   height: size.height * 0.002,
                                          // ),
                                          Container(
                                              width: size.width * 0.3,
                                              child: Text(
                                                oldproducts[index].product.name,
                                                style: TextStyle(
                                                    color: heavyBlue,
                                                    fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  width: size.width * 0.15,
                                                  child: Text(
                                                    "price: ${oldproducts[index].price.toInt()}",
                                                    style: TextStyle(
                                                        color: heavyBlue,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              Container(
                                                  width: size.width * 0.15,
                                                  child: Text(
                                                    "Rate: ${oldproducts[index].rates.ratesAvg}",
                                                    style: TextStyle(
                                                        color: orange,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ));
                },
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Products',
                      style: TextStyle(
                          fontSize: 30,
                          color: heavyBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SeeAllProducts(
                            type: "NEW",
                          ),
                        ));
                  
                      },
                      child: Text(
                        'see all',
                        style: TextStyle(fontSize: 12, color: lightOrange),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<AutoshopBloc, AutoshopState>(
                builder: (context, state) {
                  return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollEndNotification &&
                            controller2.position.extentAfter == 0) {
                          print("here from listener");
                          page++;

                          context
                              .read<AutoshopBloc>()
                              .add(GetShopProductsEvent(page, ssize));
                        }

                        return false;
                      },
                      child: Container(
                        height: size.height * 0.23,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newproducts.length,
                          controller: controller2,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ShopProductDetails(newproducts[index]),
                              )),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Card(
                                                                  child: Column(
                                    children: [
                                      newproducts[index].attachments.isEmpty
                                          ? Image.asset(
                                              'assets/images/carIcon.png',
                                              width: size.width * 0.3,
                                              height: size.height * 0.1,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              newproducts[index]
                                                  .attachments[0]
                                                  .publicUrl,
                                              width: size.width * 0.3,
                                              height: size.height * 0.1,
                                              fit: BoxFit.cover,
                                            ),
                                      // SizedBox(
                                      //   height: size.height * 0.002,
                                      // ),
                                      Container(
                                          width: size.width * 0.3,
                                          child: Center(
                                            child: Text(
                                              newproducts[index].product.name,
                                              style: TextStyle(
                                                  color: heavyBlue, fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              width: size.width * 0.15,
                                              child: Text(
                                                "price: ${newproducts[index].price.toInt()}",
                                                style: TextStyle(
                                                    color: heavyBlue,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                          Container(
                                              width: size.width * 0.15,
                                              child: Text(
                                                "Rate: ${newproducts[index].rates.ratesAvg}",
                                                style: TextStyle(
                                                    color: orange ,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ));
                },
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: lightOrange,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(
                'assets/images/discount.svg',
                height: 30,
              ),
            )),
      ),
    );
  }
}
