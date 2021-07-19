import 'package:autopart/Ui/ShopProductDetails/ShopProductDetails.dart';
import 'package:autopart/Ui/auto_part_shop_tab/AutoShop/autoshop_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/AutopartShop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllProducts extends StatefulWidget {
  final String type;
  SeeAllProducts({Key key, this.type}) : super(key: key);

  @override
  _SeeAllProductsState createState() => _SeeAllProductsState();
}

class _SeeAllProductsState extends State<SeeAllProducts> {
  int page = 0;
  int ssize = 20;

  List<ShopItems> products = [];

  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) =>
            AutoshopBloc()..add(GetShopProductsEvent(page, ssize)),
        child: Scaffold(body: Container(child:
            BlocBuilder<AutoshopBloc, AutoshopState>(builder: (context, state) {
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
            widget.type == "USED"
                ? products = state.oldproducts
                : products = state.newproducts;
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
              height: size.height ,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                controller: controller,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 3, right: 3, top: 8, bottom: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ShopProductDetails(products[index]),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                products[index].attachments.isEmpty
                                    ? Image.asset(
                                        'assets/images/carIcon.png',
                                        width: size.width * 0.3,
                                        height: size.height * 0.1,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        products[index]
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
                                    width: size.width * 0.6,
                                    child: Text(
                                      products[index].product.name,
                                      style: TextStyle(
                                          color: heavyBlue, fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                // SizedBox(
                                //   height: size.height * 0.01,
                                // ),
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: size.width * 0.16,
                                        child: Text(
                                          "price: ${products[index].price.toInt()}",
                                          style: TextStyle(
                                              color: heavyBlue,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        )),
                                   
                                  ],
                                ),
                                // SizedBox(height: size.height*0.01,),
                                 Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                     Container(
                                            width: size.width * 0.15,
                                            child: Text(
                                              "Rate: ${products[index].rates.ratesAvg}",
                                              style: TextStyle(
                                                  color: orange,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
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
                }, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 3/4
              ),
              ),
            ),
          );
        }))));
  }
}
