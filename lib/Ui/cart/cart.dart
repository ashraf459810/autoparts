
import 'package:autopart/Ui/cart/bloc/cart_bloc.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/GetCartModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autopart/Ui/cart/placeOreder.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int counter = 1;
  double total = 0;
  List<CartItem> cart = [];

  bool iscartempty = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        child: BlocProvider(
          create: (context) => CartBloc()..add(GetCartEvent()),
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            if (state is CartInitial) {
              return Container(
                  height: 400,
                  width: 400,
                  child: Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: orange,
                      ),
                    ),
                  ));
            }
            if (state is RemoveItem) {
              double s = 0;
              cart = state.finalcart;
              if (cart.isEmpty) {
                iscartempty = true;
              }
              for (var i = 0; i < state.finalcart.length; i++) {
                s = s + state.finalcart[i].fullPrice.ceil();
              }
              total = s;
            }
            if (state is Loading) {
              return Container(
                  height: 400,
                  width: 400,
                  child: Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: orange,
                      ),
                    ),
                  ));
            }

            if (state is GetCartState) {
              if (state.finalcart.isNotEmpty) {
                iscartempty = false;
                cart = state.finalcart;
         
                for (var i = 0; i < state.finalcart.length; i++) {
                  total = total + state.finalcart[i].fullPrice.ceil();
                }
              }
            }
            return !iscartempty
                ? Scaffold(
                    body: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.03),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.08),
                              Text(
                                'Cart',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: heavyBlue),
                              ),
                            ],
                          ),
                          Container(
                            height: size.height * 0.76,
                            child: ListView.builder(
                              itemCount: cart.length,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: size.height * 0.2,
                                        width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: SizedBox(
                                          height: size.height * 0.2,
                                          width: size.width * 0.2,
                                          child:
                                              cart[index].attachments.isNotEmpty
                                                  ? CircleAvatar(backgroundColor: Colors.white,
                                                                                                      child: Image.network(
                                                        '${cart[index].attachments[0].publicUrl}',
                                                        width: size.width * 0.3,
                                                        height: size.height * 0.1,
                                                        fit: BoxFit.contain,
                                                      ),
                                                  )
                                                  : Image.asset(
                                                      'assets/images/carIcon.png',
                                                      width: size.width * 0.3,
                                                      height: size.height * 0.1,
                                                    ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 40, bottom: 40),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.04,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: size.height * 0.02,
                                                  width: size.width * 0.3,
                                                  child: Text(
                                                    "Name ${cart[index].product.name}",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.grey,

                                                        // overflow: TextOverflow
                                                        // .ellipsis,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: size.height * 0.02,
                                                  width: size.width * 0.3,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  child: cart[index]
                                                          .sourceTypeName
                                                          .contains("quotation")
                                                      ? Text("Quotation",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[400]))
                                                      : Text(
                                                          "Offer",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[400]),
                                                        ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: size.height * 0.02,
                                                  width: size.width * 0.3,
                                                  child: Text(
                                                    "Brand ${cart[index].brand.name},",
                                                    style: TextStyle(
                                                        color: green,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height * 0.015,
                                            ),
                                            Container(
                                              height: size.height * 0.04,
                                              width: size.width * 0.3,
                                              child: Text(
                                                "price ${cart[index].fullPrice.ceil()}",
                                                style: TextStyle(
                                                    color: orange,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.08,
                                      ),
                                      GestureDetector(
                                          onTap: () => context
                                              .read<CartBloc>()
                                              .add(RemoveItemEvent(
                                                  cart[index].id)),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.grey,
                                          ))
                                    ],
                                  ),
                                  Container(
                                      height: 0.5, color: Colors.grey[300])
                                ]);
                              },
                            ),
                          ),
                        
                        
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "TOTAL",
                                    style: TextStyle(
                                        color: lightGray, fontSize: 12),
                                  ),
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state) {
                                      return Text(
                                        "${total.toInt()} AED",
                                        style: TextStyle(
                                            color: lightGray,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                  Text(
                                    "Free shipping on all orders",
                                    style: TextStyle(
                                        color: lightGray, fontSize: 12),
                                  ),
                                  Text(
                                    "over 1000 AED",
                                    style: TextStyle(
                                        color: lightGray, fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(width: size.width * 0.13),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => 
                                          PlaceOrder()
                                          // DelieverLocation()
                                          ));
                                },
                                child: Container(
                                  height: size.height * 0.06,
                                  width: size.width * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: lightOrange,
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Check out",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: size.width * 0.02),
                                        Container(
                                          height: size.height * 0.03,
                                          width: size.width * 0.06,
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
                              )
                            ],
                          )
                      
                      
                        ],
                      ),
                    ),
                  ))
                : Scaffold(
                    body: Container(
                    color: Colors.white,
                    height: size.height,
                    width: size.width,
                    child: Center(
                      child: Text(
                        "No Items Added to your Cart",
                        style: TextStyle(
                            color: orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ));
          }),
        ));
  }
}
