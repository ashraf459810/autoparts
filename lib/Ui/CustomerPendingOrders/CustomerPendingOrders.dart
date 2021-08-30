import 'package:autopart/Ui/vendorblocs/profilebloc/profilebloc_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerPendingOrders extends StatefulWidget {
  CustomerPendingOrders({Key key}) : super(key: key);

  @override
  _CustomerPendingOrdersState createState() => _CustomerPendingOrdersState();
}

class _CustomerPendingOrdersState extends State<CustomerPendingOrders> {
  var finishedorders = [];
  ProfileblocBloc profileblocBloc = ProfileblocBloc();
  @override
  void initState() {
    profileblocBloc.add(CustomerPendingOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder(
        bloc: profileblocBloc,
        builder: (context, state) {
          if (state is ProfileblocInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is Loading) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.orange,
            ));
          }
          if (state is Error) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is PendingOrdersState) {
            print(state.finishedorders.length);
            finishedorders = state.finishedorders;
          }

          return finishedorders.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    child: ListView.builder(
                      itemCount: finishedorders.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: size.height * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deliver Location",
                                style: TextStyle(
                                    color: Colors.orange[900], fontSize: 25),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                  "Date :${finishedorders[index].creationDate.year}/${finishedorders[index].creationDate.month}/${finishedorders[index].creationDate.day}"),
                              Text(
                                  "country :${finishedorders[index].deliverCountry}"),
                              Text(
                                  "City :${finishedorders[index].deliverCity}"),
                              Text(
                                  "Street :${finishedorders[index].deliverStreet}"),
                              Text("Status :${finishedorders[index].status}"),
                              Text(
                                  "Price :${finishedorders[index].fullPrice.toString()}"),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              finishedorders[index].currentCartItems.isNotEmpty
                                  ? Container(
                                      height: size.height * 0.1,
                                      child: ListView.builder(
                                        itemCount: finishedorders[0]
                                            .currentCartItems
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Type :${finishedorders[index].currentCartItems[0].sourceTypeName}"),
                                                Text(
                                                    "Price ${finishedorders[index].currentCartItems[0].fullPrice.toString()}"),
                                                Text(
                                                    "Brand :${finishedorders[index].currentCartItems[0].brand.name}"),
                                                Text(
                                                    "Product :${finishedorders[index].currentCartItems[0].product.name}"),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Container(),
                              Center(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                  width: size.width * 0.9,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Container(
                  child: Center(
                    child: Text("You don't have Pending Orders"),
                  ),
                );
        },
      ),
    );
  }
}
