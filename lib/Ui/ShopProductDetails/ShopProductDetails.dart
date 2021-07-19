import 'package:autopart/Ui/cart/bloc/cart_bloc.dart';
import 'package:autopart/Ui/product_page/details_tab.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/AutopartShop.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopProductDetails extends StatefulWidget {
  final ShopItems shopItems;
  ShopProductDetails(this.shopItems);
  @override
  _ShopProductDetailsState createState() => _ShopProductDetailsState();
}

class _ShopProductDetailsState extends State<ShopProductDetails>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabsIndex = 0;

  @override
  void initState() {
    _tabController = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => CartBloc(),
        child: Scaffold(
          backgroundColor: bgColor,
          body: Column(
            children: [
              Expanded(
                  child: widget.shopItems.attachments.isNotEmpty
                      ? Image.network(
                          widget.shopItems.attachments[0].publicUrl,
                          width: size.width,
                          height: 200,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          'assets/images/carIcon.png',
                          width: size.width,
                          height: 200,
                          fit: BoxFit.fill,
                        )),

              /*   Container(
                child: Image.asset("assets/images/wheel_cover.png",
                  width: size.width,
                  height: 200,
                  fit: BoxFit.fill,),
              ),*/

              SizedBox(
                height: 21,
              ),
              Container(
                width: size.width * 0.9,
                child: Container(
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color:
                          (tabsIndex == 1) ? Colors.white : Colors.transparent),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        "Details",
                        style: TextStyle(
                            color: (tabsIndex == 1) ? lightOrange : heavyBlue,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    DetailsTab(
                        widget.shopItems.brand.name,
                        widget.shopItems.product.name,
                        widget.shopItems.price.toString()),
                  ],
                  controller: _tabController,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is AddProductState){
                   Fluttertoast.showToast(
                                  msg: "Added to cart successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: lightOrange,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //            width: size.width*0.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/main_bt_bg.png'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Builder(
                        builder: (context) => InkWell(
                          onTap: () {
                            context
                                .read<CartBloc>()
                                .add(AddProductEvent(widget.shopItems.id));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
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
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
