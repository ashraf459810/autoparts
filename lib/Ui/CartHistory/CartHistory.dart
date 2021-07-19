import 'package:autopart/Ui/CartHistory/bloc/carthistory_bloc.dart';
import 'package:autopart/Ui/CartHistoryItem/CartHistoryItem.dart';
import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/model/CartHistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartHistory extends StatefulWidget {
  CartHistory({Key key}) : super(key: key);

  @override
  _CartHistoryState createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  ScrollController scrollController = ScrollController();
  int page = 0;
  int sszie = 10;
  List<CartInfo> carts = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          CarthistoryBloc()..add(GetCartHistoryEvent(page, sszie)),
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBar(
                backgroundColor: Colors.white,
                title: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 100),
                  child: Container(
                    child: Text(
                      "Cart History",
                      style: TextStyle(
                          color: heavyBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                elevation: 0,
              )),
          body: BlocConsumer<CarthistoryBloc, CarthistoryState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is GetCartHistoyState) {
                carts = state.carts;
              }

              return 
      carts.isNotEmpty?        Container(
                height: size.height,
                child: ListView.builder(
                  itemCount:carts.length,
                  itemBuilder: (context, index) {
                    return NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollEndNotification &&
                              scrollController.position.extentAfter == 0) {
                            print("here from listener");
                            page++;

                            context
                                .read<CarthistoryBloc>()
                                .add(GetCartHistoryEvent(page, sszie));
                          }

                          return false;
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartHistoryItem(cartInfo: carts[index],),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.05,
                                          ),
                                          Icon(
                                            Icons.shopping_cart,
                                            color: orange,
                                            size: 50,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Order: #${carts[index].id}"),
                                          SizedBox(
                                            width: size.width * 0.3,
                                          ),
                                          Text("10 Oct, 2020")
                                        ],
                                      ),
                                      Text("price :${carts[index].fullPrice}")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              ):Container();
            },
          )),
    );
  }
}
